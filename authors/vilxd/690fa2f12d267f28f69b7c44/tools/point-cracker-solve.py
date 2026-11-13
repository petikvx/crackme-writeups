#!/usr/bin/env python3
"""Patcher pour point-cracker.exe (vilxd, "crack the points").

main() = __main(); printf("Your count points is %d", 0); scanf("%d");
Le "0" vient de `xor edx,edx` @ VA 0x140011929 (file off 0x10d29).
On remplace `call __main` (5 o) + `xor edx,edx` (2 o) par
`mov edx, N` (5 o) + 2 nops -> affiche "Your count points is N".

  python3 tools/point-cracker-solve.py [--points 101] [-q] [--check]
Sortie : analysis/point-cracker-patched.exe (l'original n'est jamais modifié).
"""
import argparse, hashlib, os, struct, subprocess, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "download.bin")
OUT = os.path.join(ROOT, "analysis", "point-cracker-patched.exe")
OFF = 0x10D24                      # VA 0x140011924
ORIG = bytes.fromhex("e81efefeff" "31d2")   # call __main ; xor edx,edx

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--points", type=int, default=101)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="lance le patché sous wine")
    a = ap.parse_args()
    with zipfile.ZipFile(ZIP) as z:
        data = bytearray(z.read("point-cracker.exe", pwd=b"crackmes.one"))
    assert data[OFF:OFF+7] == ORIG, "octets inattendus"
    data[OFF:OFF+7] = b"\xba" + struct.pack("<I", a.points & 0xFFFFFFFF) + b"\x90\x90"
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT, "wb").write(data)
    if a.q:
        print(a.points); return
    print(f"patched -> {OUT} points={a.points}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", OUT], input=b"", capture_output=True, timeout=60)
        out = r.stdout.decode(errors="replace")
        print(out)
        want = f"Your count points is {a.points}"
        print("OK" if want in out else "KO"); sys.exit(0 if want in out else 1)

main()
