#!/usr/bin/env python3
"""niko122 — « niko's vm final!! :) » (vm-final.exe, PE64).

Le mot de passe (84 octets) est stocké chiffré dans le bytecode de la VM :
opcode CHECK (handler #30, FUN_140005da0) compare l'entrée à
    ct[i] ^ keystream(key, i)          key = 0xd8e0bc14, len = 0x54
Ce script recalcule le mot de passe hors binaire.

  python3 niko122-solve.py          # affiche le mot de passe
  python3 niko122-solve.py -q       # idem, sans fioriture (pour pipe)
  python3 niko122-solve.py --check ../original/vm-final.exe   # preuve live (xvfb-run + wine)
Pas d'username dans ce crackme (exemple `petik` : refusé -> "Wrong").
"""
import argparse, os, shutil, struct, subprocess, sys

M = 0xFFFFFFFF
KEY = 0xD8E0BC14
# 21 dwords poussés par FUN_1400068b0 (0x140006b15..) = 84 octets de ciphertext
CT_DWORDS = [
    0x88199109, 0x89BC333F, 0xB75D33FA, 0xA1E8019D, 0x23E86FDA, 0xA7B9C56B, 0x90FEA06F,
    0x69CEAACD, 0x5EE8BBB7, 0x823A8082, 0x6F91A639, 0x0E137A21, 0x8B02C9D1, 0xAA9F6DCB,
    0x4DD4A758, 0xF8F5D3EF, 0xCD4EA20F, 0x93C772E0, 0xED8C54BF, 0x5B6B8C96, 0x9173BB49,
]


def rol(x, n):
    return ((x << n) | (x >> (32 - n))) & M


def ks(key, i):
    """octet i du keystream (ChaCha-like, ~3,5 passes de quarter-round)"""
    u22 = (((key ^ 0x271F43D9) * 0x9E3779B9) & M) ^ 0xCAFEBABE
    u1 = ((key ^ 0x064D7CF8) + u22) & M
    k2 = ((((key >> 16) & 0xFFFF) >> 3) | ((key << 13) & M)) ^ 0x13371337
    a = rol((i ^ u1 ^ 0x99F0B3D4) & M, 16)      # u21
    b = (a + k2) & M                             # u20
    d = rol(b ^ u22, 12)                         # u16
    c = (u1 + d) & M                             # u15
    a = rol(c ^ a, 8);  b = (b + a) & M
    d = rol(d ^ b, 7);  c = (c + d) & M
    for _ in range(2):
        a = rol(a ^ c, 16); b = (b + a) & M
        d = rol(d ^ b, 12); c = (c + d) & M
        a = rol(a ^ c, 8);  b = (b + a) & M
        d = rol(d ^ b, 7);  c = (c + d) & M
    a = rol(a ^ c, 16); b = (b + a) & M
    d = rol(d ^ b, 12); c = (c + d) & M
    a = rol(a ^ c, 8);  b = (b + a) & M
    d = d ^ b
    return ((rol(d, 7) ^ a ^ b ^ c) >> ((i & 3) * 8)) & 0xFF


def password():
    ct = b"".join(struct.pack("<I", x) for x in CT_DWORDS)
    return bytes(c ^ ks(KEY, i) for i, c in enumerate(ct)).decode()


def run(exe, text):
    cmd = ["wine", exe]
    if shutil.which("xvfb-run"):
        cmd = ["xvfb-run", "-a"] + cmd
    r = subprocess.run(cmd, input=(text + "\n").encode(), capture_output=True, timeout=90)
    return r.stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance le binaire (wine) avec le mot de passe + un KO (petik)")
    a = ap.parse_args()
    pw = password()
    if a.q:
        print(pw)
        return
    print("password :", pw)
    if a.check:
        exe = os.path.abspath(a.check)
        ok, ko = run(exe, pw), run(exe, "petik")
        print("OK  ->", repr(ok))
        print("KO  ->", repr(ko))
        sys.exit(0 if "Correct" in ok and "Wrong" in ko else 1)


if __name__ == "__main__":
    main()
