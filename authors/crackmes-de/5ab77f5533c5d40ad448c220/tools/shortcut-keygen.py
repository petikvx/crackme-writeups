#!/usr/bin/env python3
"""Keygen pour SHoRT_CuT (kkr_we_rule, RED CReW 2010), Delphi 7 + LockBox (MD5/SHA-1).
Serial = A-B ; base32(A) et base32(B) sont déchiffrés avec une clé tirée du nom en hexa, puis
comparés à hash456220(SHA1hex(nom)) et hash456220(MD5hex(nom)).  usage : shortcut-keygen.py [nom] [--check SERIAL]"""
import argparse, base64, hashlib
M = 0xFFFFFFFF

def pow32(b, n):                      # 0x456064 : Power Int64, seul le dword bas sert
    return 1 if n == 0 else pow(b & M, n, 1 << 32)

def h456220(s):                       # 0x456220 -> IntToHex(v, 0)
    b = s.encode("latin-1"); ebx = edi = s14 = s18 = s1c = 0
    for idx in range(len(b), 0, -1):
        ebx = (ebx + b[idx - 1]) & M
        for i in range(1, idx):
            edi = (pow32(ebx, i) + ebx) & M
            s14 = (s14 + edi + ebx) & M
        s18 = (s18 + (pow32(s14, idx) ^ s14)) & M
        s1c ^= (edi + ebx + s14 + s18) & M
        ebx = s1c
    return "%X" % s1c

def key4560fc(namehex):               # 1re boucle de 0x4560fc
    eax = ecx = 0
    for esi, c in enumerate(namehex.encode(), 1):
        eax = (((eax + c) & M) >> 5) + 0x32 & M
        ecx = ((esi ^ eax) << 3) & M          # shl ecx,0x43 : le CPU masque à 3
        sx = ecx - (1 << 32) if ecx & 0x80000000 else ecx
        r = abs(sx) % esi * (1 if sx >= 0 else -1)   # idiv signé
        eax = (r << 3) & M
    return ecx

def enc(data, k):                     # 2e boucle de 0x4560fc
    m = ((k >> 7) ^ (k << 3)) & M
    return bytes((((c ^ m) - k) & 0xFF) for c in data)

def dec(target, k):
    m = ((k >> 7) ^ (k << 3)) & 0xFF
    return bytes((((t + k) & 0xFF) ^ m) for t in target)

def parts(name):
    nh = "".join("%X" % b for b in name.encode("latin-1"))
    return nh, h456220(hashlib.sha1(name.encode("latin-1")).hexdigest().upper()), \
               h456220(hashlib.md5(name.encode("latin-1")).hexdigest().upper())

def keygen(name):
    nh, t1, t2 = parts(name); k = key4560fc(nh)
    b32 = lambda x: base64.b32encode(x).decode().rstrip("=")
    return b32(dec(t1.encode(), k)) + "-" + b32(dec(t2.encode(), k))

def check(name, serial):
    if not name or "-" not in serial: return False
    nh, t1, t2 = parts(name); k = key4560fc(nh); a, b = serial.split("-", 1)
    d = lambda x: base64.b32decode(x + "=" * (-len(x) % 8))[: len(x) * 5 // 8]
    return enc(d(a), k).decode("latin-1") == t1 and enc(d(b), k).decode("latin-1") == t2

if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("name", nargs="?", default="petik"); ap.add_argument("--check"); a = ap.parse_args()
    if a.check:
        ok = check(a.name, a.check); print(a.name, a.check, "OK" if ok else "KO"); raise SystemExit(0 if ok else 1)
    nh, t1, t2 = parts(a.name)
    print("nom hex =", nh, "| cible A =", t1, "| cible B =", t2, "| clé = %#x" % key4560fc(nh))
    s = keygen(a.name); print("serial  :", s); assert check(a.name, s)
