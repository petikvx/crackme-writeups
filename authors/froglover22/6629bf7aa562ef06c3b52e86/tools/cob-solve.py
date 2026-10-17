#!/usr/bin/env python3
"""froglover22 — Crack On The Cob (GnuCOBOL) : mot de passe = "PASSWORD" (champ PIC X(10), complété par 2 espaces).

CrackMe_module_init @0x14d1 : memset(b_8.3, ' ', 10) ; b_9.2 = movabs 0x44524f5753534150 ("PASSWORD") + word 0x2020 ;
CrackMe_ @0x1310 : cob_accept(f_8.4) ; memcmp(b_8.3, b_9.2, 10) == 0 -> "YES" sinon "NO " ; memcmp(.., "YES", 3) -> Access Granted/Denied.
--check : si libcob.so.4 est absente, compile tools/libcob_shim.c (gcc) et l'utilise via LD_LIBRARY_PATH.
Usage : cob-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys, tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE = ROOT / "original" / "crack_on_the_cob"
d = EXE.read_bytes()
i = d.index(bytes.fromhex("48b8") + struct.pack("<Q", 0x44524F5753534150))   # movabs rax, imm64
q = d[i + 2:i + 10]
pw = q.decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"password = {pw}  (PIC X(10) : '{pw}' + 2 espaces ; saisie complétée par des espaces)")
if a.check:
    env = None
    with tempfile.TemporaryDirectory() as t:
        subprocess.run(["gcc", "-shared", "-fPIC", "-o", f"{t}/libcob.so.4", str(ROOT / "tools" / "libcob_shim.c")], check=True)
        env = {"LD_LIBRARY_PATH": t}
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True, env=env).stdout.strip().splitlines()[-1]
        ok, ko1, ko2, ko3 = run(pw), run(pw.lower()), run(pw + "XX"), run("wrong")
    print("OK:", ok, "| KO:", ko1, "|", ko2, "|", ko3)
    sys.exit(0 if ok == "Access Granted!" and all(k == "Access Denied!" for k in (ko1, ko2, ko3)) else 1)
