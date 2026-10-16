#!/usr/bin/env python3
"""toasterbirb — shellcoding : fabrique le fichier get_number.png (shellcode de 10 octets).

Le binaire lit `get_number.png` du répertoire courant (fread 0x10 octets) dans une page RWX (pré-remplie de `0f 0b` = ud2),
exige buf[0] == 0x90, puis appelle buf(time(0)) deux fois (sleep(1) entre) et teste :
    f(t1) + (~t1 & 1) + f(t2) + (~t2 & 1) == 6
Avec f(t) = 2 + (t & 1) on a f(t) + (~t & 1) = 3 quel que soit t -> somme toujours 6 (même si sleep dérive d'une seconde).

    90          nop                    ; octet 0 exigé
    89 f8       mov eax, edi           ; edi = time(0)
    83 e0 01    and eax, 1
    83 c0 02    add eax, 2
    c3          ret

Usage : shellcoding-solve.py [-o get_number.png] [-q] [--check]
"""
import argparse, shutil, subprocess, sys, tempfile
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "shellcoding"
SHELLCODE = bytes.fromhex("90" "89f8" "83e001" "83c002" "c3")

ap = argparse.ArgumentParser()
ap.add_argument("-o", default=None, help="écrit le fichier (par défaut : affiche l'hex)")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.o:
    Path(a.o).write_bytes(SHELLCODE)
if a.q:
    print(SHELLCODE.hex()); sys.exit(0)
print("get_number.png =", SHELLCODE.hex(" "), f"({len(SHELLCODE)} octets)")
if a.check:
    def run(payload):
        with tempfile.TemporaryDirectory() as t:
            if payload is not None:
                (Path(t) / "get_number.png").write_bytes(payload)
            return subprocess.run([str(EXE)], cwd=t, capture_output=True, text=True).stdout.strip().splitlines()[-1]
    results = [run(SHELLCODE) for _ in range(3)]
    ko_byte, ko_ret, ko_none = run(b"\x91" + SHELLCODE[1:]), run(bytes.fromhex("90b800000000c3")), run(None)
    print("OK x3:", results[0][:30], "| KO:", ko_byte[:40], "|", ko_ret[:40], "|", ko_none)
    good = all(r.startswith("Correct!") for r in results) and "first byte" in ko_byte and "work a bit" in ko_ret
    sys.exit(0 if good else 1)
