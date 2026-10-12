#!/usr/bin/env python3
"""Keygen « KeyGen Me - 1 » (kkr_we_rule, ASM) — crackmes.one 5ab77f5533c5d40ad448c222.

Cible T = f(nom) sur 10 bits ; serial = 4 entiers (a,b,c,d) avec a²+b²+c²+d² == T (mod 2^32).
  usage : asm_keygen_me_1-keygen.py [-q] [--all] NOM
"""
import sys
M16, M32 = 0xFFFF, 0xFFFFFFFF

def name_hash(name: bytes) -> int:
    """0x401220 : boucle 16 bits sur chaque octet, puis x² & ~x."""
    dx = 0
    for ch in name:
        ax = ch
        dx = (dx + ax) & M16
        dx = (dx + dx) & M16
        p = ax * dx                       # mul dx : dx:ax = ax*dx
        ax, dx = p & M16, (p >> 16) & M16
        dx = (dx - ax) & M16
        dx = (dx + dx) & M16
        dx = (dx + ax) & M16
        dx = (dx * ax) & M16              # imul dx,ax
    c = dx
    sq = (c * c) & M32
    return sq & ~c & M32                  # (sq | (c&sq)) ^ (c&sq)

def target(name: bytes) -> int:
    x = name_hash(name)
    sq = (x * x) & M32                    # 0x401278(x,2) = x*x
    edi = (sq & (x ^ sq)) << 2 & M32      # xor ecx,eax ; and eax,ecx ; shl eax,2
    n = len(name)
    s = edi - (1 << 32) if edi & 0x80000000 else edi   # idiv signé
    q = int(s / n); r = s - q * n          # troncature vers 0 (x86)
    edi = (edi - q + r) & M32
    return edi >> 22                      # 0..1023

def four_squares(t: int):
    import math
    for a in range(math.isqrt(t), -1, -1):
        for b in range(math.isqrt(t - a*a), -1, -1):
            for c in range(math.isqrt(t - a*a - b*b), -1, -1):
                d2 = t - a*a - b*b - c*c
                d = math.isqrt(d2)
                if d*d == d2:
                    return a, b, c, d

def main(argv):
    q = "-q" in argv
    args = [a for a in argv if not a.startswith("-")]
    name = (args[0] if args else "petik").encode("latin-1")
    t = target(name)
    s = four_squares(t)
    if q:
        print(*s)
    else:
        print(f"nom      : {name.decode('latin-1')}")
        print(f"hash nom : {name_hash(name):#010x}")
        print(f"cible T  : {t}")
        print(f"serial   : {s[0]} / {s[1]} / {s[2]} / {s[3]}   ({'+'.join(f'{v}²' for v in s)} = {sum(v*v for v in s)})")

if __name__ == "__main__":
    main(sys.argv[1:])
