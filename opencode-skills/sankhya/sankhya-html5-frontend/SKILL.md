---
name: sankhya-html5-frontend
description: Especialista em telas HTML5 e SankhyaJS para add-ons Sankhya. Use quando Codex precisar criar, revisar ou corrigir vc/src/webapp/html5, index.html, app.js, styles.css, chamadas a service.sbr, auth/mgeSession, menus para telas customizadas, integracao front-end/back-end, assets de tela ou migracao de UI DWF/Flex para HTML5.
---

# Sankhya HTML5 Frontend

## Fluxo

1. Ler a tela existente em `vc/src/webapp/html5/<tela>/` e o `datadictionary/menu.xml`.
2. Conferir qual service Java a tela chama e qual contrato JSON/XML espera.
3. Pesquisar exemplos em `C:\sk-java\git\sankhyaw` para SankhyaJS e chamadas `service.sbr`.
4. Implementar tela simples, robusta e compativel com o container do Sankhya.
5. Validar HTML/CSS/JS localmente quando possivel e depois via deploy do ADD.

## Regras

- Nao colocar regra critica apenas no JavaScript; validar no backend.
- Evitar dependencias externas desnecessarias; tela deve funcionar no ambiente Sankhya.
- Tratar loading, erro de sessao, erro de servico e resposta vazia.
- Manter ids e nomes alinhados ao menu/resourceId do dicionario.
- Se usar visual customizado, priorizar legibilidade operacional e fluxos repetidos.

## Exemplo Local

Use `C:\\dharatecnologia\\dhara-pecuaria\hello-world-addon\vc\src\webapp\html5\classificacao-graos` como referencia basica de estrutura.

