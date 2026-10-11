#!/usr/bin/env python3
"""Console Infinity (promix17) — générateur de mots de passe.

Format imposé (43 caractères) :
  [0:9]   "Password!"   [14:21] "Hacker!"   [30:39] "Infinity!"   [42] "!"
Les 17 caractères libres (9..13, 21..29, 39..41) sont tirés au hasard
jusqu'à ce que hash(pw) % 0xFFFFFF == 0x209DD8 (fonction 0x401020).
"""
import random, string, sys

def h(s: bytes) -> int:
    a = 0; c = 0
    for i, ch in enumerate(s):
        sc = ch - 256 if ch > 127 else ch
        a = (a + sc) & 0xffffffff
        c ^= ch
        a = (a + c) & 0xffffffff
        c = (~c) & 0xff
        c >>= 2
        c ^= a & 0xff
        c ^= (i << 3) & 0xff
        d = (c * i) & 0xffffffff
        d = (d * (~a & 0xffffffff)) & 0xffffffff
        a ^= d
    return a % 0xffffff

FREE = list(range(9, 14)) + list(range(21, 30)) + list(range(39, 42))
AL = string.ascii_letters + string.digits

def gen(seed=None):
    rnd = random.Random(seed)
    base = bytearray(b"Password!-----Hacker!---------Infinity!---!")
    while True:
        for p in FREE:
            base[p] = ord(rnd.choice(AL))
        if h(base) == 0x209DD8:
            return base.decode()

if __name__ == "__main__":
    known = "Password!WErUPHacker!I35mP5pygInfinity!LoL!"
    assert h(known.encode()) == 0x209DD8
    print(known)
    if "--new" in sys.argv:
        print(gen())  # ~16 M essais en moyenne : utiliser plutôt consoleinfinity-brute.c
