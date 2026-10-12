#!/usr/bin/env python3
"""sams_keygenme (samfisher9000, crackme3.exe VB6) — keygen, reproduit cmdcheck_Click.
Nom : 5 à 15 caractères. usage : sams-keygenme-solve.py [nom]
"""
import sys

def windows3(n: int) -> str:
    s = str(n)                                   # CStr(Long)
    return '-'.join(s[j:j+3] for j in range(3))  # Mid(s, j, 3), j = 1..3

def serial(name: str) -> str:
    assert 5 <= len(name) <= 15
    P = 0
    for ch in name:
        v = ord(ch) - 0x0B
        if v > 0x5A: v = v + 12 - 6 + 16         # +22
        if v < 0x5A: v = v + 46 - 10 + 7         # +43
        if v > 0x96: v = v - 23 + 4 - 16         # -35
        P = P * (v // 50) if P != 0 else v       # P = P * Int(v / 50)
    if P < 20000:
        P = round(P / 10.0 * P)                  # __vbaFpI4 (arrondi au pair)
    Q = round((5 * v) * P / 15)                  # CLng(Int(5*v) * P / 15), v = dernier caractère
    a, b = windows3(P), windows3(Q)
    return f"{a}-{len(a)}-{b}-{len(b)}"

if __name__ == '__main__':
    print(serial(sys.argv[1] if len(sys.argv) > 1 else 'petik'))
