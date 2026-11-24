#!/usr/bin/env python3
"""Solveur — OTC's Keygen

Le nom doit valoir "Speed" (base64 == "U3BlZWQ=" dans le binaire interne) ;
`petik` est donc impossible. Second champ :
  sha256hex( bytes(c ^ 0x42 for c in md5hex(name)) )

Usage:
  python3 -I tools/otc-solve.py -q
  python3 -I tools/otc-solve.py --check
"""
from __future__ import annotations
import argparse, hashlib, os, shutil, subprocess, tempfile
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "task"
NAME = "Speed"

def answer(name: str = NAME) -> str:
    m = hashlib.md5(name.encode()).hexdigest().encode()
    return hashlib.sha256(bytes(c ^ 0x42 for c in m)).hexdigest()

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = answer()
    if a.check:
        with tempfile.TemporaryDirectory() as d:  # original/ n'est pas exécutable : on lance une copie
            t = Path(d) / "task"
            shutil.copy(BIN, t); os.chmod(t, 0o755)
            r = subprocess.run([str(t)], input=f"{NAME}\n{s}\n", capture_output=True, text=True, timeout=10, cwd=d)
            bad = subprocess.run([str(t)], input=f"{NAME}\n{'0'*64}\n", capture_output=True, text=True, timeout=10, cwd=d)
        print(r.stdout.strip()); print("--- KO ---"); print(bad.stdout.strip())
        ok = "You are him!" in r.stdout and "Bad luck" in bad.stdout
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(s if a.q else f"{NAME} → {s}")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
