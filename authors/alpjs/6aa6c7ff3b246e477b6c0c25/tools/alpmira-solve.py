#!/usr/bin/env python3
"""Solveur stub — alpjs's alpmira (pending)

VMP + sponge ; password inconnu. Voir analysis/NOTES.md.
"""
from __future__ import annotations
import argparse, sys

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    print("pending: password unknown (custom VMP / sponge)", file=sys.stderr)
    return 1

if __name__ == "__main__":
    raise SystemExit(main())
