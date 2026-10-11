#!/usr/bin/env python3
# Keygen libertyordeaths_asm_keygenme1 (crackmes.de) — usage : solve.py <nom>
import sys
def keygen(name):
    b=name.encode('latin-1'); esi=0; edx=10; edi=0
    for i,c in enumerate(b):
        c=c-256 if c>127 else c
        esi=(esi+c+1+edx)&0xffffffff
        edx=(edx*(i+1))&0xffffffff
        edi=(edx*esi)&0xffffffff
    return "LOD-%u-%X"%(esi,edi)
print(keygen(sys.argv[1] if len(sys.argv)>1 else "petik"))
