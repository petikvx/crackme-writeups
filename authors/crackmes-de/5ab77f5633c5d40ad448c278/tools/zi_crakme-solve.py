#!/usr/bin/env python3
"""Zi - Crakme v1.0 (zionz, crackmes.de) — Blitz3D.

Le code BlitzBasic compilé est stocké dans la ressource du runtime Blitz3D
(section .rsrc) avec sa table de constantes chaînes (__bbStrConst). Le
programme fait : Input("ENTER SERIAL TO CONTINUE:") ; If s$ = "AX943" ...
(__bbStrCompare, sensible à la casse). Ce script relit la constante qui suit
le prompt directement dans le binaire.

Usage : zi_crakme-solve.py [-q] [--check SERIAL] [--exe PATH]
"""
import argparse, os, re

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "Zi _Crackme.exe")


def extract(path):
    d = open(path, "rb").read()
    i = d.index(b"ENTER SERIAL TO CONTINUE:\x00")
    consts = re.findall(rb"([\x20-\x7e]+)\x00", d[i:i + 0x60])
    # consts = [prompt, serial, "WELL DONE!", "WRONG SERIAL"]
    assert consts[2] == b"WELL DONE!" and consts[3] == b"WRONG SERIAL", consts
    return i, consts[1].decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    ap.add_argument("--exe", default=EXE)
    a = ap.parse_args()
    off, serial = extract(a.exe)
    if a.check is not None:
        ok = a.check == serial
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    if a.q:
        print(serial)
    else:
        print(f"prompt @ file 0x{off:x}")
        print(f"serial : {serial}")


if __name__ == "__main__":
    main()
