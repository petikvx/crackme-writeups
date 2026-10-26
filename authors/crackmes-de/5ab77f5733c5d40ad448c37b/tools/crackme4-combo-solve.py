#!/usr/bin/env python3
"""crackme_4_combo (KLiZMA) : keygen 3 stages (scanf %ld x 9 entrées).

Usage:
  crackme4-combo-solve.py [-q] [--check] [--serial S] [--first A]
  S = serial stage 1 (0..99999999, b0*b1+b2*b3 == b4*b6+b5*b7, b0 = chiffre des unités)
  A = 1er serial stage 2 (100000..999999)
Pas de nom/login dans ce crackme (donc pas de `petik`). Ne touche jamais à original/.
"""
import argparse, os, subprocess, sys, zipfile, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "CrackMe_#4_by_KLiZMA.zip")


def stage1_ok(n):
    if not 0 <= n <= 99999999:
        return False
    b = [(n // 10 ** i) % 10 for i in range(8)]     # b[0] = unités
    return b[0] * b[1] + b[2] * b[3] == b[4] * b[6] + b[5] * b[7]


def sar(x, n):                                       # idiv-like: add (2^n-1) si négatif puis sar
    return (x + ((1 << n) - 1) if x < 0 else x) >> n


def solve(s=99999999, a=999999):
    assert stage1_ok(s), "stage 1 invalide"
    assert 100000 <= a <= 999999
    v2 = a + s - 0x400
    v3 = sar(s + v2, 10)
    v4 = s - a + v2 - v3
    v5 = sar(s, 8) + sar(a, 7) + sar(v2, 6)
    idv, code = v3, v5                               # ID in (99999, v3], Code in (999999, v5]
    assert 99999 < idv and 999999 < code, "choisir S/A plus grands"
    return [s, a, v2, v3, v4, v5, idv, code]


def run(path, answers):
    cmd = ["xvfb-run", "-a", "wine", path]
    return subprocess.run(cmd, input="".join(f"{x}\n" for x in answers).encode(),
                          capture_output=True, timeout=120).stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="exécute le binaire d'origine sous Wine")
    ap.add_argument("--serial", type=int, default=99999999)
    ap.add_argument("--first", type=int, default=999999)
    a = ap.parse_args()
    ans = solve(a.serial, a.first)
    if a.q:
        print(" ".join(map(str, ans)))
        return
    labels = ["Stage 1 serial", "Stage 2 1st", "Stage 2 2nd", "Stage 2 3rd", "Stage 2 4th",
              "Stage 2 5th", "Stage 3 ID", "Stage 3 Code"]
    for l, x in zip(labels, ans):
        print(f"{l:15} {x}")
    if a.check:
        with tempfile.TemporaryDirectory() as d:
            with zipfile.ZipFile(ZIP) as z:
                z.extract("crackme.exe", d, pwd=b"crackmes.one")
            good = run(os.path.join(d, "crackme.exe"), ans)
            bad = run(os.path.join(d, "crackme.exe"), [ans[0] + 1] + ans[1:])
        print("--- OK ---\n" + good)
        print("--- KO (stage1+1) ---\n" + bad)
        sys.exit(0 if "STAGE 3 completed" in good and "STAGE 3 completed" not in bad else 1)


if __name__ == "__main__":
    main()
