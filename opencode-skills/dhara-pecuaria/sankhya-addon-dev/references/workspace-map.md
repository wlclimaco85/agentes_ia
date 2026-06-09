# Workspace Map

- Root: `C:\dharatecnologia`
- Main add-on: `C:\dharatecnologia\dhara-pecuaria`
- Example add-on: `C:\dharatecnologia\hello-world-addon`
- Local Sankhya sources: `C:\sk-java\git\sankhyaw`
- Local docs: `C:\dharatecnologia\docs`
- JDK 8: `C:\dharatecnologia\tools\jdk8\jdk8u492-b09`
- Gradle: `C:\dharatecnologia\tools\gradle-7.6.4`
- Gradle cache: `C:\dharatecnologia\tools\gradle-cache`
- WildFly: `C:\sk-java\AS\wildfly-23-pre-hom`
- Sankhya libs: `C:\sk-java\LIBS`

## Main Project

`dhara-pecuaria` uses:

- Gradle plugin `br.com.sankhya.addonstudio`
- `group = br.com.sankhya.dhara`
- `version = 1.0.r012`
- `plataformaMinima = 4.28`
- Modules: `model`, `vc`
- Migrations: `dbscripts/V1.xml` through `V5.xml`
- Data dictionary files under `datadictionary/`

## Useful Commands

```powershell
cd C:\dharatecnologia\dhara-pecuaria
$env:JAVA_HOME='C:\dharatecnologia\tools\jdk8\jdk8u492-b09'
$env:GRADLE_USER_HOME='C:\dharatecnologia\tools\gradle-cache'
$env:WILDFLY_HOME='C:\sk-java\AS\wildfly-23-pre-hom'
.\gradlew.bat tasks
.\gradlew.bat clean deployAddon
```
