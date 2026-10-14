#!/usr/bin/env python3
"""Macabre's Infector Crackme v0.1 — id 5ab77f5a33c5d40ad448c4f6. ELF32 KDE3/Qt3 (GUI, strippé).

Sub-goal 2 (mot de passe « Infector », LED rouge -> verte) : sub_0804DAC0 @0x804dac0
    len(pw) == 5   et   Π (signed char) pw[i]  == -1488344688   (int32, wrap)      -> LED « green »
  Il y a 180 chaînes imprimables de 5 caractères qui conviennent ; la seule qui soit un mot est « breed ».
Sub-goal 1 (mot de passe de l'hôte) : propre à chaque hôte infecté (choisi à l'infection) ; routine de
  (dé)chiffrement sub_0804DC40 : XOR par clé répétée avec « saut » (voir unxor()).

  infector-solve.py [-q] [--all] [--check]
"""
import argparse, itertools, sys

M = 1 << 32
TARGET = (-1488344688) % M


def prod(pw: bytes) -> int:
    p = 1
    for c in pw:
        p = (p * (c - 256 if c > 127 else c)) % M
    return p


def candidates():
    P = range(0x21, 0x7F)
    two = {}
    for a, b in itertools.product(P, P):
        two.setdefault(a * b, []).append((a, b))
    out = set()
    for a, b, c in itertools.product(P, P, P):
        p = a * b * c
        v = (p & -p).bit_length() - 1
        if v > 4:
            continue
        m = 1 << (32 - v)
        q = (((TARGET >> v) * pow(p >> v, -1, m)) % m)
        for d, e in two.get(q, ()):
            if (p * d * e) % M == TARGET:
                out.add(bytes([a, b, c, d, e]))
    return sorted(out)


def unxor(data: bytes, key: bytes) -> bytes:
    """réplique de sub_804DC40 : octet en clair 0 ou == key[k] inchangé et sans avancer ;
    sinon out = b ^ key[k] ; k++ (retour à 0 en fin de clé)."""
    k = 0
    out = bytearray()
    for b in data:
        if b == 0 or b == key[k]:
            out.append(b)
        else:
            out.append(b ^ key[k]); k = (k + 1) % len(key)
    return bytes(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true"); ap.add_argument("--all", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.all:
        for s in candidates(): print(s.decode())
        return
    print("breed" if a.q else "mot de passe Infector : breed   (autres : --all, 180 solutions)")
    if a.check:
        c = candidates()
        ok = prod(b"breed") == TARGET and len(c) == 180 and b"breed" in c and prod(b"breeD") != TARGET
        print("check:", "OK" if ok else "KO", f"(Π('breed') = {prod(b'breed')-M if prod(b'breed')>=1<<31 else prod(b'breed')}, {len(c)} solutions)")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
