#!/usr/bin/env python3
"""Solveur — jeffli6789 Crackmes.one RE CTF 2026 (wallpaper)

ELF64 asm minuscule (syscalls), strippé.
Password = 37 chiffres dans {0,1,2,3} : chemin sur un « wallpaper »
bitmask 16×4, avec état 64-bit (seed + rotations / nibble masks).

Flag : CMO{<password>}

Usage :
  python3 wallpaper-solve.py -q
  python3 wallpaper-solve.py --check 1001223…
  python3 wallpaper-solve.py --run
  python3 wallpaper-solve.py --solve   # meet-in-the-middle (~quelques min)
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "wallpaper"

SEED = 0xB6FD071E9C8A3425
WALL = 0x3BB97FFD7FFD6EEC
TARGET = 0x0123456789ABCDEF ^ 0x1111111111111111 ^ 0xEEEEEEEEEEEEEEEE
MASKS = {0: 0xF0, 1: 0xFC, 2: 0x10, 3: 0x04}

# Une solution valide (plusieurs existent)
PASSWORD_CANON = "1001223210123010301233322110103321001"


def ror(x: int, cl: int) -> int:
    cl &= 63
    if cl == 0:
        return x
    return ((x >> cl) | (x << (64 - cl))) & ((1 << 64) - 1)


def rol(x: int, cl: int) -> int:
    cl &= 63
    if cl == 0:
        return x
    return ((x << cl) | (x >> (64 - cl))) & ((1 << 64) - 1)


def find_rot(rax: int) -> int | None:
    for attempt in range(16):
        if (ror(rax, (attempt << 2) & 63) & 0xF) == 0:
            return attempt
    return None


def transform(rax: int, digit: int, attempt: int) -> int:
    m = MASKS[digit]
    rcx = (attempt << 2) & ((1 << 64) - 1)
    stack_val = rax
    cl = ((rcx & 0xFF) + m) & 0xFF
    stack_val = ror(stack_val, cl)
    sil = stack_val & 0xF
    stack_val = (stack_val & ~0xFF) | ((stack_val & 0xFF) & 0xF0)
    rcx = (-rcx) & ((1 << 64) - 1)
    rcx = (rcx + 0x40) & ((1 << 64) - 1)
    stack_val = ror(stack_val, rcx & 0xFF)
    rcx = (rcx - 0x40) & ((1 << 64) - 1)
    rcx = (-rcx) & ((1 << 64) - 1)
    cl = ((rcx & 0xFF) - m) & 0xFF
    stack_val = ror(stack_val, cl)
    stack_val |= sil
    rcx = (-rcx) & ((1 << 64) - 1)
    rcx = (rcx + 0x40) & ((1 << 64) - 1)
    return ror(stack_val, rcx & 0xFF)


def inverse_transform(nrax: int, digit: int, attempt: int) -> int:
    m = MASKS[digit]
    att4 = (attempt << 2) & ((1 << 64) - 1)
    cl_last = (((-att4) & ((1 << 64) - 1)) + 0x40) & 0xFF
    stack_val = rol(nrax, cl_last)
    sil = stack_val & 0xF
    stack_val &= ~0x0F
    cl = ((att4 & 0xFF) - m) & 0xFF
    stack_val = rol(stack_val, cl)
    stack_val = rol(stack_val, cl_last)
    stack_val |= sil
    cl0 = ((att4 & 0xFF) + m) & 0xFF
    return rol(stack_val, cl0)


def wall_ok(attempt: int, digit: int) -> bool:
    return bool((WALL >> ((attempt << 2) + digit)) & 1)


def check_password(password: str) -> bool:
    password = password.strip()
    if len(password) != 37 or any(c not in "0123" for c in password):
        return False
    rax = SEED
    for ch in password:
        d = ord(ch) - 48
        att = find_rot(rax)
        if att is None or not wall_ok(att, d):
            return False
        rax = transform(rax, d, att)
    return rax == TARGET


def solve_mitm(fwd_depth: int = 18) -> str | None:
    """Meet-in-the-middle (lent : ~quelques minutes)."""
    cur: dict[int, str] = {SEED: ""}
    for _ in range(fwd_depth):
        nxt: dict[int, str] = {}
        for rax, path in cur.items():
            att = find_rot(rax)
            if att is None:
                continue
            for d in range(4):
                if not wall_ok(att, d):
                    continue
                nrax = transform(rax, d, att)
                if nrax not in nxt:
                    nxt[nrax] = path + str(d)
        cur = nxt
    fwd = cur

    bwd: dict[int, str] = {TARGET: ""}
    for _ in range(37 - fwd_depth):
        nxt = {}
        for nrax, path in bwd.items():
            for att in range(16):
                for d in range(4):
                    if not wall_ok(att, d):
                        continue
                    prev = inverse_transform(nrax, d, att)
                    if find_rot(prev) != att:
                        continue
                    if transform(prev, d, att) != nrax:
                        continue
                    if prev not in nxt:
                        nxt[prev] = str(d) + path
        bwd = nxt

    for rax, p1 in fwd.items():
        if rax in bwd:
            return p1 + bwd[rax]
    return None


def run_bin(password: str, timeout: float = 3.0) -> str:
    try:
        proc = subprocess.run(
            [str(_BIN)],
            input=(password + "\n").encode(),
            capture_output=True,
            timeout=timeout,
        )
    except FileNotFoundError:
        return "no-bin"
    except PermissionError:
        return "no-exec"
    except subprocess.TimeoutExpired:
        return "timeout"
    return (proc.stdout + proc.stderr).decode("latin-1", errors="replace")


def main() -> int:
    ap = argparse.ArgumentParser(description="wallpaper / RE CTF 2026 solver")
    ap.add_argument("-q", action="store_true", help="password (+ CMO wrap)")
    ap.add_argument("--check", metavar="P")
    ap.add_argument("--run", action="store_true")
    ap.add_argument("--solve", action="store_true", help="MITM (lent)")
    args = ap.parse_args()

    if args.solve:
        print("solving (MITM)…", flush=True)
        sol = solve_mitm()
        if not sol:
            print("FAIL")
            return 1
        print(sol)
        print(f"CMO{{{sol}}}")
        return 0

    if args.check is not None:
        ok = check_password(args.check)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    pw = PASSWORD_CANON
    if args.q:
        print(pw)
        print(f"CMO{{{pw}}}")
        return 0

    print("=== wallpaper / RE CTF 2026 ===")
    print(f"password : {pw}")
    print(f"flag     : CMO{{{pw}}}")
    print(f"check    : {check_password(pw)}")
    if args.run:
        print("--- live ---")
        sys.stdout.write(run_bin(pw))
    return 0


if __name__ == "__main__":
    sys.exit(main())
