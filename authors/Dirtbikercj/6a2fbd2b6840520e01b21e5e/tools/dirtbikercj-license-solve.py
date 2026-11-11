#!/usr/bin/env python3
"""Dirtbikercj's Secure License Portal — extrait la license key de CrackMe.dll.

Usage : python3 -I dirtbikercj-license-solve.py [-q] [--check]
La clé est un blob statique de 16 octets (ReadOnlySpan<byte>, 15 utilisés)
dans .text, juste après le stub `jmp [_CorExeMain]` ; ValidateKey la compare
telle quelle (la lambda Select est l'identité byte->char).
--check : vérifie le motif IL (ldsflda; ldc.i4.s 15; newobj ReadOnlySpan) et
la présence du message [SUCCESS] dans #US.
"""
import argparse, io, re, sys, zipfile
from pathlib import Path

ORIG = Path(__file__).resolve().parent.parent / "original" / "download.bin"

def load_dll():
    outer = zipfile.ZipFile(ORIG)
    inner = zipfile.ZipFile(io.BytesIO(outer.read("CrackMe.zip", pwd=b"crackmes.one")))
    return inner.read("CrackMe.dll")

def extract_key(dll):
    stub = b"\xff\x25\x00\x20\x40\x00"      # jmp [0x402000] (apphost -> mscoree)
    i = dll.find(stub)
    assert i >= 0, "stub _CorExeMain introuvable"
    blob = dll[i + len(stub): i + len(stub) + 16]
    return blob[:15].decode("ascii")        # ldc.i4.s 15 : le 16e octet est ignoré

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    dll = load_dll()
    key = extract_key(dll)
    if a.check:
        assert re.search(rb"\x7f.\x00\x00\x04\x1f\x0f\x73", dll), "motif IL absent"
        assert "[SUCCESS]".encode("utf-16le") in dll, "message succès absent"
        assert re.fullmatch(r"[\x20-\x7e]{15}", key)
    print(key if a.q else f"License key : {key}")

if __name__ == "__main__":
    sys.exit(main())
