# Sync UmaBoid B42 dev 42.18 build to Zomboid Workshop upload folder.
param(
    [string]$SourceBuild = "C:\Users\mpass\Desktop\MyProjectZomboid\My Mods\UmaBoidB42\UmaBoidB42\Contents\mods\UmaBoidB42\42.18",
    [string]$WorkshopRoot = "C:\Users\mpass\Zomboid\Workshop\UmaBoid B42 [ UNOFFICIAL PORT]",
    [switch]$AlsoSyncLegacy42
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $SourceBuild)) {
    throw "Source build not found: $SourceBuild"
}
if (-not (Test-Path -LiteralPath $WorkshopRoot)) {
    throw "Workshop root not found: $WorkshopRoot"
}

$modName = "UmaBoidB42"
$dst418 = Join-Path $WorkshopRoot "Contents\mods\$modName\42.18"
$dst42 = Join-Path $WorkshopRoot "Contents\mods\$modName\42"

New-Item -ItemType Directory -Force -Path $dst418 | Out-Null
robocopy $SourceBuild $dst418 /MIR /NFL /NDL /NJH /NJS /nc /ns /np | Out-Null
if ($LASTEXITCODE -ge 8) { throw "robocopy 42.18 failed: $LASTEXITCODE" }
Write-Host "Synced 42.18 -> $dst418"

if ($AlsoSyncLegacy42) {
    New-Item -ItemType Directory -Force -Path $dst42 | Out-Null
    robocopy $SourceBuild $dst42 /MIR /NFL /NDL /NJH /NJS /nc /ns /np | Out-Null
    if ($LASTEXITCODE -ge 8) { throw "robocopy 42 failed: $LASTEXITCODE" }
    Write-Host "Synced 42 -> $dst42"
} elseif (Test-Path -LiteralPath $dst42) {
    Remove-Item -LiteralPath $dst42 -Recurse -Force
    Write-Host "Removed legacy 42 build from Workshop folder"
}

$srcWorkshop = "C:\Users\mpass\Desktop\MyProjectZomboid\My Mods\UmaBoidB42\UmaBoidB42\workshop.txt"
if (Test-Path -LiteralPath $srcWorkshop) {
    Copy-Item -LiteralPath $srcWorkshop -Destination (Join-Path $WorkshopRoot "workshop.txt") -Force
    Write-Host "Synced workshop.txt"
}

$srcStub = "C:\Users\mpass\Desktop\MyProjectZomboid\My Mods\UmaBoidB42\UmaBoidB42\Contents\mods\UmaBoidB42\mod.info"
$dstStub = Join-Path $WorkshopRoot "Contents\mods\$modName\mod.info"
if (Test-Path -LiteralPath $srcStub) {
    New-Item -ItemType Directory -Force -Path (Split-Path $dstStub) | Out-Null
    Copy-Item -LiteralPath $srcStub -Destination $dstStub -Force
    Write-Host "Synced mod.info stub"
}

$srcPoster = Join-Path $SourceBuild "poster.png"
$dstPreview = Join-Path $WorkshopRoot "preview.png"
if (Test-Path -LiteralPath $srcPoster) {
    Copy-Item -LiteralPath $srcPoster -Destination $dstPreview -Force
    Write-Host "Synced preview.png"
}

Write-Host "Done. Upload from:"
Write-Host $WorkshopRoot
