#!/usr/bin/env python3
"""BadEngineer's BeginnerFriendly — keygen.

Prédicat (main @ 0x40146d) : strlen(pw) <= 16 et sum(ord(c)) == 0x4d8 (1240).
Tout mot de passe respectant ça est valide ; on complète un préfixe (défaut : petik)
avec des caractères imprimables pour atteindre la somme.

  beginnerfriendly-solve.py [--prefix petik] [-q] [--check original.exe]
"""
import argparse, subprocess, sys

TARGET, MAXLEN = 0x4D8, 16


def solve(prefix="petik"):
    rem = TARGET - sum(map(ord, prefix))
    n = MAXLEN - len(prefix)
    for k in range(0, n + 1):  # k caractères de remplissage, imprimables 0x21..0x7e
        if 0x21 * k <= rem <= 0x7E * k and (k or rem == 0):
            if k == 0:
                return prefix
            base, extra = divmod(rem, k)
            fill = [base + (1 if i < extra else 0) for i in range(k)]
            return prefix + "".join(map(chr, fill))
    raise SystemExit("prefixe impossible")


def valid(p):
    return len(p) <= MAXLEN and sum(map(ord, p)) == TARGET


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--prefix", "--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance le binaire sous xvfb-run wine")
    a = ap.parse_args()
    pw = solve(a.prefix)
    assert valid(pw)
    print(pw if a.q else f"password = {pw!r} (len={len(pw)}, sum={sum(map(ord, pw))})")
    if a.check:
        out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=pw + "\n",
                             capture_output=True, text=True, timeout=120).stdout
        print(out)
        sys.exit(0 if "Congrats!" in out else 1)
