---
name: sankhya-env-intellij
description: Especialista em ambiente local Sankhya para IntelliJ, Gradle, JDK 8, WildFly e Docker. Use quando Codex precisar configurar ou diagnosticar importacao no IntelliJ IDEA, variaveis JAVA_HOME/GRADLE_USER_HOME/WILDFLY_HOME, Gradle Add-on Studio, tasks clean/deployAddon, banco Oracle ou SQL Server em Docker, debug remoto WildFly, .env, .idea/runConfigurations ou documentacao de setup da workspace.
---

# Ambiente Sankhya IntelliJ

## Setup Padrao

- Abrir no IntelliJ o projeto Gradle `C:\dharatecnologia\dhara-pecuaria`.
- Project SDK: `C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09`.
- Gradle JVM: o mesmo JDK 8.
- Gradle user home: `C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache`.
- Variaveis:
  - `JAVA_HOME=C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09`
  - `GRADLE_USER_HOME=C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache`
  - `WILDFLY_HOME=C:\sk-java\AS\wildfly-23-pre-hom`

## Docker Banco

Oracle:

```powershell
docker volume create skdev-oracle-volume
docker run -d --name skdev-oracle --shm-size=1g -p 1521:1521 -p 5500:5500 -v skdev-oracle-volume:/opt/oracle/oradata sankhyaimages/skdev-oracle:1.1.0
docker logs -f skdev-oracle
```

SQL Server:

```powershell
docker volume create mssql_dados
docker run -d --name sankhya_sqlserver -p 1433:1433 -v mssql_dados:/var/opt/mssql sankhyaimages/skdev-mssql:1.1.0
docker logs -f sankhya_sqlserver
```

## Validacao

Rodar `scripts/check_environment.ps1` desta skill. Depois importar o Gradle no IntelliJ e criar run configurations para:

- `dhara-pecuaria clean deployAddon`
- `dhara-pecuaria tasks`
- `WildFly standalone`

