#!/usr/bin/env python3
"""Ximxn perwira — password strcmp en clair: 3108{r3nt4p} (Rentap leet)."""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
BIN=ROOT/"original"/"perwira"
PW="3108{r3nt4p}"
def main():
    ap=argparse.ArgumentParser(); ap.add_argument("-q",action="store_true"); ap.add_argument("--check",action="store_true")
    a=ap.parse_args()
    if a.check:
        r=subprocess.run([str(BIN)],input=(PW+"\n").encode(),capture_output=True)
        print((r.stdout+r.stderr).decode().strip()); ok=b"correct" in r.stdout.lower(); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print(PW if a.q else f"{PW}  # pejuang Sarawak / Rentap")
    return 0
if __name__=="__main__": sys.exit(main())
