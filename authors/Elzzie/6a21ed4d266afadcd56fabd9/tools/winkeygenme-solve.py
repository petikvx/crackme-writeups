#!/usr/bin/env python3
"""Keygen pour Elzzie's winkeygenme (Cr4ckM3.dll, WPF .NET 8).

key = groupes de 5 de base32(alphabet sans I/O/0/1)( V01[ SHA256(user) ] )[:25]
Usage : winkeygenme-solve.py [-q] [--check KEY] [user]   (défaut user = petik1 : "petik" fait 5 car., min 6 imposé)
"""
import argparse, hashlib, sys

V01 = bytes([
15,157,173,22,121,207,118,148,192,243,242,81,143,246,43,113,224,231,152,83,
55,29,91,163,162,100,137,203,171,57,234,244,79,62,28,209,17,146,196,175,
161,154,227,126,82,160,201,67,14,232,31,202,151,112,167,206,80,210,102,247,
36,30,116,237,8,134,172,45,11,223,125,115,251,211,48,64,60,144,3,111,
205,165,169,92,186,63,108,75,178,96,20,228,93,129,109,135,239,133,213,132,
59,104,13,130,240,233,37,72,122,149,65,181,182,142,150,6,32,51,252,183,
88,61,248,69,54,214,245,101,225,16,177,164,105,187,35,170,90,76,127,218,
71,199,238,47,249,87,216,128,78,70,9,74,200,50,176,38,230,42,241,235,
124,193,221,34,53,23,212,25,123,188,155,179,107,184,250,219,21,73,197,156,
5,198,114,99,85,168,56,153,18,49,19,136,68,222,4,86,145,254,110,117,
66,2,7,84,139,189,159,40,94,24,119,180,46,229,58,77,120,208,33,220,
217,98,39,226,41,141,190,1,204,147,103,44,138,194,10,26,12,95,185,0,
97,195,191,158,215,253,52,131,89,174,27,140,255,106,166,236])
ALPHA = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"

def keygen(user: str) -> str:
    if len(user) < 6:
        raise ValueError("username >= 6 caractères")
    h = bytes(V01[b] for b in hashlib.sha256(user.encode()).digest())
    bits = "".join(f"{b:08b}" for b in h)
    s = "".join(ALPHA[int(bits[i:i+5], 2)] for i in range(0, 25 * 5, 5))
    return "-".join(s[i:i+5] for i in range(0, 25, 5))

if __name__ == "__main__":
    assert len(V01) == 256 and len(set(V01)) == 256
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik1")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    k = keygen(a.user)
    if a.check:
        ok = a.check.strip().upper() == k
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    print(k if a.q else f"user={a.user}\nkey ={k}")
