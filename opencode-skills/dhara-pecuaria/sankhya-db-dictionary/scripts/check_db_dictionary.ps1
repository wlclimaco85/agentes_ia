param(
    [string]$ProjectPath = "C:\dharatecnologia\dhara-pecuaria"
)

$ErrorActionPreference = "Stop"
$project = Resolve-Path -LiteralPath $ProjectPath
$dbscripts = Join-Path $project "dbscripts"
$dictionary = Join-Path $project "datadictionary"

foreach ($dir in @($dbscripts, $dictionary)) {
    if (-not (Test-Path -LiteralPath $dir)) {
        throw "Missing directory: $dir"
    }
}

Write-Host "Checking XML files..."
$xmlFiles = @(Get-ChildItem -LiteralPath $dbscripts -Filter "*.xml") + @(Get-ChildItem -LiteralPath $dictionary -Filter "*.xml")
foreach ($file in $xmlFiles) {
    try {
        [xml]$null = Get-Content -Raw -LiteralPath $file.FullName
        Write-Host "[OK] $($file.FullName)"
    } catch {
        Write-Host "[ERROR] $($file.FullName): $($_.Exception.Message)"
    }
}

Write-Host "Checking dbscripts for Oracle/MSSQL blocks..."
Get-ChildItem -LiteralPath $dbscripts -Filter "V*.xml" | Sort-Object Name | ForEach-Object {
    $raw = Get-Content -Raw -LiteralPath $_.FullName
    $hasOracle = $raw -match "<oracle>"
    $hasMssql = $raw -match "<mssql>"
    if ($hasOracle -and $hasMssql) {
        Write-Host "[OK] $($_.Name) has oracle and mssql blocks"
    } else {
        Write-Host "[WARN] $($_.Name) oracle=$hasOracle mssql=$hasMssql"
    }
}

Write-Host "Checking forbidden AD_ prefix..."
$matches = rg -n "\bAD_" $dbscripts $dictionary 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "[WARN] Found AD_ references:"
    $matches | ForEach-Object { Write-Host $_ }
} else {
    Write-Host "[OK] No AD_ references found"
}
