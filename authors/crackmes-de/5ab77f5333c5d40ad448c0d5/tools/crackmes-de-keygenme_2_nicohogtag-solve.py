#!/usr/bin/env python3
# Keygen — keygenme_2_by_nicohogtag (crackmes.de). Usage : python3 crackmes-de-keygenme_2_nicohogtag-solve.py petikpetik
# Le nom doit faire 9 ou 10 caractères : la boucle lit 10 octets à partir d’un buffer de 8 (cf. README).
import sys
def M(x): x&=0xffffffff; return x-(1<<32) if x>>31 else x
def serial(name):
    b=name.encode()[:10]
    assert len(b)>=9
    b=(b+b'\0')[:10]
    s=0; a=0x80899; m=7
    for c in b:
        c=c-256 if c>127 else c
        s=M(s+c); a=M(a+s)
    m=M(m*M(a+s))
    h=int(a/2)  # sar with rounding toward zero
    m=M(m*M(m-s+h*13))
    return abs(m) if m!=-2**31 else m
for n in sys.argv[1:]: print(n, serial(n))
