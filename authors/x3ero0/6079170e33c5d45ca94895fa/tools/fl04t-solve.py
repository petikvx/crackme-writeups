#!/usr/bin/env python3
"""X3eRo0 fl04t — 80-bit Dottie (x87 fcos fixed point) XOR keys → password.

Binary syscalls are swapped: write(fd=0), read(fd=1). --check remaps fds.
"""
from __future__ import annotations

import argparse
import os
import select
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "fl04t"
FLAG = "fr0m_fl04ts_1mp0rt_*"
# long double after repeated x87 fcos from 0.7 (x == cos(x))
DOTTIE80 = bytes.fromhex("cb6d711eecae34bdfe3f")
K1 = bytes.fromhex("ad1f4173b3c8588dca4b")
K2 = bytes.fromhex("b83240739c9e46c9a115")


def password() -> str:
    pw = bytes(a ^ b for a, b in zip(DOTTIE80, K1)) + bytes(
        a ^ b for a, b in zip(DOTTIE80, K2)
    )
    return pw.decode("ascii")


def live_check(pw: str) -> bytes:
    out_r, out_w = os.pipe()
    in_r, in_w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.dup2(out_w, 0)
        os.dup2(in_r, 1)
        for fd in (out_r, out_w, in_r, in_w):
            os.close(fd)
        os.execv(str(BIN), [str(BIN)])
        os._exit(127)
    os.close(out_w)
    os.close(in_r)
    os.write(in_w, (pw + "\n").encode())
    os.close(in_w)
    data = b""
    if select.select([out_r], [], [], 1.0)[0]:
        data = os.read(out_r, 4096)
    os.close(out_r)
    os.waitpid(pid, 0)
    return data


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    pw = password()
    assert pw == FLAG
    if args.check:
        out = live_check(pw)
        ok = b"PASSWORD ACCEPTED" in out
        print(out.decode(errors="replace").rstrip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(pw if args.q else f"{pw}  # dottie80 XOR keys; fds 0/1 swapped")
    return 0


if __name__ == "__main__":
    sys.exit(main())
