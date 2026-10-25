#!/usr/bin/env python3
"""crackmes.de nag_screen_1 (kcom) — patcher : supprime la MessageBox « GET RID OF ME! ».

Extrait CrackMe1.exe de original/crackme1.zip (sans toucher à original/),
NOPe VA 0x40101e..0x401031 (4 push + call MessageBoxA) → analysis/CrackMe1.patched.exe.
  --check : vérifie le patch (octets) et lance sous Wine/xvfb : plus de MessageBox, dialogue direct.
"""
import argparse, hashlib, os, subprocess, sys, time, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "crackme1.zip")
OUT = os.path.join(ROOT, "analysis", "CrackMe1.patched.exe")
OFF, LEN = 0x41e, 20   # VA 0x40101e - 0x401000 + raw 0x400
ORIG = bytes.fromhex("6a00680030400068103040006a00ff150c204000")


def build():
    data = bytearray(zipfile.ZipFile(ZIP).read("CrackMe1.exe", pwd=b"crackmes.one"))
    assert bytes(data[OFF:OFF + LEN]) == ORIG, "octets inattendus"
    data[OFF:OFF + LEN] = b"\x90" * LEN
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT, "wb").write(data)
    return OUT


def windows(exe, wait=4):
    """Lance exe sous Xvfb+Wine, retourne la liste des fenêtres (xwininfo -root -tree)."""
    sh = f'wine "{exe}" >/dev/null 2>&1 & sleep {wait}; xwininfo -root -tree | grep -i crackme1 | grep \\\" ; wineserver -k'
    r = subprocess.run(["xvfb-run", "-a", "bash", "-c", sh], capture_output=True, text=True)
    return r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    out = build()
    print(out if a.q else f"patché : {out} sha256={hashlib.sha256(open(out,'rb').read()).hexdigest()}")
    if a.check:
        orig = os.path.join(ROOT, "analysis", "x", "CrackMe1.exe")
        if not os.path.exists(orig):
            os.makedirs(os.path.dirname(orig), exist_ok=True)
            open(orig, "wb").write(zipfile.ZipFile(ZIP).read("CrackMe1.exe", pwd=b"crackmes.one"))
        wo, wp = windows(orig), windows(out)
        print("original :\n" + wo + "patché :\n" + wp)
        ok = "GET RID OF ME!" in wo and "GET RID OF ME!" not in wp and "Crackme!" in wp
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)


main()
