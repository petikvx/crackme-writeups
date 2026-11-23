#!/usr/bin/env python3
"""Hecate (kryptos) keygen : name -> serial XXXX-XXXX-XXXX.  Défaut : --name petik"""
import argparse, subprocess, sys, os

def serial(name: str) -> str:
    b = name.encode()
    if len(b) < 4:
        raise ValueError("name >= 4 caractères")
    h = 0x811c9dc5
    for c in b:
        h = ((h ^ c) * 0x1000193) & 0xffffffff          # FNV-1a 32
    r = (((len(b) * 0x1234) & 0xffff) ^ h) & 0xffffffff
    e = ((h >> 11) + 3 * r) & 0xffffffff
    d = r ^ e
    return "%04X-%04X-%04X" % (r & 0xffff, e & 0xffff, (d ^ 0xc0de) & 0xffff)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--check", action="store_true", help="teste contre hecate.exe (wine)")
    a = ap.parse_args()
    s = serial(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
    if a.check:
        exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "hecate.exe")
        for ser in (s, "0000-0000-0000"):
            o = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{a.name}\n{ser}\n",
                               capture_output=True, text=True, timeout=60).stdout
            print(ser, "->", o.strip().splitlines()[-1] if o.strip() else "")
main()
