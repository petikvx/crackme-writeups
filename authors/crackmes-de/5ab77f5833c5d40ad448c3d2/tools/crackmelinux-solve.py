#!/usr/bin/env python3
"""Solveur — nobz CrackmeLinux. Password « 0bfu5c4t3D=-_-" » (15 chars)."""
import argparse, subprocess
from pathlib import Path
BIN = Path(__file__).resolve().parents[1] / "original" / "CrackmeLinux"
PASSWORD = '0bfu5c4t3D=-_-"'
def main():
    ap=argparse.ArgumentParser(); ap.add_argument("-q",action="store_true"); ap.add_argument("--check",action="store_true")
    a=ap.parse_args()
    if a.q: print(PASSWORD); return 0
    if a.check:
        out=subprocess.run([str(BIN), PASSWORD], capture_output=True, timeout=2).stdout
        ok=b"Yeah" in out; print(out.decode(errors="replace").strip()); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print("password:", PASSWORD); return 0
if __name__=="__main__": raise SystemExit(main())
