# UmaBoid B42 — Unofficial Port

Unofficial Build 42 compatibility port of **UmaBoid** (Uma Musume costumes for Project Zomboid). Compatibility fixes only; original assets and credit belong to upstream author(s).

| | |
|---|---|
| **Version** | 0.0.3.1 |
| **Target build** | B42 Unstable (42.18+) |
| **Mod ID** | `UmaBoid_B42_Miroki` |
| **Workshop ID** | `3722974110` |

## Repository layout

**Published mod package** (must match Steam Workshop exactly):

```text
workshop.txt
preview.png
Contents/mods/UmaBoidB42/
  mod.info          # redirect stub
  42.18/            # live build
    mod.info
    media/
```

**GitHub-only** (not uploaded to Steam):

```text
README.md
scripts/            # sync + validation helpers
.gitignore
```

Do not put docs, scripts, or changelogs under `Contents/`.

## Maintainer workflow

1. Edit mod Lua/scripts in your dev tree (`UmaBoidB42/Contents/...`).
2. `scripts/sync_to_workshop.ps1` → `%USERPROFILE%\Zomboid\Workshop\...`
3. `scripts/sync_to_github.ps1` → this repo (mirrors Workshop package + dev scripts).
4. Upload to Steam from the Workshop folder.
5. Commit and push this repo.

## Installation (players)

Enable **UmaBoid (Uma Musume Costumes for Project Zomboid) - B42 Port** in the mod list (Workshop or copy `Contents/mods/UmaBoidB42` into `%USERPROFILE%\Zomboid\mods\`).

## Credit

- **Original UmaBoid:** upstream author(s)
- **B42 port:** compatibility maintenance in this repository

Unofficial port. Not affiliated with upstream authors or The Indie Stone.
