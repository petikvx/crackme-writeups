#!/usr/bin/env python3
"""Euler KeygenMe (servitute) — keygen name -> serial.

Usage: euler-solve.py [--name petik] [-q] [--check [path/to/Euler.exe]]
"""
import argparse, os, subprocess, sys


def serial(name: str) -> str:
    if not 5 <= len(name) <= 15 or any(c.isdigit() or not c.isalpha() for c in name):
        raise ValueError("name: 5..15 chars, letters only")
    c = ord(name[len(name) - 4])            # byte at [name + strlen - 4]
    import math
    digits = "%.4e" % math.exp(c)            # _ecvt(exp(c), 5, ...) -> 5 significant digits
    digits = digits[0] + digits[2:6]
    s = sum(map(ord, digits))
    a = s * 0xB4                             # imul eax, eax, 0xb4
    b = a * 12 + 0x10C                       # (a+a+a)<<2 + 0x10c
    return f"{digits}{a}{b}"


def check(exe: str, name: str, ser: str) -> bool:
    env = dict(os.environ, WINEDEBUG="-all")
    out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{name}\n{ser}\n\n",
                         capture_output=True, text=True, env=env, timeout=120).stdout
    print(out)
    return "Good Name/Serial" in out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="analysis/extract/Euler.exe")
    a = ap.parse_args()
    s = serial(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
    if a.check:
        ok = check(a.check, a.name, s)
        print("CHECK:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
