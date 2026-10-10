#!/usr/bin/env python3
"""Keygen pour keygen_rivendel (tryger) : password de 3*len(user) octets."""
import sys

def keygen(user: bytes) -> bytes:
    n, c, out = len(user), 0, []
    for i in range(3 * n):
        u = user[i % n]
        if i < n:
            c = ((c + 0x0F) & 0xFF) ^ u
        elif i < 2 * n:
            c = ((0x12 - c) & 0xFF) ^ u
        else:
            c = (((c - 0x4C) * 2) & 0xFF) ^ u
        out.append(c)
        if i + 1 == n:
            c = (c - 10) & 0xFF
        elif i + 1 == 2 * n:
            c = (c + 0x71) & 0xFF
    return bytes(out)

if __name__ == "__main__":
    user = (sys.argv[1] if len(sys.argv) > 1 else "petik").encode()
    pw = keygen(user)
    if "--raw" in sys.argv:
        sys.stdout.buffer.write(user + b"\n" + pw + b"\n")
    else:
        print(f"user={user.decode()} password(hex)={pw.hex()}")
