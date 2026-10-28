#!/usr/bin/env python3
"""Preuve dynamique : execute la VRAIE routine 0x401063 de KeygenMe.exe sous Unicorn.
Les imports (HeapAlloc, GetDlgItemTextA, SetDlgItemTextA, HeapFree) sont hookes ;
on lit le message que le binaire poserait dans le champ.   Usage: keygenme3-emu.py EXE SERIAL..."""
import struct, sys
from unicorn import *
from unicorn.x86_const import *

def run(exe, serial):
    d = open(exe, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    n, so = struct.unpack_from('<H', d, pe + 6)[0], struct.unpack_from('<H', d, pe + 20)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x20000)
    mu.mem_write(0x400000, d[:0x400])
    for i in range(n):
        o = pe + 24 + so + 40 * i
        vs, va, rs, rp = struct.unpack_from('<IIII', d, o + 8)
        if va < 0x15000: mu.mem_write(0x400000 + va, d[rp:rp + min(rs, vs)])
    HEAP, STK, STUB = 0x1000000, 0x2000000, 0x3000000
    for a in (HEAP, STK, STUB): mu.mem_map(a, 0x10000)
    iat = {0x40d004: 'HeapAlloc', 0x40d000: 'HeapFree', 0x40d114: 'GetDlgItemText', 0x40d11c: 'SetDlgItemText'}
    for k, (a, nm) in enumerate(iat.items()):
        mu.mem_write(a, struct.pack('<I', STUB + k * 16)); mu.mem_write(STUB + k * 16, b'\xc3')
    st = {'msg': None}
    def rd(a):
        s = b''
        while (c := mu.mem_read(a, 1)) != b'\0': s += bytes(c); a += 1
        return s.decode()
    def hook(uc, addr, sz, _):
        nm = list(iat.values())[(addr - STUB) // 16]
        esp = uc.reg_read(UC_X86_REG_ESP); arg = lambda i: struct.unpack('<I', uc.mem_read(esp + 4 * i, 4))[0]  # arg(1) = 1er param
        ret = 0
        if nm == 'HeapAlloc': ret = HEAP
        elif nm == 'GetDlgItemText':   # (hDlg,id,buf,max) : tronque a max-1
            buf, mx = arg(3), arg(4); t = serial.encode()[:mx - 1] + b'\0'; uc.mem_write(buf, t)
        elif nm == 'SetDlgItemText': pass
        uc.reg_write(UC_X86_REG_EAX, ret)
        n = {'HeapAlloc': 3, 'HeapFree': 3, 'GetDlgItemText': 4, 'SetDlgItemText': 3}[nm]
        r = struct.unpack('<I', uc.mem_read(esp, 4))[0]       # stdcall : l'appele depile ses args
        uc.reg_write(UC_X86_REG_ESP, esp + 4 + 4 * n)
        uc.reg_write(UC_X86_REG_EIP, r)
    mu.hook_add(UC_HOOK_CODE, hook, begin=STUB, end=STUB + 0x40)
    def hook_msg(uc, addr, sz, _):   # 0x401116 : call 0x40121c(esi=buf, msg) -> strcpy(buf,msg)
        esp = uc.reg_read(UC_X86_REG_ESP)
        st['msg'] = rd(struct.unpack('<I', uc.mem_read(esp + 4, 4))[0])   # [esp]=buf [esp+4]=msg
        uc.reg_write(UC_X86_REG_EIP, 0x40111b)
    mu.hook_add(UC_HOOK_CODE, hook_msg, begin=0x401116, end=0x401116)
    mu.reg_write(UC_X86_REG_ESP, STK + 0x8000)
    mu.reg_write(UC_X86_REG_ECX, 0x1234)
    try: mu.emu_start(0x401063, 0x401137)   # jusqu'au ret final
    except UcError as e: return f'ERR {e}'
    return st['msg']

if __name__ == '__main__':
    for s in sys.argv[2:]: print(f'{s!r:16} -> {run(sys.argv[1], s)}')
