#!/usr/bin/env python3
"""
Mazzotti's Back To The beginning Keygen (crackme_easy)
ELF64 PIE, C++ (libstdc++), stripped. Pas de nom/clé separes :
une seule chaine est lue et verifiee par comparaisons de caracteres fixes.

check(string& s) @ 0x1420 :
  return s[0] == ':' and s[1] == '3' and s[4] == 'M'
  (s[2], s[3] et le reste sont libres ; taille globale contrainte a [1,10]
   par le main avant l'appel : size()-1 <= 9)

=> toute chaine de 5 a 10 caracteres de la forme ":3??M...." passe.

Usage :
    python3 tools/backtothebeginning-solve.py
    python3 tools/backtothebeginning-solve.py --check
    python3 tools/backtothebeginning-solve.py --free pe --suffix tik   # :3peMtik
"""
import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "crackme_easy"


def build_password(free: str, suffix: str) -> str:
    if len(free) != 2:
        raise ValueError("--free doit faire exactement 2 caracteres (positions 2 et 3)")
    pwd = ":3" + free + "M" + suffix
    if not (1 <= len(pwd) <= 10):
        raise ValueError(f"longueur totale {len(pwd)} hors de [1,10]")
    return pwd


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--free", default="pk", help="2 caracteres libres aux positions 2-3 (defaut: pk)")
    ap.add_argument("--suffix", default="", help="suffixe libre apres la position 4 (defaut: vide)")
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="execute le binaire et verifie le succes")
    args = ap.parse_args()

    pwd = build_password(args.free, args.suffix)

    if args.quiet and not args.check:
        print(pwd)
        return

    if not args.quiet:
        print(f"[+] mot de passe : {pwd}")

    if args.check:
        proc = subprocess.run(
            [str(args.binary)],
            input=(pwd + "\n").encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=5,
        )
        out = proc.stdout.decode(errors="replace")
        if not args.quiet:
            print("----- sortie du programme -----")
            print(out.strip())
            print("--------------------------------")
        ok = "Congratulations" in out
        print("CHECK:", "OK" if ok else "FAIL", file=sys.stderr)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
