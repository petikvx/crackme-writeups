#!/usr/bin/env python3
"""Keygen Just a little crackme (bratalarm, crackmes.de).

MASM32 GUI. Serial 35 chars : AAAAAAAA-BBBBBBBB-CCCCCCCC-DDDDDDDD.
Nom (octets + NUL) :
  S = Σ bytes ; T = (S-1)*3
  h = 0x12345678 ; ∀b : h ^= b ; rol32(h,5)
  R = h % 0x7a69 ; Q = (h // 0x7a69) & 0xfff
Identité poly. sur ℂ (a,b)*(c,d)=(ac-bd,ad+bc) :
  (A,B)=(S,T)+(R,Q) ; (C,D)=(S,T)*(R,Q)
usage : bratalarm-solve.py [name] [--check]
"""
import struct, sys

def rol32(x, n):
    x &= 0xffffffff
    return ((x << n) | (x >> (32 - n))) & 0xffffffff

def cadd(a, b):
    return ((a[0] + b[0]) & 0xffffffff, (a[1] + b[1]) & 0xffffffff)

def cmul(a, b):
    return ((a[0]*b[0] - a[1]*b[1]) & 0xffffffff,
            (a[0]*b[1] + a[1]*b[0]) & 0xffffffff)

def name_params(name: str):
    data = name.encode("latin1") + b"\x00"
    S = sum(data) & 0xffffffff
    T = ((S - 1) * 3) & 0xffffffff
    h = 0x12345678
    for b in data:
        h ^= b
        h = rol32(h, 5)
    return (S, T), (h % 0x7a69, (h // 0x7a69) & 0xfff)

def keygen(name: str) -> str:
    st, rq = name_params(name)
    AB, CD = cadd(st, rq), cmul(st, rq)
    return f"{AB[0]:08X}-{AB[1]:08X}-{CD[0]:08X}-{CD[1]:08X}"

def verify_sample(name: str, serial: str, n: int = 100) -> bool:
    parts = serial.split("-")
    if len(serial) != 0x23 or len(parts) != 4:
        return False
    AB = (int(parts[0], 16), int(parts[1], 16))
    CD = (int(parts[2], 16), int(parts[3], 16))
    st, rq = name_params(name)
    ecx, edx = 0, 0x4e21
    for _ in range(n):
        ecx = (ecx + 3) & 0xffffffff
        edx = (edx - 2) & 0xffffffff
        z = (ecx, edx)
        if cadd(cadd(cmul(z, z), cmul(z, AB)), CD) != cmul(cadd(z, st), cadd(z, rq)):
            return False
    return True

if __name__ == "__main__":
    a = [x for x in sys.argv[1:] if not x.startswith("--")]
    name = a[0] if a else "petik"
    s = keygen(name)
    print(f"{name} -> {s}")
    if "--check" in sys.argv:
        print("sample loop OK:", verify_sample(name, s, 200))
