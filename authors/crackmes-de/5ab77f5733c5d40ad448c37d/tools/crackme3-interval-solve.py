#!/usr/bin/env python3
"""crackme_3_interval (KLiZMA) : keygen ID / Serial / Authorization Code (scanf %ld x 3).

Usage:
  crackme3-interval-solve.py [-q] [--check] [--id ID] [--serial S]
  ID in 10000..99999, S in 100..999, ID*S/(ID+S) (idiv signé) dans 850..900.
  Code C in [ID-S-100, ID+S-100] et 10000..99999 (intervalle).
Pas de nom/login dans ce crackme (donc pas de `petik`). Ne touche jamais à original/.
"""
import argparse, os, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "CrackMe#3_by_KLiZMA.zip")


def combo(i, s):
    return (i * s) // (i + s)          # valeurs positives : idiv == //


def solve(i=99999, s=900):
    assert 10000 <= i <= 99999 and 100 <= s <= 999, "ID/Serial hors plage"
    assert 850 <= combo(i, s) <= 900, "combinaison ID/Serial invalide"
    lo, hi = max(i - s - 100, 10000), min(i + s - 100, 99999)
    assert lo <= hi
    return [i, s, hi]                  # n'importe quel C dans [lo, hi] convient


def run(path, answers):
    return subprocess.run(["xvfb-run", "-a", "wine", path],
                          input="".join(f"{x}\n" for x in answers).encode(),
                          capture_output=True, timeout=120).stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="exécute le binaire d'origine sous Wine")
    ap.add_argument("--id", type=int, default=99999)
    ap.add_argument("--serial", type=int, default=900)
    a = ap.parse_args()
    ans = solve(a.id, a.serial)
    if a.q:
        print(" ".join(map(str, ans)))
        return
    for l, x in zip(["ID", "Serial", "Authorization Code"], ans):
        print(f"{l:20} {x}")
    if a.check:
        with tempfile.TemporaryDirectory() as d:
            with zipfile.ZipFile(ZIP) as z:
                z.extract("crackme.exe", d, pwd=b"crackmes.one")
            exe = os.path.join(d, "crackme.exe")
            good = run(exe, ans)
            bad = run(exe, [ans[0], ans[1], ans[2] + 5000])    # code hors intervalle
        print("--- OK ---\n" + good)
        print("--- KO (code+5000) ---\n" + bad)
        sys.exit(0 if "Accepted!" in good and "Accepted!" not in bad else 1)


if __name__ == "__main__":
    main()
