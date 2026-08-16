#!/usr/bin/env python3
"""Solveur / démonstrateur de timotei-crackme-06.

PE32, keyfile timotei.crackme#6.enjoy! (13 octets).

Check (objdump 0x401044) :
    (nread & 0xFF) == 0x0D
    edx = dword0 - dword1 + dword2          # little-endian
    edx >= 0x00BC614E                       # 12345678, comparé signé (jl)
    (edx & 0xFF) == buf[12]
    buf[10] == 0x36                         # '6'

Ce script reconstitue le prédicat, écrit un keyfile valide, et tente
Wine si présent (cwd = ce dossier).

Usage :
    python3 timotei-crackme-06-solve.py
    wine timotei-crackme-06.exe
"""

from __future__ import annotations

import struct
import subprocess
import shutil
from pathlib import Path

HERE = Path(__file__).resolve().parent
BINARY = HERE / "timotei-crackme-06.exe"
KEYNAME = "timotei.crackme#6.enjoy!"
KEYPATH = HERE / KEYNAME

NEED = 0x0D  # 13
THRESHOLD = 0x00BC614E  # 12345678
MUST_BYTE10 = 0x36  # '6'

# 13 octets ASCII : dword0==dword1, dword2 contient '6' à l'offset 10,
# low byte de (0-0+dword2) == dernier octet.
FEATURED = b"0000000000600"


def dwords(data: bytes) -> tuple[int, int, int]:
    a, b, c = struct.unpack_from("<III", data, 0)
    return a, b, c


def edx_of(data: bytes) -> int:
    a, b, c = dwords(data)
    return (a - b + c) & 0xFFFFFFFF


def signed32(x: int) -> int:
    return x if x < 0x80000000 else x - 0x100000000


def key_ok(data: bytes) -> bool:
    if len(data) != NEED:
        return False
    edx = edx_of(data)
    if signed32(edx) < THRESHOLD:
        return False
    if (edx & 0xFF) != data[12]:
        return False
    if data[10] != MUST_BYTE10:
        return False
    return True


def make_featured() -> bytes:
    assert key_ok(FEATURED), FEATURED
    return FEATURED


def make_numeric() -> bytes:
    """A=12345678, B=0, C=0x00360000 ('6' au 3e octet), last=dl."""
    a = THRESHOLD
    b = 0
    c = 0x00360000
    edx = (a - b + c) & 0xFFFFFFFF
    return struct.pack("<III", a, b, c) + bytes([edx & 0xFF])


def write_keyfile(blob: bytes = FEATURED) -> Path:
    if not key_ok(blob):
        raise ValueError("blob invalide")
    KEYPATH.write_bytes(blob)
    return KEYPATH


def run_wine() -> None:
    wine = shutil.which("wine") or shutil.which("wine32")
    if not wine:
        print("\n=== live Wine ===")
        print("wine absent — keyfile prêt. Dans ce dossier :")
        print("  wine timotei-crackme-06.exe")
        print("ou copier .exe + keyfile dans VirtualBox.")
        return
    print(f"\n=== live Wine ({wine}) ===")
    try:
        r = subprocess.run(
            [wine, str(BINARY.name)],
            cwd=HERE,
            capture_output=True,
            timeout=6,
            input=b"\n",
        )
        print(f"rc={r.returncode}")
        print("stdout:", r.stdout)
        if r.stderr:
            print("stderr:", r.stderr[:400])
    except subprocess.TimeoutExpired as e:
        print("TIMEOUT (Press any key). sortie :")
        print(e.stdout)


def main() -> None:
    print("=== timotei-crackme-06-solve.py ===")
    print(f"taille exigée     = {NEED} (0x{NEED:x})")
    print(f"seuil edx         = {THRESHOLD} (0x{THRESHOLD:X})")
    print(f"buf[10]           = 0x{MUST_BYTE10:02x} {chr(MUST_BYTE10)!r}")
    print()

    for name, blob in (("featured ASCII", FEATURED), ("numeric 12345678", make_numeric())):
        a, b, c = dwords(blob)
        edx = edx_of(blob)
        print(f"--- {name} {blob!r} ---")
        print(f"  A={a} (0x{a:08x})  B={b} (0x{b:08x})  C={c} (0x{c:08x})")
        print(f"  A-B+C = {edx} (0x{edx:08x}) signed={signed32(edx)}")
        print(f"  dl={edx & 0xFF:#04x} buf[12]={blob[12]:#04x} buf[10]={blob[10]:#04x}")
        print(f"  key_ok = {key_ok(blob)}")

    print("\ncontre-exemples :")
    print("  trop court     ", key_ok(b"short"))
    bad = bytearray(FEATURED)
    bad[10] = ord("7")
    print("  buf[10]='7'    ", key_ok(bytes(bad)))
    bad = bytearray(FEATURED)
    bad[12] ^= 1
    print("  last xor 1     ", key_ok(bytes(bad)))

    path = write_keyfile(FEATURED)
    print(f"\nécrit : {path}  ({path.stat().st_size} o)  hex={path.read_bytes().hex()}")

    if BINARY.is_file():
        run_wine()


if __name__ == "__main__":
    main()
