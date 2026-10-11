#!/usr/bin/env python3
"""Exécute le vrai handler de vérification (0x401610) de spear.exe sous Unicorn.
Émulés en Python : LoadLibraryA/GetProcAddress (IsDebuggerPresent -> 0), CWnd::GetDlgItemText (0x40d4c8),
CWnd::MessageBox (0x40c445), sprintf (0x4027de, "%c") et sscanf (0x402830, "%x%c"*7) du CRT statique.
Usage: emulate_check.py spear.exe serial1 serial2 serial3 serial4 serial5"""
import sys, re, struct, pefile
from unicorn import *
from unicorn.x86_const import *
pe = pefile.PE(sys.argv[1]); fields = [s.encode() for s in sys.argv[2:7]]
img = pe.get_memory_mapped_image()
mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0x20000); mu.mem_write(0x400000, img[:0x20000])
STK, S = 0x100000, 0x300000; mu.mem_map(STK, 0x10000); mu.mem_map(S, 0x1000)
mu.mem_write(S, b'\xc2\x04\x00' + b'\x90'*5 + b'\xc2\x08\x00' + b'\x90'*5 + b'\x31\xc0\xc3' + b'\x90'*5 + b'\xc3')
mu.mem_write(0x4111d8, struct.pack('<I', S)); mu.mem_write(0x4111e0, struct.pack('<I', S+8))
END = S + 24
u32 = lambda a: struct.unpack('<I', mu.mem_read(a, 4))[0]
def cstr(a):
    s = b''
    while (c := mu.mem_read(a+len(s), 1)) != b'\0': s += c
    return s
shown = []
def hook(uc, addr, size, _):
    sp = uc.reg_read(UC_X86_REG_ESP); ret = u32(sp); a = lambda i: u32(sp+4+4*i)
    if addr == S+8:  uc.reg_write(UC_X86_REG_EAX, S+16)          # GetProcAddress -> IsDebuggerPresent factice
    elif addr == S:  uc.reg_write(UC_X86_REG_EAX, 0x77000000)    # LoadLibraryA
    elif addr == 0x40d4c8:   # GetDlgItemText(id, buf, max), thiscall
        s = fields[a(0) - 0x3e8][:a(2)-1]; uc.mem_write(a(1), s+b'\0'); uc.reg_write(UC_X86_REG_EAX, len(s))
        uc.reg_write(UC_X86_REG_ESP, sp+16); uc.reg_write(UC_X86_REG_EIP, ret)
    elif addr == 0x40c445:   # MessageBox(text, caption, type), thiscall
        shown.append(cstr(a(0)).decode()); uc.reg_write(UC_X86_REG_ESP, sp+16); uc.reg_write(UC_X86_REG_EIP, ret)
    elif addr == 0x4027de:   # sprintf(dst, "%c", v)
        uc.mem_write(a(0), bytes([a(2) & 0xff, 0])); uc.reg_write(UC_X86_REG_EAX, 1)
        uc.reg_write(UC_X86_REG_ESP, sp+4); uc.reg_write(UC_X86_REG_EIP, ret)
    elif addr == 0x402830:   # sscanf(src, "%x%c%x%c...%x", &v0, &c, &v1, ...)
        src = cstr(a(0)).decode('latin1'); n = 0; pos = 0
        for k in range(13):
            if k % 2 == 0:
                m = re.compile(r'\s*([0-9a-fA-F]+)').match(src, pos)
                if not m: break
                uc.mem_write(a(2+k), struct.pack('<I', int(m[1], 16))); pos = m.end()
            else:
                if pos >= len(src): break
                uc.mem_write(a(2+k), src[pos].encode('latin1')); pos += 1
            n += 1
        uc.reg_write(UC_X86_REG_EAX, n); uc.reg_write(UC_X86_REG_ESP, sp+4); uc.reg_write(UC_X86_REG_EIP, ret)
for h in (S, S+8, 0x40d4c8, 0x40c445, 0x4027de, 0x402830): mu.hook_add(UC_HOOK_CODE, hook, begin=h, end=h)
sp = STK + 0x8000; mu.mem_write(sp, struct.pack('<I', END))
mu.reg_write(UC_X86_REG_ESP, sp); mu.reg_write(UC_X86_REG_ECX, STK)
mu.emu_start(0x401610, END)
print('MessageBox :', shown or 'aucune'); sys.exit(0 if shown and 'correct' in shown[0] else 1)
