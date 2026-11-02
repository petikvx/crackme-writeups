#!/usr/bin/env python3
"""mothlight keygen (mrAlpha17mr).  Usage: mothlight-solve.py [--name petik] [-q] [--check]
Serial = ML-<C>-<A>-<B> (groupes pas dans l'ordre des passes)."""
import argparse, re, subprocess, sys
M = 0xFFFFFFFF
def up(c): return c - 32 if 97 <= c <= 122 else c
def valid_name(n):
    return 3 <= len(n) <= 20 and re.fullmatch(r"[A-Za-z0-9 \-]+", n) and re.search(r"[A-Za-z]", n)
def keys(name):
    b = [up(c) for c in name.encode()]
    n = len(b)
    h = 0x811C9DC5                       # passe 1 : FNV-1a forward
    for c in b: h = ((h ^ c) * 0x1000193) & M
    A = ((((h ^ 0x4D4C) * 0x9E37) & M) >> 16) & 0xFFFF
    s = 0x6D6F7468                       # passe 2 : backward, rol5
    for c in reversed(b):
        s ^= c + 0x20
        s = ((s << 5) | (s >> 27)) & M
        s = (s + 0x9E3779B9) & M
    B = (s ^ (h >> 16)) & 0xFFFF
    t = ((n << 8) + b[0]) & M            # passe 3 : positionnel
    for i, c in enumerate(b):
        t = (t + c * (i + 3)) & M
        t = (t * 0x21 + 0x17) & M
    C = (t ^ (h & 0xFFFF) ^ 0x17A1) & 0xFFFF
    return A, B, C
def serial(name):
    A, B, C = keys(name)
    return f"ML-{C:04X}-{A:04X}-{B:04X}"
if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik"); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="teste via wine")
    a = ap.parse_args()
    if not valid_name(a.name): sys.exit("nom invalide")
    s = serial(a.name)
    print(s if a.q else f"name={a.name}  serial={s}")
    if a.check:
        import os
        exe = os.path.join(os.path.dirname(__file__), "..", "original", "mothlight.exe")
        r = subprocess.run(["xvfb-run","-a","wine",exe], input=f"{a.name}\n{s}\n".encode(), capture_output=True, timeout=60)
        print(r.stdout.decode(errors="replace")[-200:])
