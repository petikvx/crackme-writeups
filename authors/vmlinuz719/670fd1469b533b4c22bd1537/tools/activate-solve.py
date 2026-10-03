#!/usr/bin/env python3
"""Product Activation — vmlinuz719.

La clé est le flux d'un mélangeur 16 bits de la ROM `libcerberus.so`,
pas un mot de passe stocké. État initial 0xC1A5, table à l'offset fichier 0x204.
Chaque tour :

    x ^= x >> 7
    x ^= x << 9
    x ^= x >> 13
    x &= 0xFFFF
    octet = ((x >> 8) ^ x) & 0xFF
    octet ^= table[i]

On s'arrête sur l'octet 0, qui correspond au NUL posé après la saisie.
"""

from __future__ import annotations

import argparse
import os
import select
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROM = ROOT / "original" / "libcerberus.so"
BIN = ROOT / "original" / "activate"
TABLE_OFF = 0x204
SEED = 0xC1A5


def key_bytes(rom: bytes | None = None) -> bytes:
    if rom is None:
        rom = ROM.read_bytes()
    x = SEED
    out = bytearray()
    for i in range(len(rom) - TABLE_OFF):
        x ^= x >> 7
        x ^= (x << 9) & 0xFFFFFFFFFFFFFFFF
        x ^= x >> 13
        x &= 0xFFFF
        byte = (((x >> 8) ^ x) & 0xFF) ^ rom[TABLE_OFF + i]
        if byte == 0:
            break
        out.append(byte)
    else:
        raise RuntimeError("la table ne produit pas l'octet 0")
    return bytes(out)


def run_activate(payload: bytes, timeout: float = 5.0) -> tuple[int, bytes]:
    """Lance ./activate depuis original/ sur un pty. Un pipe casse tcsetattr."""
    if not os.access(BIN, os.X_OK):
        raise SystemExit(f"{BIN} n'est pas exécutable (chmod +x)")
    master, slave = os.openpty()
    proc = subprocess.Popen(
        [str(BIN)],
        cwd=str(BIN.parent),
        stdin=slave,
        stdout=slave,
        stderr=slave,
        close_fds=True,
    )
    os.close(slave)
    buf = b""
    sent = False
    deadline = time.monotonic() + timeout

    def drain() -> bool:
        nonlocal buf
        got = False
        while True:
            ready, _, _ = select.select([master], [], [], 0.05)
            if not ready:
                return got
            try:
                chunk = os.read(master, 4096)
            except OSError:
                return got
            if not chunk:
                return got
            buf += chunk
            got = True

    try:
        while time.monotonic() < deadline:
            drain()
            if not sent and b"Enter key:" in buf:
                time.sleep(0.2)
                os.write(master, payload)
                sent = True
                continue
            if sent and (b"successful" in buf or b"piracy" in buf or proc.poll() is not None):
                time.sleep(0.15)
                drain()
                break
        else:
            proc.kill()
        try:
            rc = proc.wait(timeout=2)
        except subprocess.TimeoutExpired:
            proc.kill()
            rc = proc.wait(timeout=2)
        drain()
    finally:
        os.close(master)
    return rc, buf


def _shows_fail(buf: bytes) -> bool:
    return b"software piracy" in buf and b"successful" not in buf


def check(key: bytes) -> int:
    cases = (
        ("ok", key + b"\r", True),
        ("ko", key[:-1] + b"4" + b"\r", False),
        ("ko", key.lower() + b"\r", False),
    )
    failed = False
    for label, payload, want_ok in cases:
        rc, buf = run_activate(payload)
        good = rc == 0 and b"Product activation successful" in buf
        passed = good if want_ok else _shows_fail(buf)
        text = buf.decode("ascii", "replace").replace("\r", "\\r").replace("\n", "\\n")
        print(f"{label} exit={rc} {text}")
        if not passed:
            failed = True
    return 1 if failed else 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Clé Product Activation")
    parser.add_argument("-q", action="store_true", help="n'écrire que la clé")
    parser.add_argument("--check", action="store_true", help="pty contre original/activate")
    args = parser.parse_args()
    key = key_bytes()
    text = key.decode("ascii")
    if args.q and not args.check:
        print(text)
        return 0
    if not args.q:
        print(text)
    if args.check:
        return check(key)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
