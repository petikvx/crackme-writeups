#!/usr/bin/env python3
"""Keygen « asm_is_fun » (qHF, crackme in assembly NASM).

Pour chaque octet c du nom, NUL final compris :
    v = (c - 15) ^ 2   si c impair
    v = (c + 2) ^ 15   si c pair
    key += "%x" % v
puis substitution caractère par caractère : 'f'->'q', '1'->'H', '5'->'z'.

  ./asm_is_fun-solve.py -q petik
  ./asm_is_fun-solve.py --check [name ...]   # vérifie sous Wine (Thanks for registering!)
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original/crackme.exe"
SUBST = str.maketrans({"f": "q", "1": "H", "5": "z"})

def keygen(name: str) -> str:
    b = name.encode("latin-1")
    if len(b) <= 3:
        raise ValueError("Name must be greater than 3.")
    out = ""
    for c in b + b"\0":
        v = ((c - 15) ^ 2) if c & 1 else ((c + 2) ^ 15)
        out += "%x" % (v & 0xFFFFFFFF)
    return out.translate(SUBST)

def run(name, key):
    """Wine sous pty (`script`) : _getch() final bloque si stdin est un simple pipe."""
    feed = f"(printf '%s\\r'; sleep 2; printf '%s\\r'; sleep 2; printf x)" % (name, key)
    cmd = f"{feed} | timeout 15 script -qc 'wine {EXE}' /dev/null"
    p = subprocess.run(["sh", "-c", cmd], capture_output=True, timeout=30)
    return p.stdout.decode("latin-1")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("names", nargs="*", default=["petik"])
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    ok = True
    for n in a.names:
        k = keygen(n)
        if a.q:
            print(k)
        else:
            print(f"Name: {n}\nKey:  {k}")
        if a.check:
            good = "Thanks for registering!" in run(n, k)
            bad = "The key is invalid." in run(n, k + "0")
            print(f"  wine OK={good}  KO(key+'0')={bad}")
            ok &= good and bad
    sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
