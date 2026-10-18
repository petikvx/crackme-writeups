#!/usr/bin/env python3
"""AegisShield (rqueww) : inverse le hash 64 bits (mini-VM de 71 instr.) via z3.

Usage : hash-inverse-z3.py (échec : z3 ne converge pas) [-q] [--check MOT]   (pas de user : mot de passe unique)
"""
import argparse, importlib.util, os, sys
import z3

M = (1 << 64) - 1
TARGET = 0x2A8FADFD62AD902E
KEY = [0x243F6A8885A308D3, 0x13198A2E03707344, 0xA4093822299F31D0, 0x082EFA98EC4E6C89]
A, B = 0x5851F42D4C957F2D, 0x14057B7EF767814F

here = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location('recon', os.path.join(here, 'recon-vm.py'))
sys.argv, _a = [sys.argv[0]], sys.argv
recon = importlib.util.module_from_spec(spec); spec.loader.exec_module(recon)
sys.argv = _a
CODE = recon.code

def V(x): return z3.BitVecVal(x, 64) if isinstance(x, int) else x
def rol(x, n):
    n %= 64
    return z3.RotateLeft(V(x), n) if n else V(x)
def lcg(x): return V(x) * A + B

def chash(chunks, size):
    """chunks : liste de qwords (int ou BitVec) ; reproduit sub_140007FE0."""
    v8 = (0x9E3779B97F4A7C15 * size & M) ^ 0xDDEBA5ECAFEF00D
    slots = [V(0)] * 4
    for i, c in enumerate(chunks):
        if i < 4:
            slots[i] = V(c)
        else:
            k = i & 3; x = V(c); y = rol(x, 17); a = slots[k]
            s = (y ^ a) + 2 * (a & y)
            slots[k] = ~(s ^ a) - 2 * (s & x & a)
    s = V(v8)
    r = []
    for sl in slots:
        if isinstance(sl, int) or z3.is_bv_value(sl) and sl.as_long() == 0:
            s = lcg(s); r.append(s)
        else:
            r.append(sl)
    reg = r + [V(0)] * 4
    for q in CODE:
        op, d, sr, imm = q >> 56, (q >> 48) & 0xff, (q >> 40) & 0xff, q & 0xffffffffff
        if op == 1: reg[d] = V(KEY[imm & 3])
        elif op == 2: reg[d] = reg[d] + reg[sr]
        elif op == 3: reg[d] = reg[d] + imm
        elif op == 4: reg[d] = reg[d] ^ reg[sr]
        elif op == 5: reg[d] = reg[d] * reg[sr]
        elif op == 6: reg[d] = reg[d] * imm
        elif op == 8: reg[d] = rol(reg[d], imm & 63)
        elif op == 9: reg[d] = lcg(reg[d])
        elif op == 10: reg[d] = reg[d] + reg[sr]
        elif op == 11: reg[d] = reg[d] - reg[sr]
        elif op == 12: break
        else: raise ValueError(op)
    v = lcg(reg[0] ^ rol(reg[1], 32) ^ rol(reg[2], 16) ^ rol(reg[3], 48))
    for _ in range(2):
        v = lcg(v ^ rol(v, 17))
    return v ^ rol(v, 17)

def chunks_of(b):
    return [int.from_bytes(b[i:i + 8].ljust(8, b'\0'), 'little') for i in range(0, len(b), 8)]

def check(pw):
    v = chash(chunks_of(pw.encode()), len(pw))
    return z3.simplify(v).as_long() == TARGET

def solve(n):
    s = z3.Solver()
    bs = [z3.BitVec(f'b{i}', 8) for i in range(n)]
    for b in bs: s.add(b >= 0x20, b < 0x7f)
    ch = []
    for i in range(0, n, 8):
        part = bs[i:i + 8]
        q = z3.Concat(*reversed(part)) if len(part) > 1 else part[0]
        ch.append(z3.ZeroExt(64 - 8 * len(part), q))
    s.add(chash(ch, n) == TARGET)
    if s.check() == z3.sat:
        m = s.model()
        return bytes(m[b].as_long() for b in bs).decode()

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true'); ap.add_argument('--check')
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check); print('OK' if ok else 'KO'); sys.exit(not ok)
    for n in range(1, 17):
        pw = solve(n)
        if pw:
            print(pw if a.q else f'len={n} password={pw!r}'); break
