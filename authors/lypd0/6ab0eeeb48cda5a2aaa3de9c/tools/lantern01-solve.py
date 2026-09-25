#!/usr/bin/env python3
"""Solveur — lypd0's Lantern01

PE64 console MSVC. Deux XOR indépendants dans .rdata :

  password (13 octets @ fichier 0x17120, VMA 0x140018320)
      password[i] = table[i] ^ 0x37
      → copper-owl-42

  flag (34 octets @ fichier 0x17130, VMA 0x140018330, après 3 octets nuls)
      flag[i] = enc[i] ^ 0x5a
      → FLAG{first_steps_1ab4f81e16df4d5c}

Le check exige strlen == 13 puis (s[i] ^ 0x37) == table[i].
Le flag n'est décodé qu'après un check réussi.

Usage:
  python3 tools/lantern01-solve.py -q
  python3 tools/lantern01-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "lantern01.exe"
TABLE_OFF = 0x17120
FLAG_OFF = 0x17130
PASS_LEN = 13
FLAG_LEN = 0x22
PASS_XOR = 0x37
FLAG_XOR = 0x5A
WIN = "FLAG{first_steps_1ab4f81e16df4d5c}"
LOSE = "Incorrect password."


def decode() -> tuple[str, str]:
    blob = BIN.read_bytes()
    table = blob[TABLE_OFF : TABLE_OFF + PASS_LEN]
    enc = blob[FLAG_OFF : FLAG_OFF + FLAG_LEN]
    if len(table) != PASS_LEN or len(enc) != FLAG_LEN:
        raise SystemExit("tables .rdata tronquées")
    password = bytes(b ^ PASS_XOR for b in table).decode("ascii")
    flag = bytes(b ^ FLAG_XOR for b in enc).decode("ascii")
    return password, flag


def _run(text: str) -> subprocess.CompletedProcess[str]:
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
    ap.add_argument("-q", action="store_true", help="password puis flag")
    ap.add_argument(
        "--check",
        action="store_true",
        help="Wine : bon password, 13 octets faux, mot trop court",
    )
    args = ap.parse_args()
    password, flag = decode()
    if flag != WIN:
        print(f"flag inattendu: {flag}")
        return 1
    if args.check:
        good = _run(password + "\n\n")
        same = _run("copper-owl-99\n\n")
        short = _run("petik\n\n")
        out = good.stdout
        print(out.strip())
        ok = (
            good.returncode == 0
            and "Unlocked!" in out
            and flag in out
            and LOSE not in out
            and same.returncode == 1
            and LOSE in same.stdout
            and flag not in same.stdout
            and len("copper-owl-99") == PASS_LEN
            and short.returncode == 1
            and LOSE in short.stdout
        )
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(password)
        print(flag)
    else:
        print(f"{password}  # XOR 0x37, len {PASS_LEN}")
        print(f"{flag}  # XOR 0x5a, len {FLAG_LEN}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
