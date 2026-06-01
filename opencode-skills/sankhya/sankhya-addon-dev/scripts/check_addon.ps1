param(
    [string]$ProjectPath = "C:\dharatecnologia\dhara-pecuaria"
)

$ErrorActionPreference = "Stop"
$project = Resolve-Path -LiteralPath $ProjectPath

Write-Host "Project: $project"

$required = @(
    "build.gradle",
    "settings.gradle",
    "model\build.gradle",
    "vc\build.gradle",
    "datadictionary",
    "dbscripts"
)

$dotenv = @{}
$envFile = Join-Path $project ".env"
if (Test-Path -LiteralPath $envFile) {
    Get-Content -LiteralPath $envFile | ForEach-Object {
        if ($_ -match "^\s*([^#][^=]+?)\s*=\s*(.+?)\s*$") {
            $dotenv[$matches[1].Trim()] = $matches[2].Trim()
        }
    }
}

foreach ($item in $required) {
    $path = Join-Path $project $item
    if (Test-Path -LiteralPath $path) {
        Write-Host "[OK] $item"
    } else {
        Write-Host "[MISSING] $item"
    }
}

$envChecks = @{
    "JAVA_HOME" = if ($env:JAVA_HOME) { $env:JAVA_HOME } else { "C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09" }
    "GRADLE_USER_HOME" = if ($env:GRADLE_USER_HOME) { $env:GRADLE_USER_HOME } else { "C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache" }
    "WILDFLY_HOME" = if ($env:WILDFLY_HOME) { $env:WILDFLY_HOME } elseif ($dotenv.ContainsKey("WILDFLY_HOME")) { $dotenv["WILDFLY_HOME"] } else { $null }
}

foreach ($name in $envChecks.Keys) {
    $value = $envChecks[$name]
    if ($value -and (Test-Path -LiteralPath $value)) {
        Write-Host "[OK] $name=$value"
    } elseif ($value) {
        Write-Host "[WARN] $name points to missing path: $value"
    } else {
        Write-Host "[WARN] $name is not set"
    }
}

$scripts = Get-ChildItem -LiteralPath (Join-Path $project "dbscripts") -Filter "V*.xml" -ErrorAction SilentlyContinue | Sort-Object Name
Write-Host "DBScripts: $($scripts.Count)"
foreach ($script in $scripts) {
    try {
        [xml]$null = Get-Content -Raw -LiteralPath $script.FullName
        Write-Host "[OK] XML $($script.Name)"
    } catch {
        Write-Host "[ERROR] XML $($script.Name): $($_.Exception.Message)"
    }
}

