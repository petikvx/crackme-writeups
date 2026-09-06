#!/usr/bin/env python3
"""crackme.03.32 (geyslan) — patchme ELF32 handcrafted.

Badboy : « Try to find the string of success… »
Succès : décrypte 9 octets @0x10030 → « \\x90Omedetou », skip 1er octet,
         write(1, "Omedetou\\n").

Patch minimal (copie sous analysis/) :
  file+0x84 : jnz → jz  (0x75 → 0x74)  # après checksums header, enter decrypt
  file+0x172.. : recalcule sum32([0..0x172)) pour le 2e checksum

Usage:
  python3 tools/crackme03-solve.py -q
  python3 tools/crackme03-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "original" / "crackme.03.32"
OUT = ROOT / "analysis" / "crackme.03.32.patched"

SUCCESS = "Omedetou"
ENC_OFF = 0x30
ENC_LEN = 9
PATCH_OFF = 0x84  # jnz short → jz short
CSUM_END = 0x172


def decrypt_blob(data: bytes | bytearray) -> bytes:
    arr = list(data[ENC_OFF : ENC_OFF + ENC_LEN])
    for i in range(8):
        arr[i + 1] = ((arr[i + 1] - 9) ^ 0xAC ^ arr[i]) & 0xFF
    return bytes(arr)


def success_string(data: bytes | bytearray | None = None) -> str:
    raw = decrypt_blob(data if data is not None else SRC.read_bytes())
    # 1er octet junk ; le binaire fait `inc esp` avant write
    return raw[1:].decode("ascii")


def patch(src: Path = SRC, dst: Path = OUT) -> Path:
    data = bytearray(src.read_bytes())
    if data[PATCH_OFF] not in (0x75, 0x74):
        raise SystemExit(f"unexpected opcode @ {PATCH_OFF:#x}: {data[PATCH_OFF]:02x}")
    data[PATCH_OFF] = 0x74  # jz
    csum = sum(data[:CSUM_END]) & 0xFFFFFFFF
    # dword lu en mémoire ; fichier tronqué → high words 0 via mapping
    data[CSUM_END : CSUM_END + 2] = (csum & 0xFFFF).to_bytes(2, "little")
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    os.chmod(dst, 0o755)
    return dst


def live_check(exe: Path) -> tuple[bool, str]:
    try:
        r = subprocess.run([str(exe)], capture_output=True, timeout=3)
    except OSError as e:
        return False, f"exec failed: {e}"
    out = (r.stdout or b"").decode("latin1", "replace")
    return SUCCESS in out and "Try to find" not in out, out.strip()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="string de succès seule")
    ap.add_argument("--check", action="store_true", help="patch + run live")
    args = ap.parse_args()

    msg = success_string()
    if args.q:
        print(msg)
        return 0

    print(f"success string : {msg}")
    out = patch()
    print(f"patched        → {out}")
    print("patch          : jnz@0x84 → jz ; fix sum @0x172")

    if args.check:
        ok, text = live_check(out)
        print(f"live           : {text!r}")
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
