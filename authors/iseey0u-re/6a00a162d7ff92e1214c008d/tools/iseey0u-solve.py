#!/usr/bin/env python3
"""iseey0u (crackmes.exe) : mot de passe dépendant du débogueur.

Le binaire ne marche que sous débogueur (IsDebuggerPresent) ; la clé XOR
vaut alors 0x6d et le mot de passe commence par 4 octets 0x14 (Ctrl-T).

  python3 iseey0u-solve.py            # écrit le mot de passe (hex + repr)
  python3 iseey0u-solve.py -q         # octets bruts, sans newline, pour un pipe
  python3 iseey0u-solve.py --check EXE [DBGRUN]   # preuve sous Wine + mini-débogueur
"""
import argparse, subprocess, sys

BLOB = bytes.fromhex("3e2f3c3e3630382e")  # dwords 0x3e3c2f3e, 0x2e383036 (LE)
KEY_DBG, KEY_NODBG = 0x6d, 0x5d
PREFIX_DBG = b"\x14" * 4


def password(debugged=True):
    if debugged:
        return PREFIX_DBG + bytes(b ^ KEY_DBG for b in BLOB)
    return bytes(b ^ KEY_NODBG for b in BLOB)  # "crackmes" : leurre, le binaire quitte avant


def run(exe, dbgrun, pw):
    r = subprocess.run(["xvfb-run", "-a", "wine", dbgrun, exe], input=pw + b"\n",
                       capture_output=True, timeout=60)
    return r.stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="+", metavar=("EXE", "DBGRUN"))
    a = ap.parse_args()
    pw = password()
    if a.q:
        sys.stdout.buffer.write(pw)
    elif a.check:
        exe = a.check[0]
        dbgrun = a.check[1] if len(a.check) > 1 else "dbgrun.exe"
        ok, ko = run(exe, dbgrun, pw), run(exe, dbgrun, password(False))
        print("OK :", ok.strip()); print("KO :", ko.strip())
        sys.exit(0 if "Success" in ok and "Fail" in ko else 1)
    else:
        print("password =", pw, "hex", pw.hex())


if __name__ == "__main__":
    main()
