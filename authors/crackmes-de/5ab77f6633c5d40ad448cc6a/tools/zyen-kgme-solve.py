#!/usr/bin/env python3
"""zyen KeyGenMe 1.1 (KgME) — serial = FontSize^2 * 10 = 19*19*10 = 3610.

  ./zyen-kgme-solve.py -q
"""
from __future__ import annotations

import argparse

FONT_SIZE = 19  # Form1.FontSize set in Form_Load
SERIAL = str(FONT_SIZE * FONT_SIZE * 10)  # 3610


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    args = ap.parse_args()
    if args.q:
        print(SERIAL)
    else:
        print(f"serial={SERIAL!r}  # FontSize={FONT_SIZE} → {FONT_SIZE}^2*10")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
