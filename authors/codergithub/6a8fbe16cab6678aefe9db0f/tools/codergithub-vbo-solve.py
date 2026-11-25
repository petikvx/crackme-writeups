#!/usr/bin/env python3
"""codergithub's VBO (Mach-O arm64) — keygen/solveur.

Clé : FLAG-AAAA-BBBB-CCCC-DDDD (4 groupes hex).  Pas d'utilisateur.
  python3 tools/codergithub-vbo-solve.py          # affiche la clé
  python3 tools/codergithub-vbo-solve.py -q       # clé seule
  python3 tools/codergithub-vbo-solve.py --check  # exécute le code ARM64 ORIGINAL sous unicorn
"""
import argparse, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "crackme")
M64 = (1 << 64) - 1
C = [0x9E3779B97F4A7C15, 0x3C6EF372FE94F82A, 0xDAA66D2C7DDF743F]
S = 0x78DDE6E5FD29F054
CT_OFF = 0x11EE  # ciphertext du message de succès (44 octets) ; le 45e vient de l'octet final
M1, M2 = 0xBF58476D1CE4E5B9, 0x94D049BB133111EB


def mix(x):
    x ^= x >> 30; x = x * M1 & M64
    x ^= x >> 27; x = x * M2 & M64
    return x


def candidates():
    """Résout les 4 contraintes de la fonction 0x100000fac (tous champs 16 bits)."""
    for a in range(0x10000):
        b = a ^ 0xE123                          # a^b == 0xe123
        c = (0xE892 - b * 0x9E37) & 0xFFFF      # (b*0x9e37 + c) & 0xffff == 0xe892
        r = c ^ 0x80CB                          # rol16(d,5) ^ c == 0x80cb
        d = ((r >> 5) | (r << 11)) & 0xFFFF
        if (a + b + c + d) & 0xFFFF == 0x9153:  # somme 16 bits
            yield a, b, c, d


def message(a, b, c, d, data):
    t = (a << 48) | (b << 32) | (c << 16) | d
    cs = C + [S]
    out = bytearray()
    for i in range(11):
        for l in range(4):
            v = mix((t + cs[l]) & M64)
            out.append(data[CT_OFF + i * 4 + l] ^ (v & 255) ^ ((v >> 31) & 255))
        cs = [(x + S) & M64 for x in cs]
    v = mix((t + 0xCFC0659B6017CFB1) & M64)  # 45e octet (0x100000d84..db8)
    out.append((v ^ 0xB9 ^ (v >> 31)) & 255)
    return bytes(out)


def solve():
    data = open(BIN, "rb").read()
    for a, b, c, d in candidates():
        m = message(a, b, c, d, data)
        if m.startswith(b"FLAG{") and m.endswith(b"}"):
            return a, b, c, d, m
    sys.exit("aucune clé")


def check(a, b, c, d, expected):
    from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM
    from unicorn.arm64_const import UC_ARM64_REG_X0 as X0, UC_ARM64_REG_W0 as W0, UC_ARM64_REG_W1, UC_ARM64_REG_W2, UC_ARM64_REG_W3, UC_ARM64_REG_X8, UC_ARM64_REG_X9, UC_ARM64_REG_X21, UC_ARM64_REG_X22, UC_ARM64_REG_X23, UC_ARM64_REG_X29, UC_ARM64_REG_SP, UC_ARM64_REG_X30
    data = open(BIN, "rb").read()
    def fresh():
        u = Uc(UC_ARCH_ARM64, UC_MODE_ARM)
        u.mem_map(0x100000000, 0x4000); u.mem_write(0x100000000, data[:0x2000])
        u.mem_map(0x7F000000, 0x10000)
        return u
    # 1) fonction de validation 0x100000fac(a,b,c,d) -> w0
    u = fresh()
    for r, v in zip((W0, UC_ARM64_REG_W1, UC_ARM64_REG_W2, UC_ARM64_REG_W3), (a, b, c, d)):
        u.reg_write(r, v)
    u.reg_write(UC_ARM64_REG_X30, 0x100001FF0)
    u.emu_start(0x100000FAC, 0x100001FF0)
    ok = u.reg_read(W0)
    # 2) génération du message 0x100000c64..0x100000dc0
    u = fresh()
    fp = 0x7F008000
    u.reg_write(UC_ARM64_REG_X29, fp)
    u.mem_write(fp - 0xDC, a.to_bytes(4, "little")); u.mem_write(fp - 0xE0, b.to_bytes(4, "little"))
    u.mem_write(fp - 0xE4, c.to_bytes(4, "little")); u.mem_write(fp - 0xE8, d.to_bytes(4, "little"))
    u.reg_write(UC_ARM64_REG_X22, M1); u.reg_write(UC_ARM64_REG_X21, M2); u.reg_write(UC_ARM64_REG_X23, S)
    u.emu_start(0x100000C64, 0x100000DC0)
    msg = bytes(u.mem_read(fp - 0x88, 0x2C)) + bytes(u.mem_read(fp - 0x5C, 1))
    print(f"[check] 0x100000fac -> {ok}; message émulé = {msg.decode(errors='replace')}")
    assert ok == 1 and msg == expected, "mismatch"


def main():
    p = argparse.ArgumentParser()
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", action="store_true")
    o = p.parse_args()
    a, b, c, d, m = solve()
    key = "FLAG-%04X-%04X-%04X-%04X" % (a, b, c, d)
    if o.q:
        print(key)
    else:
        print("clé     :", key); print("message :", m.decode())
    if o.check:
        check(a, b, c, d, m)


if __name__ == "__main__":
    main()
