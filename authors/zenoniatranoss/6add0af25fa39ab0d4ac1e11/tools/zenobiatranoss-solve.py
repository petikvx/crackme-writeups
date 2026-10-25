#!/usr/bin/env python3
"""Keygen pour zenoniatranoss / zenobiatranoss (ELF64, clé de 24 caractères).

Prédicat : 4 tirets aux index 4, 9, 14, 19 + hash 32 bits == 0x9AE078DE.
Beaucoup de clés valides (20 octets libres pour 32 bits) -> z3 en trouve une
dans [A-Z0-9] ; on fixe quelques caractères pour une sortie lisible/déterministe.

Usage : zenobiatranoss-solve.py [-q] [--check ./original/crackme] [--key KEY]
"""
import argparse, subprocess, sys, os, shutil, tempfile

TARGET = 0x9AE078DE
M = 0xFFFFFFFF
def rol(x, n, w=32):
    return ((x << n) | (x >> (w - n))) & M

def h(k):
    """Reproduit le calcul du binaire (cas rapide : pas de pénalité timing)."""
    b = ((k[13] + 0x193) & M) ^ 0x4c20484
    def st(i, add):
        nonlocal b
        b = rol(b, 5) ^ ((k[i] + (add or 0)) & M)
    def r3():
        nonlocal b
        b = rol(b, 3) ^ 0x2d2d2d2d
    st(8,0xf8); st(2,0x3e); st(0,None); st(22,0x2aa)
    r3(); st(7,0xd9); st(16,0x1f0)            # 0x11f2..0x1210
    st(1,0x1f); st(23,0x2c9); st(3,0x5d); st(15,0x1d1); st(6,0xba)
    r3(); r3()
    st(21,0x28b); st(12,0x174); st(10,0x136); st(5,0x9b); st(20,0x26c)
    st(18,0x22e); st(11,0x155); st(17,0x20f)
    return b

def valid(key):
    k = key.encode()
    return (len(k) == 24 and all(k[i] == 0x2d for i in (4,9,14,19)) and h(k) == TARGET)

def ror(x, n):
    return ((x >> n) | (x << (32 - n))) & M

def solve():
    """Meet-in-the-middle sans dépendance : octets fixes + 3 octets en avant
    (k10,k5,k20) / 3 en arrière (k17,k11,k18), jointure sur l'état après st(20)."""
    import itertools, string
    cs = (string.ascii_uppercase + string.digits).encode()
    pin = b"PETIKZENOBIATRANOSS0123"
    k = [0x2d] * 24
    free = [i for i in range(24) if i not in (4, 9, 14, 19)]
    var = (10, 5, 20, 18, 11, 17)
    j = 0
    for i in free:
        if i not in var:
            k[i] = pin[j % len(pin)]; j += 1
    # état avant st(10) (calcul avant, k fixés)
    b = ((k[13] + 0x193) & M) ^ 0x4c20484
    def st(b, i, add): return rol(b, 5) ^ ((k[i] + (add or 0)) & M)
    r3 = lambda b: rol(b, 3) ^ 0x2d2d2d2d
    b = st(b,8,0xf8); b = st(b,2,0x3e); b = st(b,0,None); b = st(b,22,0x2aa)
    b = r3(b); b = st(b,7,0xd9); b = st(b,16,0x1f0)
    b = st(b,1,0x1f); b = st(b,23,0x2c9); b = st(b,3,0x5d); b = st(b,15,0x1d1); b = st(b,6,0xba)
    b = r3(b); b = r3(b); b = st(b,21,0x28b); b = st(b,12,0x174)
    fwd = {}
    for c10, c5, c20 in itertools.product(cs, repeat=3):
        x = rol(b,5) ^ ((c10 + 0x136) & M)
        x = rol(x,5) ^ ((c5 + 0x9b) & M)
        x = rol(x,5) ^ ((c20 + 0x26c) & M)
        fwd.setdefault(x, (c10, c5, c20))
    for c18, c11, c17 in itertools.product(cs, repeat=3):
        x = ror(TARGET ^ ((c17 + 0x20f) & M), 5)
        x = ror(x ^ ((c11 + 0x155) & M), 5)
        x = ror(x ^ ((c18 + 0x22e) & M), 5)
        if x in fwd:
            k[10], k[5], k[20] = fwd[x]
            k[18], k[11], k[17] = c18, c11, c17
            return bytes(k).decode()
    raise SystemExit("pas de jointure (changer pin)")

def check(binary, key):
    tmp = tempfile.mkdtemp()
    p = os.path.join(tmp, "c"); shutil.copy(binary, p); os.chmod(p, 0o755)
    r = subprocess.run([p, key], capture_output=True, text=True)
    return r.returncode, r.stdout.strip()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--key")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    key = a.key or solve()
    if a.q:
        print(key)
    else:
        print("key =", key, "| modèle python:", valid(key))
    if a.check:
        rc, out = check(a.check, key)
        print(f"binaire: rc={rc} stdout={out!r}")
        sys.exit(rc)
