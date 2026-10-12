#!/usr/bin/env python3
"""Keygen fatmike's Crackme #2 (2005).
h = (somme des octets signés du nom) * 0xDEADBEEF mod 2^32 ; buf = wsprintf("%X", h)
Serial (19 car.) = xHHx-xHHx-xHHx-xHHx : positions 1,2 / 6,7 / 11,12 / 16,17 = buf[0..7],
tirets en 4, 9, 14.
Étape 2 (bouton « fonction désactivée ») : positions 0,3,5,8 -> K1 = "KEWL", 10,13,15,18 -> K2 = "SHIT" (big-endian),
clés XOR (dwords alternés) du code chiffré 0x409148..0x4091A3 recopié en 0x401770 (test : dw[20]==0x97BE8, dw[5]==0x0D8BD1FF).
Le nom doit faire >= 4 caractères et h >= 0x10000000 (8 chiffres hex, sinon aucun serial possible).
usage : fatmike2-solve.py [NOM] [--check SERIAL]"""
import sys

def hval(name):
    s = sum((b - 256 if b > 127 else b) for b in name.encode("latin-1"))
    return (s * 0xDEADBEEF) & 0xFFFFFFFF

def keygen(name, pad=("KE", "WL", "SH", "IT")):  # bourrage = clés de l'étape 2
    if len(name) < 4:
        raise ValueError("nom trop court (>= 4 caractères)")
    buf = "%X" % hval(name)
    if len(buf) != 8:
        raise ValueError("h=%s < 0x10000000 : pas de serial possible pour ce nom" % buf)
    return "-".join(pad[k][0] + buf[2 * k:2 * k + 2] + pad[k][1] for k in range(4))

def check(name, serial):
    if len(name) < 4 or len(serial) != 19 or any(serial[i] != "-" for i in (4, 9, 14)):
        return False
    buf = ("%X" % hval(name)).ljust(8, "\0")
    stage1 = all(serial[p] == buf[k] for k, p in enumerate((1, 2, 6, 7, 11, 12, 16, 17)))
    stage2 = "".join(serial[p] for p in (0, 3, 5, 8, 10, 13, 15, 18)) == "KEWLSHIT"
    return stage1 and stage2

if __name__ == "__main__":
    a = sys.argv[1:]
    name = a[0] if a and not a[0].startswith("--") else "petik"
    if "--check" in a:
        s = a[a.index("--check") + 1]; ok = check(name, s); print(name, s, "OK" if ok else "KO"); sys.exit(0 if ok else 1)
    print(name, keygen(name))
