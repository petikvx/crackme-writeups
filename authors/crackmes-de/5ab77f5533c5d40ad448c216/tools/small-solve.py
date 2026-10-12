#!/usr/bin/env python3
"""Keygen « A small Crackme » (bswap, crackmes.de 2003).
Le nom n'est PAS saisi : c'est le nom d'utilisateur Windows (GetUserNameA au WM_INITDIALOG).
  R  = u0*u0 + u1 - u0   (FPU : fild dword signés, fistp qword)
       u0 = dword signé octets 0..3 du nom, u1 = octets 4..7 (zéro-padding)
  L  = 4 octets bas de R (little-endian)
  serial = HEX majuscule de D, avec D[0]=L[1], D[1]=L[0]^4, D[2]=L[3], D[3]=L[2]^4
usage : small-solve.py [--user petik] [-q] [--check SERIAL]
"""
import argparse, struct

def keygen(user: str) -> str:
    b = user.encode('latin-1')[:29].ljust(8, b'\0')
    u0, u1 = struct.unpack('<ii', b[:8])
    r = u0 * u0 + u1 - u0
    L = struct.pack('<q', r)[:4]
    D = bytes([L[1], L[0] ^ 4, L[3], L[2] ^ 4])
    return D.hex().upper()

def check(user: str, serial: str) -> bool:
    """Ré-implémente le check binaire (décodage hex 0x401273 + swap/xor 0x40129a + repz cmpsb 4 octets)."""
    s = serial.encode()[:11].ljust(16, b'\0')
    dec = bytearray()
    for i in range(4):
        al, ah = s[2*i] - 0x30 & 0xff, s[2*i+1] - 0x30 & 0xff
        if al > 9: al = al - 7 & 0xff
        if ah > 9: ah = ah - 7 & 0xff
        dec.append((al << 4 | ah) & 0xff)
    dec += b'\0' * 4
    out = bytearray()
    for i in range(4):
        out += bytes([dec[2*i+1] ^ 4, dec[2*i]])
    b = user.encode('latin-1')[:29].ljust(8, b'\0')
    u0, u1 = struct.unpack('<ii', b[:8])
    return bytes(out[:4]) == struct.pack('<q', u0*u0 + u1 - u0)[:4]

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--user', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check')
    a = ap.parse_args()
    if a.check:
        ok = check(a.user, a.check); print('OK' if ok else 'KO'); raise SystemExit(0 if ok else 1)
    s = keygen(a.user)
    assert check(a.user, s)
    print(s if a.q else f'{a.user} -> {s}')
