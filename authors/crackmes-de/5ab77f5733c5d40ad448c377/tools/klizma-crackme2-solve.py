#!/usr/bin/env python3
"""KLiZMA CrackMe#2 (FSG) : ID entier -> 3 serials.  Usage: klizma-crackme2-solve.py [-q] [--check exe] [ID]"""
import argparse, subprocess, sys

def tdiv(a, b):  # division C (troncature vers 0)
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q

def s32(v):
    v &= 0xFFFFFFFF
    return v - (1 << 32) if v & 0x80000000 else v

def serials(x):
    s1 = s32(3 * tdiv(x, 2) + 0x50A5D)
    s2 = tdiv(tdiv(s1, 3) + 0x40564, 2)
    s3 = tdiv(s32(s1 + x + s2), 11)
    return s1, s2, s3

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("id", nargs="?", type=int, default=12345)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance le binaire via xvfb-run wine")
    a = ap.parse_args()
    s = serials(a.id)
    if a.q:
        print(*s)
    else:
        print(f"ID={a.id}  serial1={s[0]}  serial2={s[1]}  serial3={s[2]}")
    if a.check:
        inp = "\n".join(map(str, (a.id,) + s)) + "\n"
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=inp, capture_output=True, text=True, timeout=60)
        ok = "Very good" in r.stdout
        print(r.stdout.strip().splitlines()[-1] if r.stdout.strip() else "", "=> OK" if ok else "=> KO")
        sys.exit(0 if ok else 1)

main()
