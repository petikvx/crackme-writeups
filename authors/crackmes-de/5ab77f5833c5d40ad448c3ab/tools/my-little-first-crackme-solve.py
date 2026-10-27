#!/usr/bin/env python3
"""my_little_first_crackme (mistero5050) -- retrouve le mot de passe.

Chiffrement du binaire (N = len(saisie), N pair >= 4), N tours de :
  reverse(s) ; s[i] += i % N (mod 256) ; swap(s[2k], s[2k+1])
Résultat comparé à 34 octets (insert_soluzione @0x4016ce) => N = 34.
Ici on inverse les 34 tours.

  python3 my-little-first-crackme-solve.py [-q] [--check path/crackme.exe]
"""
import argparse, subprocess, sys

# valeurs imm32 de insert_soluzione (sign-extended -> octets)
TARGET = [0xa5,0x8f,0xb0,0x87,0xb4,0x81,0xb6,0x93,0xa1,0x8f,0xb0,0x7f,0xb4,0x85,0xb5,0x8f,
          0xae,0x96,0xab,0x8e,0xa9,0x7f,0xb6,0x88,0xab,0x93,0xa1,0x83,0xb4,0x81,0xa5,0x8b,
          0xaf,0x85]
N = len(TARGET)

def encrypt(s):
    s = list(s)
    for _ in range(N):
        s.reverse()
        s = [(c + i % N) & 0xff for i, c in enumerate(s)]
        for i in range(0, N - 1, 2):
            s[i], s[i + 1] = s[i + 1], s[i]
    return s

def solve():
    s = list(TARGET)
    for _ in range(N):
        for i in range(0, N - 1, 2):
            s[i], s[i + 1] = s[i + 1], s[i]
        s = [(c - i % N) & 0xff for i, c in enumerate(s)]
        s.reverse()
    return bytes(s)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    pw = solve()
    assert encrypt(pw) == TARGET
    txt = pw.decode("latin1")
    print(txt if a.q else f"password = {txt!r}  (len {len(pw)})")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + b"\n\n",
                           capture_output=True, timeout=60)
        out = r.stdout.decode("latin1")
        print(out.strip()[-80:])
        sys.exit(0 if "You win" in out else 1)

main()
