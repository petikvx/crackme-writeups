#!/usr/bin/env python3
"""Solution — codz_1 by codz30 (crackmes.de, VB.NET).

Serial fixe (MaxLength 5) : 11223

  python3 tools/codz1-solve.py
  python3 tools/codz1-solve.py --check
"""
from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "original" / "Password-src" / "Password" / "Form1.cs"
SERIAL = "11223"


def check() -> None:
    text = SRC.read_text(encoding="utf-8", errors="replace")
    assert 'ToDouble(TextBox1.Text) == 11223.0' in text or "11223.0" in text
    assert '"Congrats You Did It!!"' in text
    print(f"OK  serial={SERIAL}  (ilspycmd Form1.Button1_Click)")


def main(argv: list[str]) -> None:
    if "--check" in argv:
        check()
        return
    print(SERIAL)


if __name__ == "__main__":
    main(sys.argv)
