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
│   ├── dhara-pecuaria/                  # 44 agentes — Addon Sankhya ERP
│   └── app-academia/                    # 49 agentes — Spring Boot + Flutter
│
├── opencode-skills/                     # Skills OpenCode (.agents/skills/)
│   ├── sankhya/                         # 8 skills — Addon Sankhya + testes
│   ├── metodologia/                     # 8 skills — GSD, workflow, ferramentas
│   ├── app-academia/                    # 2 skills — App Academia específicas
│   ├── app-academia-metodologia/        # 8 skills — metodologia no App Academia
│   └── ui-ux-pro-max/                   # 6 skills — Design e UI/UX (upstream)
│
├── codex-agents/                        # Agentes Codex/OpenAI TOML
├── mcp-servers/                         # MCP servers customizados
└── referencias/                         # Tabelas de roteamento e guias
```

---

## 🏗️ Projetos e Separação de Contextos

**Cada projeto tem seu próprio contexto isolado.** Os orchestrators não cruzam referências.

| | Dhara Pecuária | App Academia |
|--|--|--|
| **Domínio** | Addon Sankhya ERP — pecuária bovina | Spring Boot + Flutter multiplataforma |
| **Orchestrator** | `dhara-sankhya-orchestrator` | `app-academia-orchestrator` |
| **Selenium** | `dhara-selenium-visual-tester` | `app-academia-selenium-visual-tester` |
| **Agentes exclusivos** | dhara-*, sankhya-* | architect, backend-spring, frontend-flutter, product-owner, qa, etc. |
| **Shared** | gsd-*, context-manager, code-reviewer, debugger, technical-researcher, test-automator | mesmo conjunto GSD |

---

## 🧠 Claude Code Agents

### Projeto: Dhara Pecuária — Addon Sankhya (44 agentes)

#### Orchestrator Principal
| Agente | Arquivo |
|--------|---------|
| `dhara-sankhya-orchestrator` | `claude-code-agents/dhara-pecuaria/dhara-sankhya-orchestrator.md` |

> **Fluxo obrigatório:** `context-manager` → [especialistas em PARALELO] → `gsd-verifier` → `context-manager`

#### Especialistas do Addon
| Agente | Especialidade |
|--------|--------------|
| `dhara-sankhya-addon-dev` | Arquitetura geral, Gradle, Add-on Studio SDK 2+, deploy, revisão fim a fim |
| `dhara-db-dictionary` | `dbscripts/`, `datadictionary/`, `menu.xml`, Dynamic Forms, migrations DDL |
| `dhara-java-backend` | `model/src/main/java`, handlers, services, actions, listeners, buttons, JAPE |
| `dhara-html5-frontend` | `vc/src/webapp/html5`, SankhyaJS, telas customizadas, chamadas `service.sbr` |
| `dhara-environment-intellij` | IntelliJ, JDK 8, Gradle, WildFly, Docker, debug, variáveis |
| `dhara-selenium-visual-tester` | **Selenium específico do Dhara:** shadow-DOM login, patch sf.js, 11 telas DH_ |

#### Contexto e Memória (sempre usar)
| Agente | Quando usar |
|--------|-------------|
| `context-manager` | **Obrigatório início e fim** — carregar/gravar decisões |
| `opencode-memory-context` | Memória persistente entre sessões longas |

#### Agentes GSD (compartilhados com App Academia)

**Pesquisa:** `technical-researcher`, `gsd-project-researcher`, `gsd-domain-researcher`, `gsd-advisor-researcher`, `gsd-ai-researcher`, `gsd-phase-researcher`, `gsd-research-synthesizer`, `gsd-assumptions-analyzer`, `gsd-intel-updater`

**Planejamento:** `gsd-planner`, `gsd-plan-checker`, `gsd-roadmapper`, `gsd-framework-selector`, `gsd-codebase-mapper`, `gsd-pattern-mapper`, `gsd-user-profiler`

**Implementação:** `gsd-executor`, `gsd-integration-checker`, `test-automator`

**Review/Qualidade:** `code-reviewer`, `gsd-code-reviewer`, `gsd-code-fixer`, `gsd-security-auditor`, `gsd-ui-auditor`, `gsd-ui-checker`, `gsd-verifier`, `gsd-eval-planner`, `gsd-eval-auditor`, `gsd-nyquist-auditor`

**Debug:** `debugger`, `gsd-debugger`, `gsd-debug-session-manager`

**Documentação:** `gsd-doc-writer`, `gsd-doc-classifier`, `gsd-doc-synthesizer`, `gsd-doc-verifier`

**UI/UX:** `gsd-ui-researcher`

---

### Projeto: App Academia — Spring Boot + Flutter (49 agentes)

#### Orchestrator Principal
| Agente | Arquivo |
|--------|---------|
| `app-academia-orchestrator` | `claude-code-agents/app-academia/app-academia-orchestrator.md` |

> **Fluxo obrigatório:** `context-manager` → [especialistas em PARALELO] → `gsd-verifier` + `qa` → `context-manager`

#### Especialistas do App Academia
| Agente | Especialidade |
|--------|--------------|
| `architect` | Decisões técnicas, multi-tenant, contratos de API, padrões de projeto |
| `backend-spring` | Java Spring Boot, controllers, services, repositories, Flyway, JWT, PostgreSQL |
| `frontend-flutter` | Flutter mobile/web/windows, telas, widgets, API integration |
| `product-owner` | Histórias, critérios de aceite, cards Trello, priorização |
| `qa` | Validação, testes, regressão, aceite, fechamento de cards |
| `app-academia-selenium-visual-tester` | Selenium para Flutter web — baseado em Selenium 4 |
| `docs-devops-fastlane` | Changelog, CI/CD, Fastlane, publicação |
| `deployment-engineer` | Docker, GitHub Actions, build e release |
| `ui-ux-pro-max` | Design system, paletas, tipografia, auditoria visual |

> Mais os mesmos **35 agentes GSD** listados acima + `code-reviewer`, `debugger`, `technical-researcher`, `test-automator`, `context-manager`

---

## ⚡ OpenCode Skills

### Skills Sankhya — Dhara Pecuária

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `dhara-sankhya-orchestrator` | Agente principal da workspace Dhara | `opencode-skills/sankhya/dhara-sankhya-orchestrator/` |
| `sankhya-addon-dev` | Cria e evolui ADDs Sankhya no Add-on Studio SDK 2+ | `opencode-skills/sankhya/sankhya-addon-dev/` |
| `sankhya-db-dictionary` | Datadictionary, tabelas DH_ e scripts DDL | `opencode-skills/sankhya/sankhya-db-dictionary/` |
| `sankhya-java-backend` | Handlers, Listeners, Buttons e Services | `opencode-skills/sankhya/sankhya-java-backend/` |
| `sankhya-html5-frontend` | Telas AngularJS e XHTML5 no módulo snk | `opencode-skills/sankhya/sankhya-html5-frontend/` |
| `sankhya-env-intellij` | Setup de ambiente local com IntelliJ e WildFly | `opencode-skills/sankhya/sankhya-env-intellij/` |
| `sankhya-selenium-visual-tester` | Base genérica de testes Sankhya | `opencode-skills/sankhya/sankhya-selenium-visual-tester/` |
| `dhara-selenium-visual-tester` | **Específico Dhara:** shadow-DOM, sf.js, telas DH_, harness `.selenium-dhara-e2e` | `opencode-skills/sankhya/dhara-selenium-visual-tester/` |

### Skills de Metodologia e Workflow

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `opencode-gsd-workflow` | Loop de entrega GSD (Get Shit Done) | `opencode-skills/metodologia/opencode-gsd-workflow/` |
| `opencode-memory-context` | Preservação de memória do projeto entre sessões | `opencode-skills/metodologia/opencode-memory-context/` |
| `opencode-superpowers-method` | Método spec-first e test-aware de engenharia | `opencode-skills/metodologia/opencode-superpowers-method/` |
| `opencode-ui-ux-pro` | Heurísticas de design e UX de nível produto | `opencode-skills/metodologia/opencode-ui-ux-pro/` |
| `opencode-resource-scout` | Avaliação e adaptação de recursos do ecossistema | `opencode-skills/metodologia/opencode-resource-scout/` |
| `opencode-obsidian-vault` | Trabalho com Obsidian vaults | `opencode-skills/metodologia/opencode-obsidian-vault/` |
| `opencode-n8n-workflows` | Design e documentação de workflows n8n | `opencode-skills/metodologia/opencode-n8n-workflows/` |
| `opencode-docker-devops` | Docker, Docker Compose, WSL2 e DevOps | `opencode-skills/metodologia/opencode-docker-devops/` |

### Skills App Academia

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `app-academia-orchestrator` | Agente principal da workspace AppAcademia | `opencode-skills/app-academia/app-academia-orchestrator/` |
| `app-academia-selenium-visual-tester` | Testes visuais Selenium para Flutter web | `opencode-skills/app-academia/app-academia-selenium-visual-tester/` |

### Skills UI/UX Pro Max (Design)

| Skill | Descrição |
|-------|-----------|
| `banner-design` | Design de banners para campanhas |
| `brand` | Brand voice, identidade visual e messaging |
| `design-system` | Design tokens, componentes e semântica visual |
| `design` | Logos, ícones, CIP, fotos sociais |
| `slides` | Apresentações e slide decks |
| `ui-styling` | Estilização de UI e sistemas de estilo |

---

## 🔬 dhara-selenium-visual-tester — Particularidades

O Dhara tem um tester Selenium **único** por causa das especificidades do Sankhya 4.35:

### Login shadow-DOM
```python
# O componente <sankhya-login> usa Shadow DOM — seletores normais não funcionam
root = driver.find_element(By.CSS_SELECTOR, "sankhya-login").shadow_root
root.find_element(By.CSS_SELECTOR, "#user").send_keys("sup")
# Etapa 1: Prosseguir → Etapa 2: senha → Prosseguir
```

### Patch sf.js obrigatório
```html
<!-- system.jsp deve ter ANTES do snk.js -->
<script src="scripts/vendors/sf/sf.js"></script>
<script src="scripts/snk.js?v=0"></script>
```

### 11 Telas DH_ com Menu IDs
```python
SCREENS = {
    "configuracao": "pecuaria.configuracao",   # Configuração Pecuária
    "faixa":        "pecuaria.faixa",          # Faixa Etária
    "raca":         "pecuaria.raca",           # Raça de Animais
    "tipexame":     "pecuaria.tipexame",       # Tipo de Exame
    "historico":    "pecuaria.historico",      # Histórico de Animais
    "entrada":      "pecuaria.entrada",        # Entrada de Animais
    "iatf":         "pecuaria.iatf",           # IATF/Monta
    "diag":         "pecuaria.diag",           # Diagnóstico de Gestação
    "parto":        "pecuaria.parto",          # Registro de Parto
    "apontamento":  "pecuaria.apontamento",    # Apontamento Pecuária
    "venda":        "pecuaria.venda",          # Venda de Animais
}
```

---

## 🗂️ Codex Agents (OpenAI)

Definições TOML para Codex/OpenAI API — **45 agentes para Dhara, 53 para App Academia**.

Formato de cada arquivo:
```toml
description = "Descrição curta do agente"
developer_instructions = '''
# Nome do Agente
Conteúdo completo extraído do Claude Code .md correspondente
'''
name = "nome-do-agente"
```

Agentes disponíveis em `codex-agents/dhara-pecuaria/` e `codex-agents/app-academia/`.

---

## 🔌 MCP Servers

### sankhya-specialist

Servidor MCP Node.js que expõe conhecimento especializado sobre o ecossistema Sankhya.

```json
// .mcp.json
{
  "mcpServers": {
    "sankhya-specialist": {
      "command": "node",
      "args": [".agents/mcp/sankhya-specialist/server.js"]
    }
  }
}
```

---

## 🚀 Como Usar

### Claude Code — Dhara Pecuária

```bash
# 1. Copiar agentes para o projeto
cp claude-code-agents/dhara-pecuaria/*.md SEU_PROJETO/.claude/agents/

# 2. Usar o orchestrator (ele delega para os especialistas certos em paralelo)
# No Claude Code: @dhara-sankhya-orchestrator [seu pedido]
```

### Claude Code — App Academia

```bash
cp claude-code-agents/app-academia/*.md SEU_PROJETO/.claude/agents/
# No Claude Code: @app-academia-orchestrator [seu pedido]
```

### OpenCode — Qualquer Projeto

```bash
# Copiar a skill desejada (100 disponíveis em opencode-skills/)
cp -r opencode-skills/dhara-pecuaria/sankhya-addon-dev SEU_PROJETO/.agents/skills/

# Registrar no config
# .opencode/config.json → "skills": ["sankhya-addon-dev"]
```

---

## 📏 Regras dos Orchestrators

### Regra 1 — context-manager sempre
```
PASSO 1: context-manager → carregar contexto anterior
...trabalho...
PASSO N: context-manager → gravar decisões e resultados
```

### Regra 2 — Multi-processamento
```
# Nunca sequencialize o que pode ser paralelizado
[PARALELO]: agente-A + agente-B + agente-C
→ sincronizar resultados → implementar → verificar
```

### Regra 3 — Separação de contextos
- Orchestrator do **Dhara** não referencia agentes do App Academia
- Orchestrator do **App Academia** não referencia agentes Sankhya/Dhara
- Agentes compartilhados: GSD, context-manager, code-reviewer, debugger

---

## 📊 Estatísticas

> Regra: todo agente deve existir nos **3 formatos** simultaneamente.
> Claude Code `.md` é a fonte de verdade → OpenCode `SKILL.md` e Codex `.toml` são derivados.

| Formato | Dhara Pecuária | App Academia | Total |
|---------|---------------|--------------|-------|
| **Claude Code** (`.md`) | 45 | 53 | **98** |
| **OpenCode** (`SKILL.md`) | 45 | 55 | **100** |
| **Codex** (`.toml`) | 45 | 53 | **98** |
| **MCP Servers** | 1 | — | **1** |

### Distribuição por categoria — Dhara Pecuária (45 agentes)

| Categoria | Agentes |
|-----------|---------|
| Especialistas do Addon Sankhya | 7 (dhara-*, orchestrator, selenium) |
| Contexto e Memória | 1 (context-manager) |
| Pesquisa e Análise | 10 (gsd-*-researcher, technical-researcher) |
| Planejamento | 7 (gsd-planner, gsd-plan-checker, gsd-roadmapper, ...) |
| Implementação | 3 (gsd-executor, gsd-integration-checker, test-automator) |
| Review e Qualidade | 10 (code-reviewer, gsd-code-reviewer, gsd-security-auditor, ...) |
| Debug | 3 (debugger, gsd-debugger, gsd-debug-session-manager) |
| Documentação | 4 (gsd-doc-*) |
| UI/UX | 1 (gsd-ui-researcher) |
| **Total** | **45** |

### Distribuição por categoria — App Academia (53 agentes)

| Categoria | Agentes |
|-----------|---------|
| Especialistas do Projeto | 9 (architect, backend-spring, frontend-flutter, product-owner, qa, ...) |
| Contexto e Memória | 1 (context-manager) |
| GSD (todos os grupos) | 35 (gsd-*) |
| Utilitários | 4 (code-reviewer, debugger, technical-researcher, test-automator) |
| UI/UX | 2 (gsd-ui-researcher, ui-ux-pro-max) |
| Orchestrator | 1 (app-academia-orchestrator) |
| Selenium | 1 (app-academia-selenium-visual-tester) |
| **Total** | **53** |

---

## 🏗️ Projetos que Usam Estes Agentes

| Projeto | Localização | Orchestrator |
|---------|-------------|-------------|
| **Dhara Pecuária** | `C:\dharatecnologia\dhara-pecuaria` | `dhara-sankhya-orchestrator` |
| **App Academia** | `C:\App_Academia` | `app-academia-orchestrator` |
| **Codex Claude Toolkit** | `C:\dharatecnologia\codex-claude-toolkit` | skills ui-ux-pro-max |

---

## 🤝 Contribuindo

Para adicionar um novo agente:

1. **Claude Code** → crie `claude-code-agents/<projeto>/<nome>.md` com `description:` no front-matter
2. **OpenCode** → crie `opencode-skills/<categoria>/<nome>/SKILL.md`
3. **Codex** → crie `codex-agents/<nome>.toml`
4. **Registre no orchestrator** do projeto correspondente
5. Atualize este README
6. Commit e push

---

*Mantido pela equipe Dharatecnologia · Última atualização: 2026-06-01*
