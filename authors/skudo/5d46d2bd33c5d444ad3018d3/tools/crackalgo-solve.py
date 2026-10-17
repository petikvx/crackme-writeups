#!/usr/bin/env python3
"""skudo — Crack the algorithm (Encrypt) : genere le fichier-cle attendu.

createKey("imsupersecur3") calcule un octet-cle initial (checksum signe 8
bits puis transformation XOR/mul), puis main() chiffre
"SvenJoergenIkeaBirdWaterSheepBoatCowPeePeePooPoo" avec un XOR en mode
feedback : key_suivant = octet chiffre precedent. Le programme demande le
CHEMIN d'un fichier contenant exactement ce texte chiffre (comparaison
std::string::compare sur la 1ere ligne lue par getline).

Usage : crackalgo-solve.py [-q] [--write FICHIER] [--check]
"""
import argparse
import subprocess
import sys
import tempfile
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "Encrypt"
KEY_SEED = "imsupersecur3"
PLAINTEXT = "SvenJoergenIkeaBirdWaterSheepBoatCowPeePeePooPoo"


def to_i8(x: int) -> int:
    x &= 0xFF
    return x - 256 if x >= 128 else x


def create_key(s: str) -> int:
    data = [ord(c) for c in s]
    v12 = 0
    for b in data:
        v12 = to_i8(v12 + b)
    v13 = to_i8(43 * (v12 ^ to_i8(v12 - 81) ^ 0x4C))
    v9 = 0
    for i in range(len(data)):
        data[i] = to_i8(data[i] ^ v13) & 0xFF
        sc = data[i] if data[i] < 128 else data[i] - 256
        v9 += sc
    v10 = -((-v9) % 100) if v9 < 0 else v9 % 100
    return -v10 if v10 < 0 else v10


def compute_key_bytes() -> bytes:
    key = create_key(KEY_SEED)
    out = bytearray()
    k = key
    for c in PLAINTEXT:
        enc = (k ^ ord(c)) & 0xFF
        k = enc
        out.append(enc)
    return bytes(out)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que les octets (hex)")
    ap.add_argument("--write", help="ecrit le fichier-cle a ce chemin")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    data = compute_key_bytes()
    if a.q:
        print(data.hex())
        return 0
    if a.write:
        Path(a.write).write_bytes(data)
        print(f"ecrit : {a.write} ({len(data)} octets)")
        return 0
    print(f"fichier-cle attendu (hex) : {data.hex()}")
    if a.check:
        with tempfile.NamedTemporaryFile(delete=False) as t:
            t.write(data)
            path = t.name
        r = subprocess.run([str(EXE)], input=path + "\n", capture_output=True, text=True)
        good = "Congratulations" in r.stdout
        print("OK:", r.stdout.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
