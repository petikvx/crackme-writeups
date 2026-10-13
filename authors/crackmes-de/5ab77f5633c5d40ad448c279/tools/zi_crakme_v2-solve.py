#!/usr/bin/env python3
"""Zi-Crackme V2 (zionz, crackmes.de) — Blitz3D keygen.

Username longueur 5 obligatoire. Serial = str(formule sur Asc des 5 chars) :
  a..e = Asc(Mid(user,1..5,1))
  key  = ((((a+b+d)*c) + e) + a + e) * e + d

Le code Blitz compilé est en RT_RCDATA #1111 (.rsrc). AC341 est un leurre
(« THIS IS NOT THE WAY »).

Usage : zi_crakme_v2-solve.py [USER] [-q] [--check USER SERIAL] [--exe PATH]
"""
from __future__ import annotations

import argparse
import os
import struct
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "Zi-Crackme V2.exe")


def key_from_user(user: str) -> str:
    if len(user) != 5:
        raise ValueError("username must be exactly 5 chars")
    a, b, c, d, e = (ord(ch) for ch in user)
    t = (a + b + d) * c + e
    t = t + a + e
    return str(t * e + d)


def find_rcdata(path: str) -> tuple[int, bytes]:
    """Locate RT_RCDATA #1111 (Blitz user program)."""
    data = open(path, "rb").read()
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    size_opt = struct.unpack_from("<H", data, e_lfanew + 20)[0]
    sec_off = e_lfanew + 24 + size_opt
    # find .rsrc
    num_sec = struct.unpack_from("<H", data, e_lfanew + 6)[0]
    rsrc_raw = rsrc_rva = None
    for i in range(num_sec):
        off = sec_off + i * 40
        name = data[off : off + 8].rstrip(b"\x00")
        vsize, vaddr, rawsize, rawptr = struct.unpack_from("<IIII", data, off + 8)
        if name == b".rsrc":
            rsrc_raw, rsrc_rva = rawptr, vaddr
            break
    if rsrc_raw is None:
        raise RuntimeError(".rsrc missing")

    def rva2off(rva: int) -> int:
        return rva - rsrc_rva + rsrc_raw

    def parse_dir(off: int):
        _c, _t, _maj, _min, nnamed, nid = struct.unpack_from("<IIHHHH", data, off)
        out = []
        for i in range(nnamed + nid):
            n, d = struct.unpack_from("<II", data, off + 16 + i * 8)
            out.append((n, d))
        return out

    for tname, tdata in parse_dir(rsrc_raw):
        if tname != 10:  # RT_RCDATA
            continue
        if not (tdata & 0x80000000):
            continue
        for nname, ndata in parse_dir(rsrc_raw + (tdata & 0x7FFFFFFF)):
            if nname != 1111 or not (ndata & 0x80000000):
                continue
            for _lang, ldata in parse_dir(rsrc_raw + (ndata & 0x7FFFFFFF)):
                doff = rsrc_raw + (ldata & 0x7FFFFFFF)
                rva_d, sz, *_ = struct.unpack_from("<IIII", data, doff)
                foff = rva2off(rva_d)
                return foff, data[foff : foff + sz]
    raise RuntimeError("RT_RCDATA #1111 not found")


def verify_formula_in_binary(path: str) -> bool:
    """Sanity: bytecode contains the imul/add pattern for the key formula."""
    _off, blob = find_rcdata(path)
    # After 5× Asc stores: add/add/imul/add then add/add then imul then add
    # Look for signature bytes seen in disasm around 0x32b:
    sig = bytes.fromhex(
        "8b5df4"  # mov ebx,[ebp-0xc]
        "035df0"  # add ebx,[ebp-0x10]
        "035de8"  # add ebx,[ebp-0x18]
        "0faf5dec"  # imul ebx,[ebp-0x14]
        "035de4"  # add ebx,[ebp-0x1c]
    )
    return sig in blob


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=2, metavar=("USER", "SERIAL"))
    ap.add_argument("--exe", default=EXE)
    a = ap.parse_args()

    if not verify_formula_in_binary(a.exe):
        print("KO: formula signature missing in RT_RCDATA", file=sys.stderr)
        raise SystemExit(2)

    if a.check is not None:
        user, serial = a.check
        ok = key_from_user(user) == serial
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)

    serial = key_from_user(a.user)
    if a.q:
        print(serial)
    else:
        print(f"user   : {a.user}")
        print(f"serial : {serial}")
        print(f"check  : formula signature OK in {os.path.basename(a.exe)}")


if __name__ == "__main__":
    main()
