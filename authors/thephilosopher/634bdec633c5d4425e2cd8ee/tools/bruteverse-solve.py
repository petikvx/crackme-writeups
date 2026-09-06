#!/usr/bin/env python3
"""ThePhilosopher Bruteverse — bruteforce XOR sur .data@0x402000 → clé 0xf3."""
from __future__ import annotations
import argparse, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
BIN=ROOT/"original"/"crackme"
CT=bytes.fromhex("bb968196d39a80d38a9c8681d3959f9294d3c9d3a1c1a5c1a1c6babdc6acc7a0aca1c7c1bfbfc4acb5c1bd")
FLAG="R2V2R5IN5_4S_R42LL7_F2N"
MSG=f"Here is your flag : {FLAG}"

def recover():
    for k in range(256):
        pt=bytes(b^k for b in CT)
        if b"flag" in pt.lower() or b"Here" in pt:
            return k, pt.decode()
    return None, None

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("-q",action="store_true"); ap.add_argument("--check",action="store_true")
    a=ap.parse_args(); k,pt=recover()
    assert k==0xf3 and FLAG in pt
    if a.check:
        print(f"xor key={k:#x}"); print(pt); print("OK"); return 0
    print(FLAG if a.q else f"{FLAG}  # from .data xor 0xf3 (title = brute)")
    return 0
if __name__=="__main__": sys.exit(main())
