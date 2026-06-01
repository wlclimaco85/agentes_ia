---
name: app-academia-selenium-visual-tester
description: Especialista em Selenium/WebDriver para automacao de UI e testes visuais do AppAcademia. Use quando Codex precisar criar, revisar ou diagnosticar testes Selenium para Flutter web em task_manager_flutter_merged_final ou task_manager_flutter, capturas de tela, baselines visuais, comparacao de screenshots, execucao headless, estabilidade de seletores, fixtures de teste ou relatorios de regressao visual.
---

# AppAcademia Selenium Visual Tester

## Overview

Use esta skill para transformar cenarios web do AppAcademia em testes Selenium estaveis, com foco em comportamento observavel, regressao visual e evidencia de QA. Esta adaptacao veio do agente `sankhya-selenium-visual-tester` da workspace Dhara, mas e isolada para `C:\App_Academia` e nao deve usar caminhos, `.env`, baselines, artefatos ou configuracoes de Dhara.

## Escopo Local

- Workspace raiz: `C:\App_Academia`.
- Backend esperado: `C:\App_Academia\AppAcademia`.
- Flutter base/principal: `C:\App_Academia\task_manager_flutter_merged_final`.
- Flutter cliente: `C:\App_Academia\task_manager_flutter`.
- Harness Selenium local: `C:\App_Academia\.selenium-app-academia-e2e`.
- Artefatos visuais locais: `C:\App_Academia\.selenium-app-academia-e2e\artifacts`.

Nao leia nem grave em `C:\dharatecnologia`, `.selenium-dhara-e2e`, `dhara-pecuaria` ou configuracoes Sankhya quando a tarefa for AppAcademia.

## Workflow

1. Entenda o alvo: projeto Flutter, URL, backend/API esperada, autenticacao, dados necessarios, viewport, idioma, permissao e estado inicial.
2. Classifique o teste:
   - funcional: valida fluxo, formulario, navegacao, chamadas e mensagens.
   - visual: valida layout, componentes, sobreposicoes, responsividade e regressao de screenshot.
   - hibrido: executa o fluxo funcional e captura evidencias visuais em pontos relevantes.
3. Antes de criar padroes novos, pesquise exemplos reais nos dois projetos Flutter e nos testes existentes.
4. Modele o teste com Page Objects ou helpers locais quando houver repeticao real.
5. Use seletores resilientes: `data-testid`, `id` estavel, role/nome acessivel ou CSS especifico do componente. Para Flutter web, combine semantica acessivel, textos estaveis e chaves renderizadas quando existirem.
6. Use esperas explicitas (`WebDriverWait`) para estado da UI, navegacao, overlays, loading e elementos clicaveis.
7. Capture screenshots deterministicas: viewport fixo, tema fixo, dados controlados, animacoes reduzidas quando possivel.
8. Compare contra baseline com tolerancia pequena e gere diff quando houver divergencia.
9. Reporte falhas com URL, viewport, browser, seletor/acao, screenshot atual, baseline e diff.

## Flutter Web Notes

- Rode o app Flutter web explicitamente a partir do projeto alvo, por exemplo `flutter run -d chrome --web-port 8080` ou `flutter run -d web-server --web-port 8080`.
- Se o teste depender de API real, confirme o backend em `AppAcademia/` e use ambiente local/controlado.
- Prefira testar jornadas criticas compartilhadas nos dois Flutter quando a regra de negocio for comum.
- Divergencias visuais intencionais entre base e cliente devem ser documentadas, nao tratadas automaticamente como falha.
- Flutter web pode gerar DOM menos semantico; incentive `Key`, labels acessiveis e textos estaveis quando os seletores forem frageis.

## Selenium Defaults

- Preferir Selenium 4 APIs e Selenium Manager, salvo padrao local diferente.
- Preferir Chrome ou Edge para smoke local no Windows; adicionar Firefox quando compatibilidade cross-browser importar.
- Validar em modo headed antes de consolidar headless quando houver foco, popup, download ou comportamento visual estranho.
- Desabilitar implicit waits quando usar explicit waits.
- Manter screenshots e baselines em `.selenium-app-academia-e2e\artifacts`, fora dos projetos Flutter.
- Nunca gravar credenciais, API keys ou URLs de producao nos testes. Ler segredos de variaveis de ambiente ou `.env` local ignorado.

## Test Shape

Para Python/pytest, preferir:

```text
.selenium-app-academia-e2e/
  .env.example
  pytest.ini
  requirements.txt
  tests/
    conftest.py
    pages/
      app_academia_page.py
    test_smoke_visual.py
  artifacts/
    baselines/
    actual/
    diff/
```

## Visual Testing Rules

- Estabeleca baseline apenas depois de render bom aprovado por humano.
- Fixe viewport, no minimo desktop e um tamanho mobile/tablet quando responsividade importar.
- Aguarde render final: loading removido, conteudo alvo presente, fontes carregadas, tabelas/graficos populados.
- Prefira screenshots de regiao/componente quando pagina inteira for ruidosa.
- Mascare ou evite regioes volateis: timestamps, IDs aleatorios, avatares, contadores ao vivo e dados de API instaveis.
- Trate diff visual como sinal: inspecione se a diferenca e visivel e relevante para o usuario.

## References

- Leia `references/selenium-practices.md` ao desenhar escopo, waits, seletores, Page Objects ou estrategia de testes.
- Leia `references/visual-testing.md` ao criar baselines, thresholds, matriz de viewports ou relatorios visuais.
- Use `scripts/visual_snapshot.py` como helper para captura/baseline/diff em Selenium Python.

## Output Expectations

Ao finalizar uma tarefa Selenium/visual, reporte:

- cenario coberto e projeto Flutter alvo;
- browser, modo e viewport;
- caminhos dos screenshots, baselines e diffs;
- comando para rodar;
- risco residual de flakiness ou validacao manual pendente.
