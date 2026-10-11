#!/usr/bin/env python3
"""Keygen Breaker's Crackme #4 (brk12345 / crackmes.de).
A(s) = base64(MD5(UTF-16LE(s))), B(s) = A(s)*3
h1=A(nom); x1=A(h1)+B(nom); b2=A(B(x1)); serial=B(A(B(A(b2+x1+h1))))"""
import base64, hashlib, sys
def A(s): return base64.b64encode(hashlib.md5(s.encode("utf-16-le")).digest()).decode()
def B(s): return A(s) * 3
def keygen(name):
    h1 = A(name); x1 = A(h1) + B(name); b2 = A(B(x1))
    return B(A(B(A(b2 + x1 + h1))))
if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} -> {keygen(name)}")
