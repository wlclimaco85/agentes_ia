---
name: dhara-selenium-visual-tester
description: Especialista em Selenium/WebDriver para testes do addon Dhara Pecuaria no Sankhya 4.35. Conhece login shadow-DOM do Sankhya Om, patch sf.js, rotas pecuaria.*, esperas HTML5/GWT/AngularJS e harness .selenium-dhara-e2e. Use para criar testes das 11 telas DH_, regressao visual, diagnostico de flakiness e evidencias de QA do addon.
---

# Dhara Selenium Visual Tester

## Overview

Skill para transformar cenarios do addon Dhara Pecuaria em testes Selenium estaveis.
Realidade tecnica: Sankhya Om 4.35b185 + WildFly 11 + Oracle 21c local, telas AngularJS 1.x e XHTML5.

NAO use caminhos de App_Academia, task_manager_flutter ou .selenium-app-academia-e2e.

---

## Escopo Local

- Workspace: `C:\dharatecnologia\dhara-pecuaria`
- URL alvo: `http://localhost:8080/mge/`
- Harness: `.selenium-dhara-e2e/`
- Artefatos: `.selenium-dhara-e2e/artifacts/`
- Config: `.selenium-dhara-e2e/.env`

---

## Login shadow DOM — obrigatorio (Sankhya Om 4.35)

O componente `<sankhya-login>` usa Shadow DOM. Use `shadow_root` do Selenium 4.
Fluxo obrigatorio: usuario -> clicar Prosseguir -> senha -> clicar Prosseguir -> aguardar component sumir.

```python
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait

def login_sankhya(driver, username, password):
    # Aguardar o web component
    WebDriverWait(driver, 15).until(
        lambda d: d.find_elements(By.CSS_SELECTOR, "sankhya-login"))

    # Etapa 1: usuario
    root = driver.find_element(By.CSS_SELECTOR, "sankhya-login").shadow_root
    root.find_element(By.CSS_SELECTOR, "#user").send_keys(username)
    btns = root.find_elements(By.CSS_SELECTOR, "button")
    btn = next(b for b in btns if b.is_displayed()
               and "prosseguir" in (b.text or "").lower())
    btn.click()
    time.sleep(5)

    # Etapa 2: senha
    root = driver.find_element(By.CSS_SELECTOR, "sankhya-login").shadow_root
    root.find_element(By.CSS_SELECTOR, "input[type='password']").send_keys(password)
    btns = root.find_elements(By.CSS_SELECTOR, "button")
    btn = next(b for b in btns if b.is_displayed()
               and "prosseguir" in (b.text or "").lower())
    btn.click()

    # Aguardar component desaparecer (login concluido)
    WebDriverWait(driver, 30).until(
        lambda d: not d.find_elements(By.CSS_SELECTOR, "sankhya-login"))
```

---

## Patch sf.js — verificar antes de rodar testes

O `system.jsp` do Sankhya 4.35 precisa ter antes do `snk.js`:
```html
<script src="scripts/vendors/sf/sf.js"></script>
<script src="scripts/snk.js?v=0"></script>
```
Sem isso, o workspace abre branco e nenhuma tela DH_ carrega.
Arquivo: `standalone/tmp/vfs/deployment/.../mge-4.35b185.war-.../system.jsp`

---

## Telas DH_ e Menu IDs

| Tela | Menu ID | O que validar |
|------|---------|---------------|
| Configuracao Pecuaria | `pecuaria.configuracao` | Formulario de config abre, campos visiveis |
| Faixa Etaria | `pecuaria.faixa` | Grid carrega, botao Novo funciona |
| Raca de Animais | `pecuaria.raca` | Grid e CRUD basico |
| Tipo de Exame | `pecuaria.tipexame` | Grid e CRUD |
| Historico de Animais | `pecuaria.historico` | Historico por animal |
| Entrada de Animais | `pecuaria.entrada` | Vinculo NF, acoes de vinculo |
| IATF/Monta | `pecuaria.iatf` | Importar matrizes, cobertura |
| Diagnostico de Gestacao | `pecuaria.diag` | Gerar e refazer |
| Registro de Parto | `pecuaria.parto` | Confirmar e cancelar |
| Apontamento Pecuaria | `pecuaria.apontamento` | Processar e reverter |
| Venda de Animais | `pecuaria.venda` | Formulario e subgrade |

Navegacao: `driver.get(f"{base_url}/mge/system.jsp#app/{menu_id}")`

---

## Espera apos navegacao — innerHTML (nao body.text)

O GWT + AngularJS nao escreve texto no `body.text` imediato. Use innerHTML:

```python
import re
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait

def wait_screen_loaded(driver, keywords, timeout=90):
    pattern = "|".join(re.escape(k) for k in keywords)
    def check(d):
        for fn in [
            lambda: d.find_element(By.TAG_NAME, "body").text,
            lambda: d.execute_script("return document.body.innerText || ''"),
            lambda: d.execute_script("return document.body.innerHTML || ''"),
        ]:
            try:
                if re.search(pattern, fn(), re.IGNORECASE):
                    return True
            except Exception:
                pass
        return False
    WebDriverWait(driver, timeout).until(check)
```

---

## Estrutura do Harness

```
.selenium-dhara-e2e/
  .env                    # SANKHYA_BASE_URL, SANKHYA_USER, SANKHYA_PASSWORD, HEADLESS
  .env.example
  pytest.ini
  requirements.txt        # selenium==4.27+, pytest, python-dotenv
  tests/
    conftest.py           # driver fixture, login_if_needed shadow-DOM
    pages/
      sankhya_page.py     # SankhyaPage: login shadow-DOM, open_menu_id, wait_any_text
    test_00_smoke_navigation.py
    test_01_fluxo_cadastros_base.py
    test_02_fluxo_entrada_animais.py
    test_03_fluxo_reproducao_diagnostico_nascimento.py
    test_04_fluxo_apontamento_venda_saida.py
    test_05_action_buttons_inventory.py
  artifacts/
    screens/              # screenshots aprovadas
    FAILED_*.png          # capturas automaticas em falha
```

---

## Configuracao .env

```env
SANKHYA_BASE_URL=http://localhost:8080
SANKHYA_USER=sup
SANKHYA_PASSWORD=tecsis123
BROWSER=chrome
HEADLESS=1
VIEWPORT=1366x768
DHARA_E2E_MUTATING=0
DHARA_CODEMP=1
```

---

## Selenium Defaults

- Selenium 4 com `shadow_root` API (obrigatorio para login).
- Chrome ou Edge para smoke local Windows.
- Validar headed antes de headless — telas Sankhya usam popups e focus.
- `implicitly_wait(0)` — usar apenas `WebDriverWait` explicito.
- Screenshots em `.selenium-dhara-e2e/artifacts/`.
- Nunca gravar credenciais nos testes; ler de `.env` local.

---

## Sankhya HTML5 Notes

- GWT + AngularJS: esperar iframes, overlays, IDs dinamicos e conteudo atrasado.
- Seletores resilientes: `data-testid` > `id` estavel > `ng-model` > CSS especifico.
- Exemplos: `snk-grid`, `snk-form`, `.ui-grid-row`, `[role='row']`, `.snk-button`.
- `DHARA_E2E_MUTATING=0` protege runs smoke de alterar dados do banco.

---

## Visual Testing Rules

- Baseline somente apos render aprovado por humano.
- Viewport fixo: 1366x768 obrigatorio.
- Aguardar render final: loading removido, grid populado.
- Mascarar timestamps, IDs e contadores volateis.

---

## Output Expectations

Ao finalizar, reporte:

- Cenario coberto e tela DH_ alvo.
- Browser, modo (headed/headless) e viewport.
- Caminhos dos screenshots/baselines/diffs.
- Comando para rodar: `cd .selenium-dhara-e2e && python -m pytest tests/ -v`.
- Risco residual de flakiness ou validacao manual pendente.
