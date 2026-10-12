#!/usr/bin/env python3
"""KeygenMe 0.72 (Bswap) — keymaker.
La clé est lue dans le registre : HKCU\\Software\\Keygeme072\\Your Key
  "Key 1" (REG_DWORD) = K1 (libre ; ici dérivé du nom), "Key 2" (REG_DWORD) = f(K1), "Name" (REG_SZ).
f = boucle 0x40138f..0x4013a8 (xadd / shrd dx,ax,4 / inc dl / xor dl,dh) sur les 4 octets de K1.
usage : keygenme072-solve.py [nom] [--reg]   (--reg : écrit un .reg importable par regedit / wine regedit)
"""
import sys, struct

def f(k1: int) -> int:
    b = struct.pack('<I', k1)
    ecx, dx, out = 9, 0, bytearray(4)
    for i in range(4):
        eax = b[i] - 256 if b[i] >= 0x80 else b[i]          # movsx
        eax, ecx = ecx, (ecx + eax) & 0xffffffff               # xadd ecx, eax
        ecx = (ecx + i) & 0xffffffff                           # add ecx, ebx
        dx = ((dx >> 4) | ((eax & 0xf) << 12)) & 0xffff        # shrd dx, ax, 4
        dl, dh = ((dx & 0xff) + 1) & 0xff, dx >> 8             # inc dl
        dl ^= dh                                               # xor dl, dh
        dx = (dh << 8) | dl
        out[i] = dl
    return struct.unpack('<I', bytes(out))[0]

def key_for(name: str):
    k1 = struct.unpack('<I', (name.encode('latin-1') + b'\0' * 4)[:4])[0]  # 4 premiers car. du nom
    return k1, f(k1)

if __name__ == '__main__':
    args = [a for a in sys.argv[1:] if a != '--reg']
    name = args[0] if args else 'petik'
    k1, k2 = key_for(name)
    print(f'Name  = {name}\nKey 1 = 0x{k1:08X}\nKey 2 = 0x{k2:08X}')
    if '--reg' in sys.argv:
        print('\nREGEDIT4\n\n[HKEY_CURRENT_USER\\Software\\Keygeme072\\Your Key]\n'
              f'"Key 1"=dword:{k1:08x}\n"Key 2"=dword:{k2:08x}\n"Name"="{name}"\n')
