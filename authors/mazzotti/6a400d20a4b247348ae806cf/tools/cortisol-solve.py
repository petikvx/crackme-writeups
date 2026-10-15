#!/usr/bin/env python3
"""
Mazzotti's Cortisol level low keygen (cortisol_level_low_keygen)
ELF64 PIE, C++ (libstdc++), stripped. Entrée : un nombre de 11 chiffres.

check() @ 0x1440 :
  - exige une std::string de longueur exactement 11 (10 chiffres + 1 clé)
  - weights[] @ 0x4020 = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
  - sum = Σ digit[i] * weights[i]   pour i = 0..9
  - clé attendue = (10 - sum % 10) % 10   (digit[10])

Exception à la convention `petik` (voir AGENTS.md) : l'entrée doit être
purement numérique (le binaire parse un nombre, refuse toute lettre avec
"Bro, NUMBER!!!"), `petik` est donc inapplicable ici.

Usage :
    python3 tools/cortisol-solve.py 1234567890
    python3 tools/cortisol-solve.py 1234567890 -q
    python3 tools/cortisol-solve.py 1234567890 --check
"""
import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "cortisol_level_low_keygen"

WEIGHTS = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]


def check_digit(prefix: str) -> int:
    if len(prefix) != 10 or not prefix.isdigit():
        raise ValueError("le préfixe doit être exactement 10 chiffres")
    total = sum(int(d) * w for d, w in zip(prefix, WEIGHTS))
    return (10 - total % 10) % 10


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("prefix", nargs="?", default="1234567890", help="10 premiers chiffres (défaut: 1234567890)")
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le numéro complet")
    ap.add_argument("--check", action="store_true", help="exécute le binaire et vérifie le message de succès")
    args = ap.parse_args()

    key = check_digit(args.prefix)
    serial = f"{args.prefix}{key}"

    if args.quiet and not args.check:
        print(serial)
        return

    if not args.quiet:
        print(f"[+] préfixe : {args.prefix}")
        print(f"[+] clé     : {key}")
        print(f"[+] numéro  : {serial}")

    if args.check:
        proc = subprocess.run(
            [str(args.binary)],
            input=(serial + "\n").encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=5,
        )
        out = proc.stdout.decode(errors="replace")
        if not args.quiet:
            print("----- sortie du programme -----")
            print(out.strip())
            print("--------------------------------")
        ok = "not that dumb" in out
        print("CHECK:", "OK" if ok else "FAIL", file=sys.stderr)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
