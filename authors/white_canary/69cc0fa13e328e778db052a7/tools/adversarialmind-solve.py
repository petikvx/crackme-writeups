#!/usr/bin/env python3
"""White_Canary's Adversarial Mind — solveur / vérificateur.

Le mot de passe attendu est la chaîne littérale base64 stockée en .rdata
(VA 0x140024520), PAS sa version décodée (PASSWORD{false_password}).

  adversarialmind-solve.py            # affiche le mot de passe
  adversarialmind-solve.py -q         # mot de passe seul
  adversarialmind-solve.py --check [exe] [candidat]
      # extrait la chaîne depuis le PE, puis exécute sous Unicorn le vrai
      # ctor std::string (0x140003a50) et le comparateur (0x1400024e0).
Le binaire d'origine est un ZIP (pwd crackmes.one) : l'exe est lu
depuis ../analysis/extracted/AdversarialMind.exe ou extrait à la volée.
"""
import argparse, base64, io, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, '..', 'original', 'download.bin')
RDATA_VA, STR_VA = 0x140024000, 0x140024520

def load_exe(path=None):
    if path and os.path.exists(path):
        raw = open(path, 'rb').read()
    else:
        raw = open(ORIG, 'rb').read()
    if raw[:2] == b'PK':
        z = zipfile.ZipFile(io.BytesIO(raw))
        raw = z.read('AdversarialMind.exe', pwd=b'crackmes.one')
    return raw

def va2off(pe, va):
    e = struct.unpack_from('<I', pe, 0x3c)[0]
    ns = struct.unpack_from('<H', pe, e + 6)[0]
    opt = struct.unpack_from('<H', pe, e + 20)[0]
    base = struct.unpack_from('<Q', pe, e + 24 + 24)[0]
    sec = e + 24 + opt
    for i in range(ns):
        n, vs, vaddr, rs, raddr = struct.unpack_from('<8sIIII', pe, sec + 40 * i)
        if vaddr <= va - base < vaddr + max(vs, rs):
            return va - base - vaddr + raddr
    raise ValueError(hex(va))

def cstr(pe, va):
    o = va2off(pe, va)
    return pe[o:pe.index(b'\0', o)].decode()

def check(pe, cand):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX
    BASE = 0x140000000
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x40000)
    e = struct.unpack_from('<I', pe, 0x3c)[0]
    ns = struct.unpack_from('<H', pe, e + 6)[0]
    opt = struct.unpack_from('<H', pe, e + 20)[0]
    mu.mem_write(BASE, pe[:0x400])
    for i in range(ns):
        n, vs, vaddr, rs, raddr = struct.unpack_from('<8sIIII', pe, e + 24 + opt + 40 * i)
        mu.mem_write(BASE + vaddr, pe[raddr:raddr + rs])
    HEAP, STK, RET = 0x10000000, 0x20000000, 0x30000000
    mu.mem_map(HEAP, 0x100000); mu.mem_map(STK, 0x100000); mu.mem_map(RET, 0x1000)
    mu.mem_write(RET, b'\xcc')
    heap = [HEAP + 0x10000]
    def hook(uc, addr, size, _):
        if addr == 0x140004fc0:          # operator new(size) -> bump alloc
            n = uc.reg_read(UC_X86_REG_RCX)
            uc.reg_write(UC_X86_REG_RAX, heap[0]); heap[0] += (n + 31) & ~15
            rsp = uc.reg_read(UC_X86_REG_RSP)
            uc.reg_write(UC_X86_REG_RIP, struct.unpack('<Q', uc.mem_read(rsp, 8))[0])
            uc.reg_write(UC_X86_REG_RSP, rsp + 8)
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x140004fc0, end=0x140004fc0)
    def call(fn, rcx, rdx=0):
        rsp = STK + 0x80000
        mu.mem_write(rsp, struct.pack('<Q', RET))
        mu.reg_write(UC_X86_REG_RSP, rsp)
        mu.reg_write(UC_X86_REG_RCX, rcx); mu.reg_write(UC_X86_REG_RDX, rdx)
        mu.emu_start(fn, RET)
        return mu.reg_read(UC_X86_REG_RAX)
    def mkstr(obj, va_or_bytes):
        if isinstance(va_or_bytes, int):
            ptr = va_or_bytes
        else:
            ptr = HEAP + 0x1000 + (obj & 0xfff) * 64
            mu.mem_write(ptr, va_or_bytes + b'\0')
        call(0x140003af0, obj)            # std::string()
        call(0x140003a50, obj, ptr)       # std::string(const char*)
    expected, given = HEAP + 0x100, HEAP + 0x200
    mkstr(expected, STR_VA)
    mkstr(given, cand.encode())
    # le compare s'appelle ainsi dans main : (rsp+0xe0 = expected, rsp+0xc0 = input)
    return bool(call(0x1400024e0, expected, given) & 0xff)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', nargs='*', metavar='ARG')
    a = ap.parse_args()
    exe = a.check[0] if a.check and os.path.exists(a.check[0]) else None
    pe = load_exe(exe)
    pw = cstr(pe, STR_VA)
    if a.check is not None:
        cands = [c for c in a.check if not os.path.exists(c)] or [pw]
        ok = True
        for c in cands + ['PASSWORD{false_password}', 'PASSWORD{AI_n0t_th@t_gud}', 'x']:
            r = check(pe, c)
            exp = (c == pw)
            ok &= (r == exp)
            print(f'{c!r:45} -> {"OK" if r else "KO"}')
        sys.exit(0 if ok else 1)
    print(pw if a.q else f'Password: {pw}\n(décodé base64 = {base64.b64decode(pw).decode()} -> leurre)')
main()
