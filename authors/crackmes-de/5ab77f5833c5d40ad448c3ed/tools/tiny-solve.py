#!/usr/bin/env python3
"""Solveur — yanisto tiny_crackme.

Password 4 octets : dword P tel que
  (sum32(mem[0x200008 ..]) ^ 0x5508046b) == P
après XOR-décrypt body (clé 0x3f5479f1) et banner (clé 0xbeefc0da).

I/O croisés : write→fd0, read←fd1.

Usage:
  python3 tiny-solve.py -q
  python3 tiny-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import select
import struct
import time
from pathlib import Path

BIN = Path(__file__).resolve().parents[1] / "original" / "tiny-crackme"
PASSWORD = bytes.fromhex("729040cd")  # b'r\x90@\xcd'


def run_swapped(password: bytes) -> bytes:
    p_r, p_w = os.pipe()
    c_r, c_w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(p_w)
        os.close(c_r)
        os.dup2(c_w, 0)
        os.dup2(p_r, 1)
        os.close(c_w)
        os.close(p_r)
        os.execv(str(BIN), [str(BIN)])
    os.close(p_r)
    os.close(c_w)
    os.write(p_w, password[:4])
    os.close(p_w)
    out = b""
    deadline = time.time() + 2
    while time.time() < deadline:
        r, _, _ = select.select([c_r], [], [], 0.05)
        if r:
            chunk = os.read(c_r, 4096)
            if not chunk:
                break
            out += chunk
        elif os.waitpid(pid, os.WNOHANG)[0]:
            break
    try:
        os.close(c_r)
    except OSError:
        pass
    try:
        os.waitpid(pid, 0)
    except ChildProcessError:
        pass
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD.hex())
        return 0
    if a.check:
        out = run_swapped(PASSWORD)
        ok = b"Success" in out or b"Congratulations" in out
        print(out.decode("latin1", "replace").strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print("password hex :", PASSWORD.hex())
    print("password raw :", PASSWORD)
    print("le dword     :", hex(struct.unpack("<I", PASSWORD)[0]))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
