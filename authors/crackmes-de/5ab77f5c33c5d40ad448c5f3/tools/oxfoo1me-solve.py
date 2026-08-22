#!/usr/bin/env python3
"""Solveur — 0xf001 oxfoo1me / oxfoo1m3.

Password 11 octets : fucktheduck
  password[i] = expected[i] ^ (11 + i)
  expected = « myne{xtvfw~ » (après XOR-décrypt 0x58 du body)

Usage:
  python3 oxfoo1me-solve.py -q
  python3 oxfoo1me-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import select
import time
from pathlib import Path

BIN = Path(__file__).resolve().parents[1] / "original" / "oxfoo1m3"
EXPECTED = b"myne{xtvfw~"
PASSWORD = bytes(EXPECTED[i] ^ (11 + i) for i in range(11))  # b'fucktheduck'
assert PASSWORD == b"fucktheduck"


def run_check(password: bytes = PASSWORD) -> bytes:
    in_r, in_w = os.pipe()
    out_r, out_w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(in_w)
        os.close(out_r)
        os.dup2(in_r, 0)
        os.dup2(out_w, 1)
        os.dup2(out_w, 2)
        os.close(in_r)
        os.close(out_w)
        os.execv(str(BIN), [str(BIN)])
    os.close(in_r)
    os.close(out_w)
    os.write(in_w, password[:11])
    os.close(in_w)
    out = b""
    deadline = time.time() + 2
    while time.time() < deadline:
        r, _, _ = select.select([out_r], [], [], 0.05)
        if r:
            chunk = os.read(out_r, 4096)
            if not chunk:
                break
            out += chunk
        elif os.waitpid(pid, os.WNOHANG)[0]:
            break
    try:
        os.kill(pid, 9)
        os.waitpid(pid, 0)
    except (ChildProcessError, ProcessLookupError, OSError):
        pass
    try:
        os.close(out_r)
    except OSError:
        pass
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD.decode())
        return 0
    if a.check:
        out = run_check()
        ok = b"u made it" in out
        print(out.decode("latin1", "replace").replace("\x00", "").strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print("password:", PASSWORD.decode())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
