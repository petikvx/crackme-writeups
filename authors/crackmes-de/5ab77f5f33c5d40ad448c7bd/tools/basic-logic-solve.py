#!/usr/bin/env python3
"""Solveur — crackmes.de basic_logic (eholzbach)

Password = str(getpid()) + str(time(NULL)), lu sur **fd 1** (stdout)
→ il faut un PTY. Anti-debug : ptrace(TRACEME).

Usage:
  python3 basic-logic-solve.py --check
  python3 basic-logic-solve.py -q   # rappelle la formule
"""
from __future__ import annotations

import argparse
import os
import pty
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "logic" / "logic"


def live_check() -> tuple[str, bytes, bool]:
    pid, fd = pty.fork()
    if pid == 0:
        os.execv(str(BIN), [str(BIN)])
    time.sleep(0.05)
    t = int(time.time())
    pw = f"{pid}{t}"
    data = b""
    for _ in range(20):
        try:
            data += os.read(fd, 1024)
            if b"password" in data:
                break
        except OSError:
            break
        time.sleep(0.02)
    try:
        os.write(fd, (pw + "\n").encode())
    except OSError:
        pass
    time.sleep(0.15)
    try:
        while True:
            chunk = os.read(fd, 1024)
            if not chunk:
                break
            data += chunk
    except OSError:
        pass
    try:
        os.waitpid(pid, 0)
    except ChildProcessError:
        pass
    return pw, data, b"password is correct" in data


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.q:
        print("password = str(getpid()) + str(time(NULL))  # via PTY, read fd1")
        return 0
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        pw, out, ok = live_check()
        print(out.decode(errors="replace").replace("\r", "").strip())
        print(f"used: {pw}")
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print("=== basic_logic ===")
    print("formula : pid_decimal || time_decimal")
    print("note    : read(1, …) → need PTY; ptrace anti-debug")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
