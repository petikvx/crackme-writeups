#!/usr/bin/env python3
"""QR Scanner (Towel, NSEC 2020).

L'entrée acceptée est une chaîne de 64 caractères sur {q, r}.
Le binaire affiche FLAG- suivi du MD5 de cette chaîne.
"""

from __future__ import annotations

import argparse
import hashlib
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "original" / "QR"
CODE = "rqrqrrqrqrqqqrrrrqrqqqrqrrqqrqqrqrrrrqqrrrrrqqrqqrqrqqqrrrqrrqrq"


def flag() -> str:
    return "FLAG-" + hashlib.md5(CODE.encode()).hexdigest()


def main() -> None:
    ap = argparse.ArgumentParser(description="QR Scanner")
    ap.add_argument("-q", action="store_true", help="n'afficher que le flag")
    ap.add_argument("--check", action="store_true", help="rejouer la chaîne sur le binaire")
    args = ap.parse_args()
    if len(CODE) != 64 or set(CODE) - set("qr"):
        raise SystemExit("chaîne invalide")
    if args.check:
        proc = subprocess.run(
            [str(BIN)],
            input=(CODE + "\n").encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if flag().encode() not in proc.stdout or b"QR Read Success" not in proc.stdout:
            sys.stdout.buffer.write(proc.stdout)
            raise SystemExit(1)
        bad = subprocess.run(
            [str(BIN)],
            input=b"qqqq\n",
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if b"Unable to read QR code" not in bad.stdout:
            raise SystemExit("le refus n'est pas celui attendu")
        print("ok")
        return
    if args.q:
        print(flag())
        return
    print(f"qr:   {CODE}")
    print(f"flag: {flag()}")


if __name__ == "__main__":
    main()
