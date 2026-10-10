#!/usr/bin/env python3
"""crackme by honestgamer (.NET) — keygen de Keygen.Generate()."""
import sys

def keygen(uid: int) -> int:
    if not 0 < uid < 10000:
        raise ValueError("User ID dans ]0, 10000[")
    v = uid * 786 * 17            # int32, max 133 M : pas de débordement
    return v // 12 + 1991         # division entière C# (positif)

if __name__ == "__main__":
    for a in sys.argv[1:] or ["1234"]:
        print(f"User ID {a} -> Code {keygen(int(a))}")
