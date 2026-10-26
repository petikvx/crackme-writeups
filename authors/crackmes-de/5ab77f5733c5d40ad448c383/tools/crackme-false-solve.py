#!/usr/bin/env python3
"""Keygen crackme_false (CRACKME #1 by vctor_) — vrai check dans info.nfo (CRACKME.dll).

Pour chaque octet name[i] : serial[2i] + serial[2i+1] == name[i] + 0x23  (mod 256)
Usage : crackme-false-solve.py [--name petik] [-q] [--check]
"""
import argparse


def keygen(name: str) -> str:
    out = []
    for c in name.encode("latin-1"):
        t = (c + 0x23) & 0xFF
        a = t // 2
        b = t - a
        out += [a, b]
    return bytes(out).decode("latin-1")


def check(name: str, serial: str) -> bool:
    n, s = name.encode("latin-1"), serial.encode("latin-1") + b"\0" * (2 * len(name))
    return all(((s[2 * i] + s[2 * i + 1]) & 0xFF) == ((c + 0x23) & 0xFF) for i, c in enumerate(n))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.name, a.check)
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    s = keygen(a.name)
    print(s if a.q else f"name={a.name!r} serial={s!r}")
