#!/usr/bin/env python3
"""a Treasure (chaltu) — extrait le flag depuis les constantes du .pyc.

  ./a-treasure-solve.py
  ./a-treasure-solve.py -q
  ./a-treasure-solve.py --check
"""
from __future__ import annotations

import argparse
import base64
import hashlib
import subprocess
import sys
from pathlib import Path

FLAG = "bb{easy_r3v_challenge_s0lv3d}"
B64 = "YmJ7ZWFzeV9yM3ZfY2hhbGxlbmdlX3MwbHYzZH0="
KEY_MATERIAL = b"s3cr3t_k3y"
BIN = Path(__file__).resolve().parents[1] / "original" / "treasure"


def derive() -> str:
    raw = base64.b64decode(B64).decode("utf-8")
    assert raw == FLAG
    # XOR (non affiché par le binaire) — pour doc / curiosité
    key = hashlib.md5(KEY_MATERIAL).hexdigest()[:8]
    _xor = "".join(chr(ord(c) ^ ord(key[i % len(key)])) for i, c in enumerate(raw))
    return raw


def check_live() -> bool:
    if not BIN.is_file():
        print("missing binary", BIN, file=sys.stderr)
        return False
    BIN.chmod(BIN.stat().st_mode | 0o111)
    out = subprocess.check_output([str(BIN)], text=True, timeout=30)
    return "The secret treasure is hidden in: **********" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="flag only")
    ap.add_argument("--check", action="store_true", help="run live binary banner")
    ap.add_argument("--show-xor", action="store_true", help="also print unused XOR result")
    args = ap.parse_args()
    flag = derive()
    if args.check and not check_live():
        print("CHECK FAIL", file=sys.stderr)
        return 1
    if args.q:
        print(flag)
    else:
        print(f"flag = {flag}")
        if args.show_xor:
            key = hashlib.md5(KEY_MATERIAL).hexdigest()[:8]
            xor = "".join(chr(ord(c) ^ ord(key[i % len(key)])) for i, c in enumerate(flag))
            print(f"xor_unused (md5[:8]={key!r}) = {xor!r}")
        if args.check:
            print("check: OK (banner)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
