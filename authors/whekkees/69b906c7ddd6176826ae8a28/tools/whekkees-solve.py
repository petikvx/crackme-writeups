#!/usr/bin/env python3
"""crackme6.exe (whekkees) : aucun mot de passe ne donne « Correct » -> patch.

  whekkees-solve.py                 # extrait le ZIP, écrit analysis/crackme6.patched.exe
  whekkees-solve.py --check         # + preuve Wine (orig. = Wrong, patché = Correct, user petik)
  whekkees-solve.py --reach petik   # affiche la valeur eax calculée pour un mot de passe
Le binaire sous original/ n'est jamais modifié (patch sur copie).
Preuve d'insolvabilité : tools/whekkees-bruteforce.c (tous les 2^32 mots de 4 octets).
"""
import argparse, subprocess, zipfile, pathlib

M = 0xFFFFFFFF
PROG = [1, 2, 3, 4, 1, 3, 2, 1, 4, 3, 1, 2, 4]   # puis 0xff => cmp eax, TARGET
TARGET = 0x6F3A9B21
PATCH_OFF = 0x7D1          # VA 0x1400013d1 : 74 07 (je) -> eb 07 (jmp)
ROOT = pathlib.Path(__file__).resolve().parent.parent


def run(pw: bytes) -> int:
    eax, i = 0x1337, 0
    for op in PROG:
        if op == 1:
            if i < len(pw):
                c = pw[i] - 256 if pw[i] > 127 else pw[i]
                eax = (eax + (c ^ 0x55) * 7) & M
                i += 1
        elif op == 2:
            eax = ((eax >> 29) | (eax << 3)) & M
        elif op == 3:
            eax ^= 0xA5A5A5A5
        else:
            eax = (eax + ((eax ^ 0x12345678) >> 2)) & M
    return eax


def wine(exe, pw):
    r = subprocess.run(["xvfb-run", "-a", "wine", str(exe)], input=pw + b"\n",
                       capture_output=True, timeout=120)
    return r.stdout.decode(errors="replace").strip()


ap = argparse.ArgumentParser()
ap.add_argument("--check", action="store_true")
ap.add_argument("--reach", metavar="PW")
a = ap.parse_args()
if a.reach is not None:
    print(hex(run(a.reach.encode())), "(cible", hex(TARGET) + ")")
    raise SystemExit
exe_dir = ROOT / "analysis" / "extracted"
exe = exe_dir / "crackme6.exe"
if not exe.exists():
    zipfile.ZipFile(ROOT / "original" / "download.bin").extract("crackme6.exe", exe_dir, pwd=b"crackmes.one")
d = bytearray(exe.read_bytes())
assert d[PATCH_OFF:PATCH_OFF + 2] == b"\x74\x07"
d[PATCH_OFF] = 0xEB
out = ROOT / "analysis" / "crackme6.patched.exe"
out.write_bytes(d)
print("patch écrit :", out, "(74 07 -> eb 07 @ 0x7d1)")
if a.check:
    print("original petik ->", wine(exe, b"petik"))
    print("patché   petik ->", wine(out, b"petik"))
