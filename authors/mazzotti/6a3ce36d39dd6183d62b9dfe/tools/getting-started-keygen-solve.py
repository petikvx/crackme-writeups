#!/usr/bin/env python3
"""
Mazzotti's Getting started keygen (getting_started_keygen)
ELF64 PIE, C++ (libstdc++), stripped. Demande un nom (5 a 10 caracteres,
sans espace), puis une cle numerique.

hash(s) @ 0x14b0 :
  key = Σ ( s[i] XOR table[i] )   pour i = 0..len(s)-1
  table[] @ 0x4020 (int32 par entree) = [4, 79, 129, 171, 254, 123, 224, 204, 70, 53, 238]

Contrainte sur le nom : 5 <= len(name) <= 10 (verifie dans main via
`size()-5 <= 5`, message "Bro, what are you trying to do?" sinon).

Usage :
    python3 tools/getting-started-keygen-solve.py petik
    python3 tools/getting-started-keygen-solve.py petik --check
"""
import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "getting_started_keygen"

TABLE = [4, 79, 129, 171, 254, 123, 224, 204, 70, 53, 238]


def compute_key(name: str) -> int:
    if not (5 <= len(name) <= 10):
        raise ValueError("le nom doit faire entre 5 et 10 caracteres")
    return sum(ord(c) ^ TABLE[i] for i, c in enumerate(name))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("name", nargs="?", default="petik", help="nom (5-10 car., defaut: petik)")
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="execute le binaire et verifie le succes")
    args = ap.parse_args()

    key = compute_key(args.name)

    if args.quiet and not args.check:
        print(key)
        return

    if not args.quiet:
        print(f"[+] nom : {args.name}")
        print(f"[+] cle : {key}")

    if args.check:
        proc = subprocess.run(
            [str(args.binary)],
            input=f"{args.name}\n{key}\n".encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=5,
        )
        out = proc.stdout.decode(errors="replace")
        if not args.quiet:
            print("----- sortie du programme -----")
            print(out.strip())
            print("--------------------------------")
        ok = "You did it" in out
        print("CHECK:", "OK" if ok else "FAIL", file=sys.stderr)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
