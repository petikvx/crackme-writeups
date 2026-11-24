#!/usr/bin/env python3
"""Keygen ImChill1n's very simple login : user -> password.

n = sum(octets du user trimé) * 0x841 ; bits = format(n,'b') ; inversion de chaque bit ; décimal.
"""
import argparse, subprocess, sys, os

def keygen(user: str) -> str:
    n = (sum(user.strip().encode()) * 0x841) & 0xFFFFFFFF
    b = format(n, "b")
    return str(int("".join("0" if c == "1" else "1" for c in b), 2))

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="vérifie via wine sur original/crackme.exe")
    a = ap.parse_args()
    pw = keygen(a.user)
    print(pw if a.q else f"user={a.user} password={pw}")
    if a.check:
        exe = os.path.join(os.path.dirname(__file__), "..", "original", "crackme.exe")
        out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{a.user}\n{pw}\n".encode(),
                             capture_output=True, timeout=90).stdout.decode(errors="replace")
        print(out.strip())
        sys.exit(0 if "Access granted" in out else 1)

if __name__ == "__main__":
    main()
