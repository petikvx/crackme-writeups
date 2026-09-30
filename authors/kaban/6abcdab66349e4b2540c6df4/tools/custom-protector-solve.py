#!/usr/bin/env python3
"""Solveur — KAban's custom protector

Pas de saisie : le PE console exécute une VM interne puis imprime
le message de succès (chaîne en clair dans .rdata, xref depuis main).

Usage :
  python3 custom-protector-solve.py -q
  python3 custom-protector-solve.py --check
  python3 custom-protector-solve.py --from-pe
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "0LLRi9C10LHQuCDQvNC10L3Rjw.exe"

# 0x1400370d7 — operand de l'appel iostream depuis sub_140001340
MSG = "Reverse this shit, find where this message is printed."
NEEDLE = MSG.encode("ascii")


def extract_from_pe(path: Path = BIN) -> str:
    data = path.read_bytes()
    i = data.find(NEEDLE)
    if i < 0:
        raise ValueError(f"message not found in {path}")
    # C-string : jusqu'au NUL (le binaire a aussi un '\\n')
    end = data.index(b"\x00", i)
    return data[i:end].decode("ascii").rstrip("\r\n")


def run_live(path: Path = BIN, timeout: float = 8.0) -> tuple[int, str]:
    r = subprocess.run(
        [str(path)],
        capture_output=True,
        timeout=timeout,
        check=False,
    )
    out = (r.stdout + r.stderr).decode("utf-8", "replace")
    return r.returncode, out


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument(
        "--check",
        action="store_true",
        help="lancer le PE et vérifier stdout + exit 0",
    )
    ap.add_argument(
        "--from-pe",
        action="store_true",
        help="extraire le message depuis original/*.exe",
    )
    ap.add_argument("--pe", type=Path, default=None)
    args = ap.parse_args(argv)

    pe = args.pe or BIN
    msg = extract_from_pe(pe) if args.from_pe else MSG

    if args.check:
        code, out = run_live(pe)
        ok = code == 0 and MSG in out
        if args.quiet:
            print("OK" if ok else "FAIL")
        else:
            print(out.rstrip())
            print(f"exit={code} → {'OK' if ok else 'FAIL'}")
        return 0 if ok else 1

    if args.quiet:
        print(msg)
    else:
        print(msg)
        print("# stdout du PE (pas de password / serial) ; --check pour preuve live")
    return 0


if __name__ == "__main__":
    sys.exit(main())
