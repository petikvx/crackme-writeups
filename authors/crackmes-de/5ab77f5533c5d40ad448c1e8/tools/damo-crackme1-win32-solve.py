#!/usr/bin/env python3
"""Keygen damos_crackme_1_for_win32 (damo2k, crackmes.de) — serial de 10 caractères.

Même code C que les versions Linux/Solaris, compilé MSVC (main @ 0x401000).
Contraintes (après passage en MAJUSCULES des a..z, s = serial) :
  s0 = s9 - 3     s1 = s8 + 14     s2 = s7 - 20     s3 = s6 + 6
  s0 = (s4 + s5) / 2   (division entière C : cdq ; sub eax,edx ; sar eax,1)
usage : damo-crackme1-win32-solve.py [-n N] [--check]   (--check lance l'exe sous wine)
"""
import os, random, string, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "crkme1-win32.exe")
OK = set(map(ord, string.ascii_uppercase + string.digits))   # pas de minuscules (elles sont upcasées)

def valid(s: str) -> bool:
    t = [ord(c) - 0x20 if 0x61 <= ord(c) <= 0x7A else ord(c) for c in s]
    if len(t) != 10:
        return False
    return (t[0] == t[9] - 3 and t[1] == t[8] + 14 and t[2] == t[7] - 20
            and t[3] == t[6] + 6 and t[0] == int((t[4] + t[5]) / 2))

def gen(rng=random):
    while True:
        s = [None] * 10
        s[9] = rng.choice(sorted(c for c in OK if c - 3 in OK)); s[0] = s[9] - 3
        s[8] = rng.choice(sorted(c for c in OK if c + 14 in OK)); s[1] = s[8] + 14
        s[7] = rng.choice(sorted(c for c in OK if c - 20 in OK)); s[2] = s[7] - 20
        s[6] = rng.choice(sorted(c for c in OK if c + 6 in OK)); s[3] = s[6] + 6
        s[4] = rng.choice(sorted(OK)); s[5] = 2 * s[0] - s[4] + rng.choice([0, 1])
        if s[5] in OK:
            r = "".join(map(chr, s))
            assert valid(r)
            return r

def run(s):
    env = dict(os.environ, WINEDEBUG="-all")
    return subprocess.run(["wine", EXE, s], capture_output=True, text=True, env=env).stdout.strip()

if __name__ == "__main__":
    a = sys.argv[1:]
    n = int(a[a.index("-n") + 1]) if "-n" in a else 1
    sers = ["POFKPPEZAS"] + [gen() for _ in range(n - 1)]
    for s in sers:
        print(s, "->", run(s)) if "--check" in a else print(s)
    if "--check" in a:
        for bad in ("POFKPPEZAX", "SHORT"):
            print(bad, "->", run(bad))
