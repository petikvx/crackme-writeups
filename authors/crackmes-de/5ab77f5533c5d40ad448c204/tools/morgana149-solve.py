#!/usr/bin/env python3
"""Keymaker Morgana 1.49 (bswap, crackmes.de).

Serial (10 caractères, aucun nom lu par le binaire) :
    "AQ" + c2 + "65" + "09" + c7 c8 c9      (c2, c7..c9 libres)
Le keymaker remplit les positions libres avec le nom (défaut : petik) :
    petik -> AQp6509eti

  ./morgana149-solve.py [nom]        # serial
  ./morgana149-solve.py -q           # serial seul (petik)
  ./morgana149-solve.py --check SER  # rejoue le check (réimplémentation Python)
"""
import argparse, sys

def table():
    """Boucle 0x401466..0x401492 sur un buffer encore à zéro (ecx=0x29, edx=0)."""
    ecx, edx, out = 0x29, 0, []
    for ebx in range(4):
        eax = 0                                   # movsx eax, byte [0x40332c+ebx] (= 0)
        ecx, eax = (ecx + eax) & 0xFFFFFFFF, ecx  # xadd ecx, eax
        ecx = (ecx + ebx) & 0xFFFFFFFF
        dx = ((edx & 0xFFFF) >> 2 | (eax & 3) << 14) & 0xFFFF   # shrd dx, ax, 2
        dl, dh = dx & 0xFF, dx >> 8
        dl = (((dl + 1) & 0xFF) ^ dh) - 1 & 0xFF  # inc dl / xor dl,dh / dec dl
        edx = (edx & 0xFFFF0000) | (dh << 8) | dl
        out.append(dl)
    return out                                    # [0x40, 0x40, 0x84, 0x06]

def check(serial: bytes) -> bool:
    if len(serial) != 10:                         # GetDlgItemTextA == 0x0a
        return False
    if serial[:2] != b"AQ":                       # cmp word [0x40332c], 0x5141
        return False
    s = bytearray(serial); t = table()
    for i in (2, 3):                              # xor byte [0x40332f+i], [0x40334b+i]
        s[3 + i] ^= t[i]
    ebx = int.from_bytes(s[3:7], "little")        # sub 0x401b79
    ebx = (ebx - 0xDEAD) & 0xFFFFFFFF
    ebx = (ebx & 0xFFFF0000) | ((ebx - 0x5689) & 0xFFFF)
    ebx = int.from_bytes(ebx.to_bytes(4, "little"), "big")   # bswap
    ebx = (ebx & 0xFFFF0000) | ((ebx - 0xB33F) & 0xFFFF)
    return ebx == 0

def keygen(name: str = "petik") -> str:
    t = table()
    d = (0x3FB43536).to_bytes(4, "little")        # dword attendu en [0x40332f]
    mid = bytes([d[0], d[1], d[2] ^ t[2], d[3] ^ t[3]]).decode()   # "6509"
    pad = (name + "XXXX")[:4]
    return "AQ" + pad[0] + mid + pad[1:4]

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    if a.check is not None:
        ok = check(a.check.encode("latin-1"))
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    s = keygen(a.name)
    assert check(s.encode())
    print(s if a.q else f"Name   = {a.name}\nSerial = {s}")
