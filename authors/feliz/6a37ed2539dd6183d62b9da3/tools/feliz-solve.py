#!/usr/bin/env python3
"""Solveur prorevers.exe (Feliz's crackme) : le mot de passe est un nombre constant.

Usage : feliz-solve.py [-q] [--check EXE]   (--check lance l'exe sous wine/xvfb)
"""
import argparse, shutil, subprocess, sys

def password(tries=3, seed=0x1CDF):
    ecx = (seed * 7 + 0x43) & 0xFFFFFFFF            # lea ecx,[eax*8]; sub ecx,eax; add ecx,0x43
    q = (ecx * 0x4EC4EC4F) >> 36                    # imul + sar edx,4 (ecx positif)
    return "sperma" + str(q * 0xB9A - 0xA5318)       # insert(0,"sperma") : memmove +6 puis memcpy

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    pw = password()
    print(pw if a.q else f"Password: {pw}")
    if a.check:
        cmd = ["xvfb-run", "-a", "wine", a.check]
        out = subprocess.run(cmd, input=pw + "\n\n", capture_output=True, text=True, timeout=60).stdout
        print(out)
        ok = "Incorret" not in out and "fail" not in out
        print("CHECK:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)

main()
