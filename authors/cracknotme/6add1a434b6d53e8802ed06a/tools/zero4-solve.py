#!/usr/bin/env python3
"""Zero4 (CrackNotMe) : pw[i] = table[i] ^ ((i*7+0x5a)&0xff), 71 octets.
Usage: zero4-solve.py [-q] [--exe original/Zero4.exe] [--check]"""
import sys, argparse, subprocess, os
VA_T1, VA_T2, BASE, RVA_RDATA, OFF_RDATA = 0x1400213e0, 0x140021430, 0x140000000, 0x21000, 0x1fc00
def rd(b, va, n):
    o = va - BASE - RVA_RDATA + OFF_RDATA
    return b[o:o+n]
def solve(exe):
    b = open(exe, 'rb').read()
    t = rd(b, VA_T1, 0x47)
    pw = bytes(t[i] ^ ((i*7 + 0x5a) & 0xff) for i in range(0x47))
    t2 = rd(b, VA_T2, 0x2b5)
    msg = bytes((((i % 256 - 7) & 0xff) * 13 & 0xff) ^ pw[i % 0x47] ^ t2[i] for i in range(0x2b5))
    return pw.decode(), msg
if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--exe', default=os.path.join(os.path.dirname(__file__), '..', 'original', 'Zero4.exe'))
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    pw, msg = solve(a.exe)
    print(pw)
    if not a.q: print(msg.decode(errors='replace'))
    if a.check:
        out = subprocess.run(['xvfb-run', '-a', 'wine', a.exe], input=(pw + '\r\n').encode(),
                             capture_output=True, timeout=60).stdout.decode(errors='replace')
        print(out); sys.exit(0 if 'Wrong password' not in out else 1)
