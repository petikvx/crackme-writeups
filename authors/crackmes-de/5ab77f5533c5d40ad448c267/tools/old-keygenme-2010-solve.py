#!/usr/bin/env python3
"""Keygen — old_keygenme_2010 by zaas (crackmes.one 5ab77f5533c5d40ad448c267).

Prédicat (sub_401960 + div piégée par SEH à 0x40172b) :
  acc = sum_{i=0..3} (serial[i] + name[0]+..+name[i]) + G   (octets signés)
  acc doit valoir 0 (mod 2^32) -> la division `div acc` lève une exception,
  le handler SEH conserve le flag -> "Well done!".
  G = 0 au départ ; il devient -0x586 si on frappe Shift+3 ('#') dans le
  champ serial (WM_KEYDOWN sous-classé, sub_401080, une seule fois).
  Donc : 4*n0 + 3*n1 + 2*n2 + n3 + sum(serial[:4]) == 0x586 (1414), et taper '#'
  (5e caractère, ignoré : seuls les 4 premiers comptent).
Usage : old-keygenme-2010-solve.py [nom] [--check SERIAL]
"""
import itertools, string, sys

TARGET = 0x586
ALNUM = string.digits + string.ascii_letters
PRINT = "".join(chr(c) for c in range(33, 127))

def sb(c):
    v = ord(c) & 0xFF
    return v - 256 if v >= 128 else v

def acc(name, serial, G=-TARGET):
    a = run = 0
    for i in range(4):
        run += sb(name[i])
        a += sb(serial[i]) + run
    return (a + G) & 0xFFFFFFFF

def keygen(name):
    if len(name) < 4 or not all(c in ALNUM for c in name):
        raise SystemExit("nom : >= 4 caractères alphanumériques")
    need = TARGET - sum((4 - i) * sb(c) for i, c in enumerate(name[:4]))
    q, r = divmod(need, 4)          # serial le plus régulier possible
    cand = chr(q) * (4 - r) + chr(q + 1) * r if 0 <= q < 127 else ""
    if len(cand) == 4 and all(c in ALNUM for c in cand):
        return cand
    for s0, s1, s2 in itertools.product(PRINT, repeat=3):
        s3 = need - ord(s0) - ord(s1) - ord(s2)
        if 33 <= s3 < 127:
            return s0 + s1 + s2 + chr(s3)
    raise SystemExit("pas de serial imprimable pour ce nom")

if __name__ == "__main__":
    args = sys.argv[1:]
    name = args[0] if args and not args[0].startswith("--") else "petik"
    if "--check" in args:
        s = args[args.index("--check") + 1]
        ok = acc(name, s) == 0
        print(f"{name} / {s} + '#' : {'OK' if ok else 'KO'}"); sys.exit(0 if ok else 1)
    s = keygen(name)
    assert acc(name, s) == 0
    print(f"nom    : {name}\nserial : {s} puis taper '#' (Shift+3) au clavier dans le champ -> {s}#")
