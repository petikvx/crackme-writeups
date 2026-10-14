#!/usr/bin/env python3
"""EyeCandyLOCKED (nexy) — id 5ab77f5b33c5d40ad448c563. ELF64 C++ non strippé (symboles + debug).

main @0x400fc3 : ptrace(PTRACE_TRACEME) < 0 -> « Did you really think… » ; boucle : saisie ;
  si saisie != "exit" : checkIt(saisie) @0x400eda compare les 14 premiers caractères (i = 0..0xd)
  au tableau d'entiers [ebp-0x50..] = 64 30 30 72 31 24 6d 40 6c 69 63 69 6f 75 73
  = "d00r1$m@licious" (le 15e caractère 's' n'est jamais comparé).

  eyecandy-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "EyeCandyLOCKED"
TAB = [0x64, 0x30, 0x30, 0x72, 0x31, 0x24, 0x6D, 0x40, 0x6C, 0x69, 0x63, 0x69, 0x6F, 0x75, 0x73]


def run(pw):
    return subprocess.run([str(BIN)], input=pw + "\nexit\n", capture_output=True, text=True, timeout=5).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = "".join(map(chr, TAB))
    print(pw if a.q else f"password : {pw}   (seuls les 14 premiers caractères sont comparés)")
    if a.check:
        ok = "UNLOCKED" in run(pw) and "UNLOCKED" in run(pw[:14] + "?")
        ko = "UNLOCKED" not in run(pw[:13]) and "UNLOCKED" not in run("petik")
        print("check:", "OK" if ok and ko else "KO", f"(ok={ok}, mauvais={ko})")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
