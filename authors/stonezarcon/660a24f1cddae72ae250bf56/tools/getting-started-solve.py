#!/usr/bin/env python3
"""stonezarcon — Getting started : argv[1] == "secret", reconstruit à partir de six entiers incrémentés.

main @0x1189 : malloc(0x18) ; t[0..5] = 0x6e 0x60 0x5e 0x6d 0x60 0x6f  (mov DWORD PTR [rax+k],imm32)
               boucle i = 0..4 (cmp [rbp-0x18],4 ; jle) : chaque t[k] += 1   -> +5
               buf[i] = (char) t[i] pour i = 0..6 ; buf[6] = 0 ; strcmp(argv[1], buf) == 0 -> "Welcome."
Le solveur relit les immediates et la borne de boucle dans le binaire d'origine (zip extrait).
Usage : getting-started-solve.py [-q] [--check]
"""
import argparse, re, subprocess, sys, tempfile, zipfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "getting_started.zip"
exe_bytes = zipfile.ZipFile(ZIP).read("getting_started", pwd=b"crackmes.one")   # zip chiffré (mot de passe du site)
main = exe_bytes[0x1189:0x1300]
vals = [int(m.group(1).hex(), 16) for m in re.finditer(rb"\xc7\x00(.)\x00\x00\x00", main, re.S)][:6]
bound = main.index(bytes.fromhex("837de804"))                    # cmp DWORD PTR [rbp-0x18], 4
iters = main[bound + 3] + 1                                       # jle -> i = 0..4 : 5 itérations
pw = bytes((v + iters) & 0xFF for v in vals).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"immediates = {[hex(v) for v in vals]}  +{iters}  ->  argv[1] = {pw}")
if a.check:
    with tempfile.TemporaryDirectory() as t:
        exe = Path(t) / "getting_started"; exe.write_bytes(exe_bytes); exe.chmod(0o755)
        run = lambda *x: subprocess.run([str(exe), *x], capture_output=True, text=True).stdout.strip()
        ok, ko1, ko2, ko3 = run(pw), run(pw.capitalize()), run(pw[:-1]), run()
    print("OK:", ok, "| KO:", ko1, ko2, ko3)
    sys.exit(0 if ok == "Welcome." and ko1 == ko2 == ko3 == "Denied." else 1)
