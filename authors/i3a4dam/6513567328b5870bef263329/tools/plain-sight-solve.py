#!/usr/bin/env python3
"""I3a4dam — Plain sight (C++) : Login() @0x11b9 compare std::string(cin >> s) à la constante .rodata+0x19.

operator==(std::string, const char*) avec lea rdx,[rip+0xe11] -> 0x2019 = "do_not_hardcode".
Usage : plain-sight-solve.py [-q] [--check]
"""
import argparse, subprocess, sys, tempfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "plain_sight.zip"
# zip chiffré AES (méthode 99, mot de passe du site) : zipfile ne sait pas le lire -> 7z
tmpdir = Path(tempfile.mkdtemp())
subprocess.run(["7z", "x", "-y", "-pcrackmes.one", f"-o{tmpdir}", str(ZIP)], capture_output=True, check=True)
data = (tmpdir / "plain_sight").read_bytes()
pw = data[0x2019:data.index(b"\0", 0x2019)].decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
if a.check:
    with tempfile.TemporaryDirectory() as t:
        exe = Path(t) / "plain_sight"; exe.write_bytes(data); exe.chmod(0o755)
        run = lambda s: subprocess.run([str(exe)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
        ok, ko, ko2 = run(pw), run("Do_not_hardcode"), run("wrong")
    print("OK:", ok, "| KO:", ko, "|", ko2)
    sys.exit(0 if "Welcome!" in ok and "Wrong password!" in ko and "Wrong password!" in ko2 else 1)
