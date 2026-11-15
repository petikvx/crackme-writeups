#!/usr/bin/env python3
"""Désassemble la mini-VM de vmcrack (binaire unpacké analysis/vmcrack.unpacked.exe)."""
import struct, sys
M = 0xffffffff
def km(x):
    x &= M; x ^= x >> 16
    x = x * 0x85ebca6b & M; x ^= x >> 13
    x = x * 0xc2b2ae35 & M; return x ^ (x >> 16)
NAMES = {0:'LOADB r{a}, in[{b}]',1:'SHL r{a}, {i}',2:'SHR r{a}, {i}',3:'XOR r{a}, {i:#x}',4:'MUL r{a}, {i:#x}',
 5:'XOR r{a}, r{b}',6:'MOV r{a}, r{b}',7:'CMP r{a}, {i:#x}',8:'JZ {i}',9:'WIN',10:'FAIL',11:'CMP r{a}, r{b}',12:'LDK r{a}, {i:#x}'}
def load(path):
    d = open(path, 'rb').read()
    rd = lambda va, n: d[va - 0x140009000 + 0x7600:][:n]
    N = (0x140009580 - 0x140009060) // 4
    return [struct.unpack('<I', rd(0x140009580 + 4*i, 4))[0] for i in range(N)], \
           [struct.unpack('<I', rd(0x140009060 + 4*i, 4))[0] for i in range(N)]
def decode(prog, keys):
    seed = km(0xc0ffee); out = []
    for pc in range(len(prog)):
        ks = km((pc * 0x9e3779b9 + 0x1234567 & M) ^ seed)
        w = prog[pc] ^ ks; imm = (ks ^ keys[pc] ^ 0xa5a5a5a5) & M
        op, e, c = w >> 24, (w >> 16) & 0xff, (w >> 8) & 0xff   # e=edi(rdi) c=ebp
        if op == 12: imm = km(((imm * 0x9e3779b9 + 0x7a7a7a7a) & M) ^ seed)
        out.append((op, e, c, imm, w))
    return out
if __name__ == '__main__':
    p, k = load(sys.argv[1])
    for pc, (op, e, c, imm, w) in enumerate(decode(p, k)):
        if op > 12: print(pc, 'invalid', hex(w)); break
        print(pc, NAMES[op].format(a=e, b=c, i=imm))
