#!/usr/bin/env python3
"""bitwise_fun (crackmes.de, reductor) — keygen.

serial = nombre decimal ; le binaire calcule f(serial) et le compare à
sum(ord(c) for c in name + '\n')  (le '\n' de getchar est compté !).
f est une suite de pseudo-opérations « bitwise » (additionneurs/soustracteurs
écrits à la main) ; ici portée telle quelle puis inversée par brute force.

  python3 bitwise-fun-solve.py [--user petik] [-q] [--check]
"""
import argparse, subprocess, shutil, os, sys

M32 = 0xFFFFFFFF
G8 = 0x10000  # borne des boucles de bits (g8 de la .data)


def adder(v, s):
    """boucle 0x401214 / 0x401438 : « v + s » bit à bit (m < 0x10000)."""
    t = 0
    m = 1
    while m < G8:
        a = (v & m) == m
        b = (s & m) == m
        if a and b:
            t |= (m << 1)
        elif (a or b) and (t & m) == m:
            t ^= (m << 1) | m
        elif a or b:
            t |= m
        m <<= 1
    return t & M32


def sub(A, B):
    """boucle 0x4012f6 : B - A (emprunt propagé), négatif si flag."""
    C = B
    i = 1
    while i < G8:
        if (A & i) and not (C & i):
            t = 0
            j = i
            while j < G8:
                t |= j
                if C & j:
                    C ^= t
                    break
                j <<= 1
        elif (A & i) and (C & i):
            C ^= i
        i <<= 1
    return C & M32


def f(raw):
    """raw = valeur lue par le parseur (chiffres, avec le *10 en trop)."""
    x = raw // 10                       # 0x4011e7 : division par soustractions
    x = adder(x, 0x3b1)                 # 0x401214 (cf. note write-up)
    if x < 0x36f:
        A, B, flag = x, 0x36f, True
    else:
        A, B, flag = 0x36f, x, False
    C = sub(A, B)
    if flag:
        C = (-C) & M32
    x = C
    v = adder(0, (x << 2) & M32)        # 0x401438 : v = (x<<2) & 0xffff
    x = v
    for _ in range(2):                  # ror 2 sur 16 bits
        x = (x >> 1) | (0x8000 if x & 1 else 0)
    x = (x ^ 0x2a) & 0xFFFF
    x = (x << 1) & M32                  # rol 1 sur 16 bits
    if x & 0x10000:
        x ^= 0x10001
    return x >> 1


def namesum(name):
    return sum(name.encode()) + 10


def solve(name):
    want = namesum(name)
    return [s for s in range(0, 6554) if f(s * 10) == want]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", "--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie avec wine")
    a = ap.parse_args()
    sols = solve(a.user)
    if not sols:
        sys.exit("pas de serial")
    s = sols[0]
    print(s if a.q else f"user={a.user!r} serial={s} (toutes: {sols})")
    if a.check:
        exe = os.path.join(os.path.dirname(__file__), "..", "analysis", "extracted", "app.exe")
        pre = ["xvfb-run", "-a"] if shutil.which("xvfb-run") else []
        out = subprocess.run(pre + ["wine", exe], input=f"{a.user}\n{s}\n".encode(),
                             capture_output=True, timeout=60).stdout.decode(errors="replace")
        print(out)
        sys.exit(0 if "Well done" in out else 1)


if __name__ == "__main__":
    main()
