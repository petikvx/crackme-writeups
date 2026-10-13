#!/usr/bin/env python3
"""Keygen Knight's crackme #1 (crackmes.de, UPX + MSVC 6).

Serial = "AAAA-BBBB-CCCC" (14 car., 3 groupes hex majuscules, séparateurs '-' en [4] et [9]).
Contraintes (0x401101) : A > B > C >= 0x1000, et h = hash(nom) doit être « atteignable »
par la récursion 0x401022 avec {A,B} puis avec {B,C} (somme de multiples, cas de base « t ∈ arr »).
hash(nom) (0x401090) = Σ ((c ^ 0xAA) * (c>>4)^2) << (4*(i&1))  (c = char signé, int32).
Astuce : si B divise h, les deux récursions atteignent B -> succès quels que soient A et C.

  ./knights_crackme1-solve.py [nom]        (défaut : petik)
  ./knights_crackme1-solve.py -q petik     (serial seul)
  ./knights_crackme1-solve.py --check NOM SERIAL
"""
import sys

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x >> 31 else x

def name_hash(name):
    t = 0
    for i, ch in enumerate(name.encode("latin1")):
        c = ch - 256 if ch > 127 else ch            # movsx
        e = c >> 4                                  # sar ecx,4
        d = s32((c ^ 0xAA) * e * e)                 # imul edx,ecx x2
        t = s32(t + s32(d << (4 * (i & 1))))        # shl edx,cl (cl = 0 ou 4)
    return t

def reach(arr, idx, count, target, depth=0):
    """Réplique fidèle de 0x401022 (0x401000 = recherche linéaire)."""
    if target in arr[:count]:
        return True
    if idx == count or depth > 64:
        return False
    e, acc, t = arr[idx], 0, target
    while True:
        if reach(arr, idx + 1, count, t, depth + 1):
            return True
        t, acc = s32(t - e), s32(acc + e)
        if not acc < target:                        # cmp ecx,[ebp-8] ; jl
            return False

def fmt_ok(s):
    if len(s) != 14:
        return False
    b = s.encode("latin1")
    if ((~b[4] & 0xFF) << 4 | (~b[4] & 0xFF) >> 4) & 0xFF != b[9]:
        return False
    for g in (s[0:4], s[5:9], s[10:14]):
        if any(ch not in "0123456789ABCDEF" for ch in g):
            return False
    return ((b[4] + b[9] + 0x24) | 0x81) & 0xFF == 0xFF

def check(name, serial):
    s = serial.upper()                              # _strupr sur le serial
    if len(name) < 5 or not fmt_ok(s):
        return False
    a, b, c = (int(s[i:i + 4], 16) for i in (0, 5, 10))
    if min(a, b, c) < 0x1000 or not (a > b > c):
        return False
    h = name_hash(name)
    return reach([a, b], 0, 2, h) and reach([b, c], 0, 2, h)

def keygen(name):
    h = name_hash(name)
    for b in range(0x1001, 0xFFFF):
        if h > 0 and h % b == 0:
            for a, c in ((0xFFFF, 0x1000), (b + 1, b - 1)):
                s = "%04X-%04X-%04X" % (a, b, c)
                if check(name, s):
                    return s
    return None

if __name__ == "__main__":
    args = sys.argv[1:]
    if args[:1] == ["--check"]:
        ok = check(args[1], args[2]); print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    quiet = args[:1] == ["-q"]
    if quiet: args = args[1:]
    name = args[0] if args else "petik"
    s = keygen(name)
    if quiet: print(s or ""); sys.exit(0 if s else 1)
    print(f"nom     : {name}\nhash    : {name_hash(name)} (0x{name_hash(name) & 0xFFFFFFFF:X})\nserial  : {s or '(aucun B diviseur de h dans 0x1001..0xFFFE, essayer un autre nom)'}")
