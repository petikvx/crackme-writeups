#!/usr/bin/env python3
"""LATTICE-4 (werrec) : solveur / checker.

Serial = 16 caractères alphanumériques (pas de username → pas de `petik` ici).
  python3 -I tools/lattice4-solve.py            # affiche le serial + le message final
  python3 -I tools/lattice4-solve.py -q         # serial seul
  python3 -I tools/lattice4-solve.py --check S  # rejoue tous les prédicats sur S
  python3 -I tools/lattice4-solve.py --search-first   # recalcule la 1re moitié (gcc + MITM C)
"""
import argparse, itertools, os, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
M32 = 0xFFFFFFFF
FLAG = 0x5A ^ 0x3C            # octet .data 0x140004010 après l'int3 (VEH : xor 0x3c) ; sans debugger
FIRST_HALF = "L4tT1cE4"
ALNUM = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
ENC_MSG = bytes.fromhex(  # .rdata 0x140005110, 0x23 octets
    "a9e49f62b6e556de577de7a7e478a18ca81bf9208d1675c4ce46cd02cbbf7876bc3bdd")
ENC_STAGE2_OFF, ENC_STAGE2_LEN = 0x3760, 0x3A0   # .rdata 0x140005160 (offset fichier)


def sbox():
    def inv(a):
        return next((b for b in range(256) if gmul(a, b) == 1), 0) if a else 0
    def gmul(a, b):
        r = 0
        while b:
            if b & 1: r ^= a
            a = ((a << 1) ^ 0x11B) if a & 0x80 else a << 1
            b >>= 1
        return r & 0xFF
    t = []
    for x in range(256):
        i = inv(x); y = i
        for k in (1, 2, 3, 4): y ^= ((i << k) | (i >> (8 - k))) & 0xFF
        t.append(y ^ 0x63)
    return t
SB = sbox()
assert SB[0] == 0x63 and SB[1] == 0x7C


def rol32(x, n): return ((x << n) | (x >> (32 - n))) & M32


def xt(a): return ((a << 1) ^ (0x1B if a & 0x80 else 0)) & 0xFF


def gm(a, b):
    r = 0
    while b:
        if b & 1: r ^= a
        a = xt(a); b >>= 1
    return r


def mixcol(c):
    a0, a1, a2, a3 = c
    return [xt(a0) ^ (xt(a1) ^ a1) ^ a2 ^ a3, a0 ^ xt(a1) ^ (xt(a2) ^ a2) ^ a3,
            a0 ^ a1 ^ xt(a2) ^ (xt(a3) ^ a3), (xt(a0) ^ a0) ^ a1 ^ a2 ^ xt(a3)]


def invmixcol(c):
    return [gm(c[0], 14) ^ gm(c[1], 11) ^ gm(c[2], 13) ^ gm(c[3], 9),
            gm(c[0], 9) ^ gm(c[1], 14) ^ gm(c[2], 11) ^ gm(c[3], 13),
            gm(c[0], 13) ^ gm(c[1], 9) ^ gm(c[2], 14) ^ gm(c[3], 11),
            gm(c[0], 11) ^ gm(c[1], 13) ^ gm(c[2], 9) ^ gm(c[3], 14)]


def state(b):
    s = [b[i] ^ FLAG ^ (((i + 1) * 0xA5) & 0xFF) for i in range(16)]
    return sum((mixcol(s[4 * c:4 * c + 4]) for c in range(4)), [])


def stage1(b):
    """8 premiers caractères : 4 prédicats (FNV, hash+sbox, linéaires)."""
    b = [ord(c) if isinstance(c, str) else c for c in b[:8]]
    h = 0x811C9DC5
    for c in b:
        a = h ^ c; h = a * 0x1000193 & M32
    if a != 0x53FDD974: return False
    ecx = 0xA5A5C3C3
    for c in b:
        eax = (c * 0xA7 + SB[c]) ^ ecx; ecx = rol32(eax, 7) * 0x85EBCA77 & M32
    if eax != 0x73AC9527: return False
    if (b[3]*b[0] + b[2]*b[1] + b[6]*b[5] + b[7]*b[4]) % 251 != 0xD1: return False
    x = (((b[0]*0x1F + b[1]*0x11) ^ (b[2] | b[3] << 8)) * 0x10001 +
         ((b[4]*0xD + b[5]*0xB) ^ (b[6] | b[7] << 8))) & M32
    if x != 0x58DC8BD7: return False
    a = 0
    for c in b: a = (a * 0x83 + SB[c]) & 0xFFFF
    return a == 0x7583


def stage2(b):
    """16 caractères : prédicats du shellcode déchiffré (RC4 clé = f(8 premiers chars))."""
    b = [ord(c) if isinstance(c, str) else c for c in b]
    m = state(b)
    q = (0xAA, 0xE7, 0x03, 0x6D)
    for k in range(4):
        if (m[k]*0x1F + m[k+4]*0x11 + m[k+12] + m[k+8]*0xD) % 251 != q[k]: return False
    if (m[0]*m[5] + m[10]*m[15] + m[3]*m[12]) % 251 != 6: return False
    if m[1] ^ m[6] ^ m[11] ^ m[14] != 0x80: return False
    a = 0
    for v in m: a = (a * 0x83 + SB[v]) & 0xFFFF
    if a != 0x5521: return False
    h = 0x811C9DC5
    for i in range(16):
        e = ((m[i] + b[i]) & 0xFF) ^ h; h = e * 0x1000193 & M32
    if e != 0x0256AE47: return False
    if ((b[12]*0x1F + b[13]*0x11) ^ (b[14] | b[15] << 8)) != 0x74B7: return False
    e = 0
    for i in range(8, 16): e = (e * 0xA7 + (b[i] ^ m[i - 8])) & M32
    if e != 0x7B41E7A6: return False
    h = 0
    for i in range(16):
        h = (rol32(h, 5) ^ ((b[15 - i] | 1) * m[i])) & M32
    return h == 0x82945478


def rc4(key, data):
    S = list(range(256)); j = 0
    for i in range(256):
        j = (j + S[i] + key[i % len(key)]) & 255; S[i], S[j] = S[j], S[i]
    i = j = 0; out = bytearray()
    for c in data:
        i = (i + 1) & 255; j = (j + S[i]) & 255; S[i], S[j] = S[j], S[i]
        out.append(c ^ S[(S[i] + S[j]) & 255])
    return bytes(out)


def message(serial):
    return rc4(serial.encode() + bytes([FLAG]), ENC_MSG).decode(errors="replace")


def check(serial):
    return len(serial) == 16 and all(c in ALNUM for c in serial) and stage1(serial) and stage2(serial)


def search_first():
    with tempfile.TemporaryDirectory() as d:
        open(os.path.join(d, "T.bin"), "wb").write(bytes(SB))
        exe = os.path.join(d, "mitm")
        subprocess.check_call(["gcc", "-O2", "-o", exe, os.path.join(HERE, "lattice4-first-half-mitm.c")])
        return subprocess.check_output([exe, os.path.join(d, "T.bin")], text=True).split()


def solve_second(first):
    q = (0xAA, 0xE7, 0x03, 0x6D)
    base = [ord(c) for c in first] + [0] * 8
    m_known = state(base)          # colonnes 0 et 1 ne dépendent que des 8 premiers chars
    found = []
    for c12, c13 in itertools.product(map(ord, ALNUM), repeat=2):
        w = ((c12 * 0x1F + c13 * 0x11) ^ 0x74B7)      # = b14 | b15<<8
        c14, c15 = w & 0xFF, w >> 8
        if chr(c14) not in ALNUM or chr(c15) not in ALNUM: continue
        s = [x ^ FLAG ^ (((i + 13) * 0xA5) & 0xFF) for i, x in enumerate((c12, c13, c14, c15))]
        m12 = mixcol(s)                                 # m[12..15]
        # A_k : 13*m[k+8] + m[k+12] = q_k - 0x1f*m[k] - 0x11*m[k+4]  (mod 251)
        cands = []
        for k in range(4):
            t = (q[k] - 0x1F * m_known[k] - 0x11 * m_known[k + 4] - m12[k]) % 251
            v = t * pow(13, -1, 251) % 251
            cands.append([x for x in (v, v + 251) if x < 256])
        for m8 in itertools.product(*cands):
            s8 = invmixcol(list(m8))
            b8 = [s8[j] ^ FLAG ^ (((j + 9) * 0xA5) & 0xFF) for j in range(4)]
            if all(chr(x) in ALNUM for x in b8):
                cand = first + "".join(map(chr, b8 + [c12, c13, c14, c15]))
                if check(cand): found.append(cand)
    return found


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    ap.add_argument("--search-first", action="store_true")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check); print("OK" if ok else "KO")
        if ok: print(message(a.check))
        return 0 if ok else 1
    first = search_first()[0] if a.search_first else FIRST_HALF
    assert stage1(first)
    sols = solve_second(first)
    if not sols: sys.exit("aucune solution")
    if a.q: print(sols[0]); return
    for s in sols: print("serial :", s); print("message:", message(s))


if __name__ == "__main__":
    main()
