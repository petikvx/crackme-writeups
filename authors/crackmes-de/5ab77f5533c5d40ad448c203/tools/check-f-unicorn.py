#!/usr/bin/env python3
"""Compare f() du keymaker au vrai code 0x401378..0x4013aa du dump (analysis/KeygenMe072-unfsg.bin) sous Unicorn."""
import struct, random, os, sys
from unicorn import *
here = os.path.dirname(os.path.abspath(__file__))
img = open(os.path.join(here, '../analysis/KeygenMe072-unfsg.bin'), 'rb').read()
ns = {}; exec(open(os.path.join(here, 'keygenme072-solve.py')).read().split("if __name__")[0], ns)
f, key_for = ns['f'], ns['key_for']
ks = [key_for(sys.argv[1] if len(sys.argv) > 1 else 'petik')[0]] + [random.getrandbits(32) for _ in range(200)]
for k1 in ks:
    mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0xd000); mu.mem_write(0x400000, img)
    mu.mem_write(0x4032e0, struct.pack('<I', k1)); mu.emu_start(0x401378, 0x4013aa)
    got = struct.unpack('<I', mu.mem_read(0x40330b, 4))[0]
    assert got == f(k1), (hex(k1), hex(got), hex(f(k1)))
print(f'OK : unicorn == python sur {len(ks)} valeurs de K1')
