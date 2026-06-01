$paths = [ordered]@{
    "Workspace" = "C:\\dharatecnologia\\dhara-pecuaria"
    "Main add-on" = "C:\dharatecnologia\dhara-pecuaria"
    "Example add-on" = "C:\\dharatecnologia\\dhara-pecuaria\hello-world-addon"
    "JDK 8" = "C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09"
    "Gradle" = "C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-7.6.4\bin\gradle.bat"
    "Gradle cache" = "C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache"
    "WildFly" = "C:\sk-java\AS\wildfly-23-pre-hom"
    "Sankhya libs" = "C:\sk-java\LIBS"
    "Sankhya sources" = "C:\sk-java\git\sankhyaw"
}

foreach ($entry in $paths.GetEnumerator()) {
    if (Test-Path -LiteralPath $entry.Value) {
        Write-Host "[OK] $($entry.Key): $($entry.Value)"
    } else {
        Write-Host "[MISSING] $($entry.Key): $($entry.Value)"
    }
}

Write-Host ""
Write-Host "Suggested environment for PowerShell:"
Write-Host "`$env:JAVA_HOME='C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09'"
Write-Host "`$env:GRADLE_USER_HOME='C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache'"
Write-Host "`$env:WILDFLY_HOME='C:\sk-java\AS\wildfly-23-pre-hom'"

Write-Host ""
Write-Host "Docker status:"
if (Get-Command docker -ErrorAction SilentlyContinue) {
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[WARN] Docker command failed. Check Docker Desktop."
    }
} else {
    Write-Host "[WARN] Docker CLI not found in PATH. Install/start Docker Desktop or add docker.exe to PATH."
}

