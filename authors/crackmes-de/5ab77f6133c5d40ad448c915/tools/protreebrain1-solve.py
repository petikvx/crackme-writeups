#!/usr/bin/env python3
"""protreebrains_crackme_1 — serial fixe GetDlgItemInt == 20062007.

Anti-debug (IsDebuggerPresent / Olly window) + checksum code +
OutputDebugStringA('%s'*N) qui plante sous Wine → copie analysis/*.nodbg.exe.

Usage:
  python3 tools/protreebrain1-solve.py -q
  python3 tools/protreebrain1-solve.py --check
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "original" / "_u" / "crackme_1.exe"
NODBG = ROOT / "analysis" / "crackme_1.nodbg.exe"
SERIAL = "20062007"


def make_nodbg(dst: Path = NODBG) -> Path:
    data = bytearray(SRC.read_bytes())
    off = 0x400 + (0x40105B - 0x401000)  # push OutputString ; call
    if data[off : off + 1] == b"\x68":
        data[off : off + 10] = b"\x90" * 10
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    return dst


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.q:
        print(SERIAL)
        return 0
    print(f"serial: {SERIAL}")
    if args.check:
        p = make_nodbg()
        print(f"nodbg → {p} (NOP OutputDebugString @0x40105B)")
        # static: cmp imm in binary
        if b"\xE7\x30\x32\x01" not in SRC.read_bytes():  # 20062007 LE?
            # 20062007 = 0x013230E7
            imm = (20062007).to_bytes(4, "little")
            if imm not in SRC.read_bytes():
                print("serial imm not found", file=sys.stderr)
                return 1
        print("PE contains 20062007: OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
