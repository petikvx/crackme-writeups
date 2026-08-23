#!/usr/bin/env python3
"""arthi CrackmeNX2Final — password havingfunyet (FSG + subst alphabet).

  ./arthi-nx2-solve.py -q
"""
from __future__ import annotations

import argparse

PASS = "havingfunyet"
# plaintext alphabet -> ciphertext alphabet (internal compare uses encoded form)
A1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789(),./:[]<>*&!$|\\?@# ;'~}{-=+_"
A2 = "X5STU,.LMZYcde012tu89()\\?@#xvwI/:[]EFjklAP<nomQRVW34KJfghBGHaNOibCD>*&!$|67ypqrsz;-+_' =~}{"
ENC = "".join(dict(zip(A1, A2))[c] for c in PASS)  # LX(Me.,9e?U8


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    args = ap.parse_args()
    if args.q:
        print(PASS)
    else:
        print(f"password={PASS!r}")
        print(f"encoded={ENC!r}  # compared internally after subst")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
