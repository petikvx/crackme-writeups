#!/usr/bin/env python3
"""hFireWoxlf — My First Rust Crackme (crackme_rusty) : licence = hex_decode(A) XOR "vertigox" (répété).

Dans .rodata (VMA/offset 0x4a23d) deux chaînes hex collées : A = 2e5238…5d (58 hex = 29 octets) et B = 7665727469676f78 ("vertigox").
Le zip d'origine est chiffré AES (méthode 99) : extraction via `7z x -pcrackmes.one`.
Usage : rusty-solve.py [-q] [--check]
"""
import argparse, re, subprocess, sys, tempfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "rust_crackme.zip"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
tmp = tempfile.mkdtemp()
subprocess.run(["7z", "x", "-y", "-pcrackmes.one", f"-o{tmp}", str(ZIP)], capture_output=True, check=True)
exe = Path(tmp) / "crackme_rusty"
exe.chmod(0o755)
d = exe.read_bytes()
m = re.search(rb"((?:[0-9a-f]{2}){20,})src/main\.rs([0-9a-f]{16})Failed to Decode", d)
# A et B sont collées avec "src/main.rs" au milieu : A (hex du chiffré), B (hex de la clé)
blob, key_hex = m.group(1), m.group(2)
cipher, key = bytes.fromhex(blob.decode()), bytes.fromhex(key_hex.decode())
lic = bytes(c ^ key[i % len(key)] for i, c in enumerate(cipher)).decode()
if a.q:
    print(lic); sys.exit(0)
print(f"key = {key.decode()}\nlicense = {lic}")
if a.check:
    run = lambda s: subprocess.run([str(exe)], input=s + "\n", capture_output=True, text=True, timeout=5).stdout.strip().splitlines()[-1]
    ok, ko = run(lic), run("AAAAA-BBBBB")
    print("OK:", ok, "| KO:", ko)
    sys.exit(0 if "Correct License Key" in ok and "Incorrect" in ko else 1)
