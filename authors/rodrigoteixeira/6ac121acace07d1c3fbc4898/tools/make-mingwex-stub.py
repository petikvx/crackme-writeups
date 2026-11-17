#!/usr/bin/env python3
"""Genere un libmingwex-0.dll minimal (PE32) pour lancer main.exe sous Wine.

Le crackme importe fesetenv / sqrtf / __mingw_glob de libmingwex-0.dll (absente
sous Wine). Stub : fesetenv->0, sqrtf = fld/fsqrt, __mingw_glob -> -1, DllMain -> TRUE.
Usage : make-mingwex-stub.py <dossier_sortie>   (ne jamais ecrire dans original/)
"""
import struct, sys, os

code = bytearray(0x200)
def put(off, b): code[off:off + len(b)] = b
put(0x000, bytes.fromhex('31c0c3'))                  # fesetenv: xor eax,eax ; ret
put(0x010, bytes.fromhex('d9442404d9fac3'))          # sqrtf: fld [esp+4] ; fsqrt ; ret
put(0x020, bytes.fromhex('b8ffffffffc3'))            # __mingw_glob: mov eax,-1 ; ret
put(0x030, bytes.fromhex('b801000000c20c00'))        # DllMain: mov eax,1 ; ret 12
R = 0x1000
names = [b'__mingw_glob', b'fesetenv', b'sqrtf']
funcs = [R + 0x20, R + 0x00, R + 0x10]
base = 0x40
dll_name = base + 40 + 12 + 12 + 6
nameoff = []
p = 0x100
for n in names:
    put(p, n + b'\0'); nameoff.append(p); p += len(n) + 1
put(0xE0, b'libmingwex-0.dll\0')
aof, aon, aoo = base + 40, base + 52, base + 64
put(aof, struct.pack('<3I', *funcs))
put(aon, struct.pack('<3I', *[R + o for o in nameoff]))
put(aoo, struct.pack('<3H', 0, 1, 2))
put(base, struct.pack('<IIHHIIIIIII', 0, 0, 0, 0, R + 0xE0, 1, 3, 3, R + aof, R + aon, R + aoo))

opt = struct.pack('<HBBIIIIIIIIIHHHHHHIIIIHHIIIIII',
    0x10b, 6, 0, 0x200, 0, 0, R + 0x30, R, R, 0x10000000, 0x1000, 0x200,
    4, 0, 0, 0, 4, 0, 0, 0x2000, 0x200, 0, 3, 0, 0x100000, 0x1000, 0x100000, 0x1000, 0, 16)
opt += struct.pack('<2I', R + base, 0x40) + bytes(8 * 15)
coff = struct.pack('<HHIIIHH', 0x14c, 1, 0, 0, 0, len(opt), 0x2102)
sec = struct.pack('<8sIIIIIIHHI', b'.text', 0x200, R, 0x200, 0x200, 0, 0, 0, 0, 0xE0000060)
dos = bytearray(0x40); dos[:2] = b'MZ'; dos[0x3c:0x40] = struct.pack('<I', 0x40)
img = bytes(dos) + b'PE\0\0' + coff + opt + sec
img = img.ljust(0x200, b'\0') + bytes(code)
out = os.path.join(sys.argv[1], 'libmingwex-0.dll')
open(out, 'wb').write(img)
print(out, len(img))
