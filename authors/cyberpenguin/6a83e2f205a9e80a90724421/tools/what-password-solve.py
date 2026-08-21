#!/usr/bin/env python3
"""Solveur — Cyberpenguin's What password???

ELF64 NASM : table `pw` @ VA 0x404028 … 0x404036, pour i = 0.. :
  expect[i] = ((pw[i] ^ 0x27) + (2 + 2*i)) & 0xff
Succès quand expect[i] == input[i] jusqu’à expect == '\\n'
(le '\\n' final vient typiquement de Enter).

Usage :
  python3 what-password-solve.py -q
  python3 what-password-solve.py --check 'kr@meri$dab3st'
  python3 what-password-solve.py --decode
  python3 what-password-solve.py --run
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "what_password"
PW_VA = 0x404028
PW_END_VA = 0x404037  # wrong_msg


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


def load_pw_table(path: Path | None = None) -> bytes:
    path = path or _BIN
    data = path.read_bytes()
    off = _data_file_off(data, PW_VA)
    return data[off : off + (PW_END_VA - PW_VA)]


def decode(pw: bytes | None = None) -> bytes:
    pw = pw if pw is not None else load_pw_table()
    out = bytearray()
    add = 2
    for b in pw:
        c = ((b ^ 0x27) + add) & 0xFF
        out.append(c)
        if c == 0x0A:
            break
        add += 2
    return bytes(out)


def password() -> str:
    return decode().split(b"\n", 1)[0].decode("ascii")


def check(s: str) -> bool:
    return s == password()


def run_bin(s: str, timeout: float = 3.0) -> str:
    try:
        proc = subprocess.run(
            [str(_BIN)],
            input=(s + "\n").encode(),
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
    ap = argparse.ArgumentParser(description="What password??? solver")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", metavar="P")
    ap.add_argument("--decode", action="store_true", help="dump expect bytes")
    ap.add_argument("--run", action="store_true", help="exécuter le binaire")
    args = ap.parse_args()

    if args.decode:
        d = decode()
        print(d.hex(), repr(d))
        return 0

    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    pw = password()
    if args.q:
        print(pw)
        return 0

    print("=== What password??? ===")
    print(f"password : {pw}")
    print(f"len      : {len(pw)}")
    print("formula  : expect[i] = ((pw[i] ^ 0x27) + (2+2*i)) & 0xff")
    if args.run:
        print("--- live ---")
        sys.stdout.write(run_bin(pw))
    return 0


if __name__ == "__main__":
    sys.exit(main())
