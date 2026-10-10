#!/usr/bin/env python3
"""crackme_1_easy_timers (anarchy2k3) : extrait name/serial des UnicodeString Delphi et rappelle la sequence."""
import sys, zipfile, io, struct
exe = None
if len(sys.argv) > 1:
    exe = open(sys.argv[1], 'rb').read()
def ustr(d, off):
    n = struct.unpack('<I', d[off-4:off])[0]
    return d[off:off+2*n].decode('utf-16le')
if exe:
    base = 0x46eb34 - 0x400000 - 0x1000 + 0x400  # .text RVA 0x1000 -> raw 0x400
    print('name   =', ustr(exe, base))
    print('serial =', ustr(exe, base + 0x28))
else:
    print('name   = Thom Collins')
    print('serial = 5694-5378')
print("Sequence : saisir name+serial, cliquer Check, puis .:Clear: en moins de 2 s (Timer1).")
