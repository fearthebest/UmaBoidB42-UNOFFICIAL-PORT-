import pathlib
import re
import sys

MOD = pathlib.Path(
    r"c:\Users\mpass\Desktop\MyProjectZomboid\My Mods\UmaBoidB42"
    r"\UmaBoidB42\Contents\mods\UmaBoidB42\42.18\media"
)

errors = []
warnings = []

lua_files = list(MOD.rglob("*.lua"))
for lua_path in lua_files:
    text = lua_path.read_text(encoding="utf-8", errors="ignore")
    if re.search(r"\bpcall\b|\bxpcall\b", text):
        errors.append(f"pcall/xpcall forbidden: {lua_path.relative_to(MOD)}")

server_files = [
    MOD / "lua/server/UmaBoid_Server.lua",
    MOD / "lua/server/UmaBoid_SaveMigration.lua",
    MOD / "lua/server/Items/UmaBoid_Distributions.lua",
]
for server_path in server_files:
    if not server_path.exists():
        errors.append(f"Missing server file: {server_path.relative_to(MOD)}")
        continue
    head = "\n".join(server_path.read_text(encoding="utf-8").splitlines()[:6])
    if "if isClient() then return end" in head and "type(isClient)" not in head:
        errors.append(f"Bare isClient guard: {server_path.relative_to(MOD)}")

required_client = [
    MOD / "lua/client/UmaBoidSwitchContext.lua",
    MOD / "lua/client/UmaBoidGeneralConfig.lua",
    MOD / "lua/client/UmaBoidWeaponConfig.lua",
    MOD / "lua/shared/UmaBoid_Shared.lua",
]
for client_path in required_client:
    if not client_path.exists():
        errors.append(f"Missing lua file: {client_path.relative_to(MOD)}")

if (MOD / "lua/server/UmaBoidWeaponConfig.lua").exists():
    errors.append("UmaBoidWeaponConfig.lua must be client-only")

reg_file = MOD / "registries.lua"
registered = set(
    re.findall(
        r'ItemBodyLocation\.register\("([^"]+)"\)',
        reg_file.read_text(encoding="utf-8"),
    )
)

items_txt = (MOD / "scripts" / "UmaBoidItems.txt").read_text(
    encoding="utf-8", errors="ignore"
)
used = set(re.findall(r"umaboid:[a-z_0-9]+", items_txt))

missing_reg = sorted(used - registered)
if missing_reg:
    errors.append(f"Item scripts use unregistered locations: {missing_reg}")

extra_reg = sorted(registered - used)
if extra_reg:
    warnings.append(f"Registered but unused in item scripts: {extra_reg}")

body_ids = set(
    re.findall(
        r'"(umaboid:[^"]+)"',
        (MOD / "lua/shared/NPCs/UmaBoid_BodyLocations.lua").read_text(encoding="utf-8"),
    )
)
if body_ids != registered:
    errors.append(
        "BodyLocations.lua IDs differ from registries.lua: "
        f"body-only={sorted(body_ids - registered)} "
        f"reg-only={sorted(registered - body_ids)}"
    )

hat_names = [
    "FujiKisekiHat",
    "GrassWonderAltHat",
    "GrassWonderUmaRapHat",
    "MatikaneTannhauserHat",
    "MatikaneTannhauserCasualHat",
    "MrCBHat",
    "TMOperaOCrown",
    "WinningTicketUmaRapHat",
    "YukinoBijinUmaRapHat",
]
for name in hat_names:
    match = re.search(rf"item {name}\s*\{{([\s\S]*?)\n\s*\}}", items_txt)
    if not match:
        errors.append(f"Hat item block not found: {name}")
        continue
    block = match.group(1)
    can = re.search(r"CanBeEquipped\s*=\s*([^\n,]+)", block)
    body = re.search(r"BodyLocation\s*=\s*([^\n,]+)", block)
    if not can or "base:hat" not in can.group(1):
        errors.append(
            f"{name}: CanBeEquipped not base:hat "
            f"({can.group(1).strip() if can else None})"
        )
    if not body or "base:hat" not in body.group(1):
        errors.append(
            f"{name}: BodyLocation not base:hat "
            f"({body.group(1).strip() if body else None})"
        )

dist = (MOD / "lua/server/Items/UmaBoid_Distributions.lua").read_text(encoding="utf-8")
checks = {
    "OnInitGlobalModData.Add(initSandboxRates)": "OnInitGlobalModData.Add(initSandboxRates)" in dist,
    "OnPostDistributionMerge.Add(applyDistributions)": "OnPostDistributionMerge.Add(applyDistributions)" in dist,
    "table.insert for distro pairs": "table.insert(bucket.items, pairTable[i])" in dist,
    "no top-level SandboxVars read": not re.search(r"^local umaboidVars = SandboxVars", dist, re.M),
    "no manual index append": "t1[n + i]" not in dist,
    "missing distro log": "distribution list missing" in dist,
}
for label, ok in checks.items():
    if not ok:
        errors.append(f"Distributions: failed check: {label}")

for call in re.finditer(r'insertTableSafe\(\s*"([^"]+)"\s*,\s*\{([^}]*)\}\s*\)', dist):
    parts = [p.strip() for p in call.group(2).split(",") if p.strip()]
    if len(parts) % 2 != 0:
        errors.append(
            f"Odd item/weight pair count in distribution {call.group(1)}: {len(parts)} values"
        )

if not reg_file.exists():
    errors.append("registries.lua missing at media/registries.lua")

mod_items = set()
for path in (MOD / "scripts").glob("*.txt"):
    mod_items.update(
        re.findall(r"^\s*item\s+(\w+)", path.read_text(encoding="utf-8", errors="ignore"), re.M)
    )

vanilla_root = pathlib.Path(
    r"B:\SteamLibrary\steamapps\common\ProjectZomboid\media\scripts\generated\items"
)
if vanilla_root.exists():
    vanilla_items = set()
    for path in vanilla_root.rglob("*.txt"):
        vanilla_items.update(
            re.findall(r"^\s*item\s+(\w+)", path.read_text(encoding="utf-8", errors="ignore"), re.M)
        )
    collisions = sorted(mod_items & vanilla_items)
    if collisions:
        errors.append(f"Vanilla item ID collisions in module Base: {collisions}")
else:
    warnings.append("Vanilla items path missing; skipped collision check")

recipes_txt = (MOD / "scripts" / "UmaBoidCraftRecipes.txt").read_text(encoding="utf-8", errors="ignore")
recipe_outputs = re.findall(r"item 1 (Base\.\w+)", recipes_txt)
missing_outputs = [o for o in recipe_outputs if o.split(".")[1] not in mod_items]
if missing_outputs:
    errors.append(f"craftRecipe outputs missing item defs: {missing_outputs[:10]}")

shared = (MOD / "lua/shared/UmaBoid_Shared.lua").read_text(encoding="utf-8", errors="ignore")
for token in ("CostumeSwitch = \"costumeSwitch\"", "ToughnessPain = \"toughnessPain\"", "performCostumeSwitch", "applyToughnessPain"):
    if token not in shared:
        errors.append(f"UmaBoid_Shared.lua missing: {token}")

print("=== UmaBoid B42 Fix Validation ===")
print(f"Registered locations: {len(registered)}")
print(f"Used in item scripts: {len(used)}")
print(f"Lua files scanned: {len(lua_files)}")
if warnings:
    print("WARNINGS:")
    for warning in warnings:
        print(" -", warning)
if errors:
    print("FAILURES:")
    for error in errors:
        print(" -", error)
    sys.exit(1)

print("All static checks passed.")
