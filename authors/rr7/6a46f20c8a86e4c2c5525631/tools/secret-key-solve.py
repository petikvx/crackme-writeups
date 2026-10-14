#!/usr/bin/env python3
"""RR7's Secret key — solveur.

main() : scanf("%i") nombre == 0x21 (33), puis scanf("%i") clé == 0x66 (102).
Usage : secret-key-solve.py [-q] [--check]
  -q       : affiche uniquement les deux entrées
  --check  : lance original/code.exe sous Wine (OK + KO)
"""
import argparse, os, subprocess, sys

NUMBER = 0x21   # cmp eax,0x21 @ 0x1400014e2
SECRET = 0x66   # cmp eax,0x66 @ 0x14000150c
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "code.exe")
OK = "Congratulations, you have completed the challenge!"


def run(stdin):
    env = dict(os.environ, WINEDEBUG="-all")
    p = subprocess.run(["wine", EXE], input=stdin.encode(), capture_output=True, env=env, timeout=60)
    return p.stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print(NUMBER); print(SECRET)
    else:
        print(f"Your Number   : {NUMBER} (0x{NUMBER:x})")
        print(f"Secret Key    : {SECRET} (0x{SECRET:x})")
    if a.check:
        cases = [(f"{NUMBER}\n{SECRET}\n", True), ("0x21\n0x66\n", True),  # %i accepte l'hexa
                 (f"{NUMBER}\n101\n", False), ("32\n102\n", False)]
        bad = 0
        for inp, want in cases:
            got = OK in run(inp)
            st = "OK" if got == want else "FAIL"
            bad += got != want
            print(f"[{st}] {inp.strip().replace(chr(10), ' / '):12} -> {'Congratulations' if got else '(rien)'}")
        sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
