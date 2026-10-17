#!/usr/bin/env python3
"""fdisotto — good_boy (ELF strippé) : le secret est monté sur la pile par des immediates.

main @0x10c0 :
    10cb: mov edx,0x72                 ; ba 72 00 00 00
    10ef: mov [rsp+0xe],dx             ; 66 89 54 24 0e        -> octets 72 00   ("r\0")
    10f4: mov DWORD PTR [rsp+0xa],imm  ; c7 44 24 0a 68 34 78 30 -> "h4x0"
    1114: cmp [rsp+0xa],eax ; ... 1147: cmp [rsp+0xe],ax  -> la saisie (scanf %255s) doit valoir "h4x0" + "r" + NUL
Usage : goodboy-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "good_boy"
d = EXE.read_bytes()
i = d.index(bytes.fromhex("c744240a"))               # mov DWORD PTR [rsp+0xa], imm32
dword = d[i + 4:i + 8]
k = d.index(bytes.fromhex("ba72000000"))             # mov edx,0x72
word = d[k + 1:k + 3]
pw = (dword + word).split(b"\0")[0].decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"dword={dword!r} word={word!r} -> password = {pw}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko, ko2 = run(pw), run(pw[:-1]), run(pw + "r")
    print("OK:", ok, "| KO:", ko, "|", ko2)
    sys.exit(0 if "Good boy" in ok and "Bad boy" in ko and "Bad boy" in ko2 else 1)
