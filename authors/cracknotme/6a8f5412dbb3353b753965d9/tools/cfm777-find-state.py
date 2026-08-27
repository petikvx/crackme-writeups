#!/usr/bin/env python3
"""Find CFM777 final reel state: JACKPOT (+ optional pwn{) with high printable score.

Strategy: for each JACKPOT offset, Z3 with hard jackpot + hard printable on a
growing window around it, then score the full decrypt.
"""
from __future__ import annotations

import argparse
import pathlib
import sys
import time

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
sys.path.insert(0, str(HERE))
import cfm777_crypto as C  # noqa: E402

CT = C.load_ct()
N = len(CT)
TARGET = C.TARGET


def sm64z(v):
    x = v ^ LShR(v, 30)
    y = BitVecVal(C.M1, 64) * x
    z = y ^ LShR(y, 27)
    w = BitVecVal(C.M2, 64) * z
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


def build_pts(s7):
    v = BitVecVal(C.C, 64) * (s7[0] ^ BitVecVal(C.K, 64))
    v = BitVecVal(C.C, 64) * (s7[1] ^ v) - BitVecVal(C.A, 64)
    v = BitVecVal(C.C, 64) * (s7[2] ^ v) - BitVecVal(C.B, 64)
    v = BitVecVal(C.C, 64) * (s7[3] ^ v) - BitVecVal(C.CC, 64)
    v = BitVecVal(C.C, 64) * (s7[4] ^ v) + BitVecVal(C.D, 64)
    v = BitVecVal(C.C, 64) * (s7[5] ^ v) + BitVecVal(C.E, 64)
    v102 = BitVecVal(C.C, 64) * (s7[6] ^ v) + BitVecVal(C.F, 64)
    pts = []
    vcur = v102
    for mm in range(N):
        vcur = vcur - BitVecVal(C.SUB, 64)
        r = sm64z(vcur)
        sbyte = Extract(7, 0, LShR(pick(URem(LShR(r, 24), 7), s7), 8 * (mm & 7)))
        p = (
            BitVecVal(CT[mm], 8)
            ^ Extract(7, 0, LShR(r, 56))
            ^ BitVecVal((47 * mm + 23) & 0xFF, 8)
            ^ sbyte
        )
        pts.append(p)
    return pts


def score(pt: bytes) -> int:
    return sum(32 <= c <= 126 or c in (10, 13) for c in pt)


def try_offset(off: int, window: int, timeout_ms: int, full: bool):
    s7 = [BitVec(f"s{i}", 64) for i in range(7)]
    pts = build_pts(s7)
    sol = Solver()
    sol.set("timeout", timeout_ms)
    for i, ch in enumerate(TARGET):
        sol.add(pts[off + i] == ch)
    if full:
        lo, hi = 0, N
    else:
        lo = max(0, off - window)
        hi = min(N, off + len(TARGET) + window)
    for mm in range(lo, hi):
        if off <= mm < off + len(TARGET):
            continue
        p = pts[mm]
        sol.add(Or(And(p >= 32, p <= 126), p == 10, p == 13))
    if sol.check() != sat:
        return None
    m = sol.model()
    st = [m[s].as_long() for s in s7]
    pt = C.decrypt(CT, st)
    return score(pt), st, pt


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--start", type=int, default=0)
    ap.add_argument("--stop", type=int, default=None)
    ap.add_argument("--step", type=int, default=1)
    ap.add_argument("--window", type=int, default=64, help="printable hard window around jackpot")
    ap.add_argument("--full", action="store_true", help="require ALL bytes printable")
    ap.add_argument("--timeout", type=int, default=20000)
    ap.add_argument("--min-score", type=int, default=500)
    args = ap.parse_args()
    stop = args.stop if args.stop is not None else N - len(TARGET) + 1

    best = None
    t0 = time.time()
    for off in range(args.start, stop, args.step):
        got = try_offset(off, args.window, args.timeout, args.full)
        if got is None:
            print(f"[-] off={off} unsat/timeout t={time.time()-t0:.1f}s", flush=True)
            continue
        sc, st, pt = got
        tag = f"off={off} sc={sc}/613 jack={TARGET in pt} pwn={b'pwn{' in pt}"
        print(f"[+] {tag} t={time.time()-t0:.1f}s", flush=True)
        if best is None or sc > best[0]:
            best = (sc, off, st, pt)
            (ROOT / "analysis" / "final_state.txt").write_text(
                "\n".join(hex(x) for x in st) + "\n"
            )
            (ROOT / "analysis" / "plaintext.txt").write_bytes(pt)
            print(f"[*] BEST {tag}", flush=True)
            if sc >= args.min_score and TARGET in pt:
                sys.stdout.buffer.write(pt + b"\n")
                return 0
    print("DONE", None if not best else (best[0], best[1]))
    return 0 if best and best[0] >= args.min_score else 1


if __name__ == "__main__":
    raise SystemExit(main())
