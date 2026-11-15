#!/usr/bin/env python3
"""deo's DEOBF ME : localise et déchiffre les blobs chiffrés (pas de serial).

Usage : deo-deobf-solve.py [-q] [--check] [deob.exe]
Défaut : ../analysis/extracted/deob/deob.exe (extraction : voir README).
"""
import argparse, hashlib, os, struct, sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEF = os.path.join(HERE, "..", "analysis", "extracted", "deob", "deob.exe")
STUB_RVA, ENC_OFF, N_DW = 0xA1C000, 0x80, 0x20A      # section .a1jpc7M
K0, KSTEP = 0x1FEF3488, 0x6595A395                   # xor-then-add rolling key


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?", default=DEF)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = open(a.exe, "rb").read()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    ns = struct.unpack_from("<H", d, pe + 6)[0]
    for i in range(ns):
        n, vs, va, rs, ro = struct.unpack_from("<8sIIII", d, pe + 264 + i * 40)
        if va == STUB_RVA:
            break
    else:
        sys.exit("section stub introuvable")
    off = ro + ENC_OFF
    blob = d[off:off + N_DW * 4]
    k, out = K0, bytearray()
    for (v,) in struct.iter_unpack("<I", blob):
        out += struct.pack("<I", v ^ k)
        k = (k + KSTEP) & 0xFFFFFFFF
    oep = 0x5A9CE56B ^ 0x5A9C2F17
    ok = out[:2] == b"SU" and b"KERNEL32.dll" in out and oep == 0xCA7C
    if a.q:
        print(f"blob@file=0x{off:x} rva=0x{STUB_RVA+ENC_OFF:x} len=0x{len(blob):x} OEP_rva=0x{oep:x}")
    else:
        print(f"Blob chiffré #1 : offset fichier 0x{off:x}, RVA 0x{STUB_RVA+ENC_OFF:x}, taille 0x{len(blob):x}")
        print("  sha256 chiffré :", hashlib.sha256(blob).hexdigest())
        print("  sha256 clair   :", hashlib.sha256(out).hexdigest())
        print(f"  OEP = ImageBase + 0x{oep:x}")
    open(os.path.join(HERE, "..", "analysis", "stub-decrypted.bin"), "wb").write(out)
    if a.check:
        print("CHECK", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)


main()
