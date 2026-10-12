#!/usr/bin/env python3
"""Générateur de codes pour crackme_nop (Opcode0x90).
Stub déchiffré (copie de 0x401027, dwords +0xb ^ 0x040740F3 et +0x65 ^ 0x79AEF578) :
    mov edx,[buf] ; 16 x { xor edx,[buf+i] ; i++ }   => edx = XOR_{i=1..15} le32(buf[i..i+3])
    cmp edx, 0x4D3E5732
Octet k de edx = XOR(b[1+k] .. b[15+k]) => contraintes :
    XOR(b1..b15) = 0x32,  b16 = b1^0x65,  b17 = b2^0x69,  b18 = b3^0x73
buf = ReadFile console (29 octets max) = code + "\\r\\n" + zéros. Code de 19 caractères => b1..b18 = code.
usage : nop-solve.py [--word petik] [-q] [--check CODE]
"""
import argparse, itertools, struct
TARGET = 0x4D3E5732
ALNUM = b'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

def edx_of(buf: bytes) -> int:
    buf = buf.ljust(0x1d + 4, b'\0'); edx = struct.unpack('<I', buf[0:4])[0]
    for i in range(16): edx ^= struct.unpack('<I', buf[i:i+4])[0]
    return edx

def solve(word: bytes):
    assert len(word) <= 11
    for b1, b2, b3 in itertools.product(ALNUM, repeat=3):
        p = bytes([b1 ^ 0x65, b2 ^ 0x69, b3 ^ 0x73])
        if not all(c in ALNUM for c in p): continue
        for fill in itertools.product(ALNUM, repeat=11 - len(word)):
            mid = bytes([b1, b2, b3]) + word + bytes(fill)          # b1..b14
            x = 0x32
            for c in mid: x ^= c
            if x in ALNUM:
                code = b'X' + mid + bytes([x]) + p                  # b0 libre ('X'), b15, b16..b18
                assert edx_of(code + b'\r\n') == TARGET
                return code.decode()

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--word', default='petik'); ap.add_argument('-q', action='store_true'); ap.add_argument('--check')
    a = ap.parse_args()
    if a.check is not None:
        ok = edx_of(a.check.encode() + b'\r\n') == TARGET; print('OK' if ok else 'KO'); raise SystemExit(not ok)
    c = solve(a.word.encode()); print(c if a.q else f'code : {c}')
