#!/usr/bin/env python3
"""toasterbirb — argc : 2 arguments identiques MAIS argc réel divisé par 2 par _start.

_start @0x10e0 : pop rax ; shr al,1 ; push rax ; ... -> main reçoit argc>>1.
main @0x1080 : argc>>1 == 3 ET strcmp(argv[1], argv[2]) == 0 -> "correct!".
=> argc réel 6 ou 7, soit 5 ou 6 arguments, argv[1] == argv[2].
Usage : argc-solve.py [WORD] [-q] [--check]    (WORD par défaut : petik)
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "argc"
ap = argparse.ArgumentParser()
ap.add_argument("word", nargs="?", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
args5 = [a.word, a.word, "a", "b", "c"]          # argc réel = 6 -> 3
if a.q:
    print(" ".join(args5)); sys.exit(0)
print("./original/argc", " ".join(args5), "  (ou 6 arguments : argc réel 7)")
if a.check:
    run = lambda *x: subprocess.run([str(EXE), *x], capture_output=True, text=True).stdout.strip()
    ok5, ok6 = run(*args5), run(*args5, "d")
    ko_pw, ko_n = run(a.word, "x", "a", "b", "c"), run(a.word, a.word)
    print("OK:", ok5, "|", ok6, "| KO:", ko_pw, "|", ko_n[:16] + "…")
    good = ok5.startswith("correct!") and ok6.startswith("correct!") and ko_pw == "wrong passwords..." and ko_n.startswith("please try again")
    sys.exit(0 if good else 1)
