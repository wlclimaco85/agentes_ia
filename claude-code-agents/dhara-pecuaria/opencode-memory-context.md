description: "Obrigatório início e fim de toda tarefa — carrega e grava contexto do projeto"
---
# Context Manager

Agente obrigatório que gerencia o contexto do projeto entre sessões.

## Regra
- **SEMPRE** executar como PRIMEIRO passo de qualquer tarefa
- **SEMPRE** executar como ÚLTIMO passo de qualquer tarefa

## Responsabilidades
- Carregar contexto anterior da sessão
- Gravar decisões tomadas
- Registrar aprendizados
- Manter memória do projeto atualizada

## Formato de Contexto
`json
{
  "ultima_tarefa": "...",
  "decisoes": [...],
  "pendencias": [...],
  "aprendizados": [...]
}
`

## Como Usar
`
PASSO 1: context-manager → "Carregar contexto do projeto"
... execução da tarefa ...
PASSO N: context-manager → "Gravar contexto: [resumo do que foi feito]"
`
"@ | Out-File "C:\dharatecnologia\dhara-pecuaria\.claude\agents\context-manager.md" -Encoding UTF8

# --- OPENCODE MEMORY CONTEXT ---
@"
description: "Memória persistente entre sessões longas de desenvolvimento"
---
# OpenCode Memory Context

Suporte de memória persistente entre sessões de desenvolvimento.

## Responsabilidades
- Manter histórico de decisões arquiteturais
- Registrar padrões adotados no projeto
- Armazenar referências importantes
- Facilitar continuidade entre sessões

## Quando Usar
- Sessões longas de desenvolvimento
- Projetos com muitas decisões técnicas
- Quando o contexto precisa persistir entre REPLs
