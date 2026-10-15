#!/usr/bin/env python3
"""ComputeTheKey (th) -- keygen.

main() exige argv[1] de longueur exactement 19 (+ NUL = 20 = `n`), applique
sub_11C3() dessus (chiffrement XOR par blocs de 6/6/6/1 octets, cle = 3 octets
byte_4018[0..2] -- [0] est l'octet bas d'un hash djb2-like calcule sur les 163
premiers octets de main() lui-meme (anti-patch : de 0x1342 a 0x13e5), [1]=0xC0
et [2]=0xDE sont des constantes fixes en .data -- plus bascule du dernier
octet (NUL <-> 1)), puis compare le resultat a unk_4030 (20 octets fixes) via
memcmp.

Le chiffrement est une INVOLUTION : on retrouve la cle en appliquant
exactement la meme transformation a unk_4030. 100% statique, aucune exécution
necessaire (voir cependant tools/gdb-dump-key-schedule.py pour la preuve live
et un piège de debug documenté dans le write-up).

Usage : computethekey-solve.py [-q] [--check]
"""
import argparse
import subprocess

EXE = "original/crackme_th"

MAIN_START = 0x1342
MAIN_HASH_END = 0x13E5   # bornes exactes (lea rdi,[main] ; lea rsi,[13e5] ; sub rsi,rdi -> 163)
UNK_4030_FILE_OFF = 0x4030 - 0x1000   # .data : decalage fichier->VA de 0x1000 pour ce PIE
NCHUNKS = 3
STATIC_KEY = (0xC0, 0xDE)  # byte_4018[1], byte_4018[2] -- constantes en .data


def djb2(data: bytes) -> int:
    h = 5381
    for b in data:
        h = (b + 33 * h) & 0xFFFFFFFFFFFFFFFF
    return h


def read_slice(path, offset, length):
    with open(path, "rb") as f:
        f.seek(offset)
        return f.read(length)


def xor_chunks_inplace(data: bytearray, key):
    """Reimplementation de sub_11C3 (sans le garde-fou sur l'octet final, qui
    ne sert qu'au sens direct -- la transformation est une involution)."""
    n = len(data)
    last = n - 1
    v5 = last // NCHUNKS
    v6 = n - 1 - v5
    v7 = v8 = idx = 0
    while True:
        k = key[idx % NCHUNKS]
        for i in range(v8, v8 + v5):
            data[i] ^= k
        idx += 1
        v7 += v5
        v8 += v5
        if v7 > v6:
            break
    if last > v7:
        k = key[idx % NCHUNKS]
        for i in range(v7, last):
            data[i] ^= k
    data[last] = 0 if data[last] else 1


def password(exe=EXE) -> str:
    code = read_slice(exe, MAIN_START, MAIN_HASH_END - MAIN_START)
    hash_byte = djb2(code) & 0xFF
    key = (hash_byte,) + STATIC_KEY
    data = bytearray(read_slice(exe, UNK_4030_FILE_OFF, 20))
    xor_chunks_inplace(data, key)
    return data[:-1].decode("ascii")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="lance le binaire avec la cle trouvee")
    ap.add_argument("--bin", default=EXE)
    a = ap.parse_args()
    pw = password(a.bin)
    if a.check:
        r = subprocess.run([a.bin, pw], capture_output=True, text=True)
        print(f"{pw} -> {r.stdout.strip()}")
    else:
        print(pw if a.q else f"clé = {pw!r}")


if __name__ == "__main__":
    main()
