#!/usr/bin/env python3
"""crackme_1 (batman10) — id 5ab77f5933c5d40ad448c48a. ELF32 C++ (cin >> char[500]).

main @0x8048690 : name et password lus avec `cin >>` (mots sans blanc) ;
  Σ signed(name[i]  ^ 0x47)  ==  Σ signed(pass[j] ^ 0x42)   -> « Good! »
Keygen : pass[i] = name[i] ^ 0x05 (même somme, caractère par caractère) ; repli : DP sur les
caractères imprimables non blancs si un résultat est un blanc (ex. '%' ^ 5 = ' ').

  crackme1-solve.py [name] [-q] [--check]      (défaut name = petik)
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "crackme_1"
s8 = lambda x: x - 256 if x > 127 else x
OK = [c for c in range(0x21, 0x7F)]


def keygen(name: str) -> str:
    b = name.encode()
    p = bytes(c ^ 0x05 for c in b)
    if all(0x21 <= c < 0x7F for c in p):
        return p.decode()
    target = sum(s8(c ^ 0x47) for c in b)
    best = {0: b""}
    for _ in range(len(b)):
        nxt = {}
        for t, s in best.items():
            for c in OK:
                nxt.setdefault(t + s8(c ^ 0x42), s + bytes([c]))
        best = nxt
    if target not in best:
        raise SystemExit("pas de mot de passe de même longueur")
    return best[target].decode()


def run(name, pw):
    return subprocess.run([str(BIN)], input=f"{name}\n{pw}\n", capture_output=True, text=True).stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen(a.name)
    print(k if a.q else f"name    : {a.name}\npassword: {k}")
    if a.check:
        ok = "Good!" in run(a.name, k)
        bad = "Bad!" in run(a.name, k + "a")
        print("check:", "OK" if ok and bad else "KO", f"(Good={ok}, mauvais={bad})")
        sys.exit(0 if ok and bad else 1)


if __name__ == "__main__":
    main()
