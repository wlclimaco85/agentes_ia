---
name: ui-ux-pro-max
description: Design intelligence para UI/UX web e mobile. Contém 67 estilos, 96 paletas de cores, 57 combinações de fontes, 99 diretrizes UX. Use quando precisar de design system, paleta, layout, tipografia ou auditoria visual.
mode: subagent
---

# UI/UX Pro Max

Guia de design abrangente para aplicações web e mobile. Contém 67 estilos, 96 paletas de cores, 57 combinações de fontes, 99 diretrizes UX e 25 tipos de gráficos em 13 stacks tecnológicas. Base de dados com busca e recomendações por prioridade.

---

## Pré-requisitos

Verificar se Python está instalado:

```bash
python3 --version || python --version
```

Se não estiver instalado no Windows:

```powershell
winget install Python.Python.3.12
```

---

## Como usar o script de busca

### Caminho do script

```
C:\App_Academia\.opencode\skills\ui-ux-pro-max\scripts\search.py
```

### Sintaxe geral

```bash
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "<query>" [--design-system] [--domain <domain>] [--stack <stack>] [-p "Nome do Projeto"] [--persist] [--page "pagina"]
```

---

## Quando usar cada flag

### `--design-system` (ponto de partida obrigatório)

Use **sempre** como primeiro passo. Gera um sistema de design completo buscando em 5 domínios em paralelo (produto, estilo, cor, landing, tipografia) e aplica regras de raciocínio para retornar o melhor conjunto de padrão + estilo + cores + tipografia + efeitos + anti-padrões.

```bash
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "fitness academia dashboard" --design-system -p "AppAcademia"
```

Adicione `--persist` para salvar o sistema de design em arquivos hierárquicos:

```bash
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "fitness academia dashboard" --design-system --persist -p "AppAcademia"
```

Isso cria:
- `design-system/MASTER.md` — fonte da verdade global com todas as regras
- `design-system/pages/<pagina>.md` — sobrescritas por página (com `--page`)

### `--domain <domain>` (busca específica por domínio)

Use para complementar o design system com detalhes específicos:

| Necessidade | Domínio | Exemplo |
|---|---|---|
| Mais opções de estilo | `style` | `--domain style "glassmorphism dark"` |
| Recomendações de gráficos | `chart` | `--domain chart "dashboard financeiro"` |
| Boas práticas UX | `ux` | `--domain ux "acessibilidade animacao"` |
| Fontes alternativas | `typography` | `--domain typography "profissional limpo"` |
| Estrutura de landing page | `landing` | `--domain landing "hero social-proof"` |
| Paletas por setor | `color` | `--domain color "fintech saas"` |

### `--stack <stack>` (diretrizes por tecnologia)

Use para obter boas práticas específicas da stack. Para Flutter (stack principal do AppAcademia):

```bash
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "layout responsivo formulario" --stack flutter
```

Stacks disponíveis: `html-tailwind` (padrão), `react`, `nextjs`, `vue`, `svelte`, `swiftui`, `react-native`, `flutter`, `shadcn`, `jetpack-compose`

---

## Exemplos para o projeto AppAcademia

### Design system inicial (contabilidade/gestão financeira)

```bash
# Gerar sistema de design para o app de gestão financeira
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "financial management saas dashboard professional" --design-system -p "AppAcademia" --persist
```

### Paleta Abraço (vermelho/verde — cores principais do AppAcademia)

O AppAcademia usa vermelho (`GridColors.error`) como cor primária e verde (`GridColors.success`) como cor secundária/positiva. Para buscar paletas compatíveis:

```bash
# Buscar paletas com vermelho e verde para fintech/contabilidade
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "red green accounting fintech professional" --domain color

# Buscar estilos que funcionam bem com essa paleta
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "corporate red green dashboard" --domain style
```

### Telas móveis do calendário financeiro

```bash
# Design system para tela de calendário financeiro mobile
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "financial calendar mobile agenda flutter" --design-system -p "AppAcademia" --page "calendario"

# Boas práticas UX para estados vazios em calendário
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "empty state calendar mobile" --domain ux
```

### Grid de contas a pagar/receber

```bash
# Design para grids financeiros com status e badges
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "data grid table financial status badges flutter" --stack flutter

# UX para listas longas e filtros
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "list filtering pagination" --domain ux
```

### Dashboard de KPIs

```bash
# Sistema de design para dashboard com gráficos financeiros
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "kpi dashboard financial charts analytics" --design-system -p "AppAcademia" --page "dashboard"

# Tipos de gráficos recomendados para fluxo de caixa
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "cashflow trend comparison timeline" --domain chart
```

---

## Workflow padrão para tarefas UI/UX

### Passo 1 — Analisar requisitos

Extrair do pedido:
- **Tipo de produto**: dashboard, tela de listagem, formulário, onboarding, etc.
- **Palavras-chave de estilo**: mínimo, profissional, dark mode, etc.
- **Setor**: fintech, saúde, fitness, contabilidade, etc.
- **Stack**: Flutter (padrão no AppAcademia)

### Passo 2 — Gerar design system (obrigatório)

```bash
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "<tipo> <setor> <palavras-chave>" --design-system -p "AppAcademia"
```

### Passo 3 — Complementar com buscas específicas

```bash
# UX de estados (loading, erro, vazio, sucesso) — obrigatório no AppAcademia
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "loading error empty success states" --domain ux

# Tipografia se precisar de alternativas
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "professional readable" --domain typography
```

### Passo 4 — Diretrizes Flutter

```bash
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "widget layout state theming" --stack flutter
```

### Passo 5 — Implementar e checar

Antes de entregar, verificar o checklist abaixo.

---

## Formatos de saída

```bash
# Terminal (padrão — ASCII box)
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "fintech" --design-system

# Markdown (para documentação)
python3 .opencode/skills/ui-ux-pro-max/scripts/search.py "fintech" --design-system -f markdown
```

---

## Regras obrigatórias de UI profissional

### Ícones e elementos visuais

| Regra | Fazer | Não fazer |
|---|---|---|
| Sem ícones emoji | Usar SVG (Heroicons, Lucide, Material Icons) | Usar emojis como ícones de UI |
| Hover estável | Transições de cor/opacidade | Scale transforms que deslocam layout |
| Logos corretos | SVG oficial verificado | Adivinhar paths de logos |
| Tamanho consistente | viewBox 24x24 fixo | Misturar tamanhos de ícones |

### Interação e cursor

| Regra | Fazer | Não fazer |
|---|---|---|
| Cursor pointer | `cursor-pointer` em tudo clicável | Cursor padrão em elementos interativos |
| Feedback visual | Cor, sombra ou borda no hover | Sem indicação de interatividade |
| Transições suaves | `duration: 200ms` | Mudanças instantâneas ou lentas (>500ms) |

### Contraste claro/escuro

| Regra | Fazer | Não fazer |
|---|---|---|
| Glass em modo claro | `opacity 80%+` | Transparência excessiva |
| Texto em modo claro | `#0F172A` para corpo | Tons de gray-400 ou mais claro |
| Bordas visíveis | `border-gray-200` em modo claro | `border-white/10` (invisível) |

### Layout e espaçamento

| Regra | Fazer | Não fazer |
|---|---|---|
| Navbar flutuante | Espaçamento `top-4 left-4 right-4` | Colar em `top-0 left-0` |
| Padding de conteúdo | Compensar altura de navbar fixa | Conteúdo escondido atrás de elementos fixos |
| Max-width consistente | Mesmo container em todas as telas | Misturar larguras diferentes |

---

## Checklist pré-entrega

### Qualidade visual
- [ ] Sem emojis como ícones (usar SVG)
- [ ] Todos os ícones do mesmo conjunto (Material Icons para Flutter)
- [ ] Hover states sem deslocamento de layout
- [ ] Cores do tema usadas diretamente (não hardcoded hex)

### Interação
- [ ] Todos os elementos clicáveis com feedback visual
- [ ] Transições suaves (150–300ms)
- [ ] Estados de foco visíveis para acessibilidade por teclado

### Responsividade (Flutter)
- [ ] Testado em mobile (375px equiv) e tablet (768px equiv)
- [ ] Sem overflow horizontal em telas pequenas
- [ ] Texto escalonável (`TextScaler` respeitado)

### Estados obrigatórios (AppAcademia)
- [ ] Estado loading (CircularProgressIndicator com cor primária)
- [ ] Estado erro (mensagem amigável + botão de retry)
- [ ] Estado vazio (mensagem + ação sugerida quando aplicável)
- [ ] Estado sucesso (dados exibidos corretamente)

### Acessibilidade
- [ ] Imagens com `semanticLabel`
- [ ] Cor não é o único indicador de informação
- [ ] `Semantics` widgets em elementos críticos
