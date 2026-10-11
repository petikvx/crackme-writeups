#!/usr/bin/env python3
"""Keygen NTS Crackme10 (Cyclops) : serial = "%08X" % h(name), key anti-debug = 0."""
import sys
M=0xffffffff
def serial(name, key=0):
    h=0
    for i,ch in enumerate(name.encode('latin-1')):
        c=ch-256 if ch>127 else ch
        b=(((c^0xc0c0c0c0)-key+h)*i*2)&M
        h=b^((c*5)&M)
        h=(h<<(c&31))&M if c>=0 else (h<<(((c&0x8000001f)-1|0xffffffe0)+1&31))&M
        h^=0xbaddc001
    return "%08X"%h
if __name__=="__main__":
    n=sys.argv[1] if len(sys.argv)>1 else "petik!"
    print(n, serial(n))
