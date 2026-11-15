#!/usr/bin/env python3
"""Keygen pour crackme_med.exe (antilagvip's hard crackme, mini-VM chiffrée).

Serial = 24 caractères de l'alphabet ABCDEFGHJKLMNPQRSTUVWXYZ23456789
(séparateurs ' ', tab, '-' ignorés ; minuscules acceptées).
Les 12 premiers sont libres, les 12 derniers en dépendent.

  ./antilagvip-hard-solve.py                 # moitié libre = "PETKPETKPETK"
  ./antilagvip-hard-solve.py -f ABCDEFGHJKLM # autre moitié libre
  ./antilagvip-hard-solve.py -q              # serial seul
  ./antilagvip-hard-solve.py --check [exe]   # rejoue via wine (xvfb-run)
"""
import argparse, subprocess, shutil, os

M = (1 << 64) - 1
G = 0x9e3779b97f4a7c15
AL = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
TAB = [7, 2, 11, 4, 9, 0, 6, 3, 10, 1, 8, 5]      # .rdata 0x1400bf300


def H(x):  # op HASH : splitmix64 finalizer sur x+G
    z = (x + G) & M
    z = ((z ^ (z >> 30)) * 0xbf58476d1ce4e5b9) & M
    z = ((z ^ (z >> 27)) * 0x94d049bb133111eb) & M
    return z ^ (z >> 31)


def rol(x, n):
    n &= 63
    return ((x << n) | (x >> (64 - n))) & M


def sub1b3(r0, vals):  # sous-routine @0x1b3
    r0 ^= (12 * 0x2545f4914f6cdd1d) & M
    for i, x in enumerate(vals):
        r8 = H(((x + (i + 1) * G) & M) ^ r0)
        r0 = rol(r8, 17) ^ (r8 >> 7)
    return H(r0)


def keygen(first):
    first = first.upper()
    assert len(first) == 12 and all(c in AL for c in first), 'first: 12 car. dans ' + AL
    inp = [ord(c) for c in first]
    r0 = sub1b3(0x8a5cd789635d2dff, inp)                # CALL 1b3 @0x21 (r3=0)
    for i in range((12 & 15) * 0x25 + 0x800):          # 2492 tours
        r0 = H(r0 ^ ((0x94d049bb133111eb + i * 0x9e3779b9) & M))
    r9 = r0
    r6 = sub1b3(r9 ^ 0xd1b54a32d192ed03, inp)           # r3=0 : input[i]
    r6 ^= sub1b3(r9 ^ 0x2545f4914f6cdd1d, inp[::-1])    # r3=1 : input[11-i]
    r4 = H(r6 ^ r9 ^ 0x94d049bb133111eb)
    mem = [AL[(r4 >> (5 * i)) & 31] for i in range(12)]
    out = ""
    for i in range(12):
        y = (H(0x2b992ddfa23249d6 ^ ((i * G) & M)) >> 29) & 31
        out += AL[(AL.index(mem[TAB[i]]) + y) & 31]
    return first + out


def check(serial, exe):
    cmd = ["wine", exe]
    if shutil.which("xvfb-run"):
        cmd = ["xvfb-run", "-a"] + cmd
    r = subprocess.run(cmd, input=serial + "\n", capture_output=True, text=True, timeout=60)
    return r.stdout.strip()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-f", "--first", default="PETKPETKPETK")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="")
    a = ap.parse_args()
    s = keygen(a.first)
    if a.check is not None:
        exe = a.check or os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                      "../analysis/crackme_med.exe")
        print(s, "->", check(s, exe))
    else:
        print(s if a.q else f"serial: {s}")
