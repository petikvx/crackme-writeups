#!/usr/bin/env python3
"""SerialMe v1 (pxor / d9a) — keygen + checker.

Serial = 32 hex MAJUSCULES = 4 mots de 32 bits = 4 instructions d'une mini-VM
(opcode = nibble de poids fort, opérande = 28 bits de poids faible).
Valide si, après exécution : E == 5678 et F == 1234 (E/F partent de 0).

  serialme-solve.py            -> serial canonique
  serialme-solve.py -q         -> serial seul
  serialme-solve.py --random   -> un serial valide aléatoire (brute-force guidé)
  serialme-solve.py --check S  -> vérifie S avec l'émulation de la VM
(Pas de nom/utilisateur dans ce crackme : `petik` n'a pas de sens ici.)
"""
import argparse, random, re

A, B, C, D = 4444, 6912, 5678, 1234          # 0x403381 / 385 / 389 / 38d
M = 0xFFFFFFFF

def run(serial):
    """Émulation fidèle du handler 0x401178..0x401279 ; None si rejeté / crash."""
    if len(serial) != 32 or not re.fullmatch(r'[0-9A-F]{32}', serial):
        return None
    E = F = 0
    for i in range(4):
        w = int(serial[8*i:8*i+8], 16)
        op, x = w >> 28, w & 0x0FFFFFFF
        if op == 0:   E = (B - A) & M
        elif op == 2: E = (B - F) & M
        elif op in (5, 7, 9): E = (A - B) & M
        elif op in (1, 3, 4, 6, 8):
            if x: F = E // x                  # div ebx (ebx==0 -> saut sans écrire)
        elif op == 15: return None            # table[15]=0 -> jmp 0 -> crash
        # op 10..14 : nop
    return E, F

def check(s):
    return run(s) == (C, D)

CANON = "000000001000000220000000A0000000"   # E=B-A=2468 ; F=E/2=1234 ; E=B-F=5678 ; nop

def rand_serial():
    while True:
        ops = [random.choice([0,5,7,9]), 0, 2, random.randint(10, 14)]
        x = random.choice([d for d in range(1, 5000) if 2468 // d == D or (-2468 & M) // d == D] or [2])
        s = "%X%07X" % (0, random.randint(0, 0xFFFFFFF))
        s += "%X%07X" % (random.choice([1,3,4,6,8]), x)
        s += "%X%07X" % (2, random.randint(0, 0xFFFFFFF))
        s += "%X%07X" % (random.randint(10, 14), random.randint(0, 0xFFFFFFF))
        if check(s): return s

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--random", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check.upper()); print("OK" if ok else "KO"); raise SystemExit(0 if ok else 1)
    s = rand_serial() if a.random else CANON
    assert check(s)
    print(s if a.q else f"serial = {s}\n(E,F) final = {run(s)}")
