#!/usr/bin/env python3
"""Keygen keygenme_1 by cobrasniper555 (crackmes.one 5ab77f5633c5d40ad448c289)."""
import sys

M = 0xFFFFFFFF

def s8(c):
    return c - 256 if c >= 128 else c

def serial(name: str) -> str:
    name = name.lower()                     # Edit nom créé avec ES_LOWERCASE
    b = name.encode('latin-1')[:29]         # GetDlgItemTextA(..., 30)
    if not 5 <= len(b) <= 30:
        raise ValueError("le nom doit faire entre 5 et 30 caractères")
    s = 0x87654321
    for ch in b:                            # serial -= (c*66) * (c^5)
        c = s8(ch)
        s = (s - (c * 66) * (c ^ 5)) & M
    fp = "%X" % s
    c0 = s8(b[0])
    s = (s * (((c0 * 0x28A) ^ 0xC) & M)) & M   # *= ((name[0]*65)*10) ^ 12
    sp = "%X" % s
    return "%s-%s-%s" % (chr(b[0]), fp, sp)

if __name__ == "__main__":
    a = sys.argv[1:]
    if len(a) == 3 and a[0] == "--check":
        ok = serial(a[1]) == a[2]
        print("OK" if ok else f"KO (attendu {serial(a[1])})")
        sys.exit(0 if ok else 1)
    for nm in (a or ["petik"]):
        print(f"{nm.lower()} -> {serial(nm)}")
