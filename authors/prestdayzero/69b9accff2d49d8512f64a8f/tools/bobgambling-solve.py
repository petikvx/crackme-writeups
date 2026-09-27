#!/usr/bin/env python3
"""Solveur — prestdayzero's Bobs gambling

Le choix menu est un int, puis seul l'octet bas est testé contre 0xFF.
255 (ou tout n >= 0 avec n & 0xFF == 0xFF) ouvre l'admin. Choix 1
remet la dette à 0 et affiche le flag.

Usage :
  python3 tools/bobgambling-solve.py -q
  python3 tools/bobgambling-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme_bobgambling.exe"
FLAG = "dzctf(bob_is_free_1337)"
CHOICE = 255


def script(choice: int) -> str:
    # ignore(1) + get() mangent deux octets après le nombre du menu.
    return f"{choice}\n\n1\n\n"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="n'affiche que le flag")
    ap.add_argument("--check", action="store_true", help="Wine : 255 OK, 1 KO")
    args = ap.parse_args()
    if args.q and not args.check:
        print(FLAG)
        return 0
    if not args.check:
        print(FLAG)
        print(f"menu {CHOICE} puis admin 1")
        return 0

    ok = subprocess.run(
        ["wine", str(BIN)],
        input=script(CHOICE),
        capture_output=True,
        text=True,
        timeout=15,
        check=False,
    )
    print(ok.stdout.strip())
    if FLAG not in ok.stdout or ok.returncode != 0:
        print("Wine OK : flag absent ou code non nul")
        return 1
    try:
        ko = subprocess.run(
            ["wine", str(BIN)],
            input="1\n\n",
            capture_output=True,
            text=True,
            timeout=4,
            check=False,
        )
        ko_out = ko.stdout
    except subprocess.TimeoutExpired as exc:
        ko_out = (exc.stdout or b"")
        if isinstance(ko_out, bytes):
            ko_out = ko_out.decode("latin1", "replace")
    if "Payment system is currently down" not in ko_out or FLAG in ko_out:
        print("Wine KO : message inattendu")
        print(ko_out[:400])
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
