#!/usr/bin/env python3
"""Solveur — whyyourapedme's study get PASSWORD

PE64 GUI, .text chiffré, puis une VM maison. Le password fait 5 octets.
Les 11 autres octets du buffer VM sont à 0. Sans debugger, la cible est
la clé fixe K (16 octets). 21×21 tours :

    state ^= password_pad ^ header
    chaîne d'additions, rol8 dépendant des données, xor avec +0x38*i
    state doit valoir K

Usage :
  python3 tools/find-me-solve.py -q
  python3 tools/find-me-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "find_me.exe"
PASSWORD = "rtasz"

# Immediates mov au début du bytecode (RVA .rdata 0x3000, une fois décodé).
C = bytes.fromhex("415f36f83f67918b0fab0e02c6b2da7e")
# 16 premiers octets bruts de .rdata, copiés dans le scratch à +0x100.
H = bytes.fromhex("70d49a6cb4905fbef85c10933c18d581")
# Cible si PEB / debug port / rdtsc sont propres (scratch +0x80).
K = bytes.fromhex("d8d9acf7153826c1aff92cf9d0de968d")
ROUNDS = 21 * 21


def _rol(v: int, n: int) -> int:
    n &= 7
    if n == 0:
        return v & 0xFF
    return ((v << n) | (v >> (8 - n))) & 0xFF


def mix(state: list[int], x: list[int]) -> list[int]:
    s = [(state[i] ^ x[i]) & 0xFF for i in range(16)]
    for i in range(15):
        s[i] = (s[i] + s[i + 1]) & 0xFF
    s[15] = (s[15] + s[0]) & 0xFF
    for i in range(16):
        s[i] = _rol(s[i], s[(i + 5) & 15] & 7)
    for i in range(16):
        s[i] ^= (s[(i + 9) & 15] + (0x38 * i)) & 0xFF
    return s


def accepts(password: str) -> bool:
    raw = password.encode("latin1")
    x = [(raw[i] if i < len(raw) else 0) ^ H[i] for i in range(16)]
    s = list(C)
    for _ in range(ROUNDS):
        s = mix(s, x)
    return bytes(s) == K


def _wine(text: str) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        ["wine", str(BIN)],
        input=text,
        capture_output=True,
        text=True,
        timeout=20,
        check=False,
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="n'affiche que le password")
    ap.add_argument(
        "--check",
        action="store_true",
        help="prédicat local + Wine (OK, NOP=, NOP<, NOP>)",
    )
    args = ap.parse_args()
    if not accepts(PASSWORD):
        print("prédicat local : rtasz refusé")
        return 1
    if args.q and not args.check:
        print(PASSWORD)
        return 0
    if not args.check:
        print(PASSWORD)
        print("OK  (21×21 tours, cible K si pas de debugger)")
        return 0

    if accepts("aaaaa") or accepts("ab") or accepts("rtaszX"):
        print("prédicat local : un contre-exemple est accepté")
        return 1

    # Wine en mode texte traduit \r\n. On matche le mot, pas le CRLF brut.
    cases = [
        (PASSWORD + "\n", "password: OK"),
        ("aaaaa\n", "password: NOP="),
        ("ab\n", "password: NOP<"),
        ("rtaszX\n", "password: NOP>"),
    ]
    for text, needle in cases:
        proc = _wine(text)
        out = proc.stdout
        print(out.strip())
        if needle not in out:
            print(f"Wine : attendu {needle!r} pour {text!r}, reçu {out!r}")
            return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
