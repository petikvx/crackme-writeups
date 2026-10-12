#!/usr/bin/env python3
"""Keygen DrPepUr #5 (crackmes.de / crackmes.one 5ab77f5533c5d40ad448c1fc)

Hash 64 bits du serial (0x40183f) :  H = sum_{i=1..n} s[i] * 3**(i+2)   (mod 2**64)
La licence dépend de la constante (edx:eax) que H atteint ; 0x0F = toutes les options.
Le serial doit faire > 19 caractères (cmp len,0x13 en 0x401360).
On résout s[1] mod 3, puis on divise par 3, etc. (DFS avec bornes, alphabet alphanumérique).
Usage : drpepur-5-solve.py [--type 15] [--name petik] [--keyfile chemin]
"""
import argparse, string, sys

TARGETS = {  # type de licence -> H (edx:eax)
    2: 0x0000029D0461A03C, 4: 0x00000391EB4BFB9B, 10: 0x00000410869CB04B,
    12: 0x0000023523B8C36E, 14: 0x0000038450115549, 15: 0x01ED4257A089A08E,
}
ALPHA = sorted((string.ascii_uppercase + string.digits).encode())


def H(s: bytes) -> int:
    return sum(c * 3 ** (i + 2) for i, c in enumerate(s, 1)) & (2**64 - 1)


def solve(target: int, minlen=20):
    assert target % 27 == 0
    t = target // 27
    lo, hi = min(ALPHA), max(ALPHA)
    sys.setrecursionlimit(10000)

    def rng(k):  # valeurs atteignables avec k caractères
        g = (3**k - 1) // 2
        return lo * g, hi * g

    def dfs(r, k):  # r = valeur restante, k = caractères restants
        if k == 0:
            return b"" if r == 0 else None
        a, b = rng(k)
        if not a <= r <= b:
            return None
        for c in sorted(ALPHA, key=lambda c: abs(c - 0x48)):  # milieu d'abord
            if (r - c) % 3 == 0:
                x = dfs((r - c) // 3, k - 1)
                if x is not None:
                    return bytes([c]) + x
        return None

    for n in range(minlen, 64):
        s = dfs(t, n)
        if s is not None:
            assert H(s) == target
            return s.decode()
    raise SystemExit("pas de solution")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--type", type=int, default=15, choices=sorted(TARGETS))
    ap.add_argument("--name", default="petik")
    ap.add_argument("--keyfile", help="écrit DrPepur5.key (format INI)")
    a = ap.parse_args()
    s = solve(TARGETS[a.type])
    print(s)
    if a.keyfile:
        with open(a.keyfile, "w", newline="\r\n") as f:
            f.write(f"[DrPepur #5 Registration]\nName={a.name}\nSerial={s}\n")
