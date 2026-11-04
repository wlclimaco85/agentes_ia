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

## Registro de fechamento

- História Trello `6a3af408fac48e1622611d92` concluída com `Done 5/5`.
- `Calendário Financeiro` agora expõe metadados PDF via `CalendarioFinanceiroItemProjection` sem carregar `BLOB`.
- DTO atualizado com `fileId`, `fileName`, `fileType` e `anexoPdf`.
- Flutter nos dois apps usa `Baixar conta` para `ABERTA` e `attach_file` apenas para PDF via `ApiLinks.downloadFile`.
- Validações registradas: Maven específico `2/2`, `flutter analyze` nos dois apps, testes focados `45/45` e `34/34`, build web e QA/code review aprovados.
- Suites completas Flutter ainda têm falhas preexistentes de integração.
- Backend ativo em `9001`; build web estático de validação em `9011`.
- Card Trello `6a3b0171fe9e9ffd57e3060c` atualizado para `Modernizar Configuração do Sistema > Dados de Teste (Mock)`, movido para `Em desenvolvimento` e com labels `Backend`, `Feature` e `QA`.
- URL do card: `https://trello.com/c/zjyMLXsg`.
