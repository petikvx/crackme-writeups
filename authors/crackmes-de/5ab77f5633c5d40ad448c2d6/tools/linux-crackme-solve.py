#!/usr/bin/env python3
"""linux_crackme (Level:2) by cyrex — id 5ab77f5633c5d40ad448c2d6.

main @0x8048450 : scanf("%s", buf) puis strcmp(buf, 0x80486a4) ; la constante est en clair
dans .rodata : "47ghf6fh37fbgbgj".

  linux-crackme-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "crackme_01" / "crackme"
OFF = 0x6A4                       # 0x80486a4 - 0x8048000 (rodata dans le premier LOAD)


def password():
    d = BIN.read_bytes()
    return d[OFF:d.index(b"\0", OFF)].decode()


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = password()
    print(pw if a.q else f"password: {pw}")
    if a.check:
        run = lambda s: subprocess.run([str(BIN)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = "Good" in run(pw), "bad" in run("petik")
        print("check:", "OK" if ok and ko else "KO")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
