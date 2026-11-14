#!/usr/bin/env python3
"""mintcocs's party invitation (macOS SwiftUI) — keygen d'Invitation ID.

Format : INV-AAAA-BBBBBBBB-CC
  AAAA     : 4 chiffres decimaux, 1000..9999, filtre par la fonction 0x100004e40
  BBBBBBBB : 8 chiffres hex, libres
  CC       : (AAAA*13 + int(BBBBBBBB,16)) % 100 sur 2 chiffres ("%02d", fn 0x100004e80)
Le "nom" affiche apres "welcome to the party, " (fn 0x100005720) est aussi calcule.

  ./party-invitation-solve.py                 # ID par defaut (B=petik -> hex)
  ./party-invitation-solve.py -q              # ID seul
  ./party-invitation-solve.py --check INV-....
  ./party-invitation-solve.py --verify-unicorn <slice x86_64>   (optionnel)
"""
import argparse, re, sys

M = 0xFFFFFFFF
ALPHA = "0123456789abcdefghijklmnopqrstuvwxyz"
rol16 = lambda v, n: ((v << n) | (v >> (16 - n))) & 0xFFFF


def a_ok(a):  # fn 0x100004e40
    if not 1000 <= a <= 9999:
        return False
    d = (2 * a) & 0xFFFF
    d ^= 0xF522; d = rol16(d, 2); d ^= 0xACE1; d = rol16(d, 3)
    return d == 0xC010


def valid_a():
    return [a for a in range(1000, 10000) if a_ok(a)]


def checksum(a, b):  # fn 0x100004e80
    return "%02d" % ((a * 13 + b) % 100)


def name(a, b, c):  # fn 0x100005720
    b &= 0xFFFFFF
    x = (a ^ 0xDEADBEEF) & M
    eax = (x * 0xEF372000) & M
    ecx = (((x * 0x9E3779B9) & M) >> 13) | eax
    h1 = ecx ^ 0xCAFEBABE
    r = ((h1 * 0x85EBCA6B) & M) ^ b
    h2 = ((((r << 7) & M) ^ (r >> 11)) + h1) & M
    prev = cur = 1
    for _ in range(c):
        prev, cur = cur, ((prev + cur) ^ 0x1337) & M
    v = cur ^ h2
    e = v ^ (v >> 16); e = (e * 0x7FEB352D) & M
    f = e ^ (e >> 15); u = (f * 0x846CA68B) & M
    z = u ^ (u >> 16)
    edi = z & 0xFFF
    r8 = (z >> 12) & 0xFF
    n4 = (u >> 20) & 0xF
    i1 = edi % 36
    i2 = ((edi >> 3) ^ r8) % 36
    i3 = (((r8 * 4) ^ n4)) % 36
    i4 = (edi ^ n4 ^ r8) % 36
    t = (z >> 8) ^ edi; i5 = t - 36 * ((t * 0x71C71C8) >> 32)
    t = ((z >> 4) + r8) & M; i6 = t - 36 * ((t * 0x1C71C71D) >> 34)
    t = z ^ 0xABCD; i7 = t - 36 * ((t * 0x38E38E39) >> 35)
    t = ((z >> 2) ^ ((edi + n4 + r8) & M)); i8 = t - 36 * ((t * 0x38E38E39) >> 35)
    return "".join(ALPHA[i] for i in (i1, i2, i3, i4, i5, i6, i7, i8))


def make(a, b):
    return "INV-%04d-%08X-%s" % (a, b, checksum(a, b))


def check(s):
    m = re.fullmatch(r"INV-(\d{4})-([0-9a-fA-F]{8})-(\d{2})", s)
    if not m:
        return None
    a, b, c = int(m[1]), int(m[2], 16), m[3]
    if not a_ok(a) or checksum(a, b) != c:
        return None
    return name(a, b, int(c))


def verify_unicorn(path):
    """Rejoue la vraie fn 0x100004e40 de la slice x86_64 sous Unicorn."""
    import struct
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import UC_X86_REG_RDI, UC_X86_REG_RAX, UC_X86_REG_RSP
    d = open(path, "rb").read()
    base, foff, fn = 0x100000000, 0, 0x100004E40
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x20000); mu.mem_write(base, d[:0x20000])
    mu.mem_map(0x7000000, 0x10000); mu.mem_map(0x7000, 0x1000)
    ok = []
    for a in range(0, 20000):
        mu.reg_write(UC_X86_REG_RSP, 0x7008000); mu.mem_write(0x7008000, struct.pack("<Q", 0x7000))
        mu.reg_write(UC_X86_REG_RDI, a)
        mu.emu_start(fn, 0x7000)
        if mu.reg_read(UC_X86_REG_RAX) & 1:
            ok.append(a)
    assert ok == valid_a(), (ok, valid_a())
    print("unicorn OK : valid A =", ok)


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("-q", action="store_true")
    p.add_argument("--check")
    p.add_argument("--user", default="petik", help="B = hex des 4 premiers octets du user")
    p.add_argument("--verify-unicorn")
    o = p.parse_args()
    if o.verify_unicorn:
        verify_unicorn(o.verify_unicorn); sys.exit()
    if o.check:
        n = check(o.check)
        print("INVALID" if n is None else "VALID -> welcome to the party, " + n)
        sys.exit(n is None)
    b = int.from_bytes(o.user.encode()[:4].ljust(4, b"\0"), "big") ^ 0x0
    a = valid_a()[0]
    s = make(a, b)
    if o.q:
        print(s)
    else:
        print("A valides :", valid_a())
        print("ID        :", s)
        print("nom       : welcome to the party, " + check(s))
