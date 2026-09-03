#!/usr/bin/env python3
"""smple_unpackme_v0.1 — restore scrambled import thunks.

Writes analysis/UnpackMe.restored.exe (fixed jmp [iat] + NOP self-mod patches).
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "original" / "_u" / "UnpackMe.exe"
OUT = ROOT / "analysis" / "UnpackMe.restored.exe"

FIXES = {
    0x401B30: 0x40516C,  # LoadCursorA
    0x401B40: 0x405178,  # RegisterClassExA
    0x401B50: 0x40515C,  # CreateWindowExA
    0x401B60: 0x40517C,  # ShowWindow
    0x401B70: 0x405168,  # GetMessageA
    0x401B80: 0x405180,  # TranslateMessage
    0x401B90: 0x405164,  # DispatchMessageA
    0x401BA0: 0x405174,  # PostQuitMessage
    0x401BB0: 0x405160,  # DefWindowProcA
    0x401BE0: 0x405100,  # GetCommandLineA
    0x401BF0: 0x405108,  # GetStartupInfoA
    0x401C00: 0x405104,  # GetModuleHandleA
}


def restore(data: bytearray) -> bytearray:
    def va2off(va: int) -> int:
        return 0x400 + (va - 0x401000)

    for va, iat in FIXES.items():
        off = va2off(va)
        if data[off : off + 2] != b"\xff\x25":
            raise RuntimeError(f"bad thunk at {va:#x}")
        struct.pack_into("<I", data, off + 2, iat)

    i = 0
    while True:
        j = data.find(b"\xc6\x05", i)
        if j < 0 or j > len(data) - 7:
            break
        target = struct.unpack_from("<I", data, j + 2)[0]
        if 0x401AF0 <= target <= 0x401C40:
            data[j : j + 7] = b"\x90" * 7
        i = j + 1
    return data


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("-o", type=Path, default=OUT)
    ap.add_argument("--check", action="store_true", help="restore + verify thunks")
    args = ap.parse_args()
    data = restore(bytearray(SRC.read_bytes()))
    args.o.parent.mkdir(parents=True, exist_ok=True)
    args.o.write_bytes(data)
    # verify LoadCursorA
    off = 0x400 + (0x401B30 - 0x401000)
    iat = struct.unpack_from("<I", data, off + 2)[0]
    ok = iat == 0x40516C
    if args.check:
        print("LoadCursorA thunk", hex(iat), "OK" if ok else "FAIL")
        print("written", args.o)
        return 0 if ok else 1
    if args.q:
        print(args.o)
    else:
        print(f"restored → {args.o} (12 IAT thunks + NOP self-mod)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
