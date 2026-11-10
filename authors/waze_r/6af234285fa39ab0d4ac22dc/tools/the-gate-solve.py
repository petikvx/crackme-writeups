#!/usr/bin/env python3
"""the_gate.exe (Waze_r) : phrase -> SHA-256 -> clé AES-256-ECB -> flag.

Usage:
  the-gate-solve.py                # phrase par défaut, affiche le flag
  the-gate-solve.py -q             # flag seul
  the-gate-solve.py --check        # vérifie contre le binaire (wine)
  the-gate-solve.py --phrase "..." # teste une autre phrase
"""
import argparse, hashlib, os, subprocess, sys
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "the_gate.exe")
DEFAULT = "never gonna give you up"


def blob(exe, va, n):
    off = va - 0x140006000 + 0x3a00
    return open(exe, "rb").read()[off:off + n]


def try_phrase(phrase, exe=EXE):
    """Reproduit le binaire : lower + trim, SHA-256, AES-256-ECB sur 48 octets,
    padding PKCS7, puis SHA-256(plain) == 32 octets attendus @0x140006180."""
    p = phrase.strip(" \t").lower().encode()
    key = hashlib.sha256(p).digest()
    ct = blob(exe, 0x1400061a0, 48)
    want = blob(exe, 0x140006180, 32)
    d = Cipher(algorithms.AES(key), modes.ECB()).decryptor()
    pt = d.update(ct) + d.finalize()
    pad = pt[-1]
    if not 1 <= pad <= 16:
        return None
    flag = pt[:48 - pad]
    return flag.decode(errors="replace") if hashlib.sha256(flag).digest() == want else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--phrase", default=DEFAULT)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    flag = try_phrase(a.phrase)
    if a.q:
        print(flag or "")
    else:
        print("phrase:", a.phrase)
        print("flag  :", flag)
    if a.check:
        r = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=a.phrase + "\n",
                           capture_output=True, text=True, timeout=60)
        ok = "FLAG: " + (flag or "\0") in r.stdout
        print("binaire (wine):", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    sys.exit(0 if flag else 1)


main()
