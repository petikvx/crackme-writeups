#!/usr/bin/env python3
"""Solveur — Tempesta's Lord Winderton (PE32 console / MASM).

Serial = 16 caractères hex. Après décode nibble-in-place, chaque nibble
doit vérifier le prédicat pair/impair (@0x401041), jusqu'au premier 0
(traité comme NUL → succès anticipé).

Charset « propre » (sans s'appuyer sur le bug NUL) : 2 5 7 d f
(également D/F en entrée — normalisés par le décodeur).

Usage :
  python3 lord-winderton-solve.py -q
  python3 lord-winderton-solve.py --check
  python3 lord-winderton-solve.py --check 0000000000000000
"""

from __future__ import annotations

import argparse
import os
import pty
import random
import select
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "LordWinderton.exe"

# Nibbles qui passent le prédicat (hors 0 = terminateur)
VALID_NIBBLES = (0x2, 0x5, 0x7, 0xD, 0xF)
DEFAULT_SERIAL = "ffffffffffffffff"
SUCCESS = "Valid!!!"
FAIL = "Not valid"


def nibble_ok(v: int) -> bool:
    """Rejoue le check @0x401041 pour un nibble 0..15 (0 = stop, pas testé)."""
    if v == 0:
        return True
    eax = v & 0xFF
    if (eax & 1) == 0:
        dl = eax
        eax ^= 0xDEAD
        eax = (eax + 0xBABE) & 0xFFFFFFFF
        eax >>= 4
        eax = (eax + dl) & 0xFFFFFFFF
    else:
        eax ^= 0x1A
        eax |= 0xA
        eax ^= 0x1987
    return eax == 0x1998


def hex_decode_ok(s: str) -> bool:
    if len(s) != 16:
        return False
    out: list[int] = []
    for c in s:
        if "0" <= c <= "9":
            out.append(ord(c) - 0x30)
        elif "A" <= c <= "F":
            out.append(ord(c) - 0x41 + 10)
        elif "a" <= c <= "f":
            out.append(ord(c) - 0x61 + 10)
        else:
            return False
    return True


def predicate_ok(s: str) -> bool:
    """True ssi le binaire accepterait ce serial (longueur + hex + check)."""
    if not hex_decode_ok(s):
        return False
    for c in s:
        if "0" <= c <= "9":
            v = ord(c) - 0x30
        elif "A" <= c <= "F":
            v = ord(c) - 0x41 + 10
        else:
            v = ord(c) - 0x61 + 10
        if v == 0:
            return True
        if not nibble_ok(v):
            return False
    return True


def keygen(rng: random.Random | None = None) -> str:
    """16 hex depuis le charset propre 257df."""
    rng = rng or random.SystemRandom()
    return "".join(f"{rng.choice(VALID_NIBBLES):x}" for _ in range(16))


def run_wine(serial: str, timeout: float = 6.0) -> str:
    """Wine + PTY (ReadFile console + printf msvcrt)."""
    if not BIN.is_file():
        raise FileNotFoundError(BIN)
    env = {**os.environ, "WINEDEBUG": "-all", "TERM": "xterm"}
    master, slave = pty.openpty()
    proc = subprocess.Popen(
        ["wine", str(BIN)],
        stdin=slave,
        stdout=slave,
        stderr=slave,
        env=env,
        close_fds=True,
    )
    os.close(slave)
    out = b""
    end = time.time() + timeout
    sent_serial = False
    sent_key = False
    try:
        while time.time() < end and proc.poll() is None:
            r, _, _ = select.select([master], [], [], 0.15)
            if master in r:
                try:
                    chunk = os.read(master, 4096)
                except OSError:
                    break
                if not chunk:
                    break
                out += chunk
            if (not sent_serial) and b"serial" in out.lower():
                time.sleep(0.08)
                os.write(master, serial.encode("ascii") + b"\r")
                sent_serial = True
            if sent_serial and (not sent_key) and (
                SUCCESS.encode() in out or FAIL.encode() in out or b"Shoot" in out
            ):
                time.sleep(0.05)
                os.write(master, b"x")
                sent_key = True
                time.sleep(0.15)
                break
        t2 = time.time() + 0.4
        while time.time() < t2:
            r, _, _ = select.select([master], [], [], 0.1)
            if master in r:
                try:
                    chunk = os.read(master, 4096)
                except OSError:
                    break
                if not chunk:
                    break
                out += chunk
            elif proc.poll() is not None:
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


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="serial only")
    ap.add_argument(
        "--check",
        nargs="?",
        const=DEFAULT_SERIAL,
        metavar="SERIAL",
        help=f"prédicat + Wine (défaut {DEFAULT_SERIAL})",
    )
    ap.add_argument("--keygen", action="store_true", help="serial aléatoire (charset 257df)")
    args = ap.parse_args()

    serial = keygen() if args.keygen else DEFAULT_SERIAL

    if args.check is not None:
        serial = args.check
        ok_pred = predicate_ok(serial)
        print(f"predicate({serial}) = {'OK' if ok_pred else 'FAIL'}")
        if not ok_pred:
            return 1
        try:
            out = run_wine(serial)
        except FileNotFoundError as e:
            print(e, file=sys.stderr)
            return 1
        live = SUCCESS in out
        print(out.replace("\r", "").strip())
        print(f"wine -> {'OK' if live else 'FAIL'}")
        return 0 if live else 1

    if args.q:
        print(serial)
    else:
        print(f"serial: {serial}")
        print(f"charset: {''.join(f'{n:x}' for n in VALID_NIBBLES)} (len 16)")
        print("note: un nibble 0 après décode = NUL → succès anticipé (ex. 0000…0000)")
        print("run: python3 tools/lord-winderton-solve.py --check")
    return 0


if __name__ == "__main__":
    sys.exit(main())
