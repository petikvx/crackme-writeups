#!/usr/bin/env python3
"""Solveur / keygen — crackmes.de f1nd_my_k3y5 (rezk2ll)

ELF32 NASM : 13 caractères. Chaque index i a un transform
  t = (pwd[i] + add_i) ^ xor_i
(interdit si pwd[i] == ban_i → boucle). Somme des t == 0x41a
et t[12] == 0x2b ⇒ pwd[12] == '!'.

Exemple : AAAAAAAAAoy~!

Usage:
  python3 f1nd-my-k3y5-solve.py -q
  python3 f1nd-my-k3y5-solve.py --check
  printf '%s\\n\\n' \"$(python3 f1nd-my-k3y5-solve.py -q)\" | ./original/f1nd_My_k3y5
"""
from __future__ import annotations

import argparse
import random
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "f1nd_My_k3y5"

# (ban, add, xor) per index 0..12
RULES = [
    ("l", 9, 7),
    ("S", 0x11, 7),
    ("a", 7, 3),
    ("N", 4, 2),
    ("f", 6, 5),
    ("i", 0x10, 0x45),
    ("g", 5, 8),
    ("P", 7, 3),
    ("0", 7, 3),
    ("O", 1, 8),
    ("P", 7, 3),
    ("E", 7, 3),
    ("S", 7, 3),
]
TARGET_SUM = 0x41A  # 1050
PRINTABLE = [chr(c) for c in range(0x21, 0x7F)]


def transform(i: int, ch: str) -> int | None:
    ban, add, xor = RULES[i]
    if ch == ban:
        return None
    return ((ord(ch) + add) & 0xFF) ^ xor


def valid(pw: str) -> bool:
    if len(pw) != 13:
        return False
    s = 0
    for i, ch in enumerate(pw):
        t = transform(i, ch)
        if t is None:
            return False
        s += t
    return s == TARGET_SUM and transform(12, pw[12]) == 0x2B


def keygen(seed: int = 0) -> str:
    """Déterministe : préfixe 'A'*9 (hors bans), brute force 3 chars + '!'."""
    random.seed(seed)
    prefix = []
    for i in range(9):
        c = "A"
        if c == RULES[i][0]:
            c = "B"
        prefix.append(c)
    ps = sum(transform(i, prefix[i]) for i in range(9))  # type: ignore[arg-type]
    need = TARGET_SUM - 0x2B - ps  # leave room for t12=0x2b
    for a in PRINTABLE:
        if a == RULES[9][0]:
            continue
        ta = transform(9, a)
        assert ta is not None
        for b in PRINTABLE:
            if b == RULES[10][0]:
                continue
            tb = transform(10, b)
            assert tb is not None
            for c in PRINTABLE:
                if c == RULES[11][0]:
                    continue
                tc = transform(11, c)
                assert tc is not None
                if ta + tb + tc == need:
                    pw = "".join(prefix) + a + b + c + "!"
                    assert valid(pw)
                    return pw
    raise RuntimeError("keygen failed")


DEFAULT = keygen(0)  # AAAAAAAAAoy~!


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--seed", type=int, default=0)
    args = ap.parse_args()
    pw = keygen(args.seed) if args.seed else DEFAULT
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        # double \n : le read final attend un Enter après le message
        out = subprocess.check_output(
            [str(BIN)], input=(pw + "\n\n").encode(), timeout=3
        )
        text = out.decode(errors="replace")
        ok = "Yep" in text or "correct" in text
        print(text.strip().splitlines()[-1] if text.strip() else text)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
        return 0
    print("=== f1nd_My_k3y5 keygen ===")
    print(f"key   : {pw}")
    print(f"valid : {valid(pw)}  sum={sum(transform(i, pw[i]) for i in range(13))}")
    print(f"run   : printf '%s\\n\\n' '{pw}' | ./original/f1nd_My_k3y5")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
