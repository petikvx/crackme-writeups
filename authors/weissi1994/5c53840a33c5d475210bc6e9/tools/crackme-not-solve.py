#!/usr/bin/env python3
"""Solveur — weissi1994 crackme-not (original/hello)

Password[i] = Name[i] + 5 (même longueur). La boucle itère sur
len(password) ; un préfixe plus court marche aussi si les octets matchent.
Seuls les 8 premiers octets du name sont copiés (movq) → name ≤ 8 conseillé.

Usage:
  python3 crackme-not-solve.py -q
  python3 crackme-not-solve.py --user petik
  python3 crackme-not-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "hello"
DEFAULT_USER = "petik"
SUCCESS = b"Great H4x0r Skillz"


def keygen(name: str) -> str:
    if len(name) > 8:
        raise ValueError("name length > 8 (seul un movq de 8 octets est copié)")
    for c in name:
        if ord(c) + 5 > 0xFF:
            raise ValueError(f"char {c!r} overflow +5")
    return "".join(chr(ord(c) + 5) for c in name)


def run_live(name: str, password: str, timeout: float = 5.0) -> bytes:
    """Deux read() successifs : ne pas tout envoyer d'un coup (pipe)."""
    if not BIN.is_file():
        raise FileNotFoundError(BIN)
    p = subprocess.Popen(
        [str(BIN)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    assert p.stdin is not None and p.stdout is not None
    try:
        p.stdin.write((name + "\n").encode())
        p.stdin.flush()
        time.sleep(0.05)
        p.stdin.write((password + "\n").encode())
        p.stdin.flush()
        p.stdin.close()
        out = p.stdout.read()
        p.wait(timeout=timeout)
    except Exception:
        p.kill()
        raise
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument("--user", "--name", default=DEFAULT_USER, dest="user")
    ap.add_argument("--check", action="store_true", help="lance original/hello")
    args = ap.parse_args()

    try:
        pw = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.check:
        out = run_live(args.user, pw)
        text = out.decode(errors="replace")
        print(text.replace("\x00", ""), end="" if text.endswith("\n") else "\n")
        ok = SUCCESS in out
        print(f"{args.user!r} → {pw!r} -> {'OK' if ok else 'FAIL'}")
        return 0 if ok else 1

    if args.q:
        print(pw)
    else:
        print(f"user={args.user!r} password={pw!r}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
