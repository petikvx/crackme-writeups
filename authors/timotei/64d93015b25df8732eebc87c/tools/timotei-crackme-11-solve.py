#!/usr/bin/env python3
"""Solveur / keygen timotei-crackme-11 — 1K-Edition.

GetCommandLineA → 14 derniers caractères (hors NUL) :
  key[4] + digits[10]
    esi = uint32_LE(key)
    n   = parse décimal des 10 chiffres
  @0x401070 : dword[0]^=esi ; byte[4] intact (' ') ; dword[5]^=n
  MessageBoxA(esi+n+1, msg, title, 0)

Solution (Windows + screenshot01) :
  timotei-crackme-11.exe t62O3668101526
  → "Good Work" / "timotei crackme #11 1K-Edition"

Usage :
  python3 timotei-crackme-11-solve.py
  python3 timotei-crackme-11-solve.py --arg
  python3 timotei-crackme-11-solve.py --decode t62O 3668101526
  python3 timotei-crackme-11-solve.py --for-msg 'Good Work'
"""

from __future__ import annotations

import struct
import sys

CIPHER = bytes.fromhex("33595d2b20c1a6d0b100")  # @ 0x401070
TITLE = "timotei crackme #11 1K-Edition"
WIN_KEY = "t62O"
WIN_N = 3668101526
WIN_MSG = "Good Work"


def decode(esi: int, n: int) -> bytes:
    b = bytearray(CIPHER)
    struct.pack_into("<I", b, 0, struct.unpack_from("<I", b, 0)[0] ^ (esi & 0xFFFFFFFF))
    struct.pack_into("<I", b, 5, struct.unpack_from("<I", b, 5)[0] ^ (n & 0xFFFFFFFF))
    return bytes(b)


def text_of(msg: bytes) -> str:
    return msg.split(b"\x00", 1)[0].decode("latin-1", errors="replace")


def encode_for_message(msg: str) -> tuple[str, int, str]:
    """msg ~ 9 caractères, position 4 = espace (imposé comme le binaire)."""
    raw = msg.encode("latin-1")
    clear = bytearray(raw[:9].ljust(9, b"\x00")) + b"\x00"
    clear[4] = 0x20
    esi = struct.unpack_from("<I", CIPHER, 0)[0] ^ struct.unpack_from("<I", clear, 0)[0]
    n = (struct.unpack_from("<I", CIPHER, 5)[0] ^ struct.unpack_from("<I", clear, 5)[0]) & 0xFFFFFFFF
    key = struct.pack("<I", esi & 0xFFFFFFFF).decode("latin-1")
    arg = f"{key}{n:010d}" if n < 10**10 else f"{key}{n}"
    return key, n, arg


def main() -> int:
    args = sys.argv[1:]
    print("=== timotei-crackme-11-solve.py ===")
    print(f"title  : {TITLE}")
    print(f"cipher : {CIPHER.hex()}")
    print()

    if args and args[0] in ("-h", "--help"):
        print(__doc__)
        return 0

    if args and args[0] == "--arg":
        print(f"{WIN_KEY}{WIN_N:010d}")
        return 0

    if args and args[0] == "--decode" and len(args) >= 3:
        key = args[1][:4].ljust(4, "\x00")
        n = int(args[2]) & 0xFFFFFFFF
        esi = struct.unpack("<I", key.encode("latin-1"))[0]
        msg = decode(esi, n)
        print(f"key    : {key!r}")
        print(f"n      : {n}")
        print(f"decoded: {text_of(msg)!r}")
        print(f"hWnd   : {hex((esi + n + 1) & 0xFFFFFFFF)}  (Wine : souvent invalide → pas de boîte)")
        return 0

    if args and args[0] == "--for-msg" and len(args) >= 2:
        key, n, arg = encode_for_message(args[1])
        print(f"message: {args[1]!r}")
        print(f"key    : {key!r}")
        print(f"n      : {n}" + (f" ({n:010d})" if n < 10**10 else " (ne tient pas en 10 digits)"))
        print(f"argv   : {arg}")
        print(f"verify : {text_of(decode(struct.unpack('<I', key.encode('latin-1'))[0], n))!r}")
        return 0

    key, n = WIN_KEY, WIN_N
    arg = f"{key}{n:010d}"
    msg = decode(struct.unpack("<I", key.encode())[0], n)
    text = text_of(msg)
    print("solution (Windows + screenshot01) :")
    print(f"  argv    : {arg}")
    print(f"  message : {text!r}")
    print(f"  caption : {TITLE}")
    print()
    print("Windows :")
    print(f"  timotei-crackme-11.exe {arg}")
    print()
    print("Wine : MessageBoxA(hWnd=esi+n+1) → -1, aucune fenêtre.")
    print("       Utiliser une VM Windows (ou patch hWnd=0, write-up §5).")
    assert text == WIN_MSG
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
