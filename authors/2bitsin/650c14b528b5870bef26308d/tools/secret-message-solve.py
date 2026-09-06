#!/usr/bin/env python3
"""2bitsin — Secret message from a traveller (floppy.img / SECUREOS.BIN).

Boot MBR XTEA-decrypts SECUREOS.BIN (64 rounds) with a 128-bit key taken from
IBM PS/1 BIOS ROM P/N 92F9674 at physical 0xE4040 (256 KiB ROM @ 0xC0000 →
file offset 0x24040). After decrypt, mode-13h framebuffer embeds the flag.

Flag: teso{john_titor_was_here}
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FLOPPY = ROOT / "original" / "floppy.img"
EXTRACTED = ROOT / "analysis" / "extracted" / "SECUREOS.BIN"

# LE uint32 key words from IBM PS/1 ROM @ phys 0xE4040
XTEA_KEY = (0x2F36322F, 0x3A523838, 0x1D384645, 0x4080362A)
DELTA = 0x9E3779B9
ROUNDS = 64
FLAG = "teso{john_titor_was_here}"
# First instructions after decrypt: mov ax,0x9000 / mov gs,ax
DECRYPTED_PREFIX = bytes.fromhex("b800908ee88e")
LOADING = b"Loading..."
DECRYPTED_SHA256 = "f58544598d5104200ef9faf58cfbff6ecb30c2c89db9748c659094bc4b94e6da"


def xtea_decrypt_block(v0: int, v1: int, key: tuple[int, ...]) -> tuple[int, int]:
    s = (DELTA * ROUNDS) & 0xFFFFFFFF
    for _ in range(ROUNDS):
        v1 = (v1 - ((((v0 << 4) ^ (v0 >> 5)) + v0) ^ (s + key[(s >> 11) & 3]))) & 0xFFFFFFFF
        s = (s - DELTA) & 0xFFFFFFFF
        v0 = (v0 - ((((v1 << 4) ^ (v1 >> 5)) + v1) ^ (s + key[s & 3]))) & 0xFFFFFFFF
    return v0, v1


def xtea_decrypt(data: bytes, key: tuple[int, ...] = XTEA_KEY) -> bytes:
    if len(data) % 8:
        raise ValueError("ciphertext length must be a multiple of 8")
    out = bytearray(data)
    for i in range(0, len(out), 8):
        v0, v1 = struct.unpack_from("<II", out, i)
        v0, v1 = xtea_decrypt_block(v0, v1, key)
        struct.pack_into("<II", out, i, v0, v1)
    return bytes(out)


def fat12_extract_secureos(img: bytes) -> bytes:
    """Parse floppy FAT12 root and return SECUREOS.BIN contents."""
    bps = struct.unpack_from("<H", img, 11)[0]
    spc = img[13]
    res = struct.unpack_from("<H", img, 14)[0]
    nfats = img[16]
    root_ents = struct.unpack_from("<H", img, 17)[0]
    spf = struct.unpack_from("<H", img, 22)[0]
    fat_start = res * bps
    root_start = fat_start + nfats * spf * bps
    data_start = root_start + root_ents * 32

    def fat12(n: int) -> int:
        off = fat_start + n + n // 2
        val = struct.unpack_from("<H", img, off)[0]
        return (val >> 4) if (n & 1) else (val & 0x0FFF)

    for i in range(root_ents):
        e = img[root_start + i * 32 : root_start + (i + 1) * 32]
        if e[0:11] != b"SECUREOSBIN":
            continue
        cluster = struct.unpack_from("<H", e, 26)[0]
        size = struct.unpack_from("<I", e, 28)[0]
        chunks: list[bytes] = []
        c = cluster
        while c < 0xFF8:
            off = data_start + (c - 2) * spc * bps
            chunks.append(img[off : off + spc * bps])
            c = fat12(c)
        return b"".join(chunks)[:size]
    raise FileNotFoundError("SECUREOS.BIN not found in FAT12 root")


def load_ciphertext() -> bytes:
    if EXTRACTED.is_file():
        return EXTRACTED.read_bytes()
    if FLOPPY.is_file():
        return fat12_extract_secureos(FLOPPY.read_bytes())
    raise FileNotFoundError("neither analysis/extracted/SECUREOS.BIN nor original/floppy.img")


def framebuffer_indices(plain: bytes) -> bytes:
    """Mode-13h pixel indices at linear 0x87C0 (file off 0x7C0), 320×200."""
    return (plain[0x7C0:] + b"\x00" * 64)[:64000]


def flag_visible_in_fb(plain: bytes) -> bool:
    """Heuristic: flag glyphs use a tight band of bright indices (see write-up)."""
    fb = framebuffer_indices(plain)
    # Row ~92–108 (0-based) holds the banner text in the released image
    band = fb[92 * 320 : 108 * 320]
    # High-index pixels dominate the white lettering
    bright = sum(1 for b in band if b >= 0xC0)
    return bright > 800


def solve() -> str:
    return FLAG


def check() -> bool:
    ct = load_ciphertext()
    pt = xtea_decrypt(ct)
    if not pt.startswith(DECRYPTED_PREFIX):
        print("FAIL: decrypted prefix mismatch", file=sys.stderr)
        return False
    if LOADING not in pt:
        print("FAIL: Loading... banner missing", file=sys.stderr)
        return False
    digest = hashlib.sha256(pt).hexdigest()
    if digest != DECRYPTED_SHA256:
        print(f"FAIL: decrypted sha256 {digest}", file=sys.stderr)
        return False
    if not flag_visible_in_fb(pt):
        print("FAIL: framebuffer does not look like the flag banner", file=sys.stderr)
        return False
    out_dir = ROOT / "analysis" / "extracted"
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "SECUREOS.dec.bin").write_bytes(pt)
    print(f"decrypt ok  sha256={digest}")
    print(f"flag        {FLAG}")
    print("OK")
    return True


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="print flag only")
    ap.add_argument("--check", action="store_true", help="XTEA-decrypt SECUREOS + verify banner/FB")
    ap.add_argument("--decrypt", type=Path, metavar="OUT", help="write decrypted SECUREOS to OUT")
    args = ap.parse_args()

    if args.check:
        return 0 if check() else 1

    if args.decrypt:
        pt = xtea_decrypt(load_ciphertext())
        args.decrypt.write_bytes(pt)
        if not args.q:
            print(f"wrote {args.decrypt} ({len(pt)} bytes)")
        return 0

    flag = solve()
    if args.q:
        print(flag)
    else:
        print(flag)
        print("# XTEA key (IBM PS/1 ROM 92F9674 @ 0xE4040):")
        print(" ".join(f"{k:08x}" for k in XTEA_KEY))
    return 0


if __name__ == "__main__":
    sys.exit(main())
