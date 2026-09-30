#!/usr/bin/env python3
"""Solveur — confining0367's Key (THE VAULT :: crackme v1)

PE64 console MSVC **Debug** (ucrtbased / MSVCP140D). Username 4–16,
serial `PART1->_:-PART3` :

  1. len(user) in [4, 16]
  2. sum((i+1)*PART1[i]) & 0xff == (37 * len(user) + 100) & 0xff
  3. PART2 == bytes([8, 105, 12]) XOR 0x36  →  `>_: `
  4. PART3 non vide, rol8(PART3[0], 0) ^ 0x11 == table[0] == 0x20  →  '1'
     (le for a un `return 0` après le 1er caractère ; le reste de la
     table 20 79 d9 80 c8 n'est pas consommé)
  5. state 0^6^0x2D^0xF6^0xD2 == 15

Usage:
  python3 tools/key-solve.py -q --user petik
  python3 tools/key-solve.py --user petik --check
"""
from __future__ import annotations

import argparse
import string
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "Key.exe"
DEFAULT_USER = "petik"
PART2 = bytes((8 ^ 0x36, 105 ^ 0x36, 12 ^ 0x36)).decode("ascii")  # ">_:"
PART3 = "1"
WIN = "Access granted. Well done."
ALPH = string.ascii_letters + string.digits
DEBUG_DLLS = ("MSVCP140D.dll", "VCRUNTIME140D.dll", "ucrtbased.dll")


def rol8(x: int, n: int) -> int:
    n &= 7
    x &= 0xFF
    return ((x << n) | (x >> ((8 - n) & 7))) & 0xFF


def ror8(x: int, n: int) -> int:
    n &= 7
    x &= 0xFF
    return ((x >> n) | (x << ((8 - n) & 7))) & 0xFF


def target(user: str) -> int:
    return (37 * len(user) + 100) & 0xFF


def score(part1: str) -> int:
    return sum((i + 1) * ord(c) for i, c in enumerate(part1)) & 0xFF


def split_serial(serial: str) -> tuple[str, str, str] | None:
    a = serial.find("-")
    if a < 0:
        return None
    b = serial.find("-", a + 1)
    if b < 0:
        return None
    return serial[:a], serial[a + 1 : b], serial[b + 1 :]


def intended_part3_from_table(table: bytes) -> str:
    """Décodage complet de unk_140108000 si le for allait au bout."""
    out = []
    for i, t in enumerate(table):
        c = ror8(t ^ 0x11, i)
        out.append(c)
    return bytes(out).decode("latin-1")


def part1_for(user: str) -> str:
    """3 lettres style commentaire site (Axx), sinon 2 alnum, sinon brute."""
    t = target(user)
    for b in ALPH:
        for c in ALPH:
            s = "A" + b + c
            if "-" in s:
                continue
            if score(s) == t:
                return s
    for a in ALPH:
        for b in ALPH:
            s = a + b
            if score(s) == t:
                return s
    for a in ALPH:
        if score(a) == t:
            return a
    raise SystemExit(f"pas de PART1 pour {user!r} (cible {t})")


def serial_for(user: str) -> str:
    if not (4 <= len(user) <= 16):
        raise SystemExit("username : longueur 4–16")
    if any(c.isspace() for c in user):
        raise SystemExit("username : cin >> s'arrête sur un blanc")
    return f"{part1_for(user)}-{PART2}-{PART3}"


def check_pair(user: str, serial: str) -> tuple[bool, str]:
    """Oracle des 5 étages. Retour (ok, nom d'échec)."""
    if not (4 <= len(user) <= 16):
        return False, "length"
    parts = split_serial(serial)
    if parts is None:
        return False, "parse"
    p1, p2, p3 = parts
    if score(p1) != target(user):
        return False, "one"
    if p2 != PART2:
        return False, "two"
    if not p3 or (rol8(ord(p3[0]), 0) ^ 0x11) != 0x20:
        return False, "three"
    state = 0 ^ 6 ^ 0x2D ^ 0xF6 ^ 0xD2
    if serial == "RE-VERSE-ME":
        # honeypot : HaHaHa, mais state==15 ici seulement si 1–4 ont passé
        pass
    if state != 15:
        return False, "something but don't know where."
    return True, "ok"


def wine_can_run() -> bool:
    if not BIN.is_file():
        return False
    try:
        out = subprocess.run(
            ["wine", str(BIN)],
            input="\n\n",
            capture_output=True,
            text=True,
            timeout=8,
            check=False,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return False
    blob = (out.stderr or "") + (out.stdout or "")
    if any(d in blob for d in DEBUG_DLLS) or "status c0000135" in blob:
        return False
    return "THE VAULT" in (out.stdout or "") or "Username" in (out.stdout or "")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--user", default=DEFAULT_USER, help="username (défaut petik)")
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument(
        "--check",
        action="store_true",
        help="oracle des 5 étages (+ Wine si CRT debug présent)",
    )
    args = ap.parse_args()
    user = args.user
    serial = serial_for(user)
    if args.q:
        print(serial)
        return 0
    if args.check:
        ok, why = check_pair(user, serial)
        print(f"{user} -> {serial}  ({why})")
        assert ok, why
        # vecteurs de régression (même formule que le binaire)
        samples = {
            "test": "AAg->_:-1",
            "crackme": "AB6->_:-1",
            "0123456789abcdef": "ACO->_:-1",
            user: serial,
        }
        for u, s in samples.items():
            good, tag = check_pair(u, s)
            if not good:
                print(f"KO inattendu {u} {s} ({tag})")
                return 1
        bad_len, _ = check_pair("abc", "AAg->_:-1")
        bad_two, tag_two = check_pair(user, f"{part1_for(user)}-VERSE-1")
        bait, _ = check_pair(user, "RE-VERSE-ME")
        if bad_len or tag_two != "two" or bait:
            print("oracle KO : cas d'échec non détectés")
            return 1
        print("oracle: OK (granted) + KO length/two/RE-VERSE-ME")
        if wine_can_run():
            proc = subprocess.run(
                ["wine", str(BIN)],
                input=f"{user}\n{serial}\n\n",
                capture_output=True,
                text=True,
                timeout=20,
                check=False,
            )
            print(proc.stdout)
            if WIN not in (proc.stdout or ""):
                print("Wine: pas de Access granted", file=sys.stderr)
                return 1
            print("Wine: OK")
        else:
            print(
                "Wine: skip (build Debug — MSVCP140D / ucrtbased absents)",
                file=sys.stderr,
            )
        return 0
    print(f"user    {user}")
    print(f"serial  {serial}")
    print(f"part1   {part1_for(user)}  score={score(part1_for(user))} target={target(user)}")
    print(f"part2   {PART2!r}")
    print(f"part3   {PART3!r}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
