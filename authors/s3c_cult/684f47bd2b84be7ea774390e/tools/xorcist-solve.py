#!/usr/bin/env python3
"""S3c_Cult — XORcist : mot de passe = enc ^ KEY (0xA9), lu dans xorcist.c du zip (--binary : lit .rodata de l'ELF).

validate() : strcpy(temp, enc) ; decrypt(temp) (chaque octet ^= 0xA9) ; strcmp(input, temp).
Usage : xorcist-solve.py [-q] [--check]
"""
import argparse, re, subprocess, sys, tempfile, zipfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "XORcist.zip"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
z = zipfile.ZipFile(ZIP)
src = z.read("xorcist.c").decode()
key = int(re.search(r"#define KEY (0x[0-9A-Fa-f]+)", src).group(1), 16)
enc = re.search(r'const char \*enc = "((?:\\x[0-9a-f]{2})+)"', src).group(1)
data = bytes(int(h, 16) for h in re.findall(r"\\x([0-9a-f]{2})", enc))
pw = bytes(b ^ key for b in data).decode()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
if a.check:
    with tempfile.TemporaryDirectory() as t:
        exe = Path(t) / "xorcist"
        exe.write_bytes(z.read("xorcist")); exe.chmod(0o755)
        run = lambda s: subprocess.run([str(exe)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
        ok, ko = run(pw), run("nope")
    print("OK:", ok, "| KO:", ko)
    sys.exit(0 if ok == "Logged in as root." and ko == "Nuh Uh Nuh Uh." else 1)
