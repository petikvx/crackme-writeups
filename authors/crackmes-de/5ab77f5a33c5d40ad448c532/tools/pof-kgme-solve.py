#!/usr/bin/env python3
"""pof KGME 0x01 (pof_es) — id 5ab77f5a33c5d40ad448c532. gzexe -> ELF32 sans section headers.

check(pw) @0x804835c (pour chaque caractère c) :
    sscanf(c + <octet bas de tmp>, "%d", &tmp)     # chiffre -> tmp = valeur ; non-chiffre -> tmp inchangé
    s += tmp
    si s == 0x38 (56) : f(pw) @0x804830f
f(pw) : sscanf(pw, "%d", &n)  (entier de tête) ; g(n) @0x80482d0 vrai ssi (n >> 8) == 0x2f7c2c ;
        puis, si n est PAIR (test BYTE [esp],1 sur n), « Password OK! »
=> n dans [796666880, 796667135], pair, et la somme cumulée des chiffres (+ dernier chiffre répété pour
   chaque non-chiffre) atteint exactement 56.  Exemple canonique : 796666880 (somme des chiffres = 56).

  pof-kgme-solve.py [-q] [--all] [--check]
"""
import argparse, re, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "pof-kgme-0x01" / "kgme.unpacked"
LO = 0x2F7C2C << 8


def model(pw: str) -> bool:
    m = re.match(r"\d+", pw)
    if not m:
        return False
    n = int(m.group())
    if n >> 8 != 0x2F7C2C or n % 2:
        return False
    s = tmp = 0
    for c in pw:
        if c.isdigit():
            tmp = int(c)
        s += tmp
        if s == 56:
            return True
    return False


def native(pw: str) -> bool:
    r = subprocess.run([str(BIN)], input=pw + "\n", capture_output=True, text=True, timeout=5).stdout
    return "Password OK!" in r


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--all", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    sols = [str(n) for n in range(LO, LO + 256) if model(str(n))]
    if a.all:
        print("\n".join(sols)); return
    print("796666880" if a.q else f"password : 796666880   ({len(sols)} solutions purement numériques ; --all)")
    if a.check:
        ok = native("796666880") and not native("796666881") and not native("12345")
        agree = all(native(p) == model(p) for p in sols[:6] + ["796666932a", "796666880a", "796666881"])
        print("check:", "OK" if ok and agree else "KO", f"(796666880→OK={ok}, modèle==binaire={agree})")
        sys.exit(0 if ok and agree else 1)


if __name__ == "__main__":
    main()
