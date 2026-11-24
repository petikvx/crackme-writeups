#!/usr/bin/env python3
"""Coder_90 CrackMe4 keygen : name -> serial.  Exemple : petik"""
import argparse

def h(s: bytes, seed: int) -> int:
    m = 0xFFFFFFFF
    b = 0x97829737
    for c in s:
        b ^= c
        b = (b * 0x5BD1E995) & m
        b = ((b << 5) | (b >> 27)) & m
        b ^= seed
    return b

def serial(name: str) -> str:
    n = name.encode('latin-1')
    esi = h(n, 0x55AA55AA)
    edi = h(n, esi)
    return f"{esi:08X}-{edi:08X}"

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('-q', action='store_true')
    a = ap.parse_args()
    s = serial(a.name)
    print(s if a.q else f"{a.name} -> {s}")
