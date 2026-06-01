---
name: sankhya-selenium-visual-tester
description: Especialista em Selenium/WebDriver para automacao de UI e testes visuais. Use quando Codex precisar criar, revisar ou diagnosticar testes Selenium, Page Objects, esperas explicitas, fluxos web/Sankhya HTML5, capturas de tela, baselines visuais, comparacao de screenshots, execucao headless, cross-browser, estabilidade de seletores, fixtures de teste ou relatorios de regressao visual.
---

# Sankhya Selenium Visual Tester

## Overview

Use esta skill para transformar cenarios web em testes Selenium estaveis, com foco em comportamento observavel e regressao visual. Priorize testes que validam fluxos importantes da tela, usam esperas explicitas e produzem evidencia visual util para diagnostico.

## Workflow

1. Entenda o alvo: URL, navegador, autenticacao, dados necessarios, viewport, idioma, permissao e estado inicial.
2. Classifique o teste:
   - funcional: valida fluxo, formulario, navegacao, chamadas e mensagens.
   - visual: valida layout, componentes, sobreposicoes, responsividade e regressao de screenshot.
   - hibrido: executa o fluxo funcional e captura evidencias visuais em pontos relevantes.
3. Modele o teste com Page Objects ou helpers locais quando houver repeticao real.
4. Use seletores resilientes: `data-testid`, `id` estavel, role/nome acessivel ou CSS especifico do componente. Evite XPath absoluto e sleeps fixos.
5. Use esperas explicitas (`WebDriverWait`) para estado da UI, rede indireta, overlays e elementos clicaveis.
6. Capture screenshots deterministicas: viewport fixo, tema fixo, dados controlados, animacoes reduzidas quando possivel.
7. Compare contra baseline com tolerancia pequena e gere diff quando houver divergencia.
8. Reporte falhas com URL, viewport, browser, seletor/acao, screenshot atual, baseline e diff.

## Selenium Defaults

- Prefer Selenium 4 APIs and Selenium Manager unless the repo already manages drivers.
- Prefer Chrome or Edge for local smoke tests on Windows; add Firefox when cross-browser behavior matters.
- Configure headless only after validating that headed mode works; some Sankhya/custom screens depend on focus, popups or OS dialogs.
- Disable implicit waits when using explicit waits to avoid confusing timeouts.
- Keep screenshots and baselines outside source code paths when they are generated artifacts, unless the project intentionally versions visual baselines.
- Do not put API keys, credentials or production-only URLs in test files. Read secrets from environment variables or a local ignored config.

## Test Shape

For Python/pytest, prefer this structure:

```text
tests/
  conftest.py
  pages/
    login_page.py
    tela_x_page.py
  visual/
    baselines/
    actual/
    diff/
  test_tela_x.py
```

For Java/JUnit in a Sankhya-adjacent repo, keep Selenium tests separate from add-on runtime code, normally under an integration/e2e test source set or a dedicated test utility module.

## Visual Testing Rules

- Establish a baseline only after a human-approved good render.
- Fix viewport sizes explicitly, at least desktop and one mobile/tablet width when responsive layout matters.
- Wait for final render before screenshot: loading masks gone, target content present, fonts settled, charts/tables populated.
- Prefer component/region screenshots when page-level diffs are noisy.
- Mask volatile regions when possible: timestamps, random IDs, animated charts, user avatar, live counters.
- Treat visual diffs as signals, not proof. Inspect whether the diff is user-visible and relevant.

## Sankhya HTML5 Notes

- Expect iframes, overlays, dynamic IDs and delayed content. Always inspect DOM context before selecting.
- Prefer domain actions over raw clicks when possible: open menu, filter grid, select row, submit form.
- Keep test data reversible and scoped. Never mutate production records from visual tests.
- When login is required, isolate authentication helpers and avoid recording real credentials in screenshots.

## References

- Read `references/selenium-practices.md` when designing test scope, waits, selectors, Page Objects or test pyramid placement.
- Read `references/visual-testing.md` when creating screenshot baselines, diff thresholds, viewport strategy or visual reports.
- Use `scripts/visual_snapshot.py` as a starting helper for simple capture/baseline/diff flows in Python Selenium projects.

## Output Expectations

When finishing a Selenium/visual task, report:

- what scenario was covered;
- browser, mode and viewport;
- where screenshots/baselines/diffs were written;
- how to run the test;
- any remaining flakiness risk or manual validation needed.
