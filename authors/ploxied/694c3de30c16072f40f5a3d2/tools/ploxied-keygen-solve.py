#!/usr/bin/env python3
"""Ploxied's Crack/Keygen Me : password = HEX(reverse(user XOR 0x0d)).

  python3 tools/ploxied-keygen-solve.py                # user = petik
  python3 tools/ploxied-keygen-solve.py --user bob -q  # affiche seulement le password
  python3 tools/ploxied-keygen-solve.py --check        # preuve live via xvfb-run wine
"""
import argparse, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "analysis", "extracted", "crackme.exe")  # extrait de original/crackme.rar


def keygen(user: str) -> str:
    if not 1 <= len(user) <= 8 or not user.isascii() or any(c.isspace() for c in user):
        raise ValueError("user: 1..8 caractères ASCII sans espace (scanf %8s, strlen<=8)")
    x = bytes(b ^ 0x0D for b in user.encode())
    return x[::-1].hex().upper()


def check(user: str, pw: str) -> bool:
    out = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=f"{user}\n{pw}\n\n",
                         capture_output=True, text=True, timeout=60, cwd=os.path.dirname(EXE)).stdout
    print(out)
    return "Congrats" in out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = keygen(a.user)
    if a.q:
        print(pw)
    else:
        print(f"user     = {a.user}\npassword = {pw}")
    if a.check:
        ok = check(a.user, pw)
        bad = check(a.user, pw[:-1] + ("0" if pw[-1] != "0" else "1"))
        print("OK" if ok and not bad else "KO")
        sys.exit(0 if ok and not bad else 1)


if __name__ == "__main__":
    main()
