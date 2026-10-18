#!/usr/bin/env python3
"""
saltedMacaroni841's Upgraded Levels Keygen (crackmes.one 66c724b9b899a3b9dd02ad98)
-- solveur pour les 4 niveaux.

Binaire : analysis/extracted/LEVELS_UPGRADED_FINAL/lvlupByMacaroni841
(extrait de l'archive d'origine `original/Levels_UPG_Mac841.zip`, qui
contient déjà elle-même `answers/ans_1..4` et `hints/` -- fournis par
l'auteur, pas une fuite).

Niveaux 1-3 : réponse déterministe, indépendante de l'exécution.
Niveau 4    : mot de passe généré par `rand()` (seed = `time(NULL)`) à
              CHAQUE lancement -- "KEYGEN RECOMMENDED". Ce script pilote
              le binaire sous GDB (`_level4_patch.gdb.py`) : il lit le
              6-octets "bonne réponse" déjà calculée en mémoire (juste
              avant la comparaison finale, `sub_1DDF`), puis écrase la
              copie de la saisie utilisateur par cette valeur -- un patch
              de DONNÉES (pas de jump/nop), explicitement autorisé par
              l'énoncé du niveau ("ANYTHING GOES EXCEPT PATCHING JUMPS OR
              ADDING NOPS").

Usage:
    ./levels-solve.py --level 1 [--input hello]   # calcule XOR 4
    ./levels-solve.py --level 2                    # affiche argv+password
    ./levels-solve.py --level 3                    # affiche argv+password
    ./levels-solve.py --level 4                    # lance l'exploit GDB, affiche le resultat
    ./levels-solve.py --check                       # verifie les 4 niveaux d'affilee, 0/1
"""
import argparse
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_BIN = os.path.join(
    HERE, "..", "analysis", "extracted", "LEVELS_UPGRADED_FINAL", "lvlupByMacaroni841"
)
GDB_SCRIPT = os.path.join(HERE, "_level4_patch.gdb.py")


def level1_answer(s: str) -> str:
    return "".join(chr(ord(c) ^ 4) for c in s)


def level2_info():
    return {"argv1": "e", "password": "#q$!Mr"}


def level3_info():
    return {"argv1": "0x3", "password": "01267567"}


def run_level1(binary, s, timeout=5):
    guess = level1_answer(s)
    payload = f"1\n\n{s}\n{guess}\n\n5\n\n".encode()
    p = subprocess.run([binary], input=payload, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT, timeout=timeout)
    return b"LEVEL 1 COMPLETE" in p.stdout, p.stdout


def run_level2(binary, timeout=5):
    info = level2_info()
    payload = f"2\n\n{info['password']}\n\n5\n\n".encode()
    p = subprocess.run([binary, info["argv1"]], input=payload, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT, timeout=timeout)
    return b"LEVEL 2 COMPLETE" in p.stdout, p.stdout


def run_level3(binary, timeout=5):
    info = level3_info()
    payload = f"3\n\n{info['password']}\n\n5\n\n".encode()
    p = subprocess.run([binary, info["argv1"]], input=payload, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT, timeout=timeout)
    return b"LEVEL 3 COMPLETE" in p.stdout, p.stdout


def run_level4(binary, timeout=10):
    """Drive level 4 under GDB: any 6-char placeholder guess works, the
    GDB script overwrites it in memory with the real answer before the
    comparison. The whole menu dance always ends in a clean `5\\n\\n`
    exit (verified) -- never redirect this to an unbounded file: a wrong
    navigation sequence makes the menu reprint forever."""
    cmd = ["gdb", "-q", "-batch", "-x", GDB_SCRIPT, "--args", binary]
    payload = b"4\n\nAAAAAA\n\n5\n\n"
    p = subprocess.run(cmd, input=payload, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT, timeout=timeout)
    return b"LEVEL 4 [! COMPLETE !]" in p.stdout, p.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du binaire lvlupByMacaroni841")
    ap.add_argument("--level", type=int, choices=[1, 2, 3, 4], help="niveau a resoudre/afficher")
    ap.add_argument("--input", default="hello", help="chaine de depart pour le niveau 1")
    ap.add_argument("--check", action="store_true", help="verifie les 4 niveaux, code de sortie 0/1")
    ap.add_argument("-q", "--quiet", action="store_true")
    args = ap.parse_args()

    if args.check:
        ok1, _ = run_level1(args.binary, args.input)
        ok2, _ = run_level2(args.binary)
        ok3, _ = run_level3(args.binary)
        ok4, _ = run_level4(args.binary)
        if not args.quiet:
            print(f"level1={ok1} level2={ok2} level3={ok3} level4={ok4}")
        sys.exit(0 if (ok1 and ok2 and ok3 and ok4) else 1)

    if args.level == 1:
        guess = level1_answer(args.input)
        if args.quiet:
            print(guess)
        else:
            print(f"string = {args.input!r}  ->  reponse (XOR 4) = {guess!r}")
        ok, out = run_level1(args.binary, args.input)
        print("OK" if ok else "FAIL (voir sortie ci-dessous)")
        if not ok:
            print(out.decode(errors="replace"))
    elif args.level == 2:
        info = level2_info()
        if args.quiet:
            print(info["password"])
        else:
            print(f"argv[1] = {info['argv1']!r}   password = {info['password']!r}")
            print(f"  ./lvlupByMacaroni841 {info['argv1']}   puis niveau 2, mot de passe ci-dessus")
        ok, _ = run_level2(args.binary)
        print("OK" if ok else "FAIL")
    elif args.level == 3:
        info = level3_info()
        if args.quiet:
            print(info["password"])
        else:
            print(f"argv[1] = {info['argv1']!r}   password = {info['password']!r}")
            print(f"  ./lvlupByMacaroni841 '{info['argv1']}'   puis niveau 3, mot de passe ci-dessus")
        ok, _ = run_level3(args.binary)
        print("OK" if ok else "FAIL")
    elif args.level == 4:
        ok, out = run_level4(args.binary)
        if not args.quiet:
            print(out.decode(errors="replace"))
        print("OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)
    else:
        ap.print_help()


if __name__ == "__main__":
    main()
