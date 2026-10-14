#!/usr/bin/env python3
"""linux_crackme_v1 (CM11) by veneta//MBE — id 5ab77f5433c5d40ad448c169.

Le binaire lit au plus 18 caractères (espaces/blancs ignorés), n'utilise que les
8 premiers (ecx=p0..p3, ebx=p4..p7), et vérifie 4 dwords du résultat de la
routine @0x8048242 contre 16 octets constants @0x8048312.
On modélise la routine en bit-vectors (z3), on impose « imprimable » et on résout.

  cm11-solve.py            # imprime un mot de passe
  cm11-solve.py --check    # + le passe au vrai binaire (analysis/cm1)
"""
import argparse, subprocess, sys
from pathlib import Path
from z3 import BitVec, BitVecVal, Solver, RotateLeft, RotateRight, LShR, Extract, Concat, ZeroExt, sat

HERE = Path(__file__).resolve().parent
BIN = HERE.parent / "analysis" / "cm1"
d = BIN.read_bytes()
INIT = [int.from_bytes(d[0x2fe + 4 * i:0x2fe + 4 * i + 4], "little") for i in range(4)]
TGT = [int.from_bytes(d[0x312 + 4 * i:0x312 + 4 * i + 4], "little") for i in range(4)]


def rcr(v, n, cf=0):               # 32 bits + CF = 33 bits
    full = Concat(BitVecVal(cf, 1), v)
    n = (n & 31) % 33
    full = LShR(full, n) | (full << (33 - n))
    return Extract(31, 0, full)


def rcl(v, n, cf=0):
    full = Concat(BitVecVal(cf, 1), v)
    n = (n & 31) % 33
    full = (full << n) | LShR(full, 33 - n)
    return Extract(31, 0, full)


def model(p):
    c = lambda x: BitVecVal(x, 32)
    ecx = ZeroExt(24, p[0]) | (ZeroExt(24, p[1]) << 8) | (ZeroExt(24, p[2]) << 16) | (ZeroExt(24, p[3]) << 24)
    ebx = ZeroExt(24, p[4]) | (ZeroExt(24, p[5]) << 8) | (ZeroExt(24, p[6]) << 16) | (ZeroExt(24, p[7]) << 24)
    eax = ZeroExt(24, p[5]) | (ZeroExt(24, p[1]) << 8) | (ZeroExt(24, p[4]) << 16) | (ZeroExt(24, p[0]) << 24)
    w0 = c(INIT[0]) ^ ((eax ^ c(0xa589ca11)) << 5)
    b = rcr(ebx, 0x13) & c(0x211333)
    w1 = c(INIT[1]) ^ b ^ c(0x87654321)
    b = (b & c(0x2f13af92)) + c(0x12623345)
    esi = RotateRight(b, 0x39 & 31)
    w2 = c(INIT[2]) ^ esi
    b = (b & c(0x2113ff98)) + c(0x5623a5ff)
    ecx = RotateLeft(ecx, 0x56 & 31)
    ecx = ecx ^ RotateRight(b, 7)
    w3 = rcl(ecx, 0x32)
    return [w0, w1, w2, w3]


def solve():
    p = [BitVec(f"p{i}", 8) for i in range(8)]
    s = Solver()
    for x in p:
        s.add(x >= 0x21, x <= 0x7e)
    for w, t in zip(model(p), TGT):
        s.add(w == t)
    if s.check() != sat:
        sys.exit("pas de solution imprimable")
    m = s.model()
    return bytes(m[x].as_long() for x in p).decode()


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = solve()
    print(pw)
    if a.check:
        out = subprocess.run([str(BIN)], input=pw + "\n", capture_output=True, text=True).stdout
        ok = "OK Cracked" in out
        bad = "BAD PASSWORD" in subprocess.run([str(BIN)], input="petik\n", capture_output=True, text=True).stdout
        print("check:", "OK" if ok and bad else "KO", "| ok:", ok, "| bad pour 'petik':", bad)
        sys.exit(0 if ok and bad else 1)


if __name__ == "__main__":
    main()
