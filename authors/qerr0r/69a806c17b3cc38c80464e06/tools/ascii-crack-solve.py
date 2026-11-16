#!/usr/bin/env python3
"""QERR0R's ASCII_CRACK : inverse de encode(c, i) = c + (6 - i) (mod 256).

Usage : ascii-crack-solve.py [-q] [--check ELF]
  --check : lance l'ELF extrait (analysis/ascii) avec le flag et vérifie le message.
"""
import argparse
import subprocess
import sys

# encoded_flag (.rodata 0x3083 dans l'ELF, std::string globale)
ENC = b"IYJ~U4cQ1Q[<mL[(U;`'Ynk/M-i"


def solve() -> str:
    return bytes((c - (6 - i)) & 0xFF for i, c in enumerate(ENC)).decode()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le flag")
    ap.add_argument("--check", metavar="ELF", help="exécute l'ELF avec le flag")
    a = ap.parse_args()
    flag = solve()
    print(flag if a.q else f"flag = {flag}")
    if a.check:
        out = subprocess.run([a.check, flag], capture_output=True, text=True).stdout
        ok = "You cracked me!" in out
        print("check:", "OK" if ok else "KO", out.strip())
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
