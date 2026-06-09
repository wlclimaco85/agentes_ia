---
name: sankhya-java-backend
description: Especialista em backend Java para add-ons Sankhya Add-on Studio. Use quando Codex precisar implementar, revisar ou diagnosticar model/src/main/java, services @Service, controllers @Controller, action buttons, regras de negocio, listeners, callbacks, jobs @Job, repositories, Jape/NativeSQL, DTOs, Bean Validation, DI, transacoes, logs, parameter.xml, service-providers.xml ou integracao com telas HTML5.
---

# Sankhya Java Backend

## Fluxo

1. Ler `model/build.gradle`, `model/src/main/resources/META-INF/*` e classes Java existentes.
2. Pesquisar exemplos reais em `C:\sk-java\git\sankhyaw` antes de criar anotacoes ou APIs pouco familiares.
3. Escolher o mecanismo:
   - `@Service`/`@Controller` para UI ou integracao.
   - `@ActionButton` para acao manual em tela.
   - regra/listener/callback para evento automatico.
   - `@Job` para agendamento.
   - repository/component para regra reutilizavel.
4. Manter fronteiras pequenas: controller/service orquestra; componente/repository concentra regra e persistencia.
5. Validar compilacao pelo Gradle do projeto.

## Padroes

- Pacote base do projeto principal: `br.com.sankhya.dhara`.
- Preferir DI por construtor quando a API permitir; em codigo legado Sankhya, respeitar o padrao encontrado.
- Usar transacao declarativa para escrita e modo sem transacao para leitura quando suportado.
- Fechar recursos Jape/NativeSQL quando usados diretamente.
- Mensagens para usuario devem ser claras e acionar rollback quando a regra falhar.
- Logs devem incluir contexto de negocio e stack trace, sem dados sensiveis.

## Consultas Uteis

Use o MCP `sankhya-specialist` ou `rg` local para encontrar exemplos:

```powershell
rg -n "@Service|@ActionButton|@Job|BusinessRule|NativeSql|Jape" C:\sk-java\git\sankhyaw
```
