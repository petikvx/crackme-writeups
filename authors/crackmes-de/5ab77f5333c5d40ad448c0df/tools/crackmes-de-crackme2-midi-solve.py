#!/usr/bin/env python3
"""crackme2 by MiDi : keygen.
Pour chaque caractère i du nom : v = (nom[i] + 0x1e) % (2*i + 2),
puis tant que v > 9 : v = (v - i) & 0xff. Le chiffre i du serial vaut v."""
import sys

def keygen(name: str) -> str:
    out = []
    for i, c in enumerate(name.encode("latin-1")):
        v = (c + 0x1e) % (2 * i + 2)
        while v > 9:
            v = (v - i) & 0xFF
        out.append(chr(0x30 + v))
    return "".join(out)

if __name__ == "__main__":
    n = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{n} -> {keygen(n)}")
