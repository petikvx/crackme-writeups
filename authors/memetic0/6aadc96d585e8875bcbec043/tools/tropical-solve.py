#!/usr/bin/env python3
"""Solveur / keygen — memetic0's Tropical

Matrice 6×6 plantée (tropical min-plus) → λ=3, x=(0,2,5,1,4,3) avec x₀=0.
Le serial 16 hex est l’antécédent du mix anti-tamper qui produit λ et les
MAC dérivés de hash(field).

Usage:
  python3 tools/tropical-solve.py -q
  python3 tools/tropical-solve.py --check
"""
from __future__ import annotations

import argparse
import fcntl
import os
import pty
import re
import select
import struct
import subprocess
import sys
import termios
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "tropical"

MASK64 = (1 << 64) - 1
MASK32 = (1 << 32) - 1

# byte_9660[36] + unk_9688 (rodata)
FIELD = bytes(
    [
        140, 160, 178, 61, 212, 164,
        164, 157, 129, 240, 69, 161,
        68, 250, 183, 20, 57, 90,
        247, 226, 227, 242, 36, 26,
        48, 1, 32, 11, 168, 130,
        127, 206, 201, 18, 207, 88,
    ]
)
UNK9688 = int.from_bytes(bytes.fromhex("5cdb33242132e297"), "little")

# FA0 = C660[i]^C640 après sub_6C90 (run clean). Figé dans analysis/live_fa0.txt.
FA0 = [
    int(x, 16)
    for x in (ROOT / "analysis" / "live_fa0.txt").read_text().splitlines()
    if x.strip()
]

SERIAL = "5242b75304439277"  # unique for this planted field


def rol64(x: int, n: int) -> int:
    n &= 63
    x &= MASK64
    return ((x << n) | (x >> (64 - n))) & MASK64


def rol32(x: int, n: int) -> int:
    n &= 31
    x &= MASK32
    return ((x << n) | (x >> (32 - n))) & MASK32


def hash36() -> int:
    v = 0x8B8B8B8B591D0D0D
    for i in range(36):
        v = (rol64(v ^ FIELD[i], 13) + (i ^ 0xC2B2AE3D27D4EB4F)) & MASK64
    return v


def sub_54B0() -> int:
    return hash36()


def sub_5530() -> int:
    return hash36() ^ UNK9688


def sub_5560(i: int, j: int) -> int:
    idx = j + 6 * i
    v8 = FIELD[idx]
    seed = sub_5530() & 0xFFFFFFFF
    eax = (idx * 0x7F4A7C15) & 0xFFFFFFFF
    eax ^= seed
    eax ^= eax >> 14
    eax = (eax * 0xA24BAED1) & 0xFFFFFFFF
    eax ^= eax >> 12
    eax = (eax * 0x165667B1) & 0xFFFFFFFF
    eax ^= eax >> 16
    return v8 ^ (eax & 0xFF)


def cell_weight(v: int) -> int:
    a, b, c = v % 17, v % 19, v % 23
    return (323 * c + 4370 * a + 2737 * b) % 7429


def planted_matrix() -> list[list[int]]:
    return [[cell_weight(sub_5560(i, j)) for j in range(6)] for i in range(6)]


def tropical_eigen(A: list[list[int]]) -> tuple[int, tuple[int, ...]]:
    """Unique (λ, x) with x[0]=0, x[i]∈[0,15], min-plus eigen on edges Aij≤89."""
    import itertools

    n = 6
    INF = 10**9

    def ok(lam: int, x: tuple[int, ...]) -> bool:
        for i in range(n):
            best = INF
            for j in range(n):
                if A[i][j] <= 89:
                    best = min(best, A[i][j] + x[j])
            if best != lam + x[i]:
                return False
        return True

    for lam in range(1, 40):
        for rest in itertools.product(range(16), repeat=5):
            x = (0,) + rest
            if ok(lam, x):
                return lam, x
    raise RuntimeError("no tropical eigen")


def target_v28(lam: int) -> int:
    H = sub_54B0()
    mid = ((H >> 17) ^ (H ^ ((lam * -23101) & MASK64))) & 0xFFFF
    right = ((H << 16) & MASK64) >> 24
    low24 = lam | (mid << 8)
    return (low24 | (right << 24)) & MASK64


def phase1_state() -> tuple[int, int]:
    rbx = sub_54B0()
    r14 = sub_5530()
    for i in range(32):
        rax = FA0[i]
        rbx = (rbx + rax) & MASK64
        rbx = rol64(rbx, 11) ^ r14
        r14 = (rol64(r14, 21) + rbx) & MASK64
    rbx ^= 0
    r8 = rol64(0, 11) ^ r14
    return rbx, r8


def r9_at_edx(edx: int, r8: int) -> int:
    r9 = (11 * (r8 & MASK32)) & MASK32
    for _ in range(11, edx, -1):
        r9 = (r9 - (r8 & MASK32)) & MASK32
    return r9


def inv_r13(edx: int, ebp: int, eax_out: int, rbx: int, r8: int) -> int:
    r9 = r9_at_edx(edx, r8)
    rax = rbx >> ((3 * edx) & 0x38)
    rsi = r8 >> ((17 * edx) & 0x38)
    edi = rol32(r8 & MASK32, (rsi & 0xF) + edx)
    edi ^= (ebp ^ (rbx & MASK32)) & MASK32
    ecx = ((ebp >> 16) ^ edx ^ (rax & 0xFF) ^ (rsi & 0xFF)) & 0x1F
    if ecx == 0:
        ecx = 1
    a = ((rax & 0xFF) * 0x1010101) & MASK32
    edi = rol32(edi, ecx)
    a ^= ((rsi & 0xFF) << (edx & 31)) & MASK32
    edi = (edi + a) & MASK32
    t = (rol32(edi, 13) + r9) & MASK32
    return (eax_out ^ t ^ edi) & MASK32


def invert_serial(lam: int) -> str:
    target = target_v28(lam)
    H = sub_54B0()
    rbp = H ^ target
    ebp_in = (rbp >> 32) & MASK32
    eax_out = rbp & MASK32
    rbx, r8 = phase1_state()
    r13_in = inv_r13(0, ebp_in, eax_out, rbx, r8)
    for edx in range(11):
        eax_prev = ebp_in
        ebp_prev = r13_in
        r13_prev = inv_r13(edx + 1, ebp_prev, eax_prev, rbx, r8)
        ebp_in, eax_out, r13_in = ebp_prev, eax_prev, r13_prev
    v4, v7 = r13_in, ebp_in

    def unpack(v: int) -> str:
        return "".join(f"{(v >> (4 * (7 - i))) & 0xF:x}" for i in range(8))

    return unpack(v4) + unpack(v7)


def generate() -> str:
    A = planted_matrix()
    lam, x = tropical_eigen(A)
    ser = invert_serial(lam)
    # sanity: superdiagonal reconstruction
    xs = [0]
    for i in range(5):
        xs.append(lam + xs[i] - A[i][i + 1])
    if tuple(xs) != x:
        raise RuntimeError(f"eigen mismatch {xs} vs {x}")
    if ser != SERIAL:
        # still return computed; SERIAL is expected for this build
        pass
    return ser


def live_check(serial: str) -> bool:
    master, slave = pty.openpty()
    fcntl.ioctl(master, termios.TIOCSWINSZ, struct.pack("HHHH", 40, 120, 0, 0))
    p = subprocess.Popen(
        [str(BIN)], stdin=slave, stdout=slave, stderr=slave, close_fds=True
    )
    os.close(slave)

    def drain(t: float = 0.4) -> bytes:
        end = time.time() + t
        data = b""
        while time.time() < end:
            r, _, _ = select.select([master], [], [], 0.05)
            if master in r:
                try:
                    data += os.read(master, 8192)
                except OSError:
                    break
        return data

    try:
        time.sleep(0.5)
        drain(0.4)
        os.write(master, serial.encode() )
        time.sleep(0.5)
        out = drain(0.6)
        os.write(master, b"q")
        time.sleep(0.2)
    finally:
        p.kill()
    ok = b"locked" in out and b"no lock" not in out
    clean = re.sub(r"\x1b\[[0-9;?]*[a-zA-Z]", "", out.decode("utf-8", "replace"))
    print(clean[-400:])
    return ok


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--derive", action="store_true", help="recalcule via eigen+inv mix")
    args = ap.parse_args()

    if args.derive:
        ser = generate()
        print(ser)
        print("OK" if ser == SERIAL else f"MISMATCH expected {SERIAL}", file=sys.stderr)
        return 0 if ser == SERIAL else 1

    if args.check:
        ok = live_check(SERIAL)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(SERIAL)
    else:
        print(SERIAL)
        print("# λ=3  x=(0,2,5,1,4,3)  → ./original/tropical puis coller le serial")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
