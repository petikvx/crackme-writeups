#!/usr/bin/env python3
"""Crackme 1 by syscalo (sys_linux_crackme) — id 5ab77f5c33c5d40ad448c637. ELF32 stripped.

main : boucle `printf("Inserisci il seriale: ") ; scanf("%x", &x)` (le serial est lu en HEXADÉCIMAL),
       la routine @0x8048379 calcule m = f(x) et le compare à la constante 0x70707 :
    A  = ((x & 0xff0000) + 0xff9f0000) ^ 0x150000
    q  = ((x & 0xff) | 0x37) / 0x11                  (division signée)
    B  = ((x & 0x1f00) ^ 0x1e00) + q
    m  = A ^ B   ==   0x70707   (cible : ((0x503090 & 0x111111) / 8 * 7) / 2)
  => octet 2 de x = 0x73, x & 0x1f00 = 0x1900, q = 7  ( (x&0xff)|0x37 ∈ {0x77, 0x7f} ).
  Les bits 24-31 et 13-15 sont libres.

  crkme1sys-solve.py [-q] [--all] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "crkme1sys"
M = 0xFFFFFFFF
TARGET = ((0x503090 & 0x111111) // 8 * 7) // 2        # 0x70707


def f(x: int) -> int:
    a = (((x & 0xFF0000) + 0xFF9F0000) & M) ^ 0x150000
    q = ((x & 0xFF) | 0x37) // 0x11
    b = ((x & 0x1F00) ^ 0x1E00) + q
    return (a ^ b) & M


def solutions(limit=None):
    out = []
    for low in range(256):
        for y in range(0, 0x2000, 0x100):
            x = (0x73 << 16) | y | low
            if f(x) == TARGET:
                out.append(x)
    return out


def native(hexs: str) -> bool:
    p = subprocess.Popen([str(BIN)], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    try:
        out, _ = p.communicate((hexs + "\n").encode(), timeout=1)   # pas de EOF boucle : timeout
    except subprocess.TimeoutExpired:
        p.kill()
        out = p.stdout.read(8192)
    return b"Complimenti" in out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true"); ap.add_argument("--all", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    sols = solutions()
    if a.all:
        print("\n".join(f"{x:x}" for x in sols)); return
    k = f"{sols[0]:x}"
    print(k if a.q else f"seriale (hex) : {k}   ({len(sols)} solutions avec octet haut = 0 ; --all)")
    if a.check:
        ok = native(k) and not native("737f7f") and not native("1")
        print("check:", "OK" if ok else "KO", f"({k}→Complimenti={native(k)})")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
