#!/usr/bin/env python3
"""MoonWare's .NET Framework (Avm VM) — credentials fixes (pas de calcul par user).

  python3 tools/moonware-solve.py          # affiche user + password
  python3 tools/moonware-solve.py -q       # "user:password"
  python3 tools/moonware-solve.py --check  # rejoue le binaire (dotnet + shim kernel32, pty) — voir README
"""
import argparse, os, subprocess, sys

USER = "ElfGroups"
PASSWORD = "e73cddb195c38ff1a614f323107e58c671cdbea7bc2b1588"

def check():
    here = os.path.dirname(os.path.abspath(__file__))
    run = os.path.join(here, "..", "analysis", "run")
    if not os.path.exists(os.path.join(run, "CrackMe.exe")):
        sys.exit("préparer analysis/run (voir README §Vérification)")
    for pw, want in ((PASSWORD, "GRANTED"), (PASSWORD[:-1] + "9", "DENIED")):
        out = subprocess.run(["script", "-qec", "dotnet CrackMe.exe", "/dev/null"], cwd=run,
                             input=f"{USER}\n{pw}\n".encode(), capture_output=True, timeout=60).stdout.decode()
        ok = want in out
        print(("OK " if ok else "KO ") + want)
        if not ok:
            sys.exit(1)

ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.check:
    check()
elif a.q:
    print(f"{USER}:{PASSWORD}")
else:
    print(f"user     = {USER}\npassword = {PASSWORD}")
