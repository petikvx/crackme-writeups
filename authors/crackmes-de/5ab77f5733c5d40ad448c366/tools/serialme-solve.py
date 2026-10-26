#!/usr/bin/env python3
"""SerialMe (fego) - solveur : serial fixe de 8 caractères (pas de user).

Usage: serialme-solve.py [-q] [--check SERIAL] [--all N]
"""
import argparse, itertools
import numpy as np

TARGET = b"8x@rtr25"          # .data 0x4030dc
PRINT = range(0x21, 0x7f)


def norm(b):
    """boucle 4011d5..4011fd : comparaisons signées sur 8 bits"""
    v = b - 256 if b >= 128 else b
    while v > 0x7a:
        v -= 10
    while v < 0x30:
        v += 10
        if v > 127: v -= 256
    return v & 0xff


def s8(v):  # wrap -> signed 8
    v &= 0xff
    return v - 256 if v >= 128 else v


def check_bytes(s):
    assert len(s) == 8
    d = int.from_bytes(s[:4], "little")
    d = d - (1 << 32) if d >= 1 << 31 else d
    o = bytearray(((d * 0x310890) & 0xffffffff ^ 0x96547).to_bytes(4, "little"))
    for i in range(4):
        o[i] = ((s[i] ^ o[i]) << 2) & 0xff
    d2 = int.from_bytes(s[4:], "little")
    d2 = d2 - (1 << 32) if d2 >= 1 << 31 else d2
    x = ((d2 * 0x666666) & 0xffffffff) ^ 0x365799
    x = ((x >> 17) | (x << 15)) & 0xffffffff
    o += x.to_bytes(4, "little")
    for i in range(4, 8):
        a = s[i] ^ o[i] ^ 0x31
        a = ((a >> 2) | (a << 6)) & 0xff
        o[i] = a
    return bytes(norm(b) for b in o)


def half1():
    # out[i] ne dépend que de s[0..i] (retenue de la multiplication)
    res = []
    def rec(pref):
        n = len(pref)
        if n == 4:
            res.append(bytes(pref)); return
        for c in PRINT:
            s = bytes(pref) + bytes([c]) + b"\x00" * (3 - n)
            d = int.from_bytes(s, "little")
            d = d - (1 << 32) if d >= 1 << 31 else d
            o = ((d * 0x310890) & 0xffffffff ^ 0x96547).to_bytes(4, "little")
            if norm(((c ^ o[n]) << 2) & 0xff) == TARGET[n]:
                rec(pref + [c])
    rec([])
    return res


def half2():
    rng = np.array(list(PRINT), dtype=np.uint64)
    out = []
    for a in rng:
        b, c, d = np.meshgrid(rng, rng, rng, indexing="ij")
        v = (a | (b << 8) | (c << 16) | (d << 24)).ravel()
        sv = np.where(v >= 1 << 31, v.astype(np.int64) - (1 << 32), v.astype(np.int64))
        x = ((sv * 0x666666) & 0xffffffff) ^ 0x365799
        x = ((x >> 17) | (x << 15)) & 0xffffffff
        ok = np.ones(v.shape, bool)
        for i in range(4):
            sb = (v >> (8 * i)) & 0xff
            xb = (x >> (8 * i)) & 0xff
            t = (sb.astype(np.int64) ^ xb ^ 0x31) & 0xff
            t = ((t >> 2) | (t << 6)) & 0xff
            ok &= np.array([norm(int(z)) for z in range(256)])[t] == TARGET[4 + i]
        for m in v[ok]:
            out.append(int(m).to_bytes(4, "little"))
        if out:
            break
    return out


def solve(n=1):
    h1, h2 = half1(), half2()
    return [(a + b).decode() for a, b in itertools.islice(itertools.product(h1, h2), n)]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    ap.add_argument("--all", type=int, default=1)
    a = ap.parse_args()
    if a.check:
        ok = check_bytes(a.check.encode()) == TARGET
        print("OK" if ok else "KO"); raise SystemExit(0 if ok else 1)
    sols = solve(a.all)
    for s in sols:
        assert check_bytes(s.encode()) == TARGET
        print(s if a.q else f"serial = {s}")
