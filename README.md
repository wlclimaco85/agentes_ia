# 🤖 Agentes IA — Repositório Centralizado

Repositório centralizando todos os agentes, skills e configurações de IA usados nos projetos da organização, compatíveis com **Claude Code**, **OpenCode** e **Codex (OpenAI)**.

---

## 📁 Estrutura

```
agentes_ia/
├── claude-code-agents/         # Agentes para Claude Code (.claude/agents/)
│   ├── dhara-pecuaria/         # Agentes do projeto Dhara Sankhya Addon
│   └── app-academia/           # Agentes do projeto App Academia
│
├── opencode-skills/            # Skills para OpenCode (.agents/skills/)
│   ├── sankhya/                # Skills especializadas Sankhya ERP
│   ├── metodologia/            # Skills de workflow e metodologia
│   ├── app-academia/           # Skills exclusivas App Academia
│   └── ui-ux-pro-max/          # Skills de Design e UI/UX (upstream)
│
├── codex-agents/               # Agentes para Codex/OpenAI (.codex/agents/)
├── mcp-servers/                # Servidores MCP customizados
├── openai-definitions/         # Definições OpenAI YAML
└── referencias/                # Documentação, tabelas de roteamento e guias
```

---

## 🧠 Claude Code Agents

### Projeto: Dhara Pecuária (Sankhya Addon)

| Agente | Especialidade | Arquivo |
|--------|--------------|---------|
| `dhara-sankhya-orchestrator` | Orquestrador principal — entende o pedido e coordena especialistas | `claude-code-agents/dhara-pecuaria/dhara-sankhya-orchestrator.md` |
| `dhara-sankhya-addon-dev` | Arquitetura geral, Gradle, deploy e revisão fim a fim | `claude-code-agents/dhara-pecuaria/dhara-sankhya-addon-dev.md` |
| `dhara-db-dictionary` | Tabelas DH_, DDL incremental, JAPE e Oracle/SQL Server | `claude-code-agents/dhara-pecuaria/dhara-db-dictionary.md` |
| `dhara-java-backend` | Handlers, Services, Listeners, Buttons e regras de negócio Java | `claude-code-agents/dhara-pecuaria/dhara-java-backend.md` |
| `dhara-html5-frontend` | AngularJS 1.x, snk module e telas XHTML5 | `claude-code-agents/dhara-pecuaria/dhara-html5-frontend.md` |
| `dhara-environment-intellij` | Setup IntelliJ, Gradle, WildFly e variáveis de ambiente | `claude-code-agents/dhara-pecuaria/dhara-environment-intellij.md` |

### Projeto: App Academia

| Agente | Especialidade | Arquivo |
|--------|--------------|---------|
| `docs-devops-fastlane` | Documentação, CI/CD, Fastlane e publicação automática | `claude-code-agents/app-academia/docs-devops-fastlane.md` |
| `dhara-sankhya-addon-dev` | (compartilhado) Addon Sankhya | `claude-code-agents/app-academia/dhara-sankhya-addon-dev.md` |

### Como usar no Claude Code

1. Coloque os arquivos `.md` em `.claude/agents/` na raiz do projeto
2. Invoque pelo nome: `@dhara-sankhya-orchestrator entenda o problema e coordene`
3. O orchestrator delega automaticamente para os especialistas corretos

---

## ⚡ OpenCode Skills

### Skills Sankhya (Dhara Pecuária)

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `dhara-sankhya-orchestrator` | Agente principal da workspace Dhara | `opencode-skills/sankhya/dhara-sankhya-orchestrator/` |
| `sankhya-addon-dev` | Cria e evolui ADDs Sankhya no Add-on Studio SDK 2+ | `opencode-skills/sankhya/sankhya-addon-dev/` |
| `sankhya-db-dictionary` | Datadictionary, tabelas DH_ e scripts DDL | `opencode-skills/sankhya/sankhya-db-dictionary/` |
| `sankhya-java-backend` | Handlers, Listeners, Buttons e Services | `opencode-skills/sankhya/sankhya-java-backend/` |
| `sankhya-html5-frontend` | Telas AngularJS e XHTML5 no módulo snk | `opencode-skills/sankhya/sankhya-html5-frontend/` |
| `sankhya-env-intellij` | Setup de ambiente local com IntelliJ e WildFly | `opencode-skills/sankhya/sankhya-env-intellij/` |
| `sankhya-selenium-visual-tester` | Automação de UI e testes visuais com Selenium | `opencode-skills/sankhya/sankhya-selenium-visual-tester/` |

### Skills de Metodologia e Workflow

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `opencode-gsd-workflow` | Loop de entrega GSD (Get Shit Done) focado | `opencode-skills/metodologia/opencode-gsd-workflow/` |
| `opencode-memory-context` | Preservação e reutilização de memória do projeto | `opencode-skills/metodologia/opencode-memory-context/` |
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
| `app-academia-selenium-visual-tester` | Testes visuais Selenium para o app Academia | `opencode-skills/app-academia/app-academia-selenium-visual-tester/` |

### Skills UI/UX Pro Max (Design)

| Skill | Descrição | Caminho |
|-------|-----------|---------|
| `banner-design` | Design de banners para campanhas | `opencode-skills/ui-ux-pro-max/banner-design/` |
| `brand` | Brand voice, identidade visual e messaging | `opencode-skills/ui-ux-pro-max/brand/` |
| `design-system` | Design tokens, componentes e semântica visual | `opencode-skills/ui-ux-pro-max/design-system/` |
| `design` | Logos, ícones, CIP, fotos sociais | `opencode-skills/ui-ux-pro-max/design/` |
| `slides` | Apresentações e slide decks | `opencode-skills/ui-ux-pro-max/slides/` |
| `ui-styling` | Estilização de UI e sistemas de estilo | `opencode-skills/ui-ux-pro-max/ui-styling/` |

### Como usar no OpenCode

```json
// .opencode/config.json
{
  "skills": ["sankhya-addon-dev", "opencode-gsd-workflow"]
}
```

Ou via comando: `/skill sankhya-addon-dev implementar feature X`

---

## 🗂️ Codex Agents (OpenAI)

Definições TOML para uso com Codex/OpenAI API no formato de agentes estruturados.

| Agente | Arquivo |
|--------|---------|
| `dhara-sankhya-addon-dev` | `codex-agents/dhara-sankhya-addon-dev.toml` |
| `dhara-db-dictionary` | `codex-agents/dhara-db-dictionary.toml` |
| `dhara-java-backend` | `codex-agents/dhara-java-backend.toml` |
| `dhara-html5-frontend` | `codex-agents/dhara-html5-frontend.toml` |
| `dhara-environment-intellij` | `codex-agents/dhara-environment-intellij.toml` |
| Configuração geral | `codex-agents/config.toml` |

---

## 🔌 MCP Servers

### sankhya-specialist

Servidor MCP customizado que expõe conhecimento especializado sobre o ecossistema Sankhya.

```
mcp-servers/
└── sankhya-specialist/
    └── server.js    # Node.js MCP server
```

**Configuração no Claude Code:**
```json
// .claude/plugins/sankhya-workspace/.mcp.json
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

## 📚 Referências

| Documento | Descrição |
|-----------|-----------|
| `referencias/AGENT_SKILL_SUMMARY.md` | Tabela de roteamento: quando usar cada agente/skill |
| `referencias/external-agent-repos.md` | Repositórios externos de referência |

---

## 🚀 Início Rápido

### 1. Para Claude Code — Projeto Sankhya

```bash
# Copie os agentes para seu projeto
cp claude-code-agents/dhara-pecuaria/*.md SEU_PROJETO/.claude/agents/

# Use o orchestrator
# No Claude Code: @dhara-sankhya-orchestrator [seu pedido]
```

### 2. Para OpenCode — Qualquer Projeto

```bash
# Copie a skill desejada
cp -r opencode-skills/sankhya/sankhya-addon-dev SEU_PROJETO/.agents/skills/

# Registre no config
# .opencode/config.json → "skills": ["sankhya-addon-dev"]
```

### 3. Para Codex/OpenAI API

```bash
# Use o config TOML como definição do agente
# codex-agents/dhara-sankhya-addon-dev.toml → system prompt + ferramentas
```

---

## 🏗️ Projetos que Usam Estes Agentes

| Projeto | Localização | Agentes Principais |
|---------|-------------|-------------------|
| **Dhara Pecuária** | `C:\dharatecnologia\dhara-pecuaria` | dhara-sankhya-orchestrator, todos os Sankhya |
| **App Academia** | `C:\App_Academia` | app-academia-orchestrator, docs-devops-fastlane |
| **Codex Claude Toolkit** | `C:\dharatecnologia\codex-claude-toolkit` | ui-ux-pro-max skills |

---

## 🤝 Contribuindo

Para adicionar um novo agente:

1. **Claude Code**: crie `claude-code-agents/<projeto>/<nome>.md` com `description:` no front-matter
2. **OpenCode**: crie `opencode-skills/<categoria>/<nome>/SKILL.md`  
3. **Codex**: crie `codex-agents/<nome>.toml` com `description` e `system_prompt`
4. Atualize esta tabela no README
5. Commit e push

---

## 📊 Estatísticas

| Categoria | Quantidade |
|-----------|-----------|
| Claude Code Agents | 7 |
| OpenCode Skills (Sankhya) | 7 |
| OpenCode Skills (Metodologia) | 8 |
| OpenCode Skills (App Academia) | 2 |
| OpenCode Skills (UI/UX Pro Max) | 6 |
| Codex Agents | 5 |
| MCP Servers | 1 |
| **Total de Agentes/Skills** | **36** |

---

*Mantido pela equipe Dharatecnologia · Última atualização: 2026-06-01*
