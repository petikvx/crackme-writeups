#!/usr/bin/env python3
"""KeyGenMe #1 (Ks@il / GFS) — keygen.

serial = IntToStr(major) + IntToStr(minor) + DecryptStr()
  - major/minor = octets bas de GetVersion() (version de Windows « vue » par le process)
  - DecryptStr  = 15 octets @0x4696D0 XOR clé "Delphi String Protect by BGSoPT." (i mod 32)
Usage : ./crackmes-de-keygenme_1-solve.py [major minor]   (défaut 6 2 = Win8+/wine sans manifeste)
        ./crackmes-de-keygenme_1-solve.py --exe ../original/KeyGenMe.exe   (relit la table dans le PE)
"""
import sys

KEY = b"Delphi String Protect by BGSoPT."
TABLE = bytes.fromhex("021141425b0e047e160a5d084a6034")  # @0x4696D0 (section DATA), 15 octets

def table_from_exe(path):
    import pefile
    pe = pefile.PE(path)
    return pe.get_data(0x4696D0 - pe.OPTIONAL_HEADER.ImageBase, 15)

def suffix(table=TABLE):
    return bytes(KEY[i % 32] ^ table[i] for i in range(15)).decode("latin-1")

def serial(major, minor, table=TABLE):
    return f"{major}{minor}{suffix(table)}"

if __name__ == "__main__":
    a = sys.argv[1:]
    t = TABLE
    if a[:1] == ["--exe"]:
        t = table_from_exe(a[1]); a = a[2:]
    maj, mi = (int(a[0]), int(a[1])) if len(a) == 2 else (6, 2)
    print(serial(maj, mi, t))
    if not a:
        for name, (M, m) in {"Win98": (4, 10), "Win2000": (5, 0), "WinXP": (5, 1), "Vista": (6, 0),
                             "Win7": (6, 1), "Win8+ / Win10 / Win11 / wine": (6, 2)}.items():
            print(f"  {name:28} -> {serial(M, m, t)}")
