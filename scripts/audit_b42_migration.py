#!/usr/bin/env python3
"""Static B42 migration audit for UmaBoid."""
from __future__ import annotations

import json
import pathlib
import re
import sys

MOD = pathlib.Path(
    r"C:\Users\mpass\Desktop\MyProjectZomboid\My Mods\UmaBoidB42"
    r"\UmaBoidB42\Contents\mods\UmaBoidB42\42.18\media"
)

issues: dict[str, list[str]] = {"blocker": [], "warning": [], "info": []}

B41_PATTERNS = [
    (r"WaterBottleFull", "B41 water bottle item (use Base.WaterBottle + -fluid [Water])"),
    (r"flags\[FullOfWater\]", "Invalid B42 InputFlag (use -fluid [Water] with fluid container)"),
    (r"\bneedTobeLearn\b", "Invalid craftRecipe property (vanilla uses NeedToBeLearn)"),
    (r"\bPopEmpty\b", "B41 empty pop can (B42 uses PopBottle fluid container)"),
    (r"\bEmptyPopBottle\b", "B41 empty pop bottle"),
    (r"\bPopBottleEmpty\b", "B41 empty pop bottle variant"),
    (
        r"\bType\s*=\s*(Normal|Food|Weapon|Drainable|Literature|Container|Clothing)\b",
        "B41 Type= field (use ItemType = base:*)",
    ),
    (r"^\s*recipe\s+\w+", "B41 recipe block (use craftRecipe)"),
    (r"ReplaceOnDeplete\s*=", "B41 drainable ReplaceOnDeplete"),
    (r"UseDelta\s*=", "B41 drainable UseDelta"),
    (r"IsWaterSource\s*=", "B41 water source flag"),
    (r"CanStoreWater\s*=", "B41 water storage flag"),
    (r"BodyLocation\s*=\s*Hat\b", "B41 BodyLocation=Hat (use base:hat)"),
    (r"BodyLocation\s*=\s*Shoes\b", "B41 BodyLocation=Shoes"),
    (r"CanBeEquipped\s*=\s*Hat\b", "B41 CanBeEquipped=Hat"),
]

texts: dict[pathlib.Path, str] = {}
for path in MOD.rglob("*"):
    if path.is_file() and path.suffix.lower() in {".txt", ".lua", ".json"}:
        texts[path] = path.read_text(encoding="utf-8", errors="ignore")

for path, text in texts.items():
    rel = path.relative_to(MOD)
    for pattern, message in B41_PATTERNS:
        for match in re.finditer(pattern, text, re.M):
            line = text[: match.start()].count("\n") + 1
            issues["blocker"].append(f"{rel}:{line} — {message}")

recipes = texts.get(MOD / "scripts" / "UmaBoidCraftRecipes.txt", "")
recipe_ids = set(re.findall(r"craftRecipe\s+(\w+)", recipes))

mod_items: set[str] = set()
for path in (MOD / "scripts").glob("*.txt"):
    mod_items.update(re.findall(r"^\s*item\s+(\w+)", texts[path], re.M))

for match in re.finditer(r"tags\[([^\]]+)\]", recipes):
    tag = match.group(1)
    if not tag.startswith("base:"):
        line = recipes[: match.start()].count("\n") + 1
        issues["warning"].append(
            f"scripts/UmaBoidCraftRecipes.txt:{line} — tag '{tag}' missing base: prefix"
        )

learned: set[str] = set()
for path, text in texts.items():
    if path.suffix == ".txt":
        for value in re.findall(r"LearnedRecipes\s*=\s*([^,\n]+)", text):
            learned.add(value.strip())

for recipe_id in learned:
    if recipe_id not in recipe_ids:
        issues["blocker"].append(
            f"LearnedRecipes={recipe_id} has no craftRecipe definition"
        )

recipes_json = MOD / "lua" / "shared" / "Translate" / "EN" / "Recipes.json"
if not recipes_json.exists():
    issues["warning"].append(
        "Missing Translate/EN/Recipes.json — craft recipes may show raw IDs in UI"
    )
else:
    recipe_names = json.loads(recipes_json.read_text(encoding="utf-8"))
    for recipe_id in sorted(recipe_ids):
        if recipe_id not in recipe_names:
            issues["warning"].append(
                f"Recipes.json missing translation for {recipe_id}"
            )

items_txt = "\n".join(
    text for path, text in texts.items() if "UmaBoidItems" in path.name and path.suffix == ".txt"
)
for group in re.findall(r"ClothingItemExtra\s*=\s*([^;\n]+)", items_txt):
    for item in re.split(r"[;\s]+", group.strip()):
        item = item.strip()
        if item and item not in mod_items:
            issues["blocker"].append(
                f"ClothingItemExtra references missing item: {item}"
            )

for path, text in texts.items():
    if path.suffix != ".lua":
        continue
    rel = path.relative_to(MOD)
    if "server" in path.parts:
        if re.search(r"if\s+isClient\(\)\s+then\s+return\s+end", text) and "type(isClient)" not in text[:400]:
            issues["warning"].append(f"{rel} — bare isClient() guard")
    if re.search(r"\bpcall\b|\bxpcall\b", text):
        issues["blocker"].append(f"{rel} — pcall/xpcall forbidden")

oncreate = set(
    re.findall(
        r"function Recipe\.OnCreate\.(\w+)",
        texts.get(MOD / "lua" / "server" / "UmaBoidRecipesExtra.lua", ""),
    )
)
no_oncreate_ok = {"UmaCraftToughness", "CraftAstonMachanBomb"}
missing_oncreate = recipe_ids - oncreate - no_oncreate_ok
extra_oncreate = oncreate - recipe_ids
if missing_oncreate:
    issues["info"].append(
        f"craftRecipes without OnCreate (may be fine): {sorted(missing_oncreate)}"
    )
if extra_oncreate:
    issues["warning"].append(
        f"OnCreate handlers without craftRecipe: {sorted(extra_oncreate)}"
    )

ig_ui = texts.get(MOD / "lua" / "shared" / "Translate" / "EN" / "IG_UI.json", "")
if "CraftCategory_UmaBoid" not in ig_ui:
    issues["warning"].append(
        "IG_UI.json missing CraftCategory_UmaBoid (category=UmaBoid in craftRecipe)"
    )

item_name = MOD / "lua" / "shared" / "Translate" / "EN" / "ItemName_EN.txt"
if item_name.exists():
    names = item_name.read_text(encoding="utf-8", errors="ignore")
    for item in sorted(mod_items):
        key = f"ItemName_{item}"
        if key not in names and item not in {"TPDrink", "TPDrinkMax"}:
            pass

vanilla_suspects = {
    "Aerosolbomb": "Verify B42 vanilla ID casing/name",
}
for match in re.finditer(r"\[Base\.([^\]]+)\]", recipes):
    for token in match.group(1).split(";"):
        token = token.strip()
        if token in mod_items:
            continue
        if token in vanilla_suspects:
            issues["warning"].append(
                f"craftRecipe input Base.{token} — {vanilla_suspects[token]}"
            )

print("=== UmaBoid B42 Migration Audit ===\n")
for level in ("blocker", "warning", "info"):
    items = issues[level]
    if not items:
        continue
    print(f"## {level.upper()} ({len(items)})")
    for item in items:
        print(" -", item)
    print()

print("Summary:", {key: len(value) for key, value in issues.items()})
if issues["blocker"]:
    sys.exit(1)
