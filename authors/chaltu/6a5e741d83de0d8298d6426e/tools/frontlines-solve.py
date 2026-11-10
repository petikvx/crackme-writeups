#!/usr/bin/env python3
"""chaltu's FRONTLINES - solveur.

Le mot de victoire (menu option 3) est stocké obfusqué dans .rdata (VA 0x140023c63, 11 octets) :
    char = chr(((b ^ 0xAA) + 0xED) & 0xFF)

Usage :
    frontlines-solve.py            # affiche le mot
    frontlines-solve.py -q         # mot seul
    frontlines-solve.py --check [mot] [--exe crackme.exe]
        # émule (unicorn) la routine du binaire d'origine (VA 0x1400032e5..0x1400033df)
        # et vérifie que memcmp(input, decode) == 0
"""
import argparse, os, sys, zipfile, io

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")
ENC_VA, ENC_LEN = 0x140023C63, 11


def load_exe(path=None):
    if path:
        return open(path, "rb").read()
    z = zipfile.ZipFile(ORIG)
    return z.read("crackme.exe", pwd=b"crackmes.one")


def sections(d):
    pe = int.from_bytes(d[0x3C:0x40], "little")
    n = int.from_bytes(d[pe + 6:pe + 8], "little")
    opt = int.from_bytes(d[pe + 20:pe + 22], "little")
    base = int.from_bytes(d[pe + 0x30:pe + 0x38], "little")
    out = []
    t = pe + 24 + opt
    for i in range(n):
        s = d[t + 40 * i:t + 40 * i + 40]
        vs, va, rs, ro = (int.from_bytes(s[k:k + 4], "little") for k in (8, 12, 16, 20))
        out.append((base + va, max(vs, rs), d[ro:ro + rs]))
    return base, int.from_bytes(d[pe + 0x50:pe + 0x54], "little"), out


def decode(d):
    base, _, secs = sections(d)
    for va, sz, raw in secs:
        if va <= ENC_VA < va + sz:
            enc = raw[ENC_VA - va:ENC_VA - va + ENC_LEN]
            return "".join(chr(((b ^ 0xAA) + 0xED) & 0xFF) for b in enc)
    raise SystemExit("section introuvable")


def check(d, word):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RAX
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8
    base, size, secs = sections(d)
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, (size + 0xFFF) & ~0xFFF)
    for va, sz, raw in secs:
        mu.mem_write(va, raw)
    STACK, HEAP, INP = 0x10000000, 0x20000000, 0x30000000
    for a in (STACK, HEAP, INP):
        mu.mem_map(a, 0x10000)
    rsp = STACK + 0x8000
    mu.reg_write(UC_X86_REG_RSP, rsp)
    w = word.encode("utf-8")
    mu.mem_write(INP, w)
    mu.mem_write(rsp + 0x88, INP.to_bytes(8, "little"))      # input ptr (après trim)
    mu.mem_write(rsp + 0x28, len(w).to_bytes(8, "little"))   # input len
    res = {}

    def hook(uc, addr, sz, _):
        if addr == 0x140020D60:       # Vec::reserve : on fournit un buffer
            vec = uc.reg_read(UC_X86_REG_RCX)
            uc.mem_write(vec, (0x1000).to_bytes(8, "little"))       # cap
            uc.mem_write(vec + 8, HEAP.to_bytes(8, "little"))      # ptr
            ret = int.from_bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RSP), 8), "little")
            uc.reg_write(UC_X86_REG_RSP, uc.reg_read(UC_X86_REG_RSP) + 8)
            uc.reg_write(UC_X86_REG_RIP, ret)
        elif addr == 0x140020C5B:     # memcmp(rcx, rdx, r8)
            a = bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_R8)))
            b = bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RDX), uc.reg_read(UC_X86_REG_R8)))
            res["cmp"] = (a, b)
            uc.reg_write(UC_X86_REG_RAX, 0 if a == b else 1)
            ret = int.from_bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RSP), 8), "little")
            uc.reg_write(UC_X86_REG_RSP, uc.reg_read(UC_X86_REG_RSP) + 8)
            uc.reg_write(UC_X86_REG_RIP, ret)
        elif addr == 0x1400033DF:     # test eax,eax ; je success
            res["ok"] = uc.reg_read(UC_X86_REG_RAX) & 0xFFFFFFFF == 0
            uc.emu_stop()
        elif addr == 0x1400033E5:     # branche échec (longueur différente / memcmp != 0)
            res.setdefault("ok", False)
            uc.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    try:
        mu.emu_start(0x1400032E5, 0x140003500, count=20000)
    except Exception as e:
        res["err"] = repr(e)
    return res


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="", metavar="MOT")
    ap.add_argument("--exe")
    a = ap.parse_args()
    d = load_exe(a.exe)
    word = decode(d)
    if a.check is not None:
        t = a.check or word
        r = check(d, t)
        print(f"input={t!r} -> {'ACCEPTÉ' if r.get('ok') else 'REFUSÉ'}  ({r})")
        sys.exit(0 if r.get("ok") else 1)
    print(word if a.q else f"Mot de victoire (menu 3) : {word}")


main()
