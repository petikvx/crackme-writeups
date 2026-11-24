#!/usr/bin/env python3
"""MAS's Gadget : flag = b64decode( unhex(CIBLE) XOR (98 df)* ).

Sans argument : lit la cible dans chall.exe (extrait de original/gadget.zip, jamais modifié).
  gadget-solve.py [-q] [--check]   (--check : rejoue le flag dans chall.exe via xvfb-run wine)
"""
import argparse, base64, os, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "gadget.zip")
KEY = bytes([0x98, 0xDF])          # .rdata 0x14000a101
TARGET_VA, TARGET_LEN = 0x14000A110, 88   # hex ASCII attendu
RDATA_VA, RDATA_RAW = 0x14000A000, 0x7A00  # .rdata : VA -> offset fichier


def solve(exe: bytes) -> str:
    off = RDATA_RAW + (TARGET_VA - RDATA_VA)
    cible = bytes.fromhex(exe[off:off + TARGET_LEN].decode())
    b64 = bytes(c ^ KEY[i % 2] for i, c in enumerate(cible))
    return base64.b64decode(b64).decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    with tempfile.TemporaryDirectory() as d:
        with zipfile.ZipFile(ZIP) as z:
            z.extractall(d, pwd=b"crackmes.one")
        flag = solve(open(os.path.join(d, "chall.exe"), "rb").read())
        print(flag if a.q else f"flag = {flag}")
        if a.check:
            r = subprocess.run(["xvfb-run", "-a", "wine", "chall.exe"], cwd=d, input=flag + "\n",
                               capture_output=True, text=True, timeout=90)
            ok = "Correct!" in r.stdout
            print("check:", "Correct!" if ok else "Wrong!")
            sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
