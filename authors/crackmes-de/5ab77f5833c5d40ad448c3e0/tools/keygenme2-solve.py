#!/usr/bin/env python3
"""Keygenme # 2 (starzboy) : keygen.  Usage: keygenme2-solve.py [--user petik] [--id 12345] [-q] [--check EXE]"""
import argparse, subprocess, sys

def password(name: str, uid: int) -> int:
    # main @0x401536 : pour chaque octet c (movsx) du nom :
    #   t = (c + 0x32a6c65) + 2*uid*uid + 0x2d67a23 ; acc += t   (32 bits)
    acc = 0
    for c in name.encode():
        c = c - 256 if c > 127 else c
        acc = (acc + c + 0x32A6C65 + 2 * uid * uid + 0x2D67A23) & 0xFFFFFFFF
    return acc - (1 << 32) if acc >= 1 << 31 else acc   # lu via operator>>(long)

ap = argparse.ArgumentParser()
ap.add_argument("--user", "--name", default="petik")
ap.add_argument("--id", type=int, default=12345)
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", metavar="EXE", help="lance le binaire (wine) et vérifie")
a = ap.parse_args()
pw = password(a.user, a.id)
if a.q:
    print(pw)
else:
    print(f"User-Name : {a.user}\nUser-ID   : {a.id}\nPassword  : {pw}")
if a.check:
    out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{a.user}\n{a.id}\n{pw}\n",
                         capture_output=True, text=True, timeout=120).stdout
    ok = "Access Granted" in out
    print("CHECK:", "OK" if ok else "KO"); sys.exit(0 if ok else 1)
