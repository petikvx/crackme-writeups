#!/usr/bin/env python3
"""kcgaming's very simple keycheck — password (nombre) = 1234 (0x4d2).

Usage:
  kcgaming-keycheck-solve.py [-q]
  kcgaming-keycheck-solve.py --check [--exe analysis/password.exe]
    --check : émule checkPassword (0x140001710) du vrai PE avec unicorn
              (Wine absent sur la machine d'analyse).
"""
import argparse, struct, sys

CHECK_VA = 0x140001710
IMAGE_BASE = 0x140000000


def solve():
    # checkPassword: cmp ecx, 0x4d2 ; sete al
    return 0x4D2


def check(exe, n):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RAX, UC_X86_REG_RSP, UC_X86_REG_RBP
    data = open(exe, 'rb').read()
    pe = struct.unpack_from('<I', data, 0x3C)[0]
    nsec = struct.unpack_from('<H', data, pe + 6)[0]
    optsz = struct.unpack_from('<H', data, pe + 20)[0]
    sec = pe + 24 + optsz
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(IMAGE_BASE, 0x20000)
    mu.mem_write(IMAGE_BASE, data[:0x400])
    for i in range(nsec):
        vsz, va, rsz, raw = struct.unpack_from('<IIII', data, sec + 40 * i + 8)
        mu.mem_write(IMAGE_BASE + va, data[raw:raw + rsz])
    mu.mem_map(0x7000000, 0x10000)
    mu.reg_write(UC_X86_REG_RSP, 0x7008000)
    mu.reg_write(UC_X86_REG_RBP, 0x7008000)
    mu.mem_write(0x7008000, struct.pack('<Q', 0x7000000))  # adresse de retour -> ret stop
    mu.reg_write(UC_X86_REG_RCX, n & 0xFFFFFFFF)
    mu.emu_start(CHECK_VA, 0x7000000)
    # arrêt sur ret: rax = résultat
    return mu.reg_read(UC_X86_REG_RAX) & 0xFF


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    ap.add_argument('--exe', default='analysis/password.exe')
    a = ap.parse_args()
    n = solve()
    if a.check:
        ok, ko = check(a.exe, n), check(a.exe, n + 1)
        print(f'checkPassword({n}) = {ok} ; checkPassword({n+1}) = {ko}')
        sys.exit(0 if (ok == 1 and ko == 0) else 1)
    print(n if a.q else f'Password: {n}  (0x{n:x})')
