#!/usr/bin/env python3
"""Solveur — FentCat's Assembler Crackme (PE32 console).

Le prédicat réel compare 8 octets d'entrée à ``encoded_data`` @ VA 0x4021db
(= ``@CBEDGFI``). Anti-debug / checksum / XOR+ADD sont des leurres.

Usage :
  python3 assembler-crackme-solve.py -q
  python3 assembler-crackme-solve.py --check
  python3 assembler-crackme-solve.py --check '@CBEDGFI'
"""

from __future__ import annotations

import argparse
import os
import pty
import select
import struct
import subprocess
import sys
import time
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "crackme.exe"

ENCODED_VA = 0x4021DB
CMP_LEN = 8
SUCCESS = "Welcome :O"
FAIL = "Authentication Failed"


def _pe_image_base(data: bytes) -> int:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    return struct.unpack_from("<I", data, e_lfanew + 24 + 28)[0]


def _pe_rva_to_off(data: bytes, rva: int) -> int:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    nsec = struct.unpack_from("<H", data, e_lfanew + 6)[0]
    opt = struct.unpack_from("<H", data, e_lfanew + 20)[0]
    sec = e_lfanew + 24 + opt
    for i in range(nsec):
        off = sec + i * 40
        _vsz, sec_rva, rsz, raddr = struct.unpack_from("<IIII", data, off + 8)
        if rsz and sec_rva <= rva < sec_rva + rsz:
            return raddr + (rva - sec_rva)
    raise ValueError(f"RVA {rva:#x} not in a section")


def load_password(path: Path | None = None) -> str:
    path = path or _BIN
    data = path.read_bytes()
    ib = _pe_image_base(data)
    rva = ENCODED_VA - ib
    off = _pe_rva_to_off(data, rva)
    raw = data[off : off + CMP_LEN]
    return raw.decode("ascii")


def run_bin(password: str, timeout: float = 8.0) -> str:
    """Wine + PTY : ReadConsoleA exige un vrai console / CR."""
    if not _BIN.is_file():
        raise FileNotFoundError(_BIN)
    argv = ["wine", str(_BIN)]
    env = {**os.environ, "WINEDEBUG": "-all"}
    master, slave = pty.openpty()
    proc = subprocess.Popen(
        argv,
        stdin=slave,
        stdout=slave,
        stderr=subprocess.DEVNULL,
        env=env,
        close_fds=True,
    )
    os.close(slave)
    out = b""
    sent = False
    payload = (password + "\r\n").encode("ascii", errors="replace")
    end = time.time() + timeout
    try:
        while time.time() < end:
            r, _, _ = select.select([master], [], [], 0.2)
            if r:
                try:
                    chunk = os.read(master, 4096)
                except OSError:
                    break
                if not chunk:
                    break
                out += chunk
                if not sent and b"Enter password" in out:
                    time.sleep(0.1)
                    os.write(master, payload)
                    sent = True
            if proc.poll() is not None:
                # drain
                while True:
                    r2, _, _ = select.select([master], [], [], 0.1)
                    if not r2:
                        break
                    try:
                        out += os.read(master, 4096)
                    except OSError:
                        break
                break
    finally:
        if proc.poll() is None:
            proc.kill()
            try:
                proc.wait(timeout=1)
            except subprocess.TimeoutExpired:
                pass
        try:
            os.close(master)
        except OSError:
            pass
    return out.decode("latin-1", errors="replace")


def live_ok(password: str) -> bool:
    out = run_bin(password)
    return SUCCESS in out and FAIL not in out


def main() -> int:
    ap = argparse.ArgumentParser(description="FentCat Assembler Crackme solver")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument(
        "--check",
        nargs="?",
        const="",
        metavar="P",
        help="vérifie contre le binaire Wine (défaut = password extrait)",
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

    print("=== FentCat Assembler Crackme ===")
    print(f"password : {pw}")
    print(f"compare  : 8 bytes @ encoded_data {ENCODED_VA:#x}")
    print(f"success  : {SUCCESS}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
