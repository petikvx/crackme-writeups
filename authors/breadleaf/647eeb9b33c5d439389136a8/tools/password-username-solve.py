#!/usr/bin/env python3
"""breadleaf Password and Username guess

user + password (espace). OK ssi len(password) == Σ ord(user[i]).

Exemple petik → password de longueur 541.
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
BIN=ROOT/"original"/"crackMe"
DEFAULT_USER="petik"

def keygen(user: str) -> str:
    return "x" * sum(map(ord, user))

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("-q",action="store_true"); ap.add_argument("--user",default=DEFAULT_USER)
    ap.add_argument("--check",action="store_true")
    a=ap.parse_args(); pw=keygen(a.user)
    if a.check:
        r=subprocess.run([str(BIN)],input=f"{a.user} {pw}\n".encode(),capture_output=True)
        print((r.stdout+r.stderr).decode().strip()); ok=b"y" in r.stdout.split()[-1:]; print(f"{a.user} len(pw)={len(pw)} -> {'OK' if b'\\ny' in r.stdout or r.stdout.endswith(b'y\\n') or b' y\\n' in r.stdout or r.stdout.strip().endswith(b'y') else 'FAIL'}")
        # simpler
        ok = b"y" in r.stdout and b"n" not in r.stdout.split(b":")[-1]
        print("OK" if ok else "FAIL", r.stdout); return 0 if ok else 1
    if a.q: print(len(pw))
    else: print(f"user={a.user!r} password_len={len(pw)} (any chars)")
    return 0
if __name__=="__main__": sys.exit(main())
