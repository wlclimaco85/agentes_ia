# Visual Testing With Selenium

Sources consulted:

- Selenium official docs: https://www.selenium.dev/
- Selenium test practices overview: https://www.selenium.dev/pt-br/documentation/test_practices/overview/
- Selenium testing types: https://www.selenium.dev/pt-br/documentation/test_practices/testing_types/

## What Visual Tests Should Prove

Visual tests should catch user-visible regressions that functional assertions miss: overlapping text, missing icons, broken responsive layout, hidden buttons, wrong theme, unexpected scrollbars, clipped modals and grid/table rendering issues.

They should not become pixel-perfect approval of volatile data. Control or mask unstable areas.

## Baseline Workflow

1. Open the target state with deterministic test data.
2. Set viewport and browser options.
3. Wait for the final UI state.
4. Capture screenshot to `actual`.
5. If no baseline exists, create one only after human approval.
6. Compare actual versus baseline.
7. Save diff image and numeric mismatch when different.
8. Decide whether the diff is accepted, needs a baseline update or reveals a bug.

## Determinism Checklist

- fixed viewport;
- fixed locale/timezone where possible;
- stable user/account/test data;
- animations disabled or waited out;
- fonts loaded;
- loading spinners absent;
- scroll position fixed;
- browser zoom at 100%;
- no real-time timestamps or counters in the compared region.

## Diff Thresholds

Start strict and loosen only for real noise:

- `0` mismatch: ideal for static components.
- `0.001` to `0.01`: acceptable for anti-aliasing or font differences.
- higher thresholds should be justified and documented.

Prefer region screenshots or masks before raising global tolerance.

## Screenshot Strategy

- Full page: useful for smoke visual checks and layout overview.
- Viewport: useful for first-screen regressions.
- Element/region: best for stable visual baselines.
- Responsive matrix: capture named widths such as `desktop-1366`, `tablet-768`, `mobile-390`.

## Reporting

Each visual failure should point to:

- test name and step;
- browser/version if known;
- viewport;
- baseline path;
- actual path;
- diff path;
- mismatch ratio or pixel count.
