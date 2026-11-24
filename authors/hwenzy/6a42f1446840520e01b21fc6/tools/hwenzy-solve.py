#!/usr/bin/env python3
"""hwenzy c++ crackme 6/10 — générateur / vérificateur de licence (12 caractères).

Prédicat (anti-debug neutre) :
    fold(H1(L)) ^ lo32(H2(L)) ^ lo32(H3(L)) ^ 0x11223344 == 0xd390a0ba
avec Hn = SipHash-2-4(L, clé_n) et fold(h) = (h>>32) ^ (h & 0xffffffff).

  hwenzy-solve.py                 # affiche une licence valide (connue)
  hwenzy-solve.py -q              # idem, sans bannière
  hwenzy-solve.py --check LIC     # teste LIC avec le prédicat
  hwenzy-solve.py --search [N]    # recompile hwenzy-bf.c et cherche (N préfixes, déf. 3000)
  hwenzy-solve.py --run EXE       # lance wine sur EXE avec la licence (preuve live)
"""
import argparse, os, struct, subprocess, sys

M = (1 << 64) - 1
KEYS = [(0x0f0e0d0c0b0a0908, 0x0102030405060708),
        (0xdeadbeefcafebabe, 0x0102030405060708),
        (0xfeedc0deaabbccdd, 0x0807060504030201)]
TARGET = 0xd390a0ba ^ 0x11223344
KNOWN = "i9aaaaaaus91"


def rotl(x, b):
    return ((x << b) | (x >> (64 - b))) & M


def siphash24(data, k0, k1):
    v0 = k0 ^ 0x736f6d6570736575
    v1 = k1 ^ 0x646f72616e646f6d
    v2 = k0 ^ 0x6c7967656e657261
    v3 = k1 ^ 0x7465646279746573

    def rnd():
        nonlocal v0, v1, v2, v3
        v0 = (v0 + v1) & M; v1 = rotl(v1, 13) ^ v0; v0 = rotl(v0, 32)
        v2 = (v2 + v3) & M; v3 = rotl(v3, 16) ^ v2
        v0 = (v0 + v3) & M; v3 = rotl(v3, 21) ^ v0
        v2 = (v2 + v1) & M; v1 = rotl(v1, 17) ^ v2; v2 = rotl(v2, 32)

    n = len(data) // 8
    for i in range(n):
        m = struct.unpack_from("<Q", data, 8 * i)[0]
        v3 ^= m; rnd(); rnd(); v0 ^= m
    b = (len(data) << 56) | int.from_bytes(data[8 * n:], "little")
    v3 ^= b; rnd(); rnd(); v0 ^= b
    v2 ^= 0xff
    for _ in range(4):
        rnd()
    return v0 ^ v1 ^ v2 ^ v3


def check(lic):
    if len(lic) != 12:
        return False
    d = lic.encode()
    h1, h2, h3 = (siphash24(d, *k) for k in KEYS)
    f = (h1 >> 32) ^ (h1 & 0xffffffff) ^ (h2 & 0xffffffff) ^ (h3 & 0xffffffff)
    return f == TARGET


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    ap.add_argument("--search", nargs="?", const="3000")
    ap.add_argument("--run")
    a = ap.parse_args()
    here = os.path.dirname(os.path.abspath(__file__))
    if a.check is not None:
        ok = check(a.check)
        print("OK" if ok else "KO")
        return 0 if ok else 1
    if a.search:
        exe = "/tmp/hwenzy-bf"
        subprocess.check_call(["gcc", "-O3", "-march=native", "-fopenmp", "-o", exe,
                               os.path.join(here, "hwenzy-bf.c")])
        out = subprocess.run([exe, a.search], capture_output=True, text=True).stdout.split()
        for l in out:
            print(l, "OK" if check(l) else "KO")
        return 0
    assert check(KNOWN)
    if a.run:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.run, KNOWN], capture_output=True,
                           text=True, stdin=subprocess.DEVNULL, timeout=120)
        print(r.stdout)
        return 0
    print(KNOWN if a.q else f"Licence valide : {KNOWN}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
