#!/usr/bin/env python3
"""zed-zahir — ZED-Crackme : serial = "C(uiICD@CADDEBNEEDD".

main() decode statiquement une constante embarquee "AHi23DEADBEEFCOFFEE"
(19 octets) par quelques operations ad hoc (XOR/+-, octets choisis par
BYTEn() du premier qword puis un `- 1` boucle sur le reste), puis compare
au strcmp() avec la saisie. checkSerial()/cryptSerial() (tamis + Gauss) sont
du code mort jamais appele depuis main : leurres.

Deux anti-X dans main avant le check : SIDT (detection VM, false positive
dans ce sandbox -> `VMware detected`) et ptrace(PTRACE_TRACEME) (anti-debug).
Voir le README pour le bypass GDB reproductible (necessaire ici car on tourne
deja sous un sandbox qui trigger le faux-positif SIDT).

Usage : zed-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

ORIGINAL = Path(__file__).resolve().parent.parent / "original" / "ZED-Crackme-x64.bin"
UNPACKED = Path(__file__).resolve().parent.parent / "analysis" / "ZED-Crackme-x64.unpacked.bin"
CONST = b"AHi23DEADBEEFCOFFEE"


def compute_serial() -> str:
    s1 = bytearray(19)
    s1[0] = (CONST[0] ^ 2) & 0xFF
    s1[1] = (CONST[3] - 10) & 0xFF
    s1[2] = (CONST[2] + 12) & 0xFF
    s1[3] = CONST[2]
    s1[4] = (CONST[1] + 1) & 0xFF
    for i in range(5, 19):
        s1[i] = (CONST[i] - 1) & 0xFF
    return bytes(s1).decode()


GDB_SCRIPT = """\
set pagination off
break *0x55555540140a
break *0x5555554014af
run
set $al = 0
continue
set $rax = 0
continue
"""


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true",
                     help="rejoue le binaire unpacked sous gdb (bypass SIDT + ptrace)")
    a = ap.parse_args()
    serial = compute_serial()
    if a.q:
        print(serial)
        return 0
    print(f"serial = {serial}")
    if a.check:
        if not UNPACKED.exists():
            print("KO: binaire unpacked introuvable (voir README, upx -d)")
            return 1
        script = Path("/tmp/zed_gdb_cmds.txt")
        script.write_text(GDB_SCRIPT)
        run = lambda s: subprocess.run(
            ["gdb", "-q", "-batch", "-x", str(script), "--args", str(UNPACKED)],
            input=s + "\n", capture_output=True, text=True,
        ).stdout
        ok, ko = run(serial), run("wrong")
        good = "you succeed!!" in ok and "try again" in ko
        print("OK:", "you succeed!!" in ok, "| KO:", "try again" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
