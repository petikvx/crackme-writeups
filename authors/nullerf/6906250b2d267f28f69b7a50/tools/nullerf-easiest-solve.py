#!/usr/bin/env python3
"""NullerF's Easiest — PIN (cmp eax,0x2179 dans main).

  python3 tools/nullerf-easiest-solve.py          # affiche le PIN
  python3 tools/nullerf-easiest-solve.py -q       # PIN seul
  python3 tools/nullerf-easiest-solve.py --check  # émule main() du PE d'origine (unicorn)
                                                  # avec le PIN, + un PIN faux (KO)
Pas de user/login : le crackme ne demande qu'un PIN décimal.
"""
import argparse, io, os, struct, sys, zipfile

PIN = 0x2179  # 8569
HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
MAIN, PRINTF, SCANF, GETCH_IMP = 0x140001380, 0x140002010, 0x140002090, 0x1400112F8


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("easiest.exe", pwd=b"crackmes.one")


def run(pin):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX
    d = load_exe()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    opt = struct.unpack_from("<H", d, pe + 20)[0]
    base = struct.unpack_from("<Q", d, pe + 24 + 24)[0]
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    uc.mem_map(base, 0x20000)
    uc.mem_write(base, d[:0x400])
    for i in range(nsec):
        o = pe + 24 + opt + 40 * i
        vsz, va, rsz, raw = struct.unpack_from("<IIII", d, o + 8)
        uc.mem_write(base + va, d[raw:raw + rsz])
    uc.mem_map(0x7000000, 0x10000)
    uc.mem_map(0x9000000, 0x1000)
    uc.mem_write(GETCH_IMP, struct.pack("<Q", 0x9000000))
    out = []

    def hook(uc, addr, size, _):
        if addr == 0x14000146C or addr == 0x9000000:      # __main / _getch : stub
            uc.reg_write(UC_X86_REG_RIP, addr)  # no-op, ret below
            rsp = uc.reg_read(UC_X86_REG_RSP)
            ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
            uc.reg_write(UC_X86_REG_RSP, rsp + 8); uc.reg_write(UC_X86_REG_RIP, ret)
        elif addr in (PRINTF, SCANF):
            rsp = uc.reg_read(UC_X86_REG_RSP)
            ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
            fmt = uc.reg_read(UC_X86_REG_RCX)
            s = bytes(uc.mem_read(fmt, 40)).split(b"\0")[0]
            if addr == PRINTF:
                out.append(s.decode())
            else:                                           # scanf("%d", &x)
                uc.mem_write(uc.reg_read(UC_X86_REG_RDX), struct.pack("<i", pin))
                uc.reg_write(UC_X86_REG_RAX, 1)
            uc.reg_write(UC_X86_REG_RSP, rsp + 8); uc.reg_write(UC_X86_REG_RIP, ret)

    uc.hook_add(UC_HOOK_CODE, hook)
    sp = 0x7008000
    uc.mem_write(sp, struct.pack("<Q", 0x8000000))
    uc.reg_write(UC_X86_REG_RSP, sp)
    uc.emu_start(MAIN, 0x8000000)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        ok, ko = run(PIN), run(1234)
        print("PIN", PIN, "->", ok); print("PIN 1234 ->", ko)
        sys.exit(0 if "Correct" in ok[-1] and "Incrorrect" in ko[-1] else 1)
    print(PIN if a.q else f"PIN = {PIN} (0x{PIN:X})")


main()
