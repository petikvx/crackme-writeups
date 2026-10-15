#!/usr/bin/env python3
"""simple crackme (marco007) -- XOR fixe sur deux chaines globales.

main() :
  - enc_msg[0..10] ^= key (constante 32 bits, seul l'octet bas sert) -> mot de passe
  - scanf("%s") compare par strcmp a ce mot de passe decode
  - flag[0..22] ^= (j + (multiplier ^ offset)) -> flag affiche apres succes

Usage : simple-crackme-solve.py [-q] [--check BINAIRE]
"""
import argparse
import subprocess

ENC_MSG = bytes.fromhex("2728222c2d363a2728222c")
KEY = 0x69
FLAG_ENC = bytes.fromhex("fef5fbfcc7fef7ef8884909c818b859591999e828383b3")
MULTIPLIER = 187
OFFSET = 3


def password() -> str:
    return bytes(b ^ (KEY & 0xFF) for b in ENC_MSG).decode()


def flag() -> str:
    v4 = (MULTIPLIER ^ OFFSET) & 0xFF
    return bytes((FLAG_ENC[j] ^ ((j + v4) & 0xFF)) & 0xFF for j in range(len(FLAG_ENC))).decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    pw = password()
    fl = flag()
    if a.check:
        r = subprocess.run([a.check], input=pw + "\n", capture_output=True, text=True, timeout=5)
        print(f"{pw}\n{r.stdout.strip().splitlines()[-1]}")
        return
    print(f"{pw}\n{fl}" if not a.q else pw)


if __name__ == "__main__":
    main()
