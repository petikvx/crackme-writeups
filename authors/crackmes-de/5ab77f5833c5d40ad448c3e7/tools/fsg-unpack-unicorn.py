#!/usr/bin/env python3
"""Unpack FSG 2.0 de UTW KGMv3 sous Unicorn (sans exécuter le PE).

  python3 tools/fsg-unpack-unicorn.py "UTW KGMv3.exe" analysis/kgmv3-unpacked-dump.bin

Layout : section 2 (RVA 0xa000, raw 0x200, 0x2b8d octets) = données packées ;
EP = 0x400154 (stub FSG dans l'en-tête) ; OEP = 0x401470 (VB6 : push VBHeader / call ThunRTMain).
Le stub appelle [ebx+0x10]=LoadLibraryA et [ebx+0x14]=GetProcAddress : on les remplace par
des adresses factices (hook) qui renvoient des thunks `ret` ; on s'arrête à l'OEP.
Sortie = image 0x400000..0x40d000 brute (IAT remplie de thunks factices).
"""
import struct, sys
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EAX, UC_X86_REG_EIP, UC_X86_REG_EBX

data = open(sys.argv[1], 'rb').read()
out = sys.argv[2]
OEP = 0x401470
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(0x400000, 0xd000)
mu.mem_write(0x400000, data[:0x200])
mu.mem_write(0x40a000, data[0x200:0x200 + 0x2b8d])
mu.mem_map(0x100000, 0x100000)
mu.mem_map(0x70000000, 0x10000)
mu.reg_write(UC_X86_REG_ESP, 0x1f0000)
fake = {0x70000000: 'LL', 0x70000100: 'GPA'}
nxt = [0x70001000]
state = {'dll': '', 'init': False}

def rd(a):
    return struct.unpack('<I', bytes(mu.mem_read(a, 4)))[0]

def cs(a):
    if a < 0x10000:
        return 'ord%d' % a
    return bytes(mu.mem_read(a, 40)).split(b'\0')[0].decode(errors='replace')

def api(uc, a, s, ud):
    if a in fake:
        esp = uc.reg_read(UC_X86_REG_ESP)
        ret = rd(esp)
        if fake[a] == 'LL':
            state['dll'] = cs(rd(esp + 4)); r = 0x71000000; n = 1
        else:
            r = nxt[0]; nxt[0] += 16
            fake[r] = state['dll'] + '!' + cs(rd(esp + 8))
            mu.mem_write(r, b'\xc3'); n = 2
        uc.reg_write(UC_X86_REG_EAX, r)
        uc.reg_write(UC_X86_REG_ESP, esp + 4 + 4 * n)
        uc.reg_write(UC_X86_REG_EIP, ret)

def stub(uc, a, s, ud):
    if a == OEP:
        print('OEP atteint', hex(a)); uc.emu_stop()
    if a == 0x400160 and not state['init']:      # ebx = table de pointeurs du stub
        state['init'] = True
        ebx = uc.reg_read(UC_X86_REG_EBX)
        uc.mem_write(ebx + 0x10, struct.pack('<I', 0x70000000))   # LoadLibraryA
        uc.mem_write(ebx + 0x14, struct.pack('<I', 0x70000100))   # GetProcAddress

mu.hook_add(UC_HOOK_CODE, api, begin=0x70000000, end=0x70002000)
mu.hook_add(UC_HOOK_CODE, stub, begin=0x400000, end=0x410000)
mu.emu_start(0x400154, 0, count=80000000)
open(out, 'wb').write(bytes(mu.mem_read(0x400000, 0xd000)))
print('IAT :', sum(1 for a in range(0x401000, 0x40d000, 4) if isinstance(fake.get(rd(a)), str) and '!' in fake[rd(a)]), 'imports MSVBVM60')
