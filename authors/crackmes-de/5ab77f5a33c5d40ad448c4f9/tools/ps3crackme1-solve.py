#!/usr/bin/env python3
"""ps3crackme1 (macabre) — id 5ab77f5a33c5d40ad448c4f9. ELF64 PowerPC (PS3 Linux) + programme SPE embarqué.

Hôte PPC64 (main @0x10000978) : lit username et serial (46 octets) puis lance le programme SPU (dans le
binaire à l'offset 0xe80 : ELF EM_SPU) qui DMA la structure {user[46], serial[46], result} et vérifie :

  strlen(user) > 6  et  strlen(serial) == strlen(user)
  s = 0 ; pour i : s += (2*u[i]) ^ (4*u[i]) ; attendu[i] = T[s mod len(T)]   avec T = "jxzilaoq013-fs"
  serial == attendu  ->  result = 1  ("Good boy!")

  ps3crackme1-solve.py [username] [-q] [--check]       (défaut username = petik12 : 7 car. minimum)
"""
import argparse, sys

T = b"jxzilaoq013-fs"


def keygen(user: str) -> str:
    u = user.encode()
    if len(u) <= 6 or len(u) > 45:
        raise SystemExit("username : 7 à 45 caractères")
    s = 0
    out = bytearray()
    for c in u:
        s += (2 * c) ^ (4 * c)
        out.append(T[s % len(T)])
    return out.decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik12")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen(a.user)
    print(k if a.q else f"username: {a.user}\nserial  : {k}")
    if a.check:
        # recalcul indépendant (formule du listing SPU) + invariants
        ok = len(k) == len(a.user) and all(ch in T for ch in k.encode())
        s = 0
        for c, ch in zip(a.user.encode(), k.encode()):
            s += ((c + c) & 0xFFFFFFFF) ^ ((c << 2) & 0xFFFFFFFF)
            ok &= ch == T[s % 14]
        print("check:", "OK" if ok else "KO", "(modèle statique : pas de matériel PS3/SPU ici)")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
