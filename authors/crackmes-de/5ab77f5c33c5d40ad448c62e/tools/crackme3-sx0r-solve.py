#!/usr/bin/env python3
"""Keygen — crackmes.de Crackme3 (S!x0r)

Username >=5. Serial XXXX-XXXX (hex).
hash = ∏ chars starting 0x7e4c9e32; modular pow / mul checks.

Usage:
  python3 crackme3-sx0r-solve.py -q --user sixor
  python3 crackme3-sx0r-solve.py --check --user sixor
"""
from __future__ import annotations
import argparse, os, pty, random, select, time
from pathlib import Path
BIN = Path(__file__).resolve().parents[1] / "original" / "Crackme3"

def user_hash(user: str) -> int:
    edx = 0x7E4C9E32
    for c in user.encode():
        edx = (edx * c) & 0xFFFFFFFF
    return edx

def keygen(user: str, seed: int = 0) -> str:
    if len(user) < 5:
        raise ValueError("username length >= 5")
    edx = user_hash(user)
    rng = random.Random(seed)
    for _ in range(100000):
        B = rng.randrange(1, 0x10000)
        C = pow(B, 0xF2A5, 0xF2A7)
        D = (C * edx) % 0xF2A7
        F = pow(0x15346, D, 0x3CA9D)
        for A in range(0xF2A7):
            if A > 0xFFFF:
                break
            E = (A * C) % 0xF2A7
            G = pow(0x307C7, E, 0x3CA9D)
            H = (G * F) % 0x3CA9D
            if H % 0xF2A7 == A:
                return f"{A:04X}-{B:04X}"
    raise RuntimeError("keygen failed")

def live(user: str, serial: str) -> bytes:
    pid, fd = pty.fork()
    if pid == 0:
        os.execv(str(BIN), [str(BIN)])
    data = b""
    while b"Username" not in data:
        data += os.read(fd, 1024)
    os.write(fd, (user + "\n").encode())
    end = time.time() + 1
    while time.time() < end and b"Serial" not in data:
        r, _, _ = select.select([fd], [], [], 0.1)
        if r:
            data += os.read(fd, 1024)
    os.write(fd, (serial + "\n").encode())
    time.sleep(0.3)
    try:
        while True:
            r, _, _ = select.select([fd], [], [], 0.3)
            if not r:
                break
            data += os.read(fd, 1024)
    except OSError:
        pass
    try:
        os.kill(pid, 9)
        os.waitpid(pid, 0)
    except Exception:
        pass
    return data

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", default="sixor")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--seed", type=int, default=0)
    args = ap.parse_args()
    serial = keygen(args.user, args.seed)
    if args.q:
        print(f"{args.user}:{serial}")
        return 0
    if args.check:
        out = live(args.user, serial).decode(errors="replace")
        ok = "Correct" in out
        print(out.replace("\r", "").replace("\x00", "").strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(f"user   : {args.user}")
    print(f"serial : {serial}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
