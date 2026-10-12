#!/usr/bin/env python3
"""crackme_1.0_by_c0de0f — keygen.
Check : Decrypt(serial) == name, avec
  Decrypt(s) : clés = Asc(s[1]), Asc(s[2]), Asc(s[3]), Asc(s[-1]) ; corps = s[4:-1] ;
               car. i -> Chr(Asc(c) - clé[(i-1) mod 4]).
On choisit les 4 clés égales (k = 64, '@') : l'ordre exact des clés n'a plus d'importance
et tous les caractères tombent dans 0xA0..0xFF (Latin-1 = cp1252, tapables).
usage : c0de0f-crackme-1-solve.py [nom] [--key N]
"""
import sys
args=[a for a in sys.argv[1:]]
k=64
if '--key' in args:
    i=args.index('--key'); k=int(args[i+1]); del args[i:i+2]
name=args[0] if args else 'petik'
body=''.join(chr(ord(c)+k) for c in name)
assert all(ord(ch)<256 for ch in body), 'clé trop grande pour ce nom'
print(chr(k)*3 + body + chr(k))
