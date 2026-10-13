#!/usr/bin/env python3
"""Solveur pour crackmes.de's crackme_3 by fr1c (VB5 natif).

Le crackme lit le fichier ``crackme3.key`` (cwd de l'exe) via ``Input #1``
et compare le contenu à la constante ``98765432112345``.
Ce script crée le fichier au bon endroit (à côté de CrackMe3.exe).
"""
from __future__ import annotations
import argparse
import sys
from pathlib import Path

KEY = "98765432112345"
MARKER = "98765432112345".encode("utf-16le")

def extract(exe: Path) -> str | None:
    data = exe.read_bytes()
    i = data.find(MARKER)
    if i < 0:
        return None
    return data[i : i + len(MARKER)].decode("utf-16le")

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("name", nargs="?", default="petik", help="ignoré (compat)")
    ap.add_argument("--exe", type=Path, default=None)
    ap.add_argument("--write", type=Path, default=None,
                    help="écrire crackme3.key ici (défaut: original/crackme3.key)")
    ap.add_argument("--no-write", action="store_true")
    args = ap.parse_args()
    key = KEY
    exe = args.exe
    if exe is None:
        cand = Path(__file__).resolve().parents[1] / "original" / "CrackMe3.exe"
        if cand.is_file():
            exe = cand
    if exe and exe.is_file():
        got = extract(exe)
        if got:
            key = got
    print(f"Name: {args.name} (non utilisé) / crackme3.key: {key}")
    if not args.no_write:
        out = args.write
        if out is None:
            out = Path(__file__).resolve().parents[1] / "original" / "crackme3.key"
        out.write_text(key + "\n", encoding="ascii")
        print(f"écrit: {out}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
