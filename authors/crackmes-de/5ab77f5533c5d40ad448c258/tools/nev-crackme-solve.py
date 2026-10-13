#!/usr/bin/env python3
"""nev_crackme (nevyn, crackmes.de) — mot de passe statique.

Button1Click @ 0x45393C : Edit1.Text -> ShortString S ; S ^= 0x17 octet à octet ;
si S == C1 (0x453A3C) on re-XOR (S redevient la saisie) ; puis S == C2 (0x453A48) -> "Well done!".
Lit les deux ShortStrings dans le binaire et en déduit la réponse.

  ./nev-crackme-solve.py           # explications
  ./nev-crackme-solve.py -q        # mot de passe seul
  ./nev-crackme-solve.py --check X # simule le prédicat sur X
"""
import argparse, pathlib, struct
EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "nev-crackme.exe"
BASE, CODE_RVA, CODE_RAW = 0x400000, 0x1000, 0x400  # section CODE (Delphi 7)

def sstr(data, va):
    off = va - BASE - CODE_RVA + CODE_RAW
    n = data[off]; return data[off + 1: off + 1 + n]

def check(pw: bytes, c1, c2) -> bool:
    s = bytes(b ^ 0x17 for b in pw)
    if s == c1:
        s = bytes(b ^ 0x17 for b in s)   # restauration
    return s == c2

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true"); ap.add_argument("--check")
    a = ap.parse_args()
    d = EXE.read_bytes(); c1, c2 = sstr(d, 0x453A3C), sstr(d, 0x453A48)
    sols = [bytes(b ^ 0x17 for b in c1)] if bytes(b ^ 0x17 for b in c1) == c2 else []
    sols.append(bytes(b ^ 0x17 for b in c2))  # 2e chemin : saisie^0x17 == C2 directement
    if a.check is not None:
        ok = check(a.check.encode("latin1"), c1, c2); print("Well done!" if ok else "Bad game!"); raise SystemExit(0 if ok else 1)
    if a.q:
        print(sols[0].decode("latin1")); return
    print(f"C1 (0x453A3C) = {c1!r}\nC2 (0x453A48) = {c2!r}")
    for s in sols:
        print(f"solution : {s!r}  -> check={check(s, c1, c2)}")

if __name__ == "__main__":
    main()
