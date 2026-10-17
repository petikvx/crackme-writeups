#!/usr/bin/env python3
"""nimacpp — level2 : aucune saisie. main compare deux constantes différentes ; "<s> is password" est inatteignable sans patch.

main @0x1169 : s = "01234567891" (.rodata+0x4) ; strcmp(s, "Jsfdb56d65a" (.rodata+0x10)) != 0 -> "Look at it as cracker"
                                              ; == 0 -> printf("%s is password", s)
Le seul moyen d'afficher le message de succès : neutraliser le saut @0x1198 (`75 1d` = jne -> `90 90`).
Le patch est écrit dans analysis/level2-patched ; original/ n'est pas modifié.
Usage : level2-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE, OUT = ROOT / "original" / "level2", ROOT / "analysis" / "level2-patched"
d = bytearray(EXE.read_bytes())
cstr = lambda o: bytes(d[o:d.index(0, o)]).decode()
secret, decoy = cstr(0x2004), cstr(0x2010)
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(secret); sys.exit(0)
assert d[0x1198:0x119A] == bytes.fromhex("751d"), d[0x1198:0x119A].hex()
d[0x1198:0x119A] = b"\x90\x90"
OUT.write_bytes(d); OUT.chmod(0o755)
print(f"strcmp({secret!r}, {decoy!r}) != 0 -> patch @0x1198 (75 1d -> 90 90) -> {OUT.relative_to(ROOT)}")
if a.check:
    run = lambda e: subprocess.run([str(e)], capture_output=True, text=True).stdout.strip()
    o, p = run(EXE), run(OUT)
    print("original:", o, "| patché:", p)
    sys.exit(0 if o == "Look at it as cracker" and p == f"{secret} is password" else 1)
