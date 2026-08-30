#!/usr/bin/env python3
"""Solveur — gregland's CrackMe (Visual DialogScript / PE32 UPX).

Password statique extrait du script VDS (ressource TEXT/SCRIPT) après :
  1) decompress custom (sub_495034)
  2) header digits 0600… → RandSeed = sum of three 8-digit blocks
  3) nibble-decrypt (sub_4AC3C0) des lignes du script

Prédicat (script déchiffré) :
  %X = @dlgtext(EDIT1)     # @_I
  IF @_L(%X, 9456145)      # _G …
    → « Password Ok »
  ELSE
    → « Password NOK »

Usage :
  python3 gregland-solve.py
  python3 gregland-solve.py -q
  python3 gregland-solve.py --check 9456145
"""

from __future__ import annotations

import argparse
import sys

PASSWORD = "9456145"


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("-q", action="store_true", help="n'imprimer que le password")
    p.add_argument("--check", metavar="PASSWORD", help="vérifier un password")
    args = p.parse_args(argv)

    if args.check is not None:
        ok = args.check == PASSWORD
        if args.q:
            print("OK" if ok else "FAIL")
        else:
            print(f"expect : {PASSWORD}")
            print(f"got    : {args.check}")
            print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(PASSWORD)
    else:
        print(f"password : {PASSWORD}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
