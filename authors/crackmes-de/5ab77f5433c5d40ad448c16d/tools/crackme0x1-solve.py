#!/usr/bin/env python3
"""crackme0x1 (pickled) : clé = secret[i] ^ i, secret = b'phahh`b' (.data 0x403024)."""
secret = b"phahh`b"
print("".join(chr(c ^ i) for i, c in enumerate(secret)))
