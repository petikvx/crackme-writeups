#!/usr/bin/env python3
"""serialkeygen_me (br0ken) — générateur de mots de passe.
Conditions (main @ 0x401290) :
  n = strlen(pwd) ; n^3 - 5n^2 - 6n - 56 == 0  ->  n = 7
  S = somme_{i=0..5} (3*c_i - 40) * c_i  ;  S % 10 == 0   (c_6 libre)"""
import sys, string

def ok(p):
    n = len(p)
    if n**3 - 5*n*n - 6*n - 56 != 0:
        return False
    return sum((3*ord(c) - 40) * ord(c) for c in p[:6]) % 10 == 0

def gen(base="petik"):
    base = (base + "xxxxxxx")[:5]
    for c in string.ascii_lowercase + string.digits:
        p = base + c + "!"
        if ok(p):
            return p

if __name__ == "__main__":
    p = gen(sys.argv[1] if len(sys.argv) > 1 else "petik")
    assert ok(p)
    print(p)
