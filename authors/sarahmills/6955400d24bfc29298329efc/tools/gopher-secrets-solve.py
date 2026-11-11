#!/usr/bin/env python3
"""sarahmills — Gopher Secrets (Go ELF64) : calcule le flag.

Reproduit main.buildRealFlag :
  "CTF{" + "g0_" + "r3v3rs3_" + "m4st3r_" + str(1640995200 ^ 0x1337) + "}"

  gopher-secrets-solve.py [-q] [--check]
--check : extrait le ZIP original/download.bin (mot de passe crackmes.one)
          dans un dossier temporaire et lance le binaire avec le flag.
"""
import argparse, os, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")


def flag() -> str:
    return "".join(["CTF{", "g0_", "r3v3rs3_", "m4st3r_", str(1640995200 ^ 0x1337), "}"])


def check(f: str) -> bool:
    with tempfile.TemporaryDirectory() as td:
        with zipfile.ZipFile(ZIP) as z:
            z.extract("challenge", td, pwd=b"crackmes.one")
        exe = os.path.join(td, "challenge")
        os.chmod(exe, 0o755)
        out = subprocess.run([exe, f], capture_output=True, text=True, timeout=30).stdout
    print(out, end="")
    return "Excellent work" in out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    f = flag()
    print(f if a.q else f"Flag : {f}")
    if a.check:
        sys.exit(0 if check(f) else 1)
