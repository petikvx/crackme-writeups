#!/usr/bin/env python3
"""easy_crackme_1 (stefanie) — id 5ab77f5a33c5d40ad448c507. ELF32 sans section headers.

Trois conditions (bits d'un octet @0x80499b8), message « cracked! » si (flag & 3) == 3 :
  bit0 : le fichier  « LiuYiFei_143 » (nom XOR index @0x80484b6) existe dans le répertoire courant
         avec une taille de 5 octets (stat -> st_size == 5)                    [constructeur @0x80484b0]
  bit1 : argv[1] fait >= 10 caractères et argv[1][0]+argv[1][2]+argv[1][4] == 0x14a (330)  [@0x804861b]
  anti-debug : getenv("LD_PRELOAD") != NULL -> exit ; ptrace(TRACEME) < 0 -> exit        [@0x8048526]

  easycrack1-solve.py [-q] [--check]       -> imprime la recette ; --check la rejoue
"""
import argparse, os, subprocess, sys, tempfile
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "easycrack1" / "easycrack"
FILE = "LiuYiFei_143"
ARG = "n?n?n?????"          # 'n'*3 = 330 aux indices 0,2,4 ; longueur 10


def run(cwd, arg):
    env = {k: v for k, v in os.environ.items() if k != "LD_PRELOAD"}
    return subprocess.run([str(BIN), arg], cwd=cwd, capture_output=True, text=True, env=env).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    print(f"{FILE} {ARG}" if a.q else f"1) créer le fichier de 5 octets : printf 'abcde' > {FILE}\n2) ./easycrack '{ARG}'   (argv[1] >= 10 car., s[0]+s[2]+s[4] = 330)")
    assert ord(ARG[0]) + ord(ARG[2]) + ord(ARG[4]) == 0x14A and len(ARG) >= 10
    if a.check:
        with tempfile.TemporaryDirectory() as td:
            ko_nofile = "cracked!" not in run(td, ARG)
            Path(td, FILE).write_bytes(b"abcde")
            ok = "cracked!" in run(td, ARG)
            ko_arg = "cracked!" not in run(td, "aaaaaaaaaaaa")
            Path(td, FILE).write_bytes(b"abcd")
            ko_size = "cracked!" not in run(td, ARG)
        good = ok and ko_nofile and ko_arg and ko_size
        print("check:", "OK" if good else "KO", f"(ok={ok}, sans fichier→non={ko_nofile}, mauvais arg→non={ko_arg}, taille≠5→non={ko_size})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
