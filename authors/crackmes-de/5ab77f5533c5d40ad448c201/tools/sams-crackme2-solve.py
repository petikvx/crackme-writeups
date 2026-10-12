#!/usr/bin/env python3
"""sams_crackme2 (samfisher9000) — keygen, reproduit Button1Click (0x45395c).
usage : sams-crackme2-solve.py [nom]
"""
import sys

def serial(name: str) -> str:
    esi = acc = 0
    for c in name.encode('latin-1'):
        v = c
        if v < 0x6e: v += 0x0b
        if v > 0x6e: v -= 0x0d
        if v == 0x6e: v += 0x14
        v += 0x0b
        esi += v
        acc += esi - 0x3f
    t = str(acc + esi)                       # IntToStr(acc + esi)
    u = ''.join(str(b) for b in t.encode())  # 0x4538c8 : codes ASCII décimaux concaténés
    s = ''
    for i in range(len(t)):                  # boucle sur Length(t), morceaux Copy(u, i+1, 4)
        s = s + '-' + u[i:i+4]
    return str(len(s)) + '13' + s           # LStrCatN(IntToStr(Length(s)), IntToStr(13), s)

if __name__ == '__main__':
    print(serial(sys.argv[1] if len(sys.argv) > 1 else 'petik'))
