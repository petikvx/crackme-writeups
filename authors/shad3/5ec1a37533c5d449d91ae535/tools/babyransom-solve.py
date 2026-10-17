#!/usr/bin/env python3
"""Shad3 — Baby Ransom (covid-19.bin) : cle XOR fixe = 92 (0x5c).

ATTENTION : le binaire original chiffre PUIS SUPPRIME tous les fichiers
reguliers du repertoire courant (opendir(".") + remove()) avec un XOR
mono-octet, sans jamais redonner la cle (pur ransomware-toy, aucune fonction
de dechiffrement dans le binaire). Ce solveur ne lance JAMAIS le binaire
d'origine : la cle est recalculee uniquement via srand(0xDEADBEEF) ; rand()
(seed fixe vu en Hex-Rays) grace a ctypes->libc, sans aucune ecriture disque,
puis verifiee par un round-trip XOR purement en memoire sur un fichier
factice dans un repertoire temporaire jetable (jamais le binaire lui-meme).

Usage : babyransom-solve.py [-q] [--check]
"""
import argparse
import ctypes
import sys
import tempfile
from pathlib import Path

SEED = 0xDEADBEEF


def compute_key() -> int:
    libc = ctypes.CDLL("libc.so.6")
    libc.srand(SEED)
    return libc.rand() % 255


def xor_bytes(data: bytes, key: int) -> bytes:
    return bytes(b ^ key for b in data)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle (decimal)")
    ap.add_argument("--check", action="store_true",
                     help="round-trip XOR en memoire (jamais sur le binaire d'origine)")
    a = ap.parse_args()
    key = compute_key()
    if a.q:
        print(key)
        return 0
    print(f"srand(0x{SEED:08X}) ; rand()%255 = {key} (0x{key:02x})")
    if a.check:
        with tempfile.TemporaryDirectory() as tmp:
            sample = b"ceci est un fichier de test, jamais le binaire original n'est execute."
            p = Path(tmp) / "sample.corona.test"
            enc = xor_bytes(sample, key)
            p.write_bytes(enc)
            dec = xor_bytes(p.read_bytes(), key)
            ok = dec == sample
            print("round-trip XOR:", "OK" if ok else "KO")
            return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
