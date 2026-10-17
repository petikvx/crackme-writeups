#!/usr/bin/env python3
"""jackioye — Simple but not simple (mid, ELF statique) : password = constante ^ 0x05.

main @0x40182b : scanf("%255s") ; encryptInput(buf) : buf[i] ^= 5 pour chaque octet (@0x401816 : xor edx,0x5) ;
comparaison (via PLT, strcmp) avec la constante posée sur la pile :
    movabs rax,0x6455716077666076 ; movabs rdx,0x373461776a727676 ; mov WORD PTR [rbp-0x110],0x36
=> password = chaque octet de la constante XOR 5 (la comparaison se fait APRES le XOR de la saisie).
Usage : mid-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "mid"
d = EXE.read_bytes()
main = 0x40182B
# fichier non PIE : offset = VMA - 0x400000 pour le premier segment (ici .text est à offset = VMA - 0x400000)
code = d[main - 0x400000:main - 0x400000 + 0xC0]
i1 = code.index(bytes.fromhex("48b8")); q1 = code[i1 + 2:i1 + 10]
i2 = code.index(bytes.fromhex("48ba")); q2 = code[i2 + 2:i2 + 10]
iw = code.index(bytes.fromhex("66c785f0feffff")); w = code[iw + 7:iw + 9]
key = d[0x401816 - 0x400000 + 2]                  # xor edx, imm8   (83 f2 05)
const = (q1 + q2 + w).split(b"\0")[0]
pw = bytes(c ^ key for c in const).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"constante = {const!r}  XOR {key:#x}  ->  password = {pw}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko1, ko2, ko3 = run(pw), run(pw.lower()), run(pw[:-1]), run("wrong")
    print("OK:", ok, "| KO:", ko1, "|", ko2, "|", ko3)
    sys.exit(0 if "Access Granted!" in ok and all("Access Denied!" in k for k in (ko1, ko2, ko3)) else 1)
