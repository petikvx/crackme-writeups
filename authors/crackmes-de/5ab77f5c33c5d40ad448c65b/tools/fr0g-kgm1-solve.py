#!/usr/bin/env python3
"""Keygen — crackmes.de fr0g_kgm1

serial[i] = login[(31-i) % len(login)] ^ TABLE[i]
TABLE = SeRiAlAbCdEfGhIjKlMnOpQrStUvWxYz
Write 32 bytes to /var/tmp/thegame.serial then enter login (>=5).

Usage:
  python3 fr0g-kgm1-solve.py -q --login fr0g1
  python3 fr0g-kgm1-solve.py --check --login fr0g1
"""
from __future__ import annotations
import argparse, os, subprocess, sys
from pathlib import Path
BIN = Path(__file__).resolve().parents[1] / "original" / "kgm1"
TABLE = b"SeRiAlAbCdEfGhIjKlMnOpQrStUvWxYz"
SERIAL_PATH = "/var/tmp/thegame.serial"

def keygen(login: str) -> bytes:
    login_b = login.encode()
    if len(login_b) < 5:
        raise ValueError("login len >= 5")
    return bytes(login_b[(31 - i) % len(login_b)] ^ TABLE[i] for i in range(32))

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--login", default="fr0g1"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    ser = keygen(a.login)
    if a.q:
        sys.stdout.buffer.write(ser); return 0
    if a.check:
        open(SERIAL_PATH, "wb").write(ser)
        out = subprocess.run([str(BIN)], input=(a.login + "\n").encode(), capture_output=True, timeout=2).stdout
        ok = b"Yeh" in out
        print(out.decode(errors="replace").strip()); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print(f"login  : {a.login}")
    print(f"serial : {ser!r} -> {SERIAL_PATH}")
    open(SERIAL_PATH, "wb").write(ser)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
