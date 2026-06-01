---
name: sankhya-addon-dev
description: Especialista geral para criar, evoluir, revisar e diagnosticar add-ons Sankhya Add-on Studio nesta workspace Dhara. Use quando a tarefa envolver arquitetura de ADD, estrutura Gradle, appKey, serverFolder/WildFly, deployAddon, empacotamento, revisao fim a fim, escolha entre dbscripts/datadictionary/model/vc, consulta aos exemplos locais em C:\sk-java\git\sankhyaw ou coordenacao entre banco, Java e HTML5.
---

# Sankhya ADD Dev

## Fluxo

1. Identificar o projeto alvo: normalmente `C:\dharatecnologia\dhara-pecuaria`; usar `hello-world-addon` como exemplo simples.
2. Ler `build.gradle`, `settings.gradle`, `.env`, `datadictionary/`, `dbscripts/`, `model/` e `vc/` antes de editar.
3. Classificar a entrega: novo ADD, migration, dicionario, tela, service/controller, action button, regra, listener, callback, job, ambiente ou troubleshooting.
4. Delegar mentalmente para as skills especializadas:
   - `sankhya-db-dictionary` para `dbscripts/` e `datadictionary/`.
   - `sankhya-java-backend` para `model/src/main/java` e resources Java.
   - `sankhya-html5-frontend` para `vc/src/webapp/html5`.
   - `sankhya-env-intellij` para IntelliJ, Gradle, Docker, JDK 8 e WildFly.
5. Consultar exemplos locais antes de inventar padroes: `C:\sk-java\git\sankhyaw`, `C:\\dharatecnologia\\dhara-pecuaria\hello-world-addon`, docs locais em `C:\\dharatecnologia\\dhara-pecuaria\docs`.
6. Validar com `scripts/check_addon.ps1 <projeto>` e depois Gradle quando fizer sentido.

## Padroes Da Workspace

- Prefixo do add-on principal: `DH_` para tabelas/views e `br.com.sankhya.dhara` para pacote base.
- Projeto principal: `C:\dharatecnologia\dhara-pecuaria`.
- Exemplo funcional: `C:\\dharatecnologia\\dhara-pecuaria\hello-world-addon`.
- Fontes Sankhya para pesquisa: `C:\sk-java\git\sankhyaw`.
- JDK 8 local: `C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09`.
- Gradle local: `C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-7.6.4`.
- Cache Gradle local: `C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache`.
- WildFly esperado: `C:\sk-java\AS\wildfly-23-pre-hom`.

## Guardrails

- Nunca usar prefixo `AD_` para objetos proprios.
- Nao alterar dbscript ja publicado/executado; criar `V<N>.xml`.
- Nao duplicar a mesma alteracao em Auto DDL e dbscripts.
- Nao hardcodar senhas, tokens, URLs sensiveis ou chaves que variam por ambiente.
- Manter action buttons, services e controllers como orquestradores; regra pesada fica em componente/service.
- Conferir Oracle e MSSQL em todo dbscript.

## Recursos

- `references/workspace-map.md`: mapa da workspace e comandos.
- `references/search-playbook.md`: onde buscar exemplos reais nos fontes Sankhya.
- `scripts/check_addon.ps1`: checagem rapida de estrutura, ambiente e scripts.

