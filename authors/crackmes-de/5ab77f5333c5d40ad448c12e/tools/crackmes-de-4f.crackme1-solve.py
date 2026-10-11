#!/usr/bin/env python3
"""Keygen X[!]M.4F CrackMe #1 (crackmes.de / ximus) — sub_401000(name, serial).

name : >= 3 caractères ; serial : 11 caractères "ABCDE-HHHHH"
  d2 = name[0] % 10, d3 = name[1] % 10, d4 = name[2] % 10
  d1 = (d2*d3*d4) % 10, d0 = (d1+d2+d3) % 10
  H  = "%X" % ((sum(name) * 0xFEAD) & 0xFFFFF)  (5 premiers caractères comparés)

Usage : solve.py [NAME]            (défaut : petik)
        solve.py --check NAME SERIAL
"""
import sys

def keygen(name: str) -> str:
    b = name.encode('latin-1')
    assert len(b) >= 3
    d2, d3, d4 = (b[0] % 10, b[1] % 10, b[2] % 10)   # movsx + idiv : name ASCII => positif
    d1 = (d2 * d3 * d4) % 10
    d0 = (d1 + d2 + d3) % 10
    h = '%X' % ((sum(b) * 0xFEAD) & 0xFFFFF)
    return f'{d0}{d1}{d2}{d3}{d4}-{h[:5]}'

def check(name: str, serial: str) -> bool:
    b, s = name.encode('latin-1'), serial.encode('latin-1')
    if len(b) < 3 or len(s) != 11 or s[5] != 0x2D: return False
    d = [(c - 0x30) & 0xFF for c in s[:5]]
    d = [x - 256 if x > 127 else x for x in d]
    if (d[1] + d[2] + d[3]) % 10 != d[0] or (d[2] * d[3] * d[4]) % 10 != d[1]: return False
    if [b[0] % 10, b[1] % 10, b[2] % 10] != d[2:5]: return False
    h = ('%X' % ((sum(b) * 0xFEAD) & 0xFFFFF)).encode() + b'\0'
    return all(h[i] == s[6 + i] for i in range(5))

if __name__ == '__main__':
    if len(sys.argv) > 3 and sys.argv[1] == '--check':
        ok = check(sys.argv[2], sys.argv[3]); print('OK' if ok else 'KO'); sys.exit(0 if ok else 1)
    n = sys.argv[1] if len(sys.argv) > 1 else 'petik'
    s = keygen(n); assert check(n, s); print(f'{n} / {s}')
