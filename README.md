# 🤖 Agentes IA — Repositório Centralizado

Repositório centralizando todos os agentes, skills e configurações de IA dos projetos da organização, compatíveis com **Claude Code**, **OpenCode** e **Codex (OpenAI)**.

> **Regras universais aplicadas em todos os orchestrators:**
> 1. `context-manager` **SEMPRE** como primeiro e último passo de qualquer tarefa
> 2. `opencode-memory-context` como suporte de memória persistente entre sessões
> 3. **Multi-processamento** — subagentes disparados em paralelo sempre que possível
> 4. **GSD** (Get Shit Done) como metodologia padrão de entrega

---

## 📁 Estrutura

```
agentes_ia/
├── claude-code-agents/                  # Agentes Claude Code (.claude/agents/)
│   ├── dhara-pecuaria/                  # 46 agentes — Addon Sankhya ERP
│   └── app-academia/                    # 56 agentes — Spring Boot + Flutter
│
├── opencode-skills/                     # Skills OpenCode
│   ├── dhara-pecuaria/                  # 5 skills — Sankhya (sankhya-*)
│   └── app-academia/                    # 62 skills — App Academia + GSD + UI/UX
│
└── codex-agents/                        # Agentes Codex/OpenAI TOML
    ├── dhara-pecuaria/                  # 46 agentes TOML
    └── app-academia/                    # 56 agentes TOML
```

---

## 🏗️ Projetos e Separação de Contextos

**Cada projeto tem seu próprio contexto isolado.** Os orchestrators não cruzam referências.

| | Dhara Pecuária | App Academia |
|--|--|--|
| **Domínio** | Addon Sankhya ERP — pecuária bovina | ERP contábil — Spring Boot + Flutter |
| **Orchestrator** | `dhara-sankhya-orchestrator` | `app-academia-orchestrator` |
| **Selenium** | `dhara-selenium-visual-tester` | `app-academia-selenium-visual-tester` |
| **Backend** | Java 8, WildFly, Add-on Studio SDK 2+ | Java 17, Spring Boot 3.2, PostgreSQL |
| **Frontend** | AngularJS / HTML5 Sankhya | Flutter Web + Windows + Android |
| **Deploy** | WildFly local + Sankhya nuvem | Railway (prod) + local |
| **Localização** | `C:\dharatecnologia\dhara-pecuaria` | `C:\App_Academia` |
| **Agentes exclusivos** | `dhara-*`, `sankhya-*` | `architect`, `backend-spring`, `frontend-flutter`, `product-owner`, `qa`, `deployment-engineer`, `docs-devops-fastlane`, `ui-ux-pro-max` |
| **Shared** | `gsd-*`, `context-manager`, `code-reviewer`, `debugger`, `technical-researcher`, `test-automator` | mesmo conjunto GSD |

---

## 🧠 Claude Code Agents

### Dhara Pecuária — Addon Sankhya (46 agentes)

#### Orchestrator Principal
| Agente | Arquivo |
|--------|---------|
| `dhara-sankhya-orchestrator` | `claude-code-agents/dhara-pecuaria/dhara-sankhya-orchestrator.md` |

> **Fluxo:** `context-manager` → [especialistas em PARALELO] → `gsd-verifier` → `context-manager`

#### Especialistas do Addon
| Agente | Especialidade |
|--------|--------------|
| `dhara-sankhya-addon-dev` | Arquitetura geral, Gradle, Add-on Studio SDK 2+, deploy |
| `dhara-db-dictionary` | `dbscripts/`, `datadictionary/`, `menu.xml`, Dynamic Forms, DDL |
| `dhara-java-backend` | Handlers, Services, Actions, Listeners, Buttons, JAPE |
| `dhara-html5-frontend` | `vc/src/webapp/html5`, SankhyaJS, telas customizadas |
| `dhara-environment-intellij` | IntelliJ, JDK 8, Gradle, WildFly, Docker, debug |
| `dhara-selenium-visual-tester` | Shadow-DOM login, patch sf.js, 11 telas DH_ |
| `context-manager` | **Obrigatório início e fim** |

> Mais os **35 agentes GSD** compartilhados listados abaixo.

---

### App Academia — Spring Boot + Flutter (56 agentes)

#### Orchestrator Principal
| Agente | Arquivo |
|--------|---------|
| `app-academia-orchestrator` | `claude-code-agents/app-academia/app-academia-orchestrator.md` |

> **Fluxo:** `context-manager` → [especialistas em PARALELO] → `qa` → `product-owner` → `context-manager`

#### Especialistas do Projeto
| Agente | Especialidade |
|--------|--------------|
| `architect` | Decisões técnicas, multi-tenant, contratos de API |
| `backend-spring` | Java Spring Boot, controllers, services, Flyway, JWT, PostgreSQL |
| `frontend-flutter` | Flutter Web/Windows/Mobile, widgets, state management |
| `product-owner` | Histórias, Trello, critérios de aceite, priorização |
| `qa` | Validação, testes, regressão, aceite |
| `app-academia-selenium-visual-tester` | Selenium para Flutter web, BaseFinanceiroTest |
| `docs-devops-fastlane` | Changelog, CI/CD, Fastlane, publicação |
| `deployment-engineer` | Docker, GitHub Actions, Railway |
| `ui-ux-pro-max` | Design system, paletas, tipografia, auditoria visual |
| `context-manager` | **Obrigatório início e fim** |

> Mais os **35 agentes GSD** compartilhados + `code-reviewer`, `debugger`, `technical-researcher`, `test-automator`.

---

### Agentes GSD — Compartilhados entre ambos os projetos (35 agentes)

**Pesquisa:** `gsd-project-researcher`, `gsd-domain-researcher`, `gsd-advisor-researcher`, `gsd-ai-researcher`, `gsd-phase-researcher`, `gsd-research-synthesizer`, `gsd-assumptions-analyzer`, `gsd-intel-updater`

**Planejamento:** `gsd-planner`, `gsd-plan-checker`, `gsd-roadmapper`, `gsd-framework-selector`, `gsd-codebase-mapper`, `gsd-pattern-mapper`, `gsd-user-profiler`

**Implementação:** `gsd-executor`, `gsd-integration-checker`

**Review/Qualidade:** `gsd-code-reviewer`, `gsd-code-fixer`, `gsd-security-auditor`, `gsd-ui-auditor`, `gsd-ui-checker`, `gsd-verifier`, `gsd-eval-planner`, `gsd-eval-auditor`, `gsd-nyquist-auditor`

**Debug:** `gsd-debugger`, `gsd-debug-session-manager`

**Documentação:** `gsd-doc-writer`, `gsd-doc-classifier`, `gsd-doc-synthesizer`, `gsd-doc-verifier`

**UI/UX:** `gsd-ui-researcher`

---

## ⚡ OpenCode Skills

### Dhara Pecuária (5 skills)

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `sankhya-addon-dev` | Cria e evolui ADDs Sankhya no Add-on Studio SDK 2+ | `opencode-skills/dhara-pecuaria/sankhya-addon-dev/` |
| `sankhya-db-dictionary` | Datadictionary, tabelas DH_ e scripts DDL | `opencode-skills/dhara-pecuaria/sankhya-db-dictionary/` |
| `sankhya-java-backend` | Handlers, Listeners, Buttons e Services | `opencode-skills/dhara-pecuaria/sankhya-java-backend/` |
| `sankhya-html5-frontend` | Telas AngularJS e XHTML5 no módulo snk | `opencode-skills/dhara-pecuaria/sankhya-html5-frontend/` |
| `sankhya-env-intellij` | Setup de ambiente local com IntelliJ e WildFly | `opencode-skills/dhara-pecuaria/sankhya-env-intellij/` |

### App Academia (62 skills)

#### Especialistas
| Skill | Descrição |
|-------|-----------|
| `app-academia-orchestrator` | Agente principal da workspace AppAcademia |
| `app-academia-selenium-visual-tester` | Testes visuais Selenium para Flutter web |
| `architect` | Decisões técnicas e padrões de arquitetura |
| `backend-spring` | Java Spring Boot, JPA, Flyway, JWT |
| `frontend-flutter` | Flutter Web/Windows/Mobile |
| `product-owner` | Histórias, Trello, critérios de aceite |
| `qa` | Validação, testes, regressão |
| `docs-devops-fastlane` | CI/CD, Changelog, publicação |
| `deployment-engineer` | Docker, GitHub Actions, Railway |
| `code-reviewer` | Review de código e refactoring |
| `context-manager` | Memória e contexto entre sessões |
| `debugger` | Diagnóstico de bugs |

#### Metodologia e Workflow
| Skill | Descrição |
|-------|-----------|
| `opencode-gsd-workflow` | Loop de entrega GSD (Get Shit Done) |
| `opencode-memory-context` | Preservação de memória entre sessões |
| `opencode-superpowers-method` | Método spec-first e test-aware |
| `opencode-ui-ux-pro` | Heurísticas de design e UX de nível produto |
| `opencode-resource-scout` | Avaliação de recursos do ecossistema |
| `opencode-obsidian-vault` | Trabalho com Obsidian vaults |
| `opencode-n8n-workflows` | Design de workflows n8n |
| `opencode-docker-devops` | Docker, Docker Compose, WSL2 e DevOps |

#### UI/UX e Design
| Skill | Descrição |
|-------|-----------|
| `ui-ux-pro-max` | Design system e auditoria visual |
| `banner-design` | Design de banners para campanhas |
| `brand` | Brand voice, identidade visual e messaging |
| `design-system` | Design tokens, componentes e semântica visual |
| `design` | Logos, ícones, CIP, fotos sociais |
| `slides` | Apresentações e slide decks |
| `ui-styling` | Estilização de UI e sistemas de estilo |

> Mais os **35 agentes GSD** correspondentes.

---

## 🗂️ Codex Agents (OpenAI TOML)

Definições TOML compatíveis com Codex/OpenAI API — espelham os agentes Claude Code `.md`.

```toml
description = "Descrição curta do agente"
developer_instructions = '''
# Nome do Agente
Conteúdo completo extraído do Claude Code .md correspondente
'''
name = "nome-do-agente"
```

| Projeto | Pasta | Qtd |
|---------|-------|-----|
| Dhara Pecuária | `codex-agents/dhara-pecuaria/` | 46 |
| App Academia | `codex-agents/app-academia/` | 56 |

---

## 🚀 Como Usar

### Claude Code

```bash
# Dhara Pecuária
cp claude-code-agents/dhara-pecuaria/*.md C:/dharatecnologia/dhara-pecuaria/.claude/agents/

# App Academia
cp claude-code-agents/app-academia/*.md C:/App_Academia/.claude/agents/
```

### OpenCode

```bash
# Dhara Pecuária
cp -r opencode-skills/dhara-pecuaria/. C:/dharatecnologia/.agents/skills/

# App Academia
cp -r opencode-skills/app-academia/. C:/App_Academia/.opencode/skills/
```

### Codex

```bash
# Referenciar os .toml na OpenAI Agents API
# codex-agents/dhara-pecuaria/  ou  codex-agents/app-academia/
```

---

## 📏 Regras dos Orchestrators

### Regra 1 — context-manager sempre
```
PASSO 1: context-manager → carregar contexto anterior
...trabalho dos especialistas em PARALELO...
PASSO N: context-manager → gravar decisões e resultados
```

### Regra 2 — Multi-processamento
```
# Nunca sequencialize o que pode ser paralelizado
[PARALELO]: especialista-A + especialista-B + especialista-C
→ sincronizar → commit → push
```

### Regra 3 — VER PARA CRER (App Academia)
```
PROIBIDO: aplicar fix sem ver o erro real
OBRIGATÓRIO: ler stacktrace / response body antes de qualquer alteração
OBRIGATÓRIO: validar com qa após o fix
```

### Regra 4 — Dual Flutter Dirs (App Academia)
```
Toda mudança em task_manager_flutter
DEVE ser replicada em task_manager_flutter_merged_final
```

### Regra 5 — Separação de contextos
- Orchestrator do **Dhara** não referencia agentes do App Academia
- Orchestrator do **App Academia** não referencia agentes Sankhya/Dhara
- Agentes compartilhados: `gsd-*`, `context-manager`, `code-reviewer`, `debugger`

---

## 📊 Estatísticas

> Claude Code `.md` é a fonte de verdade → OpenCode `SKILL.md` e Codex `.toml` são derivados.

| Formato | Dhara Pecuária | App Academia | Total |
|---------|---------------|--------------|-------|
| **Claude Code** (`.md`) | 46 | 56 | **102** |
| **OpenCode** (`SKILL.md`) | 5 | 62 | **67** |
| **Codex** (`.toml`) | 46 | 56 | **102** |

### Dhara Pecuária — 46 agentes

| Categoria | Qtd | Principais |
|-----------|-----|-----------|
| Orchestrator | 1 | `dhara-sankhya-orchestrator` |
| Especialistas Sankhya | 6 | `dhara-sankhya-addon-dev`, `dhara-db-dictionary`, `dhara-java-backend`, `dhara-html5-frontend`, `dhara-environment-intellij`, `dhara-selenium-visual-tester` |
| Contexto e Memória | 1 | `context-manager` |
| Utilitários | 3 | `code-reviewer`, `debugger`, `technical-researcher` |
| GSD | 35 | `gsd-*` |

### App Academia — 56 agentes

| Categoria | Qtd | Principais |
|-----------|-----|-----------|
| Orchestrator | 1 | `app-academia-orchestrator` |
| Especialistas | 9 | `architect`, `backend-spring`, `frontend-flutter`, `product-owner`, `qa`, `docs-devops-fastlane`, `deployment-engineer`, `ui-ux-pro-max`, `app-academia-selenium-visual-tester` |
| Contexto e Memória | 1 | `context-manager` |
| Utilitários | 4 | `code-reviewer`, `debugger`, `technical-researcher`, `test-automator` |
| GSD | 35 | `gsd-*` |
| UI/UX | 1 | `gsd-ui-researcher` |
| Extra | 5 | `opencode-memory-context`, `gsd-ai-researcher`, etc. |

---

## 🏗️ Projetos que Usam Estes Agentes

| Projeto | Localização | Orchestrator |
|---------|-------------|-------------|
| **Dhara Pecuária** | `C:\dharatecnologia\dhara-pecuaria` | `dhara-sankhya-orchestrator` |
| **App Academia** | `C:\App_Academia` | `app-academia-orchestrator` |

---

## 🤝 Contribuindo

Para adicionar um novo agente:

1. **Claude Code** → crie `claude-code-agents/<projeto>/<nome>.md` com `description:` no front-matter
2. **OpenCode** → crie `opencode-skills/<projeto>/<nome>/SKILL.md`
3. **Codex** → crie `codex-agents/<projeto>/<nome>.toml`
4. **Registre no orchestrator** do projeto correspondente
5. Atualize este README
6. Commit e push

---

*Última atualização: 2026-06-09*
