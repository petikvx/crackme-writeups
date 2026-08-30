#!/usr/bin/env python3
"""Keygen — hacktooth's Simple Crack/Keygenme (AutoIt).

Prédicat (script.au3 extrait) :
  user = @UserName   # Windows / Wine
  pour chaque caractère c :
      v = ord(c) - len(user)
      si v == 95 ('_') : v += 7
      serial += chr(v)

Usage :
  python3 simple-crack-solve.py              # --user petik (défaut)
  python3 simple-crack-solve.py --user Alice
  python3 simple-crack-solve.py -q
  python3 simple-crack-solve.py --check 'k`odf'
  python3 simple-crack-solve.py --local      # lit %USERNAME% via wine/cmd si dispo
"""

from __future__ import annotations

import argparse
import os
import subprocess
import sys


def generate_serial(user: str) -> str:
    if not user:
        raise ValueError("username vide")
    n = len(user)
    out: list[str] = []
    for c in user:
        v = ord(c) - n
        if v == 95:
            v += 7
        if not (0 <= v <= 0x10FFFF):
            raise ValueError(f"code point hors plage pour {c!r}: {v}")
        out.append(chr(v))
    return "".join(out)


def read_local_username() -> str:
    """Wine / Windows : %USERNAME% ; sinon USER / USERNAME env."""
    # Wine
    try:
        r = subprocess.run(
            ["wine", "cmd", "/c", "echo %USERNAME%"],
            capture_output=True,
            text=True,
            timeout=30,
        )
        for line in (r.stdout or "").splitlines():
            line = line.strip().strip("\r")
            if line and "%" not in line and not line.lower().startswith("wine"):
                return line
    except (FileNotFoundError, subprocess.TimeoutExpired, OSError):
        pass
    return os.environ.get("USERNAME") or os.environ.get("USER") or "petik"


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument(
        "--user",
        "--name",
        dest="user",
        default="petik",
        help="Windows username (@UserName), défaut: petik",
    )
    p.add_argument(
        "--local",
        action="store_true",
        help="utiliser le username local (Wine %%USERNAME%% / $USER)",
    )
    p.add_argument("-q", action="store_true", help="n'imprimer que le serial")
    p.add_argument(
        "--check",
        metavar="SERIAL",
        help="vérifier un serial contre --user / --local",
    )
    args = p.parse_args(argv)

    user = read_local_username() if args.local else args.user
    serial = generate_serial(user)

    if args.check is not None:
        ok = args.check == serial
        if args.q:
            print("OK" if ok else "FAIL")
        else:
            print(f"user   : {user}")
            print(f"expect : {serial!r}")
            print(f"got    : {args.check!r}")
            print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(serial)
    else:
        print(f"user   : {user}")
        print(f"serial : {serial}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
