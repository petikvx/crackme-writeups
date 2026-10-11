#!/usr/bin/env python3
"""FireWorx Crackme13 — serial = IntToStr(f(ebx)) pour un ebx ∈ [2, len(serial)].

f ne dépend pas du nom (Edit2 ignoré). Exemple : 1774248000 (ebx=4).
"""

def f(ebx: int) -> int:
    eax = (ebx << 12) & 0xffffffff
    eax = (eax + ebx * ebx) & 0xffffffff
    edx = (eax - 0x3021 + 0x1C44A9A4 + (eax * eax & 0xffffffff)) & 0xffffffff
    ecx = (eax + 0x29D8) & 0xffffffff
    edi = (eax * edx * 0x12499) & 0xffffffff
    ecx = (ecx - edi) & 0xffffffff
    edi = (ecx * eax * 0x12499 * 0x58 + 2) & 0xffffffff
    edi ^= 0xA
    edi = (edi + ecx) & 0xffffffff
    if edi >= 0x80000000:
        edi -= 0x100000000
    return edi


def serials():
    out = []
    for ebx in range(2, 32):
        s = str(f(ebx))
        if 2 <= ebx <= len(s):
            out.append((ebx, s))
    return out


if __name__ == "__main__":
    for ebx, s in serials():
        print(f"ebx={ebx}: {s}")
    print("exemple:", "1774248000")
