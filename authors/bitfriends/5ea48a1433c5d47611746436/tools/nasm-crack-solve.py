#!/usr/bin/env python3
"""Solveur — BitFriends's nasm crack

ELF64 NASM statique : prompt + read(16) + repz cmpsb (11 octets)
contre le label `passwd` @ VA 0x402026 = « supersecret ».

Usage :
  python3 nasm-crack-solve.py -q
  python3 nasm-crack-solve.py --check
  python3 nasm-crack-solve.py --check supersecret
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "nasm_crack"
PASSWD_VA = 0x402026
CMP_LEN = 0xB  # ecx dans le binaire


def _data_file_off(elf: bytes, va: int) -> int:
    if elf[:4] != b"\x7fELF":
        raise ValueError("not ELF")
    e_phoff = int.from_bytes(elf[0x20:0x28], "little")
    e_phentsize = int.from_bytes(elf[0x36:0x38], "little")
    e_phnum = int.from_bytes(elf[0x38:0x3A], "little")
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsize
        p_type = int.from_bytes(elf[off : off + 4], "little")
        if p_type != 1:  # PT_LOAD
            continue
        p_offset = int.from_bytes(elf[off + 8 : off + 16], "little")
        p_vaddr = int.from_bytes(elf[off + 16 : off + 24], "little")
        p_filesz = int.from_bytes(elf[off + 32 : off + 40], "little")
        if p_vaddr <= va < p_vaddr + p_filesz:
            return p_offset + (va - p_vaddr)
    raise ValueError(f"VA {va:#x} not in PT_LOAD")


def load_password(path: Path | None = None) -> str:
    path = path or _BIN
    data = path.read_bytes()
    off = _data_file_off(data, PASSWD_VA)
    raw = data[off : off + CMP_LEN]
    return raw.decode("ascii")


def run_bin(password: str, timeout: float = 3.0) -> str:
    proc = subprocess.run(
        [str(_BIN)],
        input=(password + "\n").encode(),
        capture_output=True,
        timeout=timeout,
    )
    return (proc.stdout + proc.stderr).decode("latin-1", errors="replace")


def live_ok(password: str) -> bool:
    out = run_bin(password)
    return "Correct!" in out and "Wrong!" not in out


def main() -> int:
    ap = argparse.ArgumentParser(description="BitFriends nasm_crack solver")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument(
        "--check",
        nargs="?",
        const="",
        metavar="P",
        help="vérifie contre le binaire (défaut = password extrait)",
    )
    args = ap.parse_args()

    pw = load_password()

    if args.check is not None:
        candidate = args.check if args.check != "" else pw
        if not _BIN.is_file():
            print("FAIL: binary missing", file=sys.stderr)
            return 2
        ok = live_ok(candidate)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(pw)
        return 0

    print("=== BitFriends nasm_crack ===")
    print(f"password : {pw}")
    print(f"compare  : repz cmpsb × {CMP_LEN} @ passwd {PASSWD_VA:#x}")
    print("success  : Correct!")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
