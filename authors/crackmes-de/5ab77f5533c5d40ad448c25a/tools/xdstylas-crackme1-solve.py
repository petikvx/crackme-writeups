#!/usr/bin/env python3
"""xdstylas_crackme_1 (xdstyla, crackmes.de) — serial unique.

main @ 0x402990 : cin >> s ; t = "" ; pour chaque c de s : t += chr(c ^ 0x14) ;
t == "loludiditcongratz" (0x4141B4, std::string compare) -> "Right", sinon "Noo0O0oo!".
Serial = "loludiditcongratz" ^ 0x14 (lu dans le binaire).

  ./xdstylas-crackme1-solve.py            # explications
  ./xdstylas-crackme1-solve.py -q         # serial seul
  ./xdstylas-crackme1-solve.py --check S  # simule le prédicat
  ./xdstylas-crackme1-solve.py --wine     # preuve live (wine, stdin)
"""
import argparse, pathlib, subprocess
EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "Crackme1.exe"
OFF_TARGET = 0x12BB4   # offset fichier de "loludiditcongratz" (VA 0x4141B4)
KEY = 0x14

def target():
    d = EXE.read_bytes(); return d[OFF_TARGET:d.index(b"\0", OFF_TARGET)]

def check(s: bytes) -> bool:
    return bytes(c ^ KEY for c in s) == target()

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check"); ap.add_argument("--wine", action="store_true")
    a = ap.parse_args()
    t = target(); serial = bytes(c ^ KEY for c in t).decode()
    if a.check is not None:
        ok = check(a.check.encode()); print("Right" if ok else "Noo0O0oo!"); raise SystemExit(0 if ok else 1)
    if a.wine:
        out = subprocess.run(["wine", str(EXE)], input=serial + "\n", capture_output=True, text=True, timeout=60).stdout
        print(out.strip()); raise SystemExit(0 if "Right" in out else 1)
    if a.q:
        print(serial); return
    print(f"cible (0x4141B4) = {t.decode()!r}\nclé XOR = {KEY:#x}\nserial = {serial}")

if __name__ == "__main__":
    main()
