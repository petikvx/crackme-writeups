#!/usr/bin/env python3
"""crackme Jenny (sraboy) — id 5ab77f5a33c5d40ad448c4ed. ELF64 x86-64, 3 variantes (developer/debug/release).

Le « username:password » est un SEUL argument argv[1] de 13 caractères :
    s[0:5] = user (jenny)   s[5] = '@'   s[6:13] = « phone » (7 chiffres)
  phone  = atoi(s[6:13])          (« 8675309 », le numéro de la chanson « Jenny »)
  jenny  = Σ_{i<5}  (s[i]  ^ phone)   doit valoir 0x295dda9 (43376041)
  s[5]   = argc'*4*2 = 64 = '@'       (argc' = argc << argc = 8)
  opcode = s[5] - atoi(s[10:12]) + (s[8]-'0') & 0xff  doit valoir 0x29 : le code de `add` est PATCHÉ
           (self-modifying : mprotect + memcpy) pour devenir `sub`, puis `imul` (0xcaaf0f).
  Clé affichée : 13284645-2427364-104376652  (indépendante des détails user/phone une fois les tests passés)

  jenny-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis"
TARGET = "13284645-2427364-104376652"
ANSWER = "jenny@8675309"


def conditions(s: str):
    phone = int(s[6:13])
    jx = sum(ord(c) ^ phone for c in s[:5])
    op = (ord(s[5]) - int(s[10:12]) + (ord(s[8]) - 48)) & 0xFF
    return phone, jx, s[5], op


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    print(ANSWER if a.q else f"argv[1] : {ANSWER}   (username=jenny, password=8675309)")
    if a.check:
        phone, jx, at, op = conditions(ANSWER)
        okm = (phone, jx, at, op) == (8675309, 0x295DDA9, "@", 0x29)
        res = {}
        for v in ("developer", "debug", "release"):
            out = subprocess.run([str(A / v), ANSWER], capture_output=True, text=True).stdout
            res[v] = TARGET in out
        ok = okm and all(res.values())
        print("check:", "OK" if ok else "KO", f"(modèle={okm}, binaires={res})")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
