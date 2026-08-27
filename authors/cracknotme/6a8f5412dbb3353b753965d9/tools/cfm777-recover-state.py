#!/usr/bin/env python3
"""Recover CFM777 final 7×u64 reel state from ciphertext.

For each candidate offset of b'7-7-7 JACKPOT', ask Z3 for a state that:
  - decrypts to that substring at the offset
  - yields only printable ASCII / newlines over the full 613-byte message

The intended state should score ~613/613 printable. Underconstrained
junk models score ~230–260.
"""
from __future__ import annotations

import argparse
import pathlib
import struct
import sys
import time
from concurrent.futures import ProcessPoolExecutor, as_completed

from z3 import (
    And,
    BitVec,
    BitVecVal,
    Extract,
    If,
    LShR,
    Or,
    Solver,
    URem,
    sat,
)

HERE = pathlib.Path(__file__).resolve().parent
ROOT = HERE.parent
CT_PATH = ROOT / "analysis" / "ciphertext.bin"
TARGET = b"7-7-7 JACKPOT"

C = 0x9E3779B97F4A7C15
K = 0x77777777BEEF1337
A = 0x2152411035014542
B = 0x42A482206A028A84
CC = 0x63F6C3309F03CFC6
D = 0x7AB6FBBF2BFAEAF8
E = 0x5964BAAEF6F9A5B6
F = 0x3812799EC1F86074
SUB = 0x61C8864680B583EB
M1 = 0xBF58476D1CE4E5B9
M2 = 0x94D049BB133111EB


def u64(x: int) -> int:
    return x & ((1 << 64) - 1)


def sm64_c(v: int) -> int:
    x = u64(v ^ (v >> 30))
    y = u64(M1 * x)
    z = u64(y ^ (y >> 27))
    w = u64(M2 * z)
    return u64(w ^ (w >> 31))


def decrypt_c(ct: bytes, st: list[int]) -> bytes:
    v = u64(C * (st[0] ^ K))
    v = u64(C * (st[1] ^ v) - A)
    v = u64(C * (st[2] ^ v) - B)
    v = u64(C * (st[3] ^ v) - CC)
    v = u64(C * (st[4] ^ v) + D)
    v = u64(C * (st[5] ^ v) + E)
    v102 = u64(C * (st[6] ^ v) + F)
    out = bytearray()
    for mm in range(len(ct)):
        v102 = u64(v102 - SUB)
        r = sm64_c(v102)
        out.append(
            ct[mm]
            ^ ((r >> 56) & 0xFF)
            ^ ((47 * mm + 23) & 0xFF)
            ^ ((st[(r >> 24) % 7] >> (8 * (mm & 7))) & 0xFF)
        )
    return bytes(out)


def score(pt: bytes) -> int:
    return sum(32 <= c <= 126 or c in (10, 13) for c in pt)


def sm64_z(v):
    x = v ^ LShR(v, 30)
    y = BitVecVal(M1, 64) * x
    z = y ^ LShR(y, 27)
    w = BitVecVal(M2, 64) * z
    return w ^ LShR(w, 31)


def pick(idx, s7):
    return If(
        idx == 0,
        s7[0],
        If(
            idx == 1,
            s7[1],
            If(
                idx == 2,
                s7[2],
                If(
                    idx == 3,
                    s7[3],
                    If(idx == 4, s7[4], If(idx == 5, s7[5], s7[6])),
                ),
            ),
        ),
    )


def try_offset(args: tuple[int, bytes, int]) -> tuple[int, str, list[int] | None, bytes | None, int]:
    """Return (off, status, state|None, pt|None, score)."""
    off, ct, timeout_ms = args
    n = len(ct)
    s7 = [BitVec(f"s{i}", 64) for i in range(7)]
    v = BitVecVal(C, 64) * (s7[0] ^ BitVecVal(K, 64))
    v = BitVecVal(C, 64) * (s7[1] ^ v) - BitVecVal(A, 64)
    v = BitVecVal(C, 64) * (s7[2] ^ v) - BitVecVal(B, 64)
    v = BitVecVal(C, 64) * (s7[3] ^ v) - BitVecVal(CC, 64)
    v = BitVecVal(C, 64) * (s7[4] ^ v) + BitVecVal(D, 64)
    v = BitVecVal(C, 64) * (s7[5] ^ v) + BitVecVal(E, 64)
    v102 = BitVecVal(C, 64) * (s7[6] ^ v) + BitVecVal(F, 64)

    sol = Solver()
    sol.set("timeout", timeout_ms)
    vcur = v102
    for mm in range(n):
        vcur = vcur - BitVecVal(SUB, 64)
        r = sm64_z(vcur)
        idx = URem(LShR(r, 24), 7)
        word = pick(idx, s7)
        sbyte = Extract(7, 0, LShR(word, 8 * (mm & 7)))
        p = (
            BitVecVal(ct[mm], 8)
            ^ Extract(7, 0, LShR(r, 56))
            ^ BitVecVal((47 * mm + 23) & 0xFF, 8)
            ^ sbyte
        )
        if off <= mm < off + len(TARGET):
            sol.add(p == TARGET[mm - off])
        else:
            sol.add(Or(And(p >= 32, p <= 126), p == 10, p == 13))

    r = sol.check()
    if r != sat:
        return (off, str(r), None, None, -1)
    m = sol.model()
    st = [m[s].as_long() for s in s7]
    pt = decrypt_c(ct, st)
    return (off, "sat", st, pt, score(pt))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--start", type=int, default=0)
    ap.add_argument("--stop", type=int, default=None, help="exclusive offset end")
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--timeout", type=int, default=60000, help="Z3 timeout ms per offset")
    ap.add_argument("--min-score", type=int, default=500, help="accept threshold")
    args = ap.parse_args()

    ct = CT_PATH.read_bytes()
    assert len(ct) == 0x265
    stop = args.stop if args.stop is not None else (len(ct) - len(TARGET) + 1)
    offsets = list(range(args.start, stop))
    print(f"[*] ciphertext {CT_PATH} ({len(ct)} bytes)", flush=True)
    print(f"[*] offsets {args.start}..{stop - 1} jobs={args.jobs} timeout={args.timeout}ms", flush=True)

    best = None
    t0 = time.time()
    work = [(off, ct, args.timeout) for off in offsets]
    with ProcessPoolExecutor(max_workers=args.jobs) as ex:
        futs = {ex.submit(try_offset, w): w[0] for w in work}
        for fut in as_completed(futs):
            off, status, st, pt, sc = fut.result()
            if status != "sat":
                if off % 25 == 0:
                    print(f"[-] off={off} {status} t={time.time()-t0:.1f}s", flush=True)
                continue
            assert st is not None and pt is not None
            tag = f"off={off} sc={sc}/613 pwn={b'pwn{' in pt} jackpot={TARGET in pt}"
            if best is None or sc > best[0]:
                best = (sc, off, st, pt)
                print(f"[+] BEST {tag} t={time.time()-t0:.1f}s", flush=True)
                (ROOT / "analysis" / "final_state.txt").write_text(
                    "\n".join(hex(x) for x in st) + "\n"
                )
                (ROOT / "analysis" / "plaintext.txt").write_bytes(pt)
            else:
                print(f"[.] {tag} t={time.time()-t0:.1f}s", flush=True)
            if sc >= args.min_score and TARGET in pt:
                print(pt.decode("latin1", errors="replace"))
                print("[*] state:", [hex(x) for x in st])
                # cancel remaining
                ex.shutdown(wait=False, cancel_futures=True)
                return 0

    if best is None:
        print("[-] no SAT model", file=sys.stderr)
        return 1
    print(f"[*] done best sc={best[0]} off={best[1]}")
    print(best[3][:200])
    return 0 if best[0] >= args.min_score else 2


if __name__ == "__main__":
    raise SystemExit(main())
