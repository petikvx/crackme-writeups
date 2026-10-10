#!/usr/bin/env python3
# Keygen — k1 by xtfusion (crackmes.de). Usage : python3 crackmes-de-k1-solve.py petik
import sys
def M(x): x&=0xffffffff; return x-(1<<32) if x>>31 else x
def serial(name, t=0,u=0,v=0):
    w=0
    for c in name.encode('latin1'):
        c=c-256 if c>127 else c
        t=M(t+c*80); u=M((t+u)^0x32); v=M(v+4*u); w=M(u+v+t)
    return "%x" % (w & 0xffffffff)
for n in sys.argv[1:]: print(n, serial(n))
