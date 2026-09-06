#!/usr/bin/env python3
"""Patcher — crudd's PatchPad (PE64 FASM GUI).

Goal (NFO): patch the binary so *any* name/serial (≥5 chars) is accepted.
The serial routine is intentionally broken (hash compared to the serial
*pointer*). Opening Register also SMC-writes a bad `je` imm (`74 2c`).

Patches:
  1. VA 0x401ac3: `74 58` (je Good job) → `eb 58` (jmp Good job)
  2. VA 0x401710: SMC imm so runtime write keeps `eb 58` (not `74 2c`)
  3. VA 0x4013d0: integrity checksum qword (sum of .text [0x4013d8,0x401c78))

Usage:
  python3 patchpad-solve.py           # write analysis/PATCHPAD-patched.exe
  python3 patchpad-solve.py -q        # print patched path only
  python3 patchpad-solve.py --check   # patch + Wine GUI harness (petik / any!!)
"""

from __future__ import annotations

import argparse
import os
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIG = ROOT / "original" / "PATCHPAD.EXE"
OUT = ROOT / "analysis" / "PATCHPAD-patched.exe"
CHECK_SRC = ROOT / "tools" / "patchpad-check.c"
CHECK_EXE = ROOT / "tools" / "patchpad-check.exe"

TEXT_VA = 0x401000
TEXT_RAW = 0x400
JE_VA = 0x401ac3
SMC_IMM_VA = 0x401710  # imm64 of `mov rcx, imm` at 40170e
CSUM_IMM_VA = 0x4013d0  # imm64 of `mov rcx, imm` at 4013ce
CSUM_START = 0x4013d8
CSUM_END = 0x401c78

# 48 83 f8 01 eb 58 48 83 — cmp rax,1 ; jmp Good job ; …
SMC_WANT = struct.unpack("<Q", bytes([0x48, 0x83, 0xF8, 0x01, 0xEB, 0x58, 0x48, 0x83]))[0]


def fo(va: int) -> int:
    return va - TEXT_VA + TEXT_RAW


def checksum(data: bytes | bytearray) -> int:
    total = 0
    va = CSUM_START
    while va < CSUM_END:
        total = (total + struct.unpack_from("<Q", data, fo(va))[0]) & 0xFFFFFFFFFFFFFFFF
        va += 8
    return total


def patch() -> Path:
    data = bytearray(ORIG.read_bytes())
    if data[fo(JE_VA) : fo(JE_VA) + 2] not in (b"\x74\x58", b"\xeb\x58"):
        raise SystemExit(f"unexpected bytes at {JE_VA:#x}: {data[fo(JE_VA):fo(JE_VA)+2].hex()}")
    data[fo(JE_VA)] = 0xEB

    # movabs rcx, imm64 starts with 48 B9 at 40170e
    if data[fo(0x40170E) : fo(0x40170E) + 2] != b"\x48\xb9":
        raise SystemExit("SMC movabs not found at 0x40170e")
    struct.pack_into("<Q", data, fo(SMC_IMM_VA), SMC_WANT)

    csum = checksum(data)
    struct.pack_into("<Q", data, fo(CSUM_IMM_VA), csum)
    if checksum(data) != csum:
        raise SystemExit("checksum self-check failed")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_bytes(data)
    return OUT


def ensure_check_exe() -> Path:
    if CHECK_EXE.is_file():
        return CHECK_EXE
    cc = "x86_64-w64-mingw32-gcc"
    if not CHECK_SRC.is_file():
        raise SystemExit(f"missing {CHECK_SRC}")
    subprocess.run(
        [cc, "-O2", "-s", "-o", str(CHECK_EXE), str(CHECK_SRC), "-luser32", "-lkernel32"],
        check=True,
    )
    return CHECK_EXE


def run_check(user: str, serial: str) -> int:
    patch()
    exe = ensure_check_exe()
    env = {**os.environ, "WINEDEBUG": "-all"}
    wine = "wine64" if Path("/usr/bin/wine64").exists() else "wine"
    r = subprocess.run(
        [wine, str(exe), str(OUT), user, serial],
        capture_output=True,
        text=True,
        timeout=30,
        env=env,
    )
    out = (r.stdout or "") + (r.stderr or "")
    print(out.rstrip())
    ok = r.returncode == 0 and "Good job" in out
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="print patched path only")
    ap.add_argument("--check", action="store_true", help="Wine GUI verify (any serial)")
    ap.add_argument("--user", default="petik", help="name for --check (default petik)")
    ap.add_argument("--serial", default="any!!", help="serial for --check (default any!!)")
    args = ap.parse_args()

    out = patch()
    if args.q and not args.check:
        print(out)
        return 0

    if not args.check:
        csum = struct.unpack_from("<Q", out.read_bytes(), fo(CSUM_IMM_VA))[0]
        print(f"patched={out}")
        print(f"patch: {JE_VA:#x} je→jmp; SMC imm→eb 58; checksum={csum:#x}")
        return 0

    print(f"patched={out}")
    return run_check(args.user, args.serial)


if __name__ == "__main__":
    sys.exit(main())
