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
│   └── app-academia/                    # 56 agentes — Spring Boot + Flutter
│
├── opencode-skills/                     # Skills OpenCode (.opencode/skills/)
│   └── app-academia/                    # 62 skills — App Academia + GSD + UI/UX
│
└── codex-agents/                        # Agentes Codex/OpenAI TOML
    └── app-academia/                    # 56 agentes TOML
```

---

## 🏗️ Projetos

**App Academia** — ERP contábil integrado com Spring Boot + Flutter Web/Windows/Mobile.

| Dimensão | Detalhe |
|---|---|
| **Orchestrator** | `app-academia-orchestrator` |
| **Backend** | Java 17, Spring Boot 3.2, PostgreSQL, Flyway, JWT |
| **Frontend** | Flutter Web + Windows + Android (dual-dir: `task_manager_flutter` e `task_manager_flutter_merged_final`) |
| **Deploy** | Railway (prod) + local (`AppAcademia_Tudo.bat`) |
| **Testes E2E** | Selenium em `.selenium-app-academia-e2e/` |

---

## 🧠 Claude Code Agents — App Academia (56 agentes)

### Orchestrator Principal

| Agente | Arquivo |
|--------|---------|
| `app-academia-orchestrator` | `claude-code-agents/app-academia/app-academia-orchestrator.md` |

> **Fluxo obrigatório:** `context-manager` → [especialistas em PARALELO] → `qa` → `product-owner` → `context-manager`

### Especialistas do Projeto

| Agente | Especialidade |
|--------|--------------|
| `architect` | Decisões técnicas, multi-tenant, contratos de API, padrões de projeto |
| `backend-spring` | Java Spring Boot, controllers, services, repositories, Flyway, JWT, PostgreSQL |
| `frontend-flutter` | Flutter mobile/web/windows, telas, widgets, API integration |
| `product-owner` | Histórias, critérios de aceite, cards Trello, priorização |
| `qa` | Validação, testes, regressão, aceite, fechamento de cards |
| `app-academia-selenium-visual-tester` | Selenium para Flutter web — Selenium 4, BaseFinanceiroTest |
| `docs-devops-fastlane` | Changelog, CI/CD, Fastlane, publicação |
| `deployment-engineer` | Docker, GitHub Actions, build e release |
| `ui-ux-pro-max` | Design system, paletas, tipografia, auditoria visual |
| `context-manager` | **Obrigatório início e fim** — carregar/gravar decisões |
| `code-reviewer` | Review de código, padrões, refactoring |
| `debugger` | Diagnóstico de bugs, stack traces, troubleshooting |
| `technical-researcher` | Pesquisa de bibliotecas, frameworks, soluções |
| `test-automator` | Criação de testes unitários e de integração |

### Agentes GSD (metodologia compartilhada — 35 agentes)

**Pesquisa:** `gsd-project-researcher`, `gsd-domain-researcher`, `gsd-advisor-researcher`, `gsd-ai-researcher`, `gsd-phase-researcher`, `gsd-research-synthesizer`, `gsd-assumptions-analyzer`, `gsd-intel-updater`

**Planejamento:** `gsd-planner`, `gsd-plan-checker`, `gsd-roadmapper`, `gsd-framework-selector`, `gsd-codebase-mapper`, `gsd-pattern-mapper`, `gsd-user-profiler`

**Implementação:** `gsd-executor`, `gsd-integration-checker`

**Review/Qualidade:** `gsd-code-reviewer`, `gsd-code-fixer`, `gsd-security-auditor`, `gsd-ui-auditor`, `gsd-ui-checker`, `gsd-verifier`, `gsd-eval-planner`, `gsd-eval-auditor`, `gsd-nyquist-auditor`

**Debug:** `gsd-debugger`, `gsd-debug-session-manager`

**Documentação:** `gsd-doc-writer`, `gsd-doc-classifier`, `gsd-doc-synthesizer`, `gsd-doc-verifier`

**UI/UX:** `gsd-ui-researcher`

---

## ⚡ OpenCode Skills — App Academia (62 skills)

### Especialistas do Projeto

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

### Skills de Metodologia e Workflow

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

### Skills UI/UX e Design

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

## 🗂️ Codex Agents — App Academia (56 agentes TOML)

Definições TOML compatíveis com Codex/OpenAI — espelham os agentes Claude Code `.md`.

Formato de cada arquivo:
```toml
description = "Descrição curta do agente"
developer_instructions = '''
# Nome do Agente
Conteúdo completo extraído do Claude Code .md correspondente
'''
name = "nome-do-agente"
```

Disponíveis em `codex-agents/app-academia/`.

---

## 🚀 Como Usar

### Claude Code — App Academia

```bash
# 1. Copiar agentes para o projeto
cp claude-code-agents/app-academia/*.md SEU_PROJETO/.claude/agents/

# 2. Usar o orchestrator
# No Claude Code: /app-academia-orchestrator [seu pedido]
```

### OpenCode — App Academia

```bash
# Copiar skills desejadas
cp -r opencode-skills/app-academia/app-academia-orchestrator SEU_PROJETO/.opencode/skills/

# Ou copiar todas de uma vez
cp -r opencode-skills/app-academia/. SEU_PROJETO/.opencode/skills/
```

### Codex — App Academia

```bash
# Usar os .toml em codex-agents/app-academia/
# Referenciar como agentes na OpenAI Agents API
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
[PARALELO]: backend-spring + frontend-flutter + qa
→ sincronizar resultados → commit → push
```

### Regra 3 — VER PARA CRER
```
PROIBIDO: aplicar fix sem ver o erro real
OBRIGATÓRIO: ler stacktrace / response body antes de qualquer alteração
OBRIGATÓRIO: validar com qa após o fix
```

### Regra 4 — Dual Flutter Dirs
```
Toda mudança em task_manager_flutter
DEVE ser replicada em task_manager_flutter_merged_final
```

---

## 📊 Estatísticas

> Claude Code `.md` é a fonte de verdade → OpenCode `SKILL.md` e Codex `.toml` são derivados.

| Formato | App Academia | Total |
|---------|--------------|-------|
| **Claude Code** (`.md`) | 56 | **56** |
| **OpenCode** (`SKILL.md`) | 62 | **62** |
| **Codex** (`.toml`) | 56 | **56** |

### Distribuição por categoria — App Academia

| Categoria | Qtd | Agentes |
|-----------|-----|---------|
| Orchestrator | 1 | `app-academia-orchestrator` |
| Especialistas do Projeto | 9 | `architect`, `backend-spring`, `frontend-flutter`, `product-owner`, `qa`, `docs-devops-fastlane`, `deployment-engineer`, `ui-ux-pro-max`, `app-academia-selenium-visual-tester` |
| Contexto e Memória | 1 | `context-manager` |
| Utilitários | 4 | `code-reviewer`, `debugger`, `technical-researcher`, `test-automator` |
| GSD — Pesquisa | 8 | `gsd-*-researcher`, `gsd-research-synthesizer`, `gsd-assumptions-analyzer`, `gsd-intel-updater` |
| GSD — Planejamento | 7 | `gsd-planner`, `gsd-plan-checker`, `gsd-roadmapper`, `gsd-framework-selector`, `gsd-codebase-mapper`, `gsd-pattern-mapper`, `gsd-user-profiler` |
| GSD — Implementação | 2 | `gsd-executor`, `gsd-integration-checker` |
| GSD — Review/Qualidade | 9 | `gsd-code-reviewer`, `gsd-code-fixer`, `gsd-security-auditor`, `gsd-ui-auditor`, `gsd-ui-checker`, `gsd-verifier`, `gsd-eval-planner`, `gsd-eval-auditor`, `gsd-nyquist-auditor` |
| GSD — Debug | 2 | `gsd-debugger`, `gsd-debug-session-manager` |
| GSD — Documentação | 4 | `gsd-doc-writer`, `gsd-doc-classifier`, `gsd-doc-synthesizer`, `gsd-doc-verifier` |
| GSD — UI/UX | 1 | `gsd-ui-researcher` |
| **Total** | **56** | |

---

## 🏗️ Projeto que Usa Estes Agentes

| Projeto | Localização | Orchestrator |
|---------|-------------|-------------|
| **App Academia** | `C:\App_Academia` | `app-academia-orchestrator` |

---

## 🤝 Contribuindo

Para adicionar um novo agente:

1. **Claude Code** → crie `claude-code-agents/app-academia/<nome>.md` com `description:` no front-matter
2. **OpenCode** → crie `opencode-skills/app-academia/<nome>/SKILL.md`
3. **Codex** → crie `codex-agents/app-academia/<nome>.toml`
4. **Registre no orchestrator** do projeto correspondente
5. Atualize este README
6. Commit e push

---

*Mantido pela equipe Abraço Contabilidade · Última atualização: 2026-06-09*
