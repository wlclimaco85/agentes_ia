# Selenium Practices

Sources consulted:

- Selenium official docs: https://www.selenium.dev/
- Selenium test practices overview: https://www.selenium.dev/pt-br/documentation/test_practices/overview/
- Selenium testing types: https://www.selenium.dev/pt-br/documentation/test_practices/testing_types/
- DevMedia Selenium article was requested, but the page could not be fetched reliably during skill creation. Prefer official Selenium documentation when guidance conflicts.

## Scope Guidance

Use Selenium/WebDriver for browser-level confidence where real user behavior matters: navigation, forms, auth flows, dynamic UI, browser compatibility and integration between frontend and backend. Keep lower-level logic in unit/integration tests; do not use Selenium as the only test layer.

Good Selenium candidates:

- critical user journeys;
- high-risk form workflows;
- browser-specific rendering or interaction issues;
- regressions involving DOM, CSS, overlays, iframes, downloads or uploads;
- UI flows that require evidence screenshots.

Poor Selenium candidates:

- pure business logic that can be unit tested;
- massive exhaustive data combinations;
- tests depending on uncontrollable external services;
- production-only destructive operations.

## Stable WebDriver Patterns

- Use explicit waits for state: visibility, clickability, staleness, URL changes and absence of loading masks.
- Prefer stable selectors in this order: explicit test id, stable id/name, accessible role/name, semantic CSS, short relative XPath.
- Avoid `time.sleep` except as a last-resort diagnostic comment with a TODO to replace it.
- Keep one assertion theme per test where possible.
- Use Page Objects for repeated page behavior, not for every single element.
- Make cleanup explicit when test data is created.

## Selenium 4 Notes

- Use Selenium Manager where available instead of manually downloading drivers.
- Prefer W3C WebDriver-compatible options.
- Use browser options for deterministic tests: window size, language, download folder and headless mode.
- Capture browser logs only when the driver/browser supports them and the failure needs client-side diagnostics.

## Python Skeleton

```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

def test_login_smoke():
    options = webdriver.ChromeOptions()
    options.add_argument("--window-size=1366,768")
    driver = webdriver.Chrome(options=options)
    wait = WebDriverWait(driver, 15)
    try:
        driver.get("https://example.local/login")
        wait.until(EC.visibility_of_element_located((By.NAME, "username"))).send_keys("user")
        driver.find_element(By.NAME, "password").send_keys("pass")
        driver.find_element(By.CSS_SELECTOR, "button[type='submit']").click()
        wait.until(EC.url_contains("/home"))
    finally:
        driver.quit()
```

## Failure Triage

When a test fails, collect:

- current URL;
- page title;
- screenshot;
- relevant DOM snippet if a selector failed;
- browser console logs if available;
- elapsed wait condition and timeout.

