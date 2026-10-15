#!/usr/bin/env python3
"""
chaltu's Accsess me please :) (main)
ELF64 PIE, C, non strippe. Entree : un entier (scanf "%d").

main @ 0x118a :
  scanf("%d", &n)
  if n == 0xb7b5 (47029) : canaccess() puis printaccess() -> "Access Granted"
  else                   : "Access Denied!!!!"

Usage :
    python3 tools/accsess-solve.py
    python3 tools/accsess-solve.py --check
"""
import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "main"

PASSWORD = 0xB7B5  # 47029


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="execute le binaire et verifie le succes")
    args = ap.parse_args()

    if args.quiet and not args.check:
        print(PASSWORD)
        return

    if not args.quiet:
        print(f"[+] mot de passe : {PASSWORD} (0x{PASSWORD:x})")

    if args.check:
        proc = subprocess.run(
            [str(args.binary)],
            input=f"{PASSWORD}\n".encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=5,
        )
        out = proc.stdout.decode(errors="replace")
        if not args.quiet:
            print("----- sortie du programme -----")
            print(out.strip())
            print("--------------------------------")
        ok = "Access Granted" in out
        print("CHECK:", "OK" if ok else "FAIL", file=sys.stderr)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
