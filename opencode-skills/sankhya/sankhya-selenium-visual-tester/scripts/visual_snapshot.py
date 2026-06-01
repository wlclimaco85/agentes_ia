#!/usr/bin/env python3
"""Small Selenium visual snapshot helper.

Requires:
  pip install selenium pillow

Examples:
  python visual_snapshot.py capture --url http://localhost:8080 --out actual.png
  python visual_snapshot.py compare --baseline baseline.png --actual actual.png --diff diff.png
"""

from __future__ import annotations

import argparse
from pathlib import Path
from typing import Tuple


def parse_size(value: str) -> Tuple[int, int]:
    width, height = value.lower().split("x", 1)
    return int(width), int(height)


def capture(args: argparse.Namespace) -> None:
    from selenium import webdriver
    from selenium.webdriver.support.ui import WebDriverWait

    width, height = parse_size(args.viewport)
    options = webdriver.ChromeOptions()
    options.add_argument(f"--window-size={width},{height}")
    if args.headless:
        options.add_argument("--headless=new")
    driver = webdriver.Chrome(options=options)
    try:
        driver.get(args.url)
        wait = WebDriverWait(driver, args.timeout)
        if args.css:
            wait.until(lambda d: d.find_element("css selector", args.css).is_displayed())
        else:
            wait.until(lambda d: d.execute_script("return document.readyState") == "complete")
        Path(args.out).parent.mkdir(parents=True, exist_ok=True)
        driver.save_screenshot(args.out)
    finally:
        driver.quit()


def compare(args: argparse.Namespace) -> None:
    from PIL import Image, ImageChops

    baseline = Image.open(args.baseline).convert("RGB")
    actual = Image.open(args.actual).convert("RGB")
    if baseline.size != actual.size:
        raise SystemExit(f"Size mismatch: baseline={baseline.size} actual={actual.size}")

    diff = ImageChops.difference(baseline, actual)
    bbox = diff.getbbox()
    mismatch_pixels = 0
    if bbox:
        pixels = diff.load()
        width, height = diff.size
        for y in range(height):
            for x in range(width):
                if pixels[x, y] != (0, 0, 0):
                    mismatch_pixels += 1

    total = baseline.size[0] * baseline.size[1]
    ratio = mismatch_pixels / total
    Path(args.diff).parent.mkdir(parents=True, exist_ok=True)
    diff.save(args.diff)
    print(f"mismatch_ratio={ratio:.8f}")
    print(f"mismatch_pixels={mismatch_pixels}")
    if ratio > args.threshold:
        raise SystemExit(1)


def main() -> None:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(required=True)

    p_capture = sub.add_parser("capture")
    p_capture.add_argument("--url", required=True)
    p_capture.add_argument("--out", required=True)
    p_capture.add_argument("--viewport", default="1366x768")
    p_capture.add_argument("--timeout", type=int, default=15)
    p_capture.add_argument("--css", help="Wait until this CSS selector is visible")
    p_capture.add_argument("--headless", action="store_true")
    p_capture.set_defaults(func=capture)

    p_compare = sub.add_parser("compare")
    p_compare.add_argument("--baseline", required=True)
    p_compare.add_argument("--actual", required=True)
    p_compare.add_argument("--diff", required=True)
    p_compare.add_argument("--threshold", type=float, default=0.001)
    p_compare.set_defaults(func=compare)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
