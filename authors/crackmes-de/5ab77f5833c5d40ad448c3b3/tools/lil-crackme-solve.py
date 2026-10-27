#!/usr/bin/env python3
"""lil_crackme (crackme2.exe, abcd / crackmes.de) — keygen.

Le binaire exige :
  * un fichier `kernel32.dll` dans le cwd dont le 1er mot est `naumaan` ;
  * un username (>8 car., sans espace) tel que
        sum_i ((10*c_i) % (3*i+3)) * (i ^ 3) == 0x1be (446)

Usage :
  lil-crackme-solve.py                 # username pour le préfixe « petik »
  lil-crackme-solve.py --user petik -q # imprime seulement le username
  lil-crackme-solve.py --check NAME    # vérifie un username
  lil-crackme-solve.py --write-file DIR  # crée DIR/kernel32.dll (« naumaan »)
"""
import argparse, os, sys

TARGET = 0x1BE
CHARSET = [chr(c) for c in range(0x21, 0x7F)]


def term(i, c):
    return ((10 * ord(c)) % (3 * i + 3)) * (i ^ 3)


def total(name):
    return sum(term(i, c) for i, c in enumerate(name))


def check(name):
    return len(name) > 8 and not any(ch.isspace() for ch in name) and total(name) == TARGET


def solve(prefix):
    base = total(prefix)
    for extra in range(1, 6):
        n = len(prefix) + extra
        if n < 9:
            continue
        # DP : reachable[pos][sum] -> chaîne
        states = {base: ""}
        for i in range(len(prefix), n):
            new = {}
            for s, suf in states.items():
                for c in CHARSET:
                    t = s + term(i, c)
                    if t <= TARGET and t not in new:
                        new[t] = suf + c
            states = new
        if TARGET in states:
            return prefix + states[TARGET]
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    ap.add_argument("--write-file", metavar="DIR")
    a = ap.parse_args()
    if a.write_file:
        with open(os.path.join(a.write_file, "kernel32.dll"), "w") as f:
            f.write("naumaan\n")
    if a.check is not None:
        ok = check(a.check)
        print("OK" if ok else "KO", total(a.check))
        sys.exit(0 if ok else 1)
    name = solve(a.user)
    if not name:
        sys.exit("pas de solution")
    print(name if a.q else f"username = {name}  (sum={total(name)})  + kernel32.dll = 'naumaan'")


main()
