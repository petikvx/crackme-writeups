#!/usr/bin/env python3
"""Keygen Thorwak CrackMe #01 : name -> serial XXXXX-XXXXX-XXXXX-XXXXX."""
import argparse

def serial(name: str) -> str:
    b = name.encode("latin-1")
    if len(b) <= 3:
        raise ValueError("le nom doit faire > 3 caractères")
    acc = [0] * 10
    for i in range(255):
        acc[i % 10] = (acc[i % 10] + (b[i % len(b)] ^ (i & 0xFF))) & 0xFF
    h = "".join("%02x" % x for x in acc)          # 20 hex lowercase
    c = [h[0:5], h[5:10], h[10:15], h[15:20]]
    return "-".join(reversed(c))                   # sprintf dans l'ordre inverse

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    s = serial(a.name)
    if a.check:
        print("OK" if a.check == s else "KO"); raise SystemExit(a.check != s)
    print(s if a.q else f"{a.name} -> {s}")
