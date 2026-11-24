#!/usr/bin/env python3
"""talhasa's Simple VM Crackme — la clé saisie est XORée avec 0x11 par la VM puis comparée à "r!cCtre0".

Pas de user/login : la clé est fixe (exemple petik non applicable).
Usage : talhasa-solve.py [-q] [--check <vm.exe>]
"""
import argparse, subprocess, shutil, sys

TARGET = b"r!cCtre0"   # .rdata 0x1400033d8
XOR_KEY = 0x11         # bytecode VM : 02 05 11

def solve():
    return bytes(b ^ XOR_KEY for b in TARGET).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe sous Wine (xvfb) avec la clé")
    a = ap.parse_args()
    key = solve()
    if a.q:
        print(key)
    else:
        print(f"clé : {key}   (= {TARGET.decode()!r} ^ 0x{XOR_KEY:02x})")
    if a.check:
        cmd = ["wine", a.check]
        if shutil.which("xvfb-run"):
            cmd = ["xvfb-run", "-a"] + cmd
        out = subprocess.run(cmd, input=key + "\n", capture_output=True, text=True, timeout=60).stdout
        ok = "Key is correct" in out
        print("check :", "OK" if ok else "KO", "|", out.strip().splitlines()[-1] if out.strip() else "")
        sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
