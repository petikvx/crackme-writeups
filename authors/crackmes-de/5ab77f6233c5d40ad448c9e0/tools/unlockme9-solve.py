#!/usr/bin/env python3
"""Unlockme #9 (sharpe) — unlock code / secret stub decrypt.

Hash (code) = fold: h=0; for c in code: h = ROL32(h+c, c)
Decrypt stub [0x4011F2, 0x401236): each dword ^= h; h = ROR32(h, 8)
Target hash 0x4DA8E6BB → stub writes "Secret: Sylvester!" at 0x4031AC.
"""

from __future__ import annotations

import argparse
import itertools
import struct
import sys
from pathlib import Path

TARGET_HASH = 0x4DA8E6BB
SECRET = "Secret: Sylvester!"
EXAMPLE_CODE = "TP6A002v"
STUB_RVA = 0x11F2
STUB_SIZE = 0x44

# Default sample codes (alnum, len 8) that hash to TARGET_HASH
SAMPLE_CODES = (
    "TP6A002v",
    "cR9M00Bx",
    "zQhk00HQ",
    "Z9vc00Rt",
)


def rol32(x: int, n: int) -> int:
    n &= 31
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF


def ror32(x: int, n: int) -> int:
    n &= 31
    return ((x >> n) | (x << (32 - n))) & 0xFFFFFFFF


def hash_code(code: str | bytes) -> int:
    if isinstance(code, str):
        code = code.encode("latin1")
    h = 0
    for c in code:
        h = (h + c) & 0xFFFFFFFF
        h = rol32(h, c)
    return h


def unhash_step(h_after: int, c: int) -> int:
    """Inverse of one hash step (for MITM)."""
    x = ror32(h_after, c)
    return (x - c) & 0xFFFFFFFF


def decrypt_stub(cipher: bytes, h: int) -> bytes:
    out = bytearray(cipher)
    ebx = h & 0xFFFFFFFF
    for i in range(0, len(out), 4):
        d = struct.unpack_from("<I", out, i)[0] ^ ebx
        struct.pack_into("<I", out, i, d)
        ebx = ror32(ebx, 8)
    return bytes(out)


def extract_secret(plaintext: bytes) -> str | None:
    """Parse mov [esi+disp], imm32 chain building the secret string."""
    # Look for C7 06 'Secr' then following C7 46 xx immediates
    marker = b"\xc7\x06Secr"
    idx = plaintext.find(marker)
    if idx < 0:
        marker = b"\xc7\x06" + b"Secr"
        idx = plaintext.find(marker)
    if idx < 0:
        return None
    buf = bytearray(b"Secr")
    p = idx + 6
    while p + 7 <= len(plaintext) and plaintext[p] == 0xC7 and plaintext[p + 1] == 0x46:
        imm = plaintext[p + 3 : p + 7]
        buf.extend(imm)
        p += 7
    return buf.split(b"\x00")[0].decode("latin1", errors="replace")


def load_stub_cipher(pe_path: Path) -> bytes:
    data = pe_path.read_bytes()
    # PE32, .text VA 0x1000 raw 0x400 for this binary — prefer pefile if present
    try:
        import pefile

        pe = pefile.PE(str(pe_path), fast_load=True)
        off = pe.get_offset_from_rva(STUB_RVA)
        return data[off : off + STUB_SIZE]
    except Exception:
        # Fallback: ImageBase 0x400000, .text PointerToRawData 0x400
        off = 0x400 + (STUB_RVA - 0x1000)
        return data[off : off + STUB_SIZE]


def mitm_find_codes(
    target: int = TARGET_HASH,
    length: int = 8,
    charset: bytes | None = None,
    limit: int = 20,
) -> list[str]:
    """Meet-in-the-middle for even lengths (default 8 = 4+4) over alnum."""
    if charset is None:
        charset = (
            b"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        )
    if length < 2 or length % 2:
        raise ValueError("mitm expects even length >= 2")
    half = length // 2
    fwd: dict[int, bytes] = {}
    for pref in itertools.product(charset, repeat=half):
        h = 0
        for c in pref:
            h = (h + c) & 0xFFFFFFFF
            h = rol32(h, c)
        fwd.setdefault(h, bytes(pref))
    found: list[str] = []
    for suf in itertools.product(charset, repeat=half):
        h = target
        for c in reversed(suf):
            h = unhash_step(h, c)
        if h in fwd:
            found.append((fwd[h] + bytes(suf)).decode("ascii"))
            if len(found) >= limit:
                break
    return found


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", "--quiet", action="store_true", help="print secret only")
    ap.add_argument(
        "--code",
        default=EXAMPLE_CODE,
        help=f"unlock code to hash/decrypt (default {EXAMPLE_CODE})",
    )
    ap.add_argument(
        "--check",
        action="store_true",
        help="verify default code decrypts to known secret",
    )
    ap.add_argument(
        "--mitm",
        action="store_true",
        help="search alnum len-8 codes for target hash",
    )
    ap.add_argument(
        "--pe",
        type=Path,
        default=None,
        help="path to nine.exe (default: ../original/nine.exe)",
    )
    args = ap.parse_args()

    here = Path(__file__).resolve().parent
    pe_path = args.pe or (here.parent / "original" / "nine.exe")

    if args.mitm:
        codes = mitm_find_codes()
        for c in codes:
            print(c)
        return 0 if codes else 1

    if args.check:
        cipher = load_stub_cipher(pe_path)
        h = hash_code(EXAMPLE_CODE)
        if h != TARGET_HASH:
            print(f"FAIL hash {h:#010x} != {TARGET_HASH:#010x}", file=sys.stderr)
            return 1
        pt = decrypt_stub(cipher, h)
        secret = extract_secret(pt)
        if secret != SECRET:
            print(f"FAIL secret {secret!r} != {SECRET!r}", file=sys.stderr)
            return 1
        if args.quiet:
            print(SECRET)
        else:
            print(f"code={EXAMPLE_CODE} hash={h:#010x}")
            print(f"secret={SECRET}")
            print("check: OK")
        return 0

    cipher = load_stub_cipher(pe_path)
    h = hash_code(args.code)
    pt = decrypt_stub(cipher, h)
    secret = extract_secret(pt)

    if args.quiet:
        print(secret or "")
        return 0 if secret else 1

    print(f"code={args.code!r} len={len(args.code)} hash={h:#010x}")
    print(f"target_hash={TARGET_HASH:#010x} match={h == TARGET_HASH}")
    if secret:
        print(f"secret={secret}")
    else:
        print("secret=(stub does not look like Secret: … writer)")
        print("plaintext:", pt.hex())
    print("examples:", ", ".join(SAMPLE_CODES))
    return 0 if secret == SECRET or h == TARGET_HASH else 1


if __name__ == "__main__":
    raise SystemExit(main())
