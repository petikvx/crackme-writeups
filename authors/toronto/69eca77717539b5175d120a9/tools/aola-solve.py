#!/usr/bin/env python3
"""Toronto's aola — solveur.

Le mot de passe est stocké XOR 0xAA dans .data (VA 0x140004010, 13 octets).
  python3 aola-solve.py          # affiche le mot de passe
  python3 aola-solve.py -q       # mot de passe seul
  python3 aola-solve.py --check ../analysis/b.exe   # émule main (unicorn) : "ok" pour le bon, "no" pour un faux
Pas de username : pas de 'petik' ici.
"""
import argparse, struct, sys

ENC = bytes.fromhex("f3c3dadac3cf87e1c387f3cbd3")  # .data @ 0x140004010
KEY = 0xAA

def solve():
    return bytes(b ^ KEY for b in ENC).decode()

def check(path, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX
    raw = open(path, "rb").read()
    pe = struct.unpack_from("<I", raw, 0x3c)[0]
    nsec = struct.unpack_from("<H", raw, pe + 6)[0]
    opt = struct.unpack_from("<H", raw, pe + 20)[0]
    base = 0x140000000
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0xd000)
    mu.mem_write(base, raw[:0x400])
    for i in range(nsec):
        o = pe + 24 + opt + i * 40
        vsz, va, rsz, rptr = struct.unpack_from("<IIII", raw, o + 8)
        mu.mem_write(base + va, raw[rptr:rptr + rsz])
    mu.mem_map(0x200000, 0x10000)
    out = []
    def rs(a):
        s = b""
        while True:
            c = mu.mem_read(a, 1)
            if c == b"\0": return s
            s += bytes(c); a += 1
    def ret():
        rsp = struct.unpack("<Q", mu.mem_read(mu.reg_read(UC_X86_REG_RSP), 8))[0]
        mu.reg_write(UC_X86_REG_RIP, rsp)
        mu.reg_write(UC_X86_REG_RSP, mu.reg_read(UC_X86_REG_RSP) + 8)
    def hook(uc, addr, size, _):
        if addr == 0x1400018b7:      # __main / init CRT
            ret()
        elif addr == 0x140002f40:    # printf("%s", msg)
            out.append(rs(uc.reg_read(UC_X86_REG_RDX)).decode()); ret()
        elif addr == 0x140002ee0:    # scanf("%63s", buf)
            uc.mem_write(uc.reg_read(UC_X86_REG_RDX), pw.encode() + b"\0"); ret()
        elif addr == 0x140003270:    # strcmp
            a, b = rs(uc.reg_read(UC_X86_REG_RCX)), rs(uc.reg_read(UC_X86_REG_RDX))
            uc.reg_write(UC_X86_REG_RAX, 0 if a == b else 1); ret()
        elif addr == 0x1400032c8:    # puts(msg)
            out.append(rs(uc.reg_read(UC_X86_REG_RCX)).decode()); ret()
    mu.hook_add(UC_HOOK_CODE, hook)
    sp = 0x200000 + 0x8000
    mu.mem_write(sp, struct.pack("<Q", 0xdead0000))
    mu.reg_write(UC_X86_REG_RSP, sp)
    try:
        mu.emu_start(0x140003420, 0xdead0000)
    except Exception as e:
        out.append(f"<{e}>")
    return out

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="b.exe")
    a = ap.parse_args()
    pw = solve()
    if a.check:
        for p in (pw, "petik"):
            print(repr(p), "->", check(a.check, p))
    elif a.q:
        print(pw)
    else:
        print("password =", pw)
