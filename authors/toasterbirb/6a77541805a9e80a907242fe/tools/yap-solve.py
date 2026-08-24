#!/usr/bin/env python3
"""Solveur — toasterbirb's yap (ELF64 Markov parrot).

Le binaire charge words.dat + data.dat (chaîne de Markov ordre 2).
Bigramme déterministe :

  ('Your', 'prize:') → uniquement flag{shaney_would_have_liked_this}.

Usage :
  python3 yap-solve.py -q
  python3 yap-solve.py --check
  # depuis analysis/extracted/ :
  printf 'Your prize:\\n' | ./yap
"""

from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

SEED = "Your prize:"
FLAG = "flag{shaney_would_have_liked_this}"
EXTRACTED = Path(__file__).resolve().parents[1] / "analysis" / "extracted"


def find_seed(words_path: Path, data_path: Path) -> tuple[str, str]:
    words = words_path.read_text(encoding="utf-8").split(" ")
    flag_i = next(i for i, w in enumerate(words) if w.startswith("flag{"))
    data = data_path.read_bytes()
    off = 0
    while off + 8 <= len(data):
        key, count = struct.unpack_from("<II", data, off)
        off += 8
        nxt = list(struct.unpack_from("<" + "H" * count, data, off))
        off += count * 2
        if flag_i in nxt and set(nxt) == {flag_i}:
            a, b = (key >> 16) & 0xFFFF, key & 0xFFFF
            return words[a], words[b]
    raise RuntimeError("no deterministic predecessor for flag word")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="print seed line only")
    ap.add_argument("--flag", action="store_true", help="print flag string only")
    ap.add_argument("--check", action="store_true", help="run ./yap with seed (needs extracted/)")
    args = ap.parse_args()

    if args.flag:
        print(FLAG)
        return 0

    if args.check:
        yap = EXTRACTED / "yap"
        if not yap.exists():
            print("missing analysis/extracted/yap", file=sys.stderr)
            return 1
        r = subprocess.run(
            [str(yap)],
            input=SEED + "\n",
            capture_output=True,
            text=True,
            cwd=EXTRACTED,
            timeout=5,
        )
        out = r.stdout.replace("\x1b[A", "").replace("\x1b[2K", "").strip()
        ok = FLAG in out
        print(out)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(SEED)
    else:
        wdat = EXTRACTED / "words.dat"
        ddat = EXTRACTED / "data.dat"
        if wdat.exists() and ddat.exists():
            a, b = find_seed(wdat, ddat)
            print(f"seed={a!r} {b!r}")
            print(f"line={a} {b}")
            print(f"flag={FLAG}")
        else:
            print(f"line={SEED}")
            print(f"flag={FLAG}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
