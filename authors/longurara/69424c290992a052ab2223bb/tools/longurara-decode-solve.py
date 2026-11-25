#!/usr/bin/env python3
"""Solveur decode-password.exe (longurara) : password[i] = (secret[i]-i) ^ 0x55."""
import argparse, subprocess, sys
SECRET = [0x2c,0x3b,0x22,0x40,0x38,0x28,0x36,0x38,0x38,0x3f,0x44,0x3c,0x3c,0x3e,0x4a,0x30,0x84]
def solve(): return bytes(((s - i) ^ 0x55) & 0xff for i, s in enumerate(SECRET)).decode('latin1')
if __name__ == '__main__':
    ap = argparse.ArgumentParser(); ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', metavar='EXE', help='lance le binaire sous wine')
    a = ap.parse_args(); p = solve()
    print(p if a.q else f'password = {p!r}')
    if a.check:
        r = subprocess.run(['xvfb-run','-a','wine',a.check], input=p.encode('latin1')+b'\n\n', capture_output=True, timeout=120)
        print(r.stdout.decode('latin1', 'replace'))
