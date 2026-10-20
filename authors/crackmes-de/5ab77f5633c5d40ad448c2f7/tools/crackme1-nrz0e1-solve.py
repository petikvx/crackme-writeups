#!/usr/bin/env python3
"""Patch du CrackMe #1 de NrZ0e1 : neutralise l'exit(1) de main (VA 0x40117c).

Extrait CrackMe.exe de original/CrackMe.zip (mdp crackmes.one) SANS toucher a
original/, patche 8 octets (push 1 / call exit / pop ecx -> nop) et ecrit
analysis/CrackMe-patched.exe.
Usage : crackme1-nrz0e1-solve.py [-q] [--check]   (--check : lance sous wine)
"""
import argparse, hashlib, io, os, subprocess, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "CrackMe.zip")
OUT = os.path.join(HERE, "..", "analysis", "CrackMe-patched.exe")
SHA = "e3c86c98c883d1e8ee1af3006a97dee4cc59ae74916eb4c2bc97776b2ec462b9"
VA, IMAGEBASE, TEXT_VA, TEXT_RAW = 0x40117C, 0x400000, 0x1000, 0x600
OFF = VA - IMAGEBASE - TEXT_VA + TEXT_RAW          # 0x77c
ORIG = bytes.fromhex("6a01e8c161000059")           # push 1; call exit; pop ecx


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe = bytearray(zipfile.ZipFile(ZIP).read("CrackMe.exe", pwd=b"crackmes.one"))
    assert hashlib.sha256(exe).hexdigest() == SHA, "exe inattendu"
    assert exe[OFF:OFF + 8] == ORIG, "octets inattendus"
    exe[OFF:OFF + 8] = b"\x90" * 8
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT, "wb").write(exe)
    if not a.q:
        print(f"patch @file 0x{OFF:x} (VA 0x{VA:x}) : {ORIG.hex()} -> 90*8 ; ecrit {OUT}")
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", OUT], input=b"\n", capture_output=True, timeout=60)
        out = r.stdout.decode("latin1")
        print(out)
        ok = "You solved the problem" in out
        print("CHECK", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)


main()
