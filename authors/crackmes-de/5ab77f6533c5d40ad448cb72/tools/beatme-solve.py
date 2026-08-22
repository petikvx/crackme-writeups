#!/usr/bin/env python3
"""Solveur / keygen — crackmes.de BeatMe (rezk2ll)

Username corps L∈[3..8]. Password :
  pwd[0] = '0'+L
  pwd[1] = user[2]
  pwd[2+i] = user[i] + (L//2) + 1   (i=0..L-1)

(Vérif inverse : ROT-1 puis −L//2 sur pwd[2..] == user.)

Usage:
  python3 beatme-solve.py -q --user petik
  python3 beatme-solve.py --check --user petik
"""
from __future__ import annotations

import argparse
import os
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "BeatMe"
DEFAULT_USER = "petik"


def keygen(user: str) -> str:
    u = user.encode("latin1")
    L = len(u)
    if not 3 <= L <= 8:
        raise ValueError("username length 3..8")
    half = L // 2
    body = bytearray()
    body.append(0x30 + L)
    body.append(u[2])
    for c in u:
        body.append((c + half + 1) & 0xFF)
    return body.decode("latin1")


def live_check(user: str, password: str) -> tuple[str, bool]:
    out_r, out_w = os.pipe()
    r, w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(w)
        os.close(out_r)
        os.dup2(r, 0)
        os.dup2(out_w, 1)
        os.close(r)
        os.close(out_w)
        os.execv(str(BIN), [str(BIN)])
    os.close(r)
    os.close(out_w)
    os.write(w, user.encode("latin1") + b"\n")
    time.sleep(0.05)
    os.write(w, password.encode("latin1") + b"\n")
    os.close(w)
    chunks: list[bytes] = []
    while True:
        data = os.read(out_r, 4096)
        if not data:
            break
        chunks.append(data)
    os.close(out_r)
    os.waitpid(pid, 0)
    text = b"".join(chunks).decode(errors="replace")
    return text, "CORRECT" in text or "WIN" in text


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", default=DEFAULT_USER)
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    try:
        pw = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        text, ok = live_check(args.user, pw)
        line = [ln for ln in text.splitlines() if "CORRECT" in ln or "NOPE" in ln or "WIN" in ln]
        print(line[-1] if line else text.strip()[-60:])
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(f"{args.user}:{pw}")
        return 0
    print("=== BeatMe ===")
    print(f"username : {args.user}")
    print(f"password : {pw}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
