#!/usr/bin/env python3
"""ithawk — Find password (P@ssw0rd) : password = constante + 0x0a (encrypt() retire 0x0a à chaque octet de la saisie).

main @0x11e6 : ptrace(PTRACE_TRACEME) != 0 -> "Debugger Detected" ; constante sur la pile (4 qwords, NUL à la fin) ;
scanf("%s") ; encrypt(saisie) : buf[i] -= 0x0a (lea ecx,[rax-0xa]) ; strcmp(saisie, constante) == 0 -> "Congrats, Access Granted!!".
Usage : p4ssw0rd-solve.py [-q] [--check]
"""
import argparse, re, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "P@ssw0rd"
d = EXE.read_bytes()
main = d[0x11E6:0x1300]
quads = [struct.unpack_from("<Q", main, m.start() + 2)[0] for m in re.finditer(rb"\x48[\xb8\xba]", main)][:4]
const = b"".join(struct.pack("<Q", q) for q in quads).split(b"\0")[0]
delta = d[d.index(bytes.fromhex("8d48"), 0x1189, 0x11c0) + 2]          # lea ecx,[rax-0xa] -> 0xf6 = -10
delta = 256 - delta if delta > 127 else delta
pw = bytes((b + delta) & 0xFF for b in const).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"constante = {const!r}  + {delta:#x}  ->  password = {pw}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko1, ko2 = run(pw), run(pw[:-1]), run("wrong")
    print("OK:", ok, "| KO:", ko1, "|", ko2)
    sys.exit(0 if "Access Granted" in ok and "Try Harder" in ko1 and "Try Harder" in ko2 else 1)
