#!/usr/bin/env python3
"""Solveur / notes — CrackNotMe MCM 3.0 REWORK.

Couches :
  1) Packer XOR maison → PE (voir mcm3-unpack.py)
  2) Texte enfoui (honeypot) : S3rg0M_Admin_2024
     strcmp len==0x11 @ VA 0x14000d838
     → message « Nice try, cracker. That was a honeypot. ;) »
  3) Derrière : anti-debug / integrité / mini-VM (retour 1)
     + checksum buffer dérivé == 0x762

Le « buried text » que tout le monde trouve est le honeypot.
Sous Wine le chemin honeypot ne ré-affiche souvent pas DENIED
(contrairement à un mauvais password).

Usage :
  python3 mcm3-solve.py -q
  python3 mcm3-solve.py --check S3rg0M_Admin_2024
  python3 mcm3-solve.py --unpack
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

PASSWORD_HONEYPOT = "S3rg0M_Admin_2024"
HONEYPOT_VA = 0x14000D838

_DIR = Path(__file__).resolve().parents[1]
_PACKED = _DIR / "original" / "CrackMe_packed.exe"
_UNPACKED = _DIR / "analysis" / "CrackMe_unpacked.exe"


def load_honeypot(pe: Path | None = None) -> str:
    pe = pe or (_UNPACKED if _UNPACKED.exists() else None)
    if pe is None:
        return PASSWORD_HONEYPOT
    data = pe.read_bytes()
    # unpacked .text @ 0x140001000 → file 0x400
    off = 0x400 + (HONEYPOT_VA - 0x140001000)
    return data[off:].split(b"\0", 1)[0].decode("ascii")


def check(password: str, pe: Path | None = None) -> bool:
    return password == load_honeypot(pe)


def wine_probe(password: str, timeout: int = 12) -> str:
    """DENIED / no-DENIED / timeout — honeypot souvent 'silent' sous Wine."""
    try:
        proc = subprocess.run(
            ["timeout", str(timeout), "wine", str(_PACKED)],
            input=(password + "\n\n").encode(),
            capture_output=True,
        )
    except FileNotFoundError:
        return "no-wine"
    text = (proc.stdout + proc.stderr).decode("latin-1", errors="replace")
    if "honeypot" in text.lower() or "Nice try" in text:
        return "honeypot-msg"
    if "DENIED" in text or "FAILED" in text:
        return "denied"
    if "Verification complete" in text:
        return "verify-ok"
    return "silent-or-hang"


def main() -> int:
    ap = argparse.ArgumentParser(description="MCM 3.0 REWORK solver")
    ap.add_argument("-q", action="store_true", help="password honeypot")
    ap.add_argument("--check", metavar="P")
    ap.add_argument("--unpack", action="store_true", help="appeler mcm3-unpack.py")
    ap.add_argument("--wine", metavar="P", help="sonder le comportement Wine")
    args = ap.parse_args()

    if args.unpack:
        unpack = Path(__file__).with_name("mcm3-unpack.py")
        return subprocess.call([sys.executable, str(unpack)])

    if args.wine is not None:
        print(wine_probe(args.wine))
        return 0

    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        if ok:
            print("(honeypot — pas le gate d'intégrité/VM)")
        return 0 if ok else 1

    hp = load_honeypot()
    if args.q:
        print(hp)
        return 0

    print("=== MCM 3.0 REWORK ===")
    print(f"honeypot : {hp}  (len {len(hp)}, VA {HONEYPOT_VA:#x})")
    print("msg      : [!] Nice try, cracker. That was a honeypot. ;)")
    print("packer   : python3 tools/mcm3-unpack.py")
    print("note     : vrai succès = mini-VM retour 1 + checksum 0x762")
    return 0


if __name__ == "__main__":
    sys.exit(main())
