#!/usr/bin/env python3
"""zsombii's Easy crackme (easycrack.jar) — keygen.

Clé valide : longueur 10 (après trim) et exactement 4 caractères dont
le code ASCII est multiple de 4 (c & 3 == 0). Le préfixe "KEY" est un leurre
(iinc 1,0 = no-op).

  easy-crackme-solve.py            -> clé par défaut
  easy-crackme-solve.py -r         -> clé aléatoire valide
  easy-crackme-solve.py --check JAR [--java JAVA]  -> teste contre le jar réel
"""
import argparse, random, string, subprocess

def valid(k):
    k = k.strip()
    return len(k) == 10 and sum(1 for c in k if ord(c) & 3 == 0) == 4

def gen(rand=False):
    if not rand:
        return "KEY0000111"
    pool = string.printable[:94]
    mult = [c for c in pool if ord(c) & 3 == 0]
    other = [c for c in pool if ord(c) & 3]
    l = random.sample(mult, 4) + random.sample(other, 6)
    random.shuffle(l)
    return "".join(l)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("-r", action="store_true")
    ap.add_argument("--check")
    ap.add_argument("--java", default="java")
    a = ap.parse_args()
    k = gen(a.r)
    assert valid(k)
    print(k)
    if a.check:
        out = subprocess.run([a.java, "-jar", a.check], input=k + "\n", text=True,
                             capture_output=True).stdout
        ok = "Validation key accepted" in out
        print("check:", "OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
