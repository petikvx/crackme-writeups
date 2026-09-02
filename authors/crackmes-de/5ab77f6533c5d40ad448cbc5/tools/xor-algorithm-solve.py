#!/usr/bin/env python3
"""ksydfius the_xor_algorithm — recover 32-byte KEY + success plaintext.

Known-plaintext (Hawking quote @ VA 0x403000) vs target (@ 0x4030f1):
  out[i] = (plain[i] ^ key[idx]) + idx
  idx'   = out[i] % 32
  idx0   = 0
  len(key) must be 32 (GetDlgItemTextA → eax).

Success MessageBox body (encrypted @ 0x4031ec) decrypts to a string ending
with science_m00nlight.

  python3 xor-algorithm-solve.py -q
  python3 xor-algorithm-solve.py --check
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "_u" / "the_xor_algorithm.exe"

# PE: .data raw 0x800 → VA 0x403000
DATA_OFF = 0x800
PLAIN_OFF = 0x000  # VA 403000
TARGET_OFF = 0x0F1  # VA 4030f1
MSG_OFF = 0x1EC  # VA 4031ec
N = 0xF0
KEY_LEN = 0x20
MSG_LEN = 0x64

KEY = b"Tv8(@*a;FHBADIvhadyfgpar12Af5t[a"
ANSWER = "science_m00nlight"
MSG_PREFIX = b"Great job if you can read this message"


def load_slices(raw: bytes) -> tuple[bytes, bytes, bytes]:
    base = DATA_OFF
    plain = raw[base + PLAIN_OFF : base + PLAIN_OFF + N]
    target = raw[base + TARGET_OFF : base + TARGET_OFF + N]
    msg = raw[base + MSG_OFF : base + MSG_OFF + MSG_LEN]
    if len(plain) != N or len(target) != N or len(msg) != MSG_LEN:
        raise ValueError("unexpected PE .data layout")
    return plain, target, msg


def recover_key(plain: bytes, target: bytes) -> bytes:
    key = [None] * KEY_LEN
    idx = 0
    for i in range(N):
        k = plain[i] ^ ((target[i] - idx) & 0xFF)
        if key[idx] is None:
            key[idx] = k
        elif key[idx] != k:
            raise ValueError(f"key conflict at i={i} idx={idx}")
        idx = target[i] % KEY_LEN
    if any(b is None for b in key):
        raise ValueError("incomplete key")
    return bytes(key)  # type: ignore[arg-type]


def apply_forward(buf: bytearray, key: bytes) -> None:
    idx = 0
    for i in range(len(buf)):
        if buf[i] == 0:
            break
        buf[i] ^= key[idx]
        buf[i] = (buf[i] + idx) & 0xFF
        idx = buf[i] % KEY_LEN


def decrypt_msg(enc: bytes, key: bytes) -> bytes:
    """Inverse of the success-string decrypt loop @ 0x40100c."""
    out = bytearray(enc)
    idx = 0
    for i in range(len(out)):
        orig = out[i]
        out[i] = (out[i] - idx) & 0xFF
        out[i] ^= key[idx]
        idx = orig % KEY_LEN
    return bytes(out)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="print KEY only")
    ap.add_argument("--check", action="store_true", help="verify against PE")
    ap.add_argument("--file", type=Path, default=EXE)
    args = ap.parse_args()

    raw = args.file.read_bytes()
    plain, target, msg_enc = load_slices(raw)
    key = recover_key(plain, target)

    if key != KEY:
        print(f"unexpected key: {key!r}", file=sys.stderr)
        return 1

    if args.q:
        print(key.decode("ascii"))
    else:
        print(f"KEY ({KEY_LEN}): {key.decode('ascii')}")
        plain_msg = decrypt_msg(bytearray(msg_enc), key)
        print(f"MessageBox: {plain_msg.decode('latin1')}")
        print(f"answer tag: {ANSWER}")

    if args.check:
        buf = bytearray(plain)
        apply_forward(buf, key)
        if bytes(buf) != target:
            print("CHECK FAIL: forward transform", file=sys.stderr)
            return 1
        plain_msg = decrypt_msg(bytearray(msg_enc), key)
        if not plain_msg.startswith(MSG_PREFIX) or ANSWER.encode() not in plain_msg:
            print("CHECK FAIL: success message", file=sys.stderr)
            return 1
        if raw[DATA_OFF + N] != 0:
            print("CHECK FAIL: missing NUL after quote", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
