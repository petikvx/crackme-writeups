#!/usr/bin/env python3
# Keygen libertyordeaths_linux_keygenme_1 (crackmes.de) — usage : solve.py <nom>
import sys
def s32(x): x&=0xffffffff; return x-(1<<32) if x>>31 else x
def keygen(name):
    v=0
    for i,c in enumerate(name.encode('latin-1')):
        v=s32(2*c*i); v=s32(v*v)
    return s32(v*50)
print(keygen(sys.argv[1] if len(sys.argv)>1 else "petik"))
