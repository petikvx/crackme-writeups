#!/usr/bin/env python3
"""Keygen/patch-free solveur : génère license.key pour SoftwareBreaker's License Checker.

Format (40 octets) : name[32] (NUL-padded) | "KIRA" | checksum u8 | 3 octets libres.
Le nom doit être exactement "SoftwareBreaker" (strcmp codé en dur) : pas de keygen
par utilisateur possible (petik est rejeté, voir --name pour tester).
Usage : softwarebreaker-solve.py [-q] [--name N] [-o license.key] [--check BIN]
"""
import argparse, os, subprocess, sys, tempfile

KEY = b"P@s$w0r(|12345"

def checksum(name: bytes) -> int:
    return sum(KEY[i % len(KEY)] ^ c for i, c in enumerate(name[:32])) & 0xFF

def build(name: bytes) -> bytes:
    return name.ljust(32, b"\0") + b"KIRA" + bytes([checksum(name)]) + b"\0\0\0"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default="SoftwareBreaker")
    ap.add_argument("-o", default="license.key")
    ap.add_argument("--check", metavar="BIN", help="lance le binaire dans un tmpdir")
    a = ap.parse_args()
    data = build(a.name.encode())
    if a.check:
        with tempfile.TemporaryDirectory() as d:
            open(os.path.join(d, "license.key"), "wb").write(data)
            r = subprocess.run([os.path.abspath(a.check)], cwd=d, capture_output=True, text=True)
            print(r.stdout, end="")
            sys.exit(0 if "Access Granted" in r.stdout else 1)
    open(a.o, "wb").write(data)
    if not a.q:
        print(f"{a.o}: {data.hex()}")
if __name__ == "__main__":
    main()
