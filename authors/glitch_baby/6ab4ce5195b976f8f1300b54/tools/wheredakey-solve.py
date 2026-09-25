#!/usr/bin/env python3
"""Solveur — Glitch_Baby's Wheredakey

Le password n'est pas une C-string de .rodata. main le bâtit sur la pile :

  dest  (rbp-0x60) = "Bash"          ; mov qword imm32 0x68736142
  frag  (rbp-0x72) = "Qc3fZ1"        ; dword 0x66336351 puis dword 0x315a66 (overlap 'f')
  frag  (rbp-0x6b) = "6AjD701x0O"    ; movabs 0x78313037446a4136 puis dword 0x4f3078 (overlap 'x')
  strcat(dest, rbp-0x72); strcat(dest, rbp-0x6b);
  strcmp(saisie, dest)

Password = BashQc3fZ16AjD701x0O  (20 octets, le dword mort [rbp-0x7c] = 0x14)

Usage:
  python3 tools/wheredakey-solve.py -q
  python3 tools/wheredakey-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "wheredakey"
WIN = "Nice bruh you got it"
LOSE = "Nuh uh"


def _store(mem: bytearray, off: int, val: int, n: int) -> None:
    i = len(mem) + off
    mem[i : i + n] = val.to_bytes(n, "little")


def _cstr(mem: bytearray, off: int) -> bytes:
    i = len(mem) + off
    return bytes(mem[i : mem.index(0, i)])


def password() -> str:
    """Rejoue les stores de main (frame de 0x80 octets, offsets rbp-relatifs)."""
    mem = bytearray(0x80)
    _store(mem, -0x60, 0x68736142, 8)  # "Bash\\0\\0\\0\\0" (imm32 sign-étendu)
    _store(mem, -0x58, 0, 8)
    _store(mem, -0x57, 0, 8)
    _store(mem, -0x4F, 0, 8)
    _store(mem, -0x72, 0x66336351, 4)  # "Qc3f"
    _store(mem, -0x6F, 0x00315A66, 4)  # "fZ1\\0" — réécrit le 'f'
    _store(mem, -0x6B, 0x78313037446A4136, 8)  # "6AjD701x"
    _store(mem, -0x64, 0x004F3078, 4)  # "x0O\\0" — réécrit le 'x'
    built = _cstr(mem, -0x60) + _cstr(mem, -0x72) + _cstr(mem, -0x6B)
    return built.decode("ascii")


def _run(pw: str) -> str:
    r = subprocess.run(
        [str(BIN)],
        input=pw + "\n",
        capture_output=True,
        text=True,
        timeout=5,
        check=False,
    )
    return r.stdout + r.stderr


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="n'imprimer que le password")
    ap.add_argument(
        "--check",
        action="store_true",
        help="lance le binaire (OK + un KO). Le code de sortie vaut 0 dans les deux cas.",
    )
    args = ap.parse_args()
    pw = password()
    if len(pw) != 0x14:
        print(f"longueur inattendue: {len(pw)}", file=sys.stderr)
        return 1
    if args.check:
        good = _run(pw)
        bad = _run("petik")
        print(good.strip())
        ok = WIN in good and LOSE not in good and WIN not in bad and LOSE in bad
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
    else:
        print(f"{pw}  # Bash + Qc3fZ1 + 6AjD701x0O")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
