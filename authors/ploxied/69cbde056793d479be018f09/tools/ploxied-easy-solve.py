#!/usr/bin/env python3
"""Ploxied's Easy Crackme : le mot de passe est un entier signé 32 bits.

Le vrai main compare le résultat de `cin >> int` à 0xdeadbeef ; en signé
cela donne -559038737 (3735928559 déborde et est rejeté « must be a number »).
    ploxied-easy-solve.py [-q] [--check]
"""
import argparse, os, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
CONST = 0xDEADBEEF


def password() -> int:
    return CONST - (1 << 32) if CONST >= 1 << 31 else CONST


def check(pw: int) -> bool:
    d = tempfile.mkdtemp()
    try:
        with zipfile.ZipFile(ZIP) as z:
            z.extractall(d, pwd=b"crackmes.one")
        exe = os.path.join(d, "crackme.exe")
        cmd = ["xvfb-run", "-a", "wine", exe]
        out = subprocess.run(cmd, input=f"{pw}\n".encode(), capture_output=True,
                             timeout=60).stdout.decode(errors="replace")
        print(out.strip())
        return "Correct password" in out
    finally:
        shutil.rmtree(d, ignore_errors=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="test sous Wine")
    a = ap.parse_args()
    pw = password()
    print(pw if a.q else f"password = {pw} (0x{CONST:08x} signé)")
    if a.check:
        sys.exit(0 if check(pw) else 1)
