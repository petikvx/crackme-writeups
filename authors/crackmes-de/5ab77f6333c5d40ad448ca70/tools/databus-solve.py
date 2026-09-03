#!/usr/bin/env python3
"""databus_keygenme1 — name → serial AAAAAAAA-BBBBBBBB (uppercase hex).

Constraints: len(name) >= 5 and even. Default example: petikk (petik is odd).
"""
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "_u" / "keygenme1.exe"
K = 0xDDCCBBAA  # dword at .data 0x403218


def checksum(name: bytes) -> int:
    total = 0
    for ecx in range(len(name), 0, -1):
        total += name[ecx - 1] + ecx
    return total & 0xFFFFFFFF


def nibble_ok(ecx: int) -> bool:
    edi = 0
    while True:
        if (ecx & 0xFF) == 0:
            break
        ecx = (ecx >> 4) & 0xFFFFFFFF
        edi += 1
        if edi == 8:
            break
    return ecx == 0


def keygen(name: str) -> str:
    nb = name.encode("latin1")
    if len(nb) < 5 or len(nb) % 2:
        raise ValueError("name length must be >= 5 and even")
    cs = checksum(nb)
    a = (cs + K) & 0xFFFFFFFF
    b = (2 * a) & 0xFFFFFFFF
    if not (nibble_ok(a) and nibble_ok(b)):
        raise ValueError("nibble check failed for this name (try another)")
    return f"{a:08X}-{b:08X}"


def wine_check(name: str, serial: str) -> bool:
    helper = Path(__file__).resolve().parent / "databus_gui_check.exe"
    subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
    time.sleep(0.3)
    p = subprocess.Popen(
        ["wine", str(EXE)],
        env={**__import__("os").environ, "WINEDEBUG": "-all"},
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    try:
        time.sleep(1.4)
        r = subprocess.run(
            ["wine", str(helper), name, serial],
            capture_output=True,
            env={**__import__("os").environ, "WINEDEBUG": "-all"},
            timeout=20,
        )
        out = r.stdout.decode("latin1", "replace")
        print(out.strip())
        return "Good job" in out
    finally:
        subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
        try:
            p.wait(timeout=2)
        except Exception:
            p.kill()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", "--name", default="petikk", dest="user")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    try:
        serial = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 2
    if args.check:
        ok = wine_check(args.user, serial)
        print("check:", "OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(serial)
    else:
        print(f"{args.user} → {serial}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
