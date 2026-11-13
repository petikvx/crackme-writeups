#!/usr/bin/env python3
"""Solveur Bobx "Very hard antidebug +10 antisystem" (crackmes.one 690cdb67...).

Reconstruit le mot de passe attendu par GetPassword() (VA 0x140001dc1) :
les 3 qwords + le dword écrits sur la pile, puis copiés par strncpy.
Pas de user/login : mot de passe fixe.

  python3 bobx-solve.py            # affiche le mot de passe
  python3 bobx-solve.py -q         # mot de passe seul
  python3 bobx-solve.py --check    # preuve via wine (xvfb-run) sur crackme.exe
"""
import argparse, os, struct, subprocess, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")


def password() -> str:
    buf = bytearray(struct.pack("<QQQ", 0x48545F4B43345243,   # "CR4CK_TH"
                                0x5F3447334D5F3531,           # "15_M3G4_"
                                0x3230325F44523448))          # "H4RD_202"
    buf += b"\0" * 8
    buf[0x17:0x1B] = struct.pack("<I", 0x213432)              # [rbp-0xa9] : "24!\0"
    return buf[: buf.index(0)].decode()


def check(pw: str) -> bool:
    with tempfile.TemporaryDirectory() as d:
        zipfile.ZipFile(ZIP).extract("crackme.exe", d, pwd=b"crackmes.one")
        out = subprocess.run(["xvfb-run", "-a", "wine", os.path.join(d, "crackme.exe")],
                             input=(pw + "\n\n").encode(), capture_output=True,
                             timeout=120).stdout.decode(errors="replace")
    print(out)
    return "Access Granted" in out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = password()
    print(pw if a.q else f"Password : {pw}")
    if a.check:
        ok = check(pw)
        print("CHECK:", "OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
