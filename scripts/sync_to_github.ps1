# Mirror the Steam Workshop upload package into the GitHub backup repo.
# GitHub root may also contain scripts/, docs/, README.md — never inside Contents/.
param(
    [string]$WorkshopRoot = "C:\Users\mpass\Zomboid\Workshop\UmaBoid B42 [ UNOFFICIAL PORT]",
    [string]$GithubRoot = "C:\Users\mpass\Projects\UmaBoidB42-UNOFFICIAL-PORT",
    [string]$DevRoot = "C:\Users\mpass\Desktop\MyProjectZomboid\My Mods\UmaBoidB42"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $WorkshopRoot)) {
    throw "Workshop root not found: $WorkshopRoot"
}

if (-not (Test-Path -LiteralPath $GithubRoot)) {
    New-Item -ItemType Directory -Force -Path $GithubRoot | Out-Null
    git -C $GithubRoot init
    git -C $GithubRoot remote add origin https://github.com/fearthebest/UmaBoidB42-UNOFFICIAL-PORT-.git
    git -C $GithubRoot fetch origin
    git -C $GithubRoot checkout -B main origin/main
}

# --- Published mod package (must match Steam) ---
foreach ($name in @("Contents", "workshop.txt", "preview.png")) {
    $src = Join-Path $WorkshopRoot $name
    $dst = Join-Path $GithubRoot $name
    if (-not (Test-Path -LiteralPath $src)) {
        throw "Missing workshop artifact: $src"
    }
    if (Test-Path -LiteralPath $dst) {
        Remove-Item -LiteralPath $dst -Recurse -Force
    }
    if ((Get-Item -LiteralPath $src).PSIsContainer) {
        robocopy $src $dst /MIR /NFL /NDL /NJH /NJS /nc /ns /np | Out-Null
        if ($LASTEXITCODE -ge 8) { throw "robocopy $name failed: $LASTEXITCODE" }
    } else {
        Copy-Item -LiteralPath $src -Destination $dst -Force
    }
    Write-Host "Synced $name"
}

# Remove legacy duplicate build folder if present (Steam ships 42.18 only).
$legacy = Join-Path $GithubRoot "Contents\mods\UmaBoidB42\42"
if (Test-Path -LiteralPath $legacy) {
    Remove-Item -LiteralPath $legacy -Recurse -Force
    Write-Host "Removed legacy Contents\mods\UmaBoidB42\42"
}

# --- Dev-only files (GitHub only, not in Workshop) ---
$scriptsDst = Join-Path $GithubRoot "scripts"
New-Item -ItemType Directory -Force -Path $scriptsDst | Out-Null

$scriptSources = @(
    (Join-Path $DevRoot "scripts\sync_to_workshop.ps1"),
    (Join-Path $DevRoot "scripts\sync_to_github.ps1"),
    (Join-Path $DevRoot "validate_fixes.py"),
    (Join-Path $DevRoot "audit_b42_migration.py")
)
foreach ($file in $scriptSources) {
    if (Test-Path -LiteralPath $file) {
        Copy-Item -LiteralPath $file -Destination (Join-Path $scriptsDst (Split-Path $file -Leaf)) -Force
        Write-Host "Synced dev script $(Split-Path $file -Leaf)"
    }
}

Copy-Item -LiteralPath (Join-Path $DevRoot "docs\README-github.md") -Destination (Join-Path $GithubRoot "README.md") -Force
Copy-Item -LiteralPath (Join-Path $DevRoot ".gitignore") -Destination (Join-Path $GithubRoot ".gitignore") -Force
Write-Host "Synced README.md and .gitignore"

Write-Host "Done. GitHub mod package matches Workshop."
Write-Host $GithubRoot
