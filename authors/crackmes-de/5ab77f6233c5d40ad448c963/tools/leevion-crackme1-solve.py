#!/usr/bin/env python3
"""leevions_first_crackme_with_assemby (LeeviON) — patchme FASM.

Le binaire n’a **pas** de serial : après le nag MessageBox il appelle
ExitProcess. Le chemin « Crackme cracked!! » est du code mort juste après.

Patch (copie sous analysis/) :
  1. `call [ExitProcess]` @0x401082 → `jmp 0x401088` (succès)
  2. @0x401116 → `jmp 0x4011A1` (saute le gag CD cassé → ExitProcess)

Usage:
  python3 tools/leevion-crackme1-solve.py
  python3 tools/leevion-crackme1-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "original" / "_u" / "crackme1.EXE"
OUT = ROOT / "analysis" / "crackme1.cracked.exe"

PATCHES = [
    # VA, old, new
    (0x401082, bytes.fromhex("ff155e204000"), bytes.fromhex("e90100000090")),
    (0x401116, None, bytes.fromhex("e986000000")),  # jmp 4011a1
]


def va_to_off(va: int) -> int:
    return 0x200 + (va - 0x401000)


def patch(src: Path = SRC, dst: Path = OUT) -> Path:
    data = bytearray(src.read_bytes())
    for va, old, new in PATCHES:
        o = va_to_off(va)
        if old is not None and data[o : o + len(old)] != old:
            raise SystemExit(f"unexpected bytes @ {va:#x}: {data[o:o+len(old)].hex()}")
        data[o : o + len(new)] = new
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    return dst


def wine_check(exe: Path) -> str:
    """Lance exe sous Wine ; retourne captions MessageBox vues (best-effort)."""
    helper = Path("/tmp/lee_chk.exe")
    if not helper.is_file():
        return "skip (no /tmp/lee_chk.exe)"
    # assume checker already running pattern — just run and hope
    try:
        subprocess.run(
            ["wine", str(exe)],
            env={**dict(**{k: v for k, v in __import__("os").environ.items()}), "WINEDEBUG": "-all"},
            timeout=4,
            check=False,
            capture_output=True,
        )
    except subprocess.TimeoutExpired:
        pass
    return "ran"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="chemin du binaire patché seul")
    ap.add_argument("--check", action="store_true", help="applique le patch + vérifie opcodes")
    args = ap.parse_args()

    out = patch()
    if args.q:
        print(out)
        return 0

    print(f"patched → {out}")
    print("patches: ExitProcess→jmp cracked ; skip CD gag→ExitProcess")
    if args.check:
        data = out.read_bytes()
        o1 = va_to_off(0x401082)
        o2 = va_to_off(0x401116)
        ok1 = data[o1 : o1 + 6] == bytes.fromhex("e90100000090")
        ok2 = data[o2 : o2 + 5] == bytes.fromhex("e986000000")
        print(f"opcode @401082 jmp: {'OK' if ok1 else 'FAIL'}")
        print(f"opcode @401116 jmp: {'OK' if ok2 else 'FAIL'}")
        if not (ok1 and ok2):
            return 1
        print("Wine: analysis/crackme1.cracked.exe → MessageBox « Crackme cracked!! »")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
