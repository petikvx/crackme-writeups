#!/usr/bin/env python3
"""Keygen SpaghettiMe (JiM~, .NET) : name -> cle base64 de 40 caracteres.

    python3 spaghettime-solve.py [--name petik] [-q] [--check]
--check : lance le harness .NET (Wine) sur l'exe d'origine pour valider.
"""
import argparse, base64, os, subprocess, sys

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x

def net_hash(s):
    """string.GetHashCode() .NET Framework 32 bits (exe x86)."""
    h1 = h2 = 5381
    u = [ord(c) for c in s] + [0]
    i = 0
    while u[i] != 0:
        h1 = ((((h1 << 5) + h1) & 0xFFFFFFFF) ^ u[i]) & 0xFFFFFFFF
        if u[i + 1] == 0:
            break
        h2 = ((((h2 << 5) + h2) & 0xFFFFFFFF) ^ u[i + 1]) & 0xFFFFFFFF
        i += 2
    return s32(h1 + h2 * 1566083941)

def cdiv(a, b):  # division C# (vers 0)
    q = abs(a) // abs(b)
    return q if (a >= 0) == (b > 0) else -q

def cmod(a, b):
    return a - b * cdiv(a, b)

def rec_num(n):
    """overloaded(int) : 1337 + 3 par pair / -2 par impair sur chaque pas vers 0."""
    v = 1337
    step = -1 if n > 0 else 1
    k = n
    while k != 0:
        v += 3 if k % 2 == 0 else -2   # Python % : parite identique pour signes
        k += step
    return v

def name_target(name):
    return cmod(rec_num(cdiv(net_hash(name), 100000)), 255)

def reduce_arr(a):
    while len(a) > 1:
        last = a[-1]
        a = [(last + x) % 255 for x in a[:-1]]
    return a[0]

def keygen(name):
    t = name_target(name)
    if not 0 <= t < 255:
        raise ValueError("cible negative (%d) : aucun octet ne peut la produire, essaie un autre nom" % t)
    base = [0] * 30
    for b0 in range(255):
        base[0] = b0
        if reduce_arr(base) == t:
            return base64.b64encode(bytes(base)).decode()
    raise ValueError("pas de solution")

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    key = keygen(a.name)
    print(key if a.q else "name=%s\nkey =%s" % (a.name, key))
    if a.check:
        d = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "analysis", "harness")
        r = subprocess.run(["xvfb-run", "-a", "wine", "harness.exe", "SpaghettiMe.exe", a.name, key],
                           cwd=d, capture_output=True, text=True)
        print(r.stdout.strip()); sys.exit(r.returncode)
