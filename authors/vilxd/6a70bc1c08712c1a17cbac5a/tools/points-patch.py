#!/usr/bin/env python3
"""Patcher — vilxd's Crack my points (DLL + Loader).

Goal: points > 100. The DLL builds «You have N» where N comes from a
100-iteration loop (`cmp eax, 0x64` @ VA 0x180001487). Changing 0x64 → 0x65
yields N=101 without breaking the integrity check (ecx stays 0xF).

Usage :
  python3 points-patch.py              # write analysis/Crackme-patched.dll
  python3 points-patch.py --points 200
  python3 points-patch.py --check      # wine Loader + patched DLL
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

import pefile

ROOT = Path(__file__).resolve().parents[1]
SRC_DLL = ROOT / "analysis" / "extracted" / "Crackme.dll"
SRC_LOADER = ROOT / "analysis" / "extracted" / "Loader.exe"
OUT_DLL = ROOT / "analysis" / "Crackme-patched.dll"
PATCH_VA = 0x1487  # cmp eax, imm8 inside .text


def patch(points: int) -> Path:
    if not 1 <= points <= 255:
        raise SystemExit("--points must fit in imm8 (1..255)")
    pe = pefile.PE(str(SRC_DLL))
    data = bytearray(Path(SRC_DLL).read_bytes())
    text = next(s for s in pe.sections if s.Name.startswith(b".text"))
    off = text.PointerToRawData + (PATCH_VA - text.VirtualAddress)
    if data[off : off + 2] != b"\x83\xf8":
        raise SystemExit(f"unexpected bytes at patch site: {data[off:off+3].hex()}")
    data[off + 2] = points & 0xFF
    OUT_DLL.write_bytes(data)
    return OUT_DLL


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--points", type=int, default=101, help="target points (default 101)")
    ap.add_argument("-q", action="store_true", help="print output path only")
    ap.add_argument("--check", action="store_true", help="run wine Loader.exe with patched DLL")
    args = ap.parse_args()

    out = patch(args.points)
    if args.q:
        print(out)
        return 0

    print(f"patched={out} points={args.points}")
    if args.check:
        with tempfile.TemporaryDirectory() as td:
            t = Path(td)
            shutil.copy(SRC_LOADER, t / "Loader.exe")
            shutil.copy(out, t / "Crackme.dll")
            r = subprocess.run(
                ["wine", str(t / "Loader.exe")],
                capture_output=True,
                text=True,
                timeout=15,
                env={**dict(**{k: v for k, v in __import__("os").environ.items()}), "WINEDEBUG": "-all"},
            )
            print(r.stdout)
            ok = f"You have {args.points}" in r.stdout.replace("\r", "")
            print("OK" if ok else "FAIL")
            return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
