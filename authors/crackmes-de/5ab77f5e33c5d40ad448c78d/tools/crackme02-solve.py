#!/usr/bin/env python3
"""crackme2 / crackme02 (seveb) — id 5ab77f5e33c5d40ad448c78d. ELF32 + ELF64. Serial de 21 caractères (stdin).

  s[0:3]  = "da-"                      s[18:21] = "-da"
  s[3:7]  = N décimal, N ∈ { i : 1000 < i <= 2000, i % 20 == 3 }  (salt(), 50 valeurs : 1003, 1023, …, 1983)
  s[7]    = '-'    s[13] = '-'
  s[8:13] = v[3] v[2] 'X' v[1] v[0]  avec  v = str(7*(N//3)+42)   (si 2*(N//3+16) <= 999)
  s[14:18]: s[14] <= s[16]  et  s[17] >= s[15]       (libres sinon)
  succès : « Good job you made it! »

  crackme02-solve.py [N] [-q] [--check]       (défaut N = 1003)
"""
import argparse, subprocess, sys
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis"
VALID_N = [i for i in range(1, 2001) if i % 20 == 3 and i > 1000]


def keygen(n=1003, mid="aaaa"):
    assert n in VALID_N
    q = n // 3
    v3 = 2 * (q + 16)
    if v3 <= 999:
        v3 = 7 * q + 42
    v = str(v3)
    assert len(v) == 4, "v doit avoir 4 chiffres"
    s2 = v[3] + v[2] + "X" + v[1] + v[0]
    assert mid[0] <= mid[2] and mid[3] >= mid[1]
    return f"da-{n:04d}-{s2}-{mid}-da"


def run(exe, s):
    return subprocess.run([str(A / exe)], input=s + "\n", capture_output=True, text=True, timeout=5).stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("n", nargs="?", type=int, default=1003)
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen(a.n)
    print(k if a.q else f"serial : {k}   ({len(VALID_N)} valeurs de N possibles)")
    if a.check:
        good = all("Good job you made it" in run(e, keygen(n)) for e in ("crackme02_64bit", "crackme02_32bit") for n in (1003, 1503, 1983))
        bad = all("invalid" in run("crackme02_64bit", s) for s in (k[:-1] + "b", k.replace("-", "_", 1), "da-1004-08X32-aaaa-da"))
        print("check:", "OK" if good and bad else "KO", f"(accepté={good}, altérés rejetés={bad})")
        sys.exit(0 if good and bad else 1)


if __name__ == "__main__":
    main()
