#!/usr/bin/env python3
"""Keygen lafarge crackme #1 (crackmes.de) : nom -> serial XXXXX-XXXXX-XXXXX.

T0 (@0x406000) et T1 (@0x406100) : tables de 256 octets du crackme.exe
(section .data), reprises telles quelles.
Usage : lafarge-crackme1-solve.py [--name petik] [-q] [--check SERIAL]
"""
import argparse, sys

T0 = bytes.fromhex(
 "b17d2eeb9e3b5a96f13a2385b869bc957236d2504199107b2c5978c4468c8643"
 "a680f9a4f8b09a317a0d01ca0fcec31af4f9ed48b90b538b480f6cc6d4a25954"
 "c581c6db2e27480e25ddd7d4646ab84a2f0c091fa19e44333a2e707a88fb4d67"
 "c355e63789cf655195e2ecb8d3e5ca573983d67fad9fa4634713ae2c12de2077"
 "eeb45df4ae7290263fc19c841f5a8807ab6096ead942fd921acde5f0582dadd0"
 "18a33ce3f5a9038a60f6fce18e05e8a6e05fdd7e11202438426bbdd122308cb5"
 "e9cc4e4b14c0776c63ae1cf510826ee0e8b334ff32947101dc75f04d68b114c9"
 "7e3e87ba5068ba9c67181aaade0a2a10ce46b303fcd99b90a75333735b06b704")
T1 = bytes.fromhex(
 "45565e5b40534551284150525c415c25524d465c5a265c24452d2057554e4e24"
 "562d4d27525a5e5840402d25445d57214540245422274c5841565a2c504f5346"
 "46575e59562624595c5d535d5743224221445d45514c585847235f245b2d2351"
 "262b2126572747514344435022254c21544c4d532420462b5f5b47232a455c59"
 "26565b252640425e27414020262022222b2e4f5f455b45575b4d464651454421"
 "5f5d5d51492c465c424457445c5f43245c57445c252142595f5c5d2c21245f5c"
 "5e515a5120464c2356404741474d502445435a22205950532c5f4144455d4d21"
 "592d20585e4d2721415a4e472643432d24255e5a5e5353475c42512125564d5d")


def keygen(name):
    n = len(name)
    if n <= 3 or n > 0x54:
        raise ValueError("nom : 4..84 caracteres")
    L = (n // 15 + 1) * 15                      # longueur completee a un multiple de 15
    b = bytearray(name.encode() + bytes(T0[i] for i in range(n, L)))
    # melange : b[j] ^= T0[b[i]] (b[i] relu a chaque j, y compris quand j == i)
    for i in range(L):
        for j in range(L):
            b[j] ^= T0[b[i]]
    # repliement : bloc 0 ^= blocs 1..nb-1
    for k in range(1, L // 15):
        for j in range(15):
            b[j] ^= b[15 * k + j]
    out = bytes(T1[c] for c in b[:15])           # substitution finale
    s = out.decode("latin1")
    return f"{s[0:5]}-{s[5:10]}-{s[10:15]}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    s = keygen(a.name)
    if a.check:
        ok = a.check == s
        print("OK" if ok else f"KO (attendu {s})")
        sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name!r} serial={s}")


if __name__ == "__main__":
    main()
