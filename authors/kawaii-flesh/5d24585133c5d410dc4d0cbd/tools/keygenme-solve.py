#!/usr/bin/env python3
"""kawaii-flesh — keygenme : keygen.

main(argc, argv) calcule :
    v4  = (3 * name[0]) ^ sum(ord(c) for c in name)     // name = argv[1]
    key = v4 << strlen(argv[0])                          // PIEGE : argv[0], pas argv[1] !

La longueur de argv[0] depend donc de la facon dont le binaire est invoque
(ex. "./keygenme" = 10 caracteres, un chemin absolu donnerait un decalage
different). Ce solveur prend argv0_len en parametre explicite (par defaut
10, pour une invocation "./keygenme").

Exemple (user de reference petik, invoque comme "./keygenme") :
    name=petik -> key=865280

Usage : keygenme-solve.py [-q] [--name petik] [--argv0-len 10] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keygenme"


def compute_key(name: str, argv0_len: int) -> int:
    v4 = (3 * ord(name[0])) ^ sum(ord(c) for c in name)
    return v4 << argv0_len


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--argv0-len", type=int, default=len("./keygenme"),
                     help="longueur de argv[0] telle que le binaire sera invoque (defaut: './keygenme' = 10)")
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire via './keygenme'")
    a = ap.parse_args()
    key = compute_key(a.name, a.argv0_len)
    if a.q:
        print(key)
        return 0
    print(f"name={a.name!r} argv0_len={a.argv0_len} -> key={key}")
    if a.check:
        run_dir = EXE.parent
        key_local = compute_key(a.name, len("./keygenme"))
        ok = subprocess.run(["./keygenme", a.name, str(key_local)], capture_output=True, text=True, cwd=run_dir).stdout
        ko = subprocess.run(["./keygenme", a.name, "123"], capture_output=True, text=True, cwd=run_dir).stdout
        good = "Good job!" in ok and "Wrong key!" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
