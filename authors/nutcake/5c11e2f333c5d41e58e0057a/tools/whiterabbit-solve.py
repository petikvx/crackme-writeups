#!/usr/bin/env python3
"""nutcake — WhiteRabbit (hidden) : flag = "flag{3sc0nd1d0_3h_M41s_G0st0S0}".

main() n'appelle jamais secret() : il faut l'invoquer directement (code
mort, jamais atteint par aucun chemin normal). secret() est un simple
printf avec un format et des arguments entierement fixes (pas de calcul,
pas de dependance a l'entree) :

    printf("flag{%d%c%c%dn%c%d%c%d_%dh_M%d%ds_G%d%ct%dS%d}\\n",
           3,115,99,0,100,1,100,0,3,4,1,0,115,0,0)

Usage : whiterabbit-solve.py [-q] [--check]
"""
import argparse
import re
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "hidden"
FMT = "flag{%d%c%c%dn%c%d%c%d_%dh_M%d%ds_G%d%ct%dS%d}"
ARGS = [3, 115, 99, 0, 100, 1, 100, 0, 3, 4, 1, 0, 115, 0, 0]


def render() -> str:
    parts = re.findall(r"%[dc]|[^%]+", FMT)
    out = []
    ai = 0
    for p in parts:
        if p == "%d":
            out.append(str(ARGS[ai])); ai += 1
        elif p == "%c":
            out.append(chr(ARGS[ai])); ai += 1
        else:
            out.append(p)
    return "".join(out)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le flag")
    ap.add_argument("--check", action="store_true",
                     help="appelle secret() sous gdb (code mort, jamais execute par main)")
    a = ap.parse_args()
    flag = render()
    if a.q:
        print(flag)
        return 0
    print(f"flag = {flag!r}")
    if a.check:
        r = subprocess.run(
            ["gdb", "-q", "-batch", "-ex", "break main", "-ex", "run",
             "-ex", "call (int)secret()", "--args", str(EXE)],
            capture_output=True, text=True,
        )
        printed_len = None
        for line in r.stdout.splitlines():
            if line.startswith("$1 ="):
                printed_len = int(line.split("=")[1].strip())
        good = printed_len == len(flag) + 1  # printf inclut le '\n'
        print("secret() a imprime", printed_len, "octets (attendu:", len(flag) + 1, ")")
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
