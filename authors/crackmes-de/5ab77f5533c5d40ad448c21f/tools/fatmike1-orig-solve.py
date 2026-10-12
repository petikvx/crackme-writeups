#!/usr/bin/env python3
"""fatmike Crackme #1 (version originale (bug add esp,8)) : retrouve l'unique serial par texte clair connu.
Le bouton Check déchiffre 48 octets (0x40802C) : dec[i] = enc[i] ^ serial[i % 13] (len == 13 obligatoire),
teste hash(dec) % 0x16049 == 0xFE65 (hash type ELF, arrêt au 1er octet nul) puis WriteProcessMemory
de dec en 0x40141F (48 NOP dans le binaire) et y revient.
Clair supposé : le même appel MessageBoxA que la branche « Try again! » (0x4012B6), avec « Well done! ».
usage : fatmike1-solve.py [--check SERIAL] [--exe chemin/Crackme1-unpacked.exe]"""
import argparse, os

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "analysis", "Crackme1-unpacked.exe")
CRIB = bytes.fromhex("6a 40 68 14 80 40 00 68 20 80 40 00 a1")  # push 40h / push "Information" / push "Well done!" / mov eax,[hDlg]

def enc_bytes(exe):
    d = open(exe, "rb").read()
    return d[0x802C:0x802C + 48]  # .data : RVA == offset fichier (exe dépacké)

def ehash(buf, mod=0x16049):
    v = 0
    for b in buf:
        if b == 0:
            break
        v = ((v << 4) + (b - 256 if b > 127 else b)) & 0xFFFFFFFF
        t = v & 0xF0000000
        if t:
            v ^= t >> 24
            v ^= t
    return v % mod

def decrypt(enc, serial):
    k = serial.encode("latin-1")
    return bytes(e ^ k[i % len(k)] for i, e in enumerate(enc))

if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--check"); ap.add_argument("--exe", default=EXE); a = ap.parse_args()
    enc = enc_bytes(a.exe)
    if a.check:
        s = a.check; dec = decrypt(enc, s) if s else b""
        ok = len(s) == 13 and ehash(dec) == 0xFE65
        print(s, "hash OK" if ok else "KO", "| code =", dec.hex(" ") if ok else "-")
        raise SystemExit(0 if ok else 1)
    key = bytes(e ^ c for e, c in zip(enc, CRIB)).decode("latin-1")
    print("clé depuis le crib :", key)
    dec = decrypt(enc, key)
    print("hash = %#x (attendu 0xfe65)" % ehash(dec))
    print("code 0x40141F :", dec.hex(" "))
