#!/usr/bin/env python3
"""Solveur — Mazzotti's Getting started patch-me (ELF64).

Le binaire a un check correct (n%123==45 et n%2137==1920 → 251949)
mais après `test al,al` un **jmp inconditionnel** (`eb 32`) envoie
toujours sur « You suck… ». Patch : `eb` → `74` (je).

Usage :
  python3 patchme-solve.py -q              # serial
  python3 patchme-solve.py --patch         # écrit analysis/getting_started_patched
  python3 patchme-solve.py --check         # patch + run 251949
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIG = ROOT / "original" / "getting_started_patchme"
OUT = ROOT / "analysis" / "getting_started_patched"
PATCH_OFF = 0x1154  # eb 32 → 74 32
SERIAL = 251949  # 123*k+45 ≡ 1920 (mod 2137)


def find_serial() -> int:
    for k in range(0, 100000):
        n = 123 * k + 45
        if n % 2137 == 1920:
            return n
    raise RuntimeError("no serial")


def patch() -> Path:
    data = bytearray(ORIG.read_bytes())
    if data[PATCH_OFF : PATCH_OFF + 2] != bytes([0xEB, 0x32]):
        raise SystemExit(f"unexpected bytes at {PATCH_OFF:#x}: {data[PATCH_OFF:PATCH_OFF+2].hex()}")
    data[PATCH_OFF] = 0x74
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_bytes(data)
    OUT.chmod(0o755)
    return OUT


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="serial only")
    ap.add_argument("--patch", action="store_true", help="write patched binary")
    ap.add_argument("--check", action="store_true", help="patch + run with serial")
    args = ap.parse_args()

    serial = find_serial()
    assert serial == SERIAL

    if args.q and not args.check and not args.patch:
        print(serial)
        return 0

    if args.patch or args.check:
        out = patch()
        print(f"patched={out}")

    if args.check:
        r = subprocess.run([str(OUT)], input=f"{serial}\n", capture_output=True, text=True, timeout=5)
        print(r.stdout)
        ok = "Good job patcher" in r.stdout
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if not args.patch:
        print(f"serial={serial}")
        print("patch: eb 32 → 74 32 @ file offset 0x1154 (after test al,al)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
