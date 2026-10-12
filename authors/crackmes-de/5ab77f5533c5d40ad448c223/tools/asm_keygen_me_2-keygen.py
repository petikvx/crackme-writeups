#!/usr/bin/env python3
"""Keygen « KeyGen ME - 2 » (kkr_we_rule, ASM) — crackmes.one 5ab77f5533c5d40ad448c223.

Serial = "A-B" (deux entiers décimaux) avec  A + B == K(nom)  (mod 2^32)
et gcd(3, A) == gcd(3, B) == 1 tel que calculé par la routine 0x4012CA (idiv signé).
  usage : asm_keygen_me_2-keygen.py [-q] [--check SERIAL] NOM      (nom >= 4 caractères)
"""
import sys
M16, M32 = 0xFFFF, 0xFFFFFFFF

def s32(x):
    x &= M32
    return x - (1 << 32) if x & 0x80000000 else x

def h1(name: bytes) -> int:            # 0x401222
    dx = 0
    for ax in name:
        dx = (dx + ax) & M16
        dx = (dx * ax) & M16           # imul dx,ax
        dx ^= ax
        dx = (dx << 2) & M16
        ax >>= 2                       # shr ax,2 (ax modifié pour la suite du tour)
        dx ^= ax
        dx = (dx + dx) & M16
        dx = (dx - ax) & M16
        dx = ((dx >> 4) | (dx << 12)) & M16   # ror dx,4
        dx ^= ax
        dx = (dx - ax) & M16
        dx ^= ax
    return dx

def h2(name: bytes) -> int:            # 0x401273
    bx = 0
    for ax in name:
        bx = (bx + ax) & M16
        bx ^= ax
        bx = (bx - ax) & M16
        bx &= ax
    return bx

def key(name: bytes) -> int:
    g1 = (h1(name) ** 3 - h1(name)) & M32   # 0x4012F3(x,3) = x³, puis - x
    g2 = (h2(name) ** 3 - h2(name)) & M32
    return ((((g1 ^ g2) & g2) + g2) & M32)  # 0x4012AA renvoie toujours son argument

def idiv(a, b):                        # x86 idiv : troncature vers 0
    q = abs(a) // abs(b)
    q = q if (a >= 0) == (b >= 0) else -q
    return q, a - q * b

def gcd_routine(a: int, b: int):       # 0x4012CA(a=3, b=valeur) -> ebx
    a, b = s32(a), s32(b)
    if b == 0:
        return None                    # esi non initialisé : à éviter
    while b != 0:
        esi = b
        _, r = idiv(a, b)
        b, a = r, esi
    return esi

def ok_part(v: int) -> bool:
    return gcd_routine(3, v) == 1

def keygen(name: bytes):
    k = key(name)
    for a in range(1, 100):
        b = s32(k - a)
        if ok_part(a) and ok_part(b):
            return k, a, b
    raise RuntimeError("pas de découpage trouvé")

def check(name: bytes, serial: str) -> bool:
    if len(name) <= 3 or "-" not in serial:
        return False
    sa, sb = serial.split("-", 1)
    def strtoint(s):                   # StrToIntA : signe optionnel + chiffres
        i, neg, v = 0, False, 0
        if s[:1] == "-": neg, i = True, 1
        while i < len(s) and s[i].isdigit():
            v = (v * 10 + int(s[i])) & M32; i += 1
        return s32(-v if neg else v)
    a, b = strtoint(sa), strtoint(sb)
    return ok_part(a) and ok_part(b) and ((a + b) & M32) == key(name)

def main(argv):
    q = "-q" in argv
    chk = None
    if "--check" in argv:
        i = argv.index("--check"); chk = argv[i + 1]; del argv[i:i + 2]
    args = [a for a in argv if a != "-q"]
    name = (args[0] if args else "petik").encode("latin-1")
    if len(name) <= 3:
        sys.exit("le nom doit faire au moins 4 caractères")
    if chk is not None:
        r = check(name, chk); print("OK" if r else "KO"); sys.exit(0 if r else 1)
    k, a, b = keygen(name)
    if q:
        print(f"{a}-{b}")
    else:
        print(f"nom    : {name.decode('latin-1')}")
        print(f"h1/h2  : {h1(name):#06x} / {h2(name):#06x}")
        print(f"K      : {k:#010x} ({s32(k)})")
        print(f"serial : {a}-{b}")

if __name__ == "__main__":
    main(sys.argv[1:])
