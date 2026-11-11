#!/usr/bin/env python3
"""Solveur BadEngineer's First Crackme (easycrackme.exe, PE32 MinGW).

Mot de passe de 9 caractères : p[0]=c, p[i]=(p[i-1]+i)&0xFF  (i=1..8),
c étant le premier caractère (au choix ; <= '5' pour passer le test de main).

  python3 tools/easycrackme-solve.py            # c='0' -> 0136:?ELT
  python3 tools/easycrackme-solve.py -c A       # autre premier caractère
  python3 tools/easycrackme-solve.py --list     # tous les mots de passe valides
  python3 tools/easycrackme-solve.py --check    # vérif par émulation du vrai
                                                # code x86 (unicorn) du .exe
  -q : n'affiche que le mot de passe
"""
import argparse, os, struct, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "analysis", "extracted", "easycrackme.exe")


def make(c: int) -> str:
    out, v = [c], c
    for i in range(1, 9):
        v = (v + i) & 0xFF
        out.append(v)
    return "".join(map(chr, out))


def usable(pw: str) -> bool:
    # scanf("%63s") : pas d'espace/contrôle ; ASCII imprimable
    return all(0x21 <= ord(ch) <= 0x7E for ch in pw)


def check(pw: str) -> str:
    """Émule napiyorsunmeselaquestionmark(pw, pw[0]) du binaire réel."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EIP, UC_X86_REG_EAX
    d = open(EXE, "rb").read()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    osz = struct.unpack_from("<H", d, pe + 20)[0]
    mu.mem_map(0x400000, 0x20000)
    mu.mem_write(0x400000, d[:0x400])
    for i in range(nsec):
        o = pe + 24 + osz + 40 * i
        vs, va, rs, ro = struct.unpack_from("<IIII", d, o + 8)
        if ro and rs and va < 0x1F000:
            mu.mem_write(0x400000 + va, d[ro:ro + rs])
    mu.mem_map(0x100000, 0x10000)
    sp = 0x10F000
    buf = 0x108000
    mu.mem_write(buf, pw.encode() + b"\0")
    log = []

    def rs(a):
        s = b""
        while (b := bytes(mu.mem_read(a, 1))) != b"\0":
            s += b; a += 1
        return s

    def arg(n):
        return struct.unpack("<I", bytes(mu.mem_read(mu.reg_read(UC_X86_REG_ESP) + 4 * n, 4)))[0]

    def ret(val):
        esp = mu.reg_read(UC_X86_REG_ESP)
        r = struct.unpack("<I", bytes(mu.mem_read(esp, 4)))[0]
        mu.reg_write(UC_X86_REG_EAX, val & 0xFFFFFFFF)
        mu.reg_write(UC_X86_REG_ESP, esp + 4)
        mu.reg_write(UC_X86_REG_EIP, r)

    def hook(uc, addr, size, _):
        if addr == 0x403c48:   ret(len(rs(arg(1))))                       # strlen
        elif addr == 0x403c58:                                              # strcmp
            a, b = rs(arg(1)), rs(arg(2)); ret((a > b) - (a < b))
        elif addr == 0x403c88: log.append(rs(arg(1)).decode(errors="replace")); ret(0)  # printf
        elif addr == 0x403c80: log.append(rs(arg(1)).decode()); ret(0)     # puts
        elif addr == 0x403d28: ret(0)                                      # Sleep
        elif addr == 0x403c70: raise RuntimeError("scanf appelé : mauvais mdp")  # retry path
    mu.hook_add(UC_HOOK_CODE, hook)
    # état initial : compteur .bss 0x40702c = 0
    mu.mem_write(0x40702C, b"\0\0\0\0")
    mu.mem_write(sp, struct.pack("<III", 0xDEAD0000, buf, ord(pw[0])))
    mu.reg_write(UC_X86_REG_ESP, sp)
    try:
        mu.emu_start(0x4014D4, 0xDEAD0000)
    except Exception as e:
        return "KO (" + str(e) + ")"
    return "OK" if any("FOUND" in l for l in log) else "KO"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-c", "--first", default="0")
    ap.add_argument("--list", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    if a.list:
        for c in range(0x21, 0x7F):
            pw = make(c)
            if usable(pw):
                print(pw, "(main OK)" if c <= 0x35 else "(via retry)")
        return
    pw = make(ord(a.first[0]))
    if not usable(pw):
        sys.exit("premier caractère donnant un mdp non saisissable ; essayer --list")
    if a.q:
        print(pw)
    else:
        print("password:", pw)
    if a.check:
        print("check emulation:", check(pw))
        bad = pw[:-1] + chr(ord(pw[-1]) ^ 1)
        print("check emulation (KO attendu):", check(bad))


main()
