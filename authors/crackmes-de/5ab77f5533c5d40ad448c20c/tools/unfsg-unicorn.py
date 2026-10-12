#!/usr/bin/env python3
"""Décompresse le stub FSG 1.31 de KeygenMe068.exe par émulation Unicorn.
LoadLibraryA / GetProcAddress sont simulés (noms journalisés, adresses factices 0x7f00xxxx) ;
on s'arrête au saut vers l'OEP (première exécution dans la section 1) et on dumpe l'image
-> analysis/KeygenMe068-unfsg.bin (image mémoire brute à 0x400000) + imports résolus.
"""
import pefile, struct, sys
from unicorn import *
from unicorn.x86_const import *
src = sys.argv[1] if len(sys.argv) > 1 else 'original/KeygenMe068.exe'
out = sys.argv[2] if len(sys.argv) > 2 else 'analysis/KeygenMe068-unfsg.bin'
pe = pefile.PE(src); base = pe.OPTIONAL_HEADER.ImageBase; size = pe.OPTIONAL_HEADER.SizeOfImage
mu = Uc(UC_ARCH_X86, UC_MODE_32)
mu.mem_map(base, (size + 0xfff) & ~0xfff)
mu.mem_write(base, pe.header[:pe.OPTIONAL_HEADER.SizeOfHeaders])
for s in pe.sections:
    mu.mem_write(base + s.VirtualAddress, s.get_data()[:s.SizeOfRawData])
STK = 0x00100000; mu.mem_map(STK, 0x100000); mu.reg_write(UC_X86_REG_ESP, STK + 0xff000)
API = 0x7f000000; mu.mem_map(API, 0x100000)
mu.mem_write(API, b'\xc3' * 0x100000)
LL, GPA = API, API + 0x10
mu.mem_write(base + 0x17470, struct.pack('<I', LL)); mu.mem_write(base + 0x17474, struct.pack('<I', GPA))
names = {}; nxt = [API + 0x1000]; imports = []
def rstr(a):
    b = b''
    while True:
        c = mu.mem_read(a, 1)
        if c == b'\0': return b.decode()
        b += c; a += 1
def hook(mu, addr, size, _):
    esp = mu.reg_read(UC_X86_REG_ESP)
    if addr == LL:
        ret, p = struct.unpack('<II', mu.mem_read(esp, 8))
        dll = rstr(p); names['dll'] = dll
        mu.reg_write(UC_X86_REG_EAX, 0x7e000000 + len(imports)); mu.reg_write(UC_X86_REG_ESP, esp + 8); mu.reg_write(UC_X86_REG_EIP, ret)
    elif addr == GPA:
        ret, h, p = struct.unpack('<III', mu.mem_read(esp, 12))
        fn = rstr(p) if p > 0xffff else '#%d' % p
        a = nxt[0]; nxt[0] += 4; imports.append((names.get('dll'), fn, a))
        mu.reg_write(UC_X86_REG_EAX, a); mu.reg_write(UC_X86_REG_ESP, esp + 12); mu.reg_write(UC_X86_REG_EIP, ret)
    elif base + 0x1000 <= addr < base + 0x16000:
        print('OEP = 0x%x' % addr); mu.emu_stop()
mu.hook_add(UC_HOOK_CODE, hook)
mu.emu_start(base + pe.OPTIONAL_HEADER.AddressOfEntryPoint, 0, count=50_000_000)
open(out, 'wb').write(mu.mem_read(base, size))
for d, f, a in imports: print('0x%x  %s!%s' % (a, d, f))
