#!/usr/bin/env python3
"""crackme1 / crackme01 (seveb) — id 5ab77f5e33c5d40ad448c78b. ELF32 + ELF64.

main : scanf("%23s", s) ; s[0] == '6' et s[1] == '9' ; out[0] = 'E' ;
  pour i = 1..7 (a = 2, 5, 8, …, 20) : out[i] = atoi(s[a:a+3]) (si strlen(out) <= 7) ;
  strcmp(out, "Evilzone") == 0 -> « The Password translates into Evilzone, Good job. »
=> s = "69" + "".join(str(ord(c)) for c in "vilzone") = 69118105108122111110101 (23 caractères)

  crackme01-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis"
TARGET = "Evilzone"


def serial():
    return "69" + "".join(str(ord(c)) for c in TARGET[1:])


def run(exe, s):
    return subprocess.run([str(A / exe)], input=s + "\n", capture_output=True, text=True, timeout=5).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = serial()
    print(s if a.q else f"secret number : {s}   (« 69 » + codes ASCII décimaux de « vilzone »)")
    if a.check:
        res = {e: ("Good job" in run(e, s), "Nope" in run(e, "123")) for e in ("crackme01_64bit", "crackme01_32bit")}
        ok = all(all(v) for v in res.values())
        print("check:", "OK" if ok else "KO", res)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
