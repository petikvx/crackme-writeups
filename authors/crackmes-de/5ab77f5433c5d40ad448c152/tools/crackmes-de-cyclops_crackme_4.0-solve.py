#!/usr/bin/env python3
"""Keygen Cyclops CrackMe v4.0 : RC4(clé=nom) sur l'e-mail étendu à 32 octets, octets en décimal."""
import sys
def keygen(name: str, email: str) -> str:
    n = name.encode('latin-1'); e = email.encode('latin-1')[:32]
    S = list(range(256)); j = 0
    for i in range(256):
        j = (j + S[i] + n[i % len(n)]) & 0xff; S[i], S[j] = S[j], S[i]
    p = bytes(e[k % len(e)] for k in range(32))
    i = j = 0; out = []
    for k in range(32):
        i = (i + 1) & 0xff; j = (j + S[i]) & 0xff; S[i], S[j] = S[j], S[i]
        out.append(p[k] ^ S[(S[i] + S[j]) & 0xff])
    # bug d'origine : le 1er nombre lit out[i] avec i=32 après la boucle -> octet nul -> "0"
    return "0" + "".join(str(b) for b in out[1:])
if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    email = sys.argv[2] if len(sys.argv) > 2 else "petik@crackmes.one"
    print(keygen(name, email))
