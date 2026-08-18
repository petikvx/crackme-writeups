#!/usr/bin/env python3
"""Solveur CFB7 (CrackNotMe — Shattered Mirror / shellcode XOR).

Le password n’est pas en clair : un blob 0x25 octets en .rdata est XOR-é avec
une clé dérivée de l’anti-debug PEB, copié en RWX via VirtualAlloc, puis
exécuté. Le shellcode compare 2× qword au password.

Sans debugger (IsDebuggerPresent == 0, BeingDebugged == 0) :

  key = BeingDebugged ^ 0x5A = 0x5A

Shellcode déchiffré (résumé) :

  mov rax, "Pwn.By_S" ; cmp [rcx], rax
  mov rax, "MC_2026\\0" ; cmp [rcx+8], rax
  → password = Pwn.By_SMC_2026

Usage :
  python3 cfb7-solve.py
  python3 cfb7-solve.py -q
  python3 cfb7-solve.py --check
  python3 cfb7-solve.py --run    # wine + patch RWX (wipe shellcode)
"""

from __future__ import annotations

import argparse
import os
import struct
import subprocess
import sys
import tempfile
import time
from pathlib import Path

PASSWORD = "Pwn.By_SMC_2026"
XOR_KEY_CLEAN = 0x5A
BLOB_VA = 0x1400213E0
BLOB_LEN = 0x25
IMAGE_BASE = 0x140000000
RDATA_VA = 0x21000
RDATA_RAW = 0x1FA00
TEXT_VA = 0x1000
TEXT_RAW = 0x400
# VirtualProtect flProtect = PAGE_EXECUTE_READ (0x20) → crash au wipe sous Wine
VPROTECT_IMM_VA = 0x14000386F  # octet immédiat dans `mov r8d, 0x20`
PAGE_EXECUTE_READWRITE = 0x40

HERE = Path(__file__).resolve().parent
EXE = HERE.parent / "original" / "CFB7.exe"


def va_to_fo(va: int) -> int:
    rva = va - IMAGE_BASE
    if rva >= RDATA_VA:
        return RDATA_RAW + (rva - RDATA_VA)
    return TEXT_RAW + (rva - TEXT_VA)


def read_blob(data: bytes) -> bytes:
    fo = va_to_fo(BLOB_VA)
    return bytes(data[fo : fo + BLOB_LEN])


def decrypt(blob: bytes, key: int = XOR_KEY_CLEAN) -> bytes:
    return bytes(b ^ key for b in blob)


def password_from_shellcode(sc: bytes) -> str:
    """Extrait les 2 imm64 du shellcode (mov rax, imm64)."""
    # 48 b8 <imm64> ; cmp [rcx],rax ; jne ; 48 b8 <imm64> …
    assert sc[0:2] == b"\x48\xb8", sc[:2].hex()
    part1 = sc[2:10]
    assert sc[0x0F:0x11] == b"\x48\xb8", sc[0x0F:0x11].hex()
    part2 = sc[0x11:0x19]  # "MC_2026\0"
    assert part2[-1] == 0
    return (part1 + part2[:-1]).decode("ascii")


def check_offline(data: bytes) -> tuple[bool, str]:
    sc = decrypt(read_blob(data))
    got = password_from_shellcode(sc)
    pwd = got.encode("ascii") + b"\0"
    ok = pwd[:8] == sc[2:10] and pwd[8:16] == sc[0x11:0x19]
    return ok and got == PASSWORD, got


def patch_rwx(src: Path, dst: Path) -> None:
    """PAGE_EXECUTE_READ → READWRITE pour que le wipe post-check ne pagefault pas."""
    data = bytearray(src.read_bytes())
    fo = va_to_fo(VPROTECT_IMM_VA)
    if data[fo] != 0x20:
        raise SystemExit(f"unexpected VirtualProtect imm at {fo:#x}: {data[fo]:#x}")
    data[fo] = PAGE_EXECUTE_READWRITE
    dst.write_bytes(data)


def run_live(password: str) -> str:
    if not EXE.is_file():
        raise SystemExit(f"missing {EXE}")
    with tempfile.TemporaryDirectory(prefix="cfb7-") as td:
        patched = Path(td) / "CFB7_rwx.exe"
        patch_rwx(EXE, patched)
        env = os.environ.copy()
        env["WINEDEBUG"] = "-all"
        p = subprocess.Popen(
            ["wine", str(patched)],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            env=env,
        )
        time.sleep(0.2)
        out, _ = p.communicate((password + "\n\n").encode(), timeout=45)
    return out.decode("latin1", "replace").replace("\r", "")


def main() -> int:
    ap = argparse.ArgumentParser(description="CFB7 Shattered Mirror solver")
    ap.add_argument("-q", "--quiet", action="store_true", help="password only")
    ap.add_argument(
        "--check",
        action="store_true",
        help="re-decrypt blob from original/CFB7.exe and verify",
    )
    ap.add_argument(
        "--run",
        action="store_true",
        help="wine live (binaire temporaire patché RWX)",
    )
    ap.add_argument("--trace", action="store_true", help="dump shellcode hex/ascii")
    args = ap.parse_args()

    if args.check or args.trace or args.run:
        data = EXE.read_bytes()
        blob = read_blob(data)
        sc = decrypt(blob)
        ok, got = check_offline(data)
        if args.trace:
            print(f"blob @ {BLOB_VA:#x} ({BLOB_LEN} bytes)")
            print(f"key   = {XOR_KEY_CLEAN:#04x} (clean PEB)")
            print(f"enc   = {blob.hex()}")
            print(f"dec   = {sc.hex()}")
            print(f"ascii = {''.join(chr(c) if 32 <= c < 127 else '.' for c in sc)}")
            print(f"pwd   = {got!r}  check={'OK' if ok else 'FAIL'}")
        if args.check:
            if not ok:
                print(f"CHECK FAIL: got {got!r}, expected {PASSWORD!r}", file=sys.stderr)
                return 1
            if not args.quiet:
                print(f"check OK — {got}")
            else:
                print(got)
        if args.run:
            text = run_live(PASSWORD)
            if not args.quiet:
                print(text)
            if "ACCESS GRANTED" not in text:
                print("live FAIL: no ACCESS GRANTED", file=sys.stderr)
                return 1
            if args.quiet and not args.check:
                print(PASSWORD)
            return 0
        return 0 if ok else 1

    if args.quiet:
        print(PASSWORD)
    else:
        print(PASSWORD)
        print(
            "# tip: python3 tools/cfb7-solve.py --check / --run / --trace",
            file=sys.stderr,
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
