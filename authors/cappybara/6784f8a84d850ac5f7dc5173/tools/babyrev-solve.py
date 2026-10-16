#!/usr/bin/env python3
"""Cappybara — BabyRev : password "Sup3rS3cr3tP455W0rd\n" (le \n est DANS la constante), code 0x539 = 1337, flag déchiffré.

main @0x11e9 : fgets(buf, 0x20) ; scanf("%d") ; code == 0x539 ? ; strcmp(buf, .rodata+0x10e..) ;
flag[i] = ((i + 0x69) ^ dword_table[i]) & 0xff pour i = 0..0x1a (table `flag` @0x2060, 27 dwords).
Usage : babyrev-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "babyrev"
d = EXE.read_bytes()
PW_OFF, TABLE, N = 0x212E, 0x2060, 0x1B
pw = d[PW_OFF:d.index(b"\0", PW_OFF)].decode()          # contient le '\n' final
flag = "".join(chr(((i + 0x69) ^ int.from_bytes(d[TABLE + 4 * i:TABLE + 4 * i + 4], "little")) & 0xFF) for i in range(N))
code = 0x539
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(flag); sys.exit(0)
print(f"password = {pw.strip()}  (+ saut de ligne)\ncode     = {code}\nflag     = {flag}")
if a.check:
    run = lambda p, c: subprocess.run([str(EXE)], input=f"{p}{c}\n", capture_output=True, text=True).stdout
    ok = run(pw, code)
    ko_pw, ko_code = run("wrong\n", code), run(pw, code + 1)
    good = flag in ok and "Wrong password" in ko_pw and "Wrong code" in ko_code
    print("OK:", flag in ok, "| KO pw:", "Wrong password" in ko_pw, "| KO code:", "Wrong code" in ko_code)
    sys.exit(0 if good else 1)
