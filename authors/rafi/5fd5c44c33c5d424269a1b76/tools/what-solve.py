#!/usr/bin/env python3
"""rafi — what (crackme) : flag = decoder("6/!:!#7$=:1", "the_flag") (XOR cyclique).

main @0x797 : un compteur reste à 0, la condition "if (compteur > 0) decoder(...)" n'est donc JAMAIS
vraie -> decoder() n'est jamais appelée en exécution normale (code mort). Le programme affiche
seulement "Decode me:F{<encodé>}". La preuve passe par un appel direct de decoder() sous GDB.
decoder(enc, key) @0x6fa : pour chaque octet i de enc : enc[i] ^= key[i % strlen(key)], puis
printf("Flag is: F{%s}", enc).
Usage : what-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
ENC = "6/!:!#7$=:1"
KEY = "the_flag"
FLAG = "".join(chr(ord(ENC[i]) ^ ord(KEY[i % len(KEY)])) for i in range(len(ENC)))
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(FLAG); sys.exit(0)
print(f"flag = F{{{FLAG}}}")
print("decoder() n'est jamais appelée par main() (compteur figé à 0) : preuve via gdb (call direct).")
if a.check:
    import re
    base = 0x555555400000   # base PIE observée sous gdb pour ce binaire (non standard)
    cmds = [
        "set debuginfod enabled off",
        f"break *{hex(base + 0x5f0)}", "run",
        "call (char*)malloc(16)", "call (char*)malloc(16)",
        f'call (int)strcpy($1,"{ENC}")', f'call (int)strcpy($2,"{KEY}")',
        f"call (void){hex(base + 0x6fa)}($1,$2)", "call (int)fflush(0)",
    ]
    args = ["gdb", "-q", "-batch"]
    for c in cmds:
        args += ["-ex", c]
    out = subprocess.run(args + [str(EXE)], input="", capture_output=True, text=True).stdout
    ok = f"Flag is: F{{{FLAG}}}" in out
    print("gdb call decoder() ->", "OK" if ok else "KO")
    sys.exit(0 if ok else 1)
