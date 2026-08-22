#!/usr/bin/env python3
"""Solveur — pipedown's I need to be honest

ELF64 asm (syscalls), non strippé :
  - password en clair @ actual_password (len 0x1b)
  - checksum somme des octets == 0x9be
  - 3 flags : XOR mono-octet clés 0x47 / 0x5a / 0x6c
    (aussi présents en clair dans .data — « be honest »)

Usage :
  python3 ineedtobehonest-solve.py -q
  python3 ineedtobehonest-solve.py --flags
  python3 ineedtobehonest-solve.py --check SecurePass_2k26_X64_Reverse
  python3 ineedtobehonest-solve.py --run
"""

from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "ineedtobehonest"

PW_VA = 0x4011A3
PW_LEN = 0x1B
CHK_VA = 0x4011BE
FLAGS = (
    (0x4011F0, 0x22, 0x47),  # flag1_encrypted, key
    (0x40123C, 0x2A, 0x5A),
    (0x40128A, 0x24, 0x6C),
)


def va2off(elf: bytes, va: int) -> int:
    e_phoff = int.from_bytes(elf[0x20:0x28], "little")
    e_phentsize = int.from_bytes(elf[0x36:0x38], "little")
    e_phnum = int.from_bytes(elf[0x38:0x3A], "little")
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsize
        if int.from_bytes(elf[off : off + 4], "little") != 1:
            continue
        p_offset = int.from_bytes(elf[off + 8 : off + 16], "little")
        p_vaddr = int.from_bytes(elf[off + 16 : off + 24], "little")
        p_filesz = int.from_bytes(elf[off + 32 : off + 40], "little")
        if p_vaddr <= va < p_vaddr + p_filesz:
            return p_offset + (va - p_vaddr)
    raise ValueError(f"VA {va:#x} not in PT_LOAD")


def load_password(path: Path | None = None) -> str:
    data = (path or _BIN).read_bytes()
    off = va2off(data, PW_VA)
    return data[off : off + PW_LEN].decode("ascii")


def expected_checksum(path: Path | None = None) -> int:
    data = (path or _BIN).read_bytes()
    return struct.unpack_from("<Q", data, va2off(data, CHK_VA))[0]


def decrypt_flags(path: Path | None = None) -> list[str]:
    data = (path or _BIN).read_bytes()
    out: list[str] = []
    for va, n, key in FLAGS:
        enc = data[va2off(data, va) : va2off(data, va) + n]
        out.append(bytes(b ^ key for b in enc).decode("ascii"))
    return out


def check(password: str, path: Path | None = None) -> bool:
    pw = load_password(path)
    if password != pw:
        return False
    return sum(password.encode("ascii")) == expected_checksum(path)


def run_bin(password: str, timeout: float = 5.0) -> str:
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
    ap = argparse.ArgumentParser(description="I need to be honest solver")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--flags", action="store_true", help="decrypt 3 flags")
    ap.add_argument("--check", metavar="P")
    ap.add_argument("--run", action="store_true", help="exécuter le binaire")
    args = ap.parse_args()

    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    pw = load_password()
    if args.q:
        print(pw)
        return 0

    if args.flags:
        for f in decrypt_flags():
            print(f)
        return 0

    print("=== I need to be honest ===")
    print(f"password : {pw}")
    print(f"checksum : {sum(pw.encode()):#x} (expect {expected_checksum():#x})")
    print("flags    :")
    for f in decrypt_flags():
        print(f"  {f}")
    if args.run:
        print("--- live ---")
        sys.stdout.write(run_bin(pw))
    return 0


if __name__ == "__main__":
    sys.exit(main())
