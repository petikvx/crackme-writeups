#!/usr/bin/env python3
"""Solveur — jeffli6789's Orbit Fold

ELF strippé. Le flag fait 23 octets. Deux filtres :

  somme_{i=0..22} flag[i] * (i+1)   ≡  0x728a  (mod 2^16)

  pour chaque indice p de la permutation .rodata @ 0x20a0 :
      rot = (p % 5) + 1
      x   = rol8( (p*7 + 0x31) ^ flag[p] , rot )
      (x + ((13*p) ^ 0x5a)) ^ key[p]   bas octet == 0
  key = 23 octets @ 0x2080

Inverse, p par p :
  rolled = (key[p] - ((13*p) ^ 0x5a)) & 0xff
  flag[p] = ror8(rolled, rot) ^ (p*7 + 0x31)

Flag : CMO{orbit_folded_twice}

Usage:
  python3 tools/orbit-fold-solve.py -q
  python3 tools/orbit-fold-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "orbit_fold_linux_x86_64"
KEY_OFF = 0x2080
PERM_OFF = 0x20A0
N = 23
WIN = "Correct. Submit that flag to claim your points."
LOSE = "No orbit. Try again."


def ror8(x: int, n: int) -> int:
    n &= 7
    x &= 0xFF
    return ((x >> n) | (x << (8 - n))) & 0xFF


def flag() -> str:
    blob = BIN.read_bytes()
    key = blob[KEY_OFF : KEY_OFF + N]
    perm = blob[PERM_OFF : PERM_OFF + N]
    if len(key) != N or len(perm) != N or sorted(perm) != list(range(N)):
        raise SystemExit("tables .rodata inattendues")
    out = [0] * N
    for p in perm:
        rot = (p % 5) + 1
        rolled = (key[p] - ((13 * p) ^ 0x5A)) & 0xFF
        out[p] = ror8(rolled, rot) ^ ((p * 7 + 0x31) & 0xFF)
    return bytes(out).decode("ascii")


def _run(args: list[str], text: str | None) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        args,
        input=None if text is None else text,
        capture_output=True,
        text=True,
        timeout=5,
        check=False,
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="n'imprimer que le flag")
    ap.add_argument(
        "--check",
        action="store_true",
        help="argv OK, stdin OK, 23 octets faux, mot trop court",
    )
    args = ap.parse_args()
    pw = flag()
    if args.check:
        good_argv = _run([str(BIN), pw], None)
        good_in = _run([str(BIN)], pw + "\n")
        bad = _run([str(BIN), "CMO{orbit_folded_twicX}"], None)
        short = _run([str(BIN), "short"], None)
        print(good_argv.stdout.strip())
        ok = (
            good_argv.returncode == 0
            and WIN in good_argv.stdout
            and LOSE not in good_argv.stdout
            and good_in.returncode == 0
            and WIN in good_in.stdout
            and bad.returncode == 1
            and LOSE in bad.stdout
            and len("CMO{orbit_folded_twicX}") == N
            and short.returncode == 1
            and LOSE in short.stdout
        )
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(pw if args.q else f"{pw}  # len {N}, checksum 0x728a")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
