#!/usr/bin/env python3
"""Keygen Hysteria Crackme (haiklr) — keyfile géométrique.

Le binaire lit le nom (4..24), calcule CRC32, ouvre le keyfile nommé
hex(premier_octet_du_nom) (ex. petik → « 70 »), et y lit 6 dwords LE :
A=(x1,y1), B=(x2,y2), C=(x3,y3). Point P=(CRC%99, (CRC%99)^0x2007).

Conditions (hors A,B,C distincts et coords ≠ 0) :
  (x1-r)*(y1-s) + (x1-x3)*(y1-y3) == 0
  (x2-r)*(y2-s) + (x2-x3)*(y2-y3) == 0
  dist²(P,A) == dist²(P,B)
"""
from __future__ import annotations
import argparse, struct, sys, zlib
from pathlib import Path

def crc32(name: bytes) -> int:
    return zlib.crc32(name) & 0xFFFFFFFF

def point_p(name: bytes) -> tuple[int, int]:
    r = crc32(name) % 0x63  # 99
    s = r ^ 0x2007
    return r, s

def valid(r, s, x1, y1, x2, y2, x3, y3) -> bool:
    pts = [(x1, y1), (x2, y2), (x3, y3)]
    if any(v == 0 for v in (x1, y1, x2, y2, x3, y3)):
        return False
    if len(set(pts)) < 3:
        return False
    if (x1 - r) * (y1 - s) + (x1 - x3) * (y1 - y3) != 0:
        return False
    if (x2 - r) * (y2 - s) + (x2 - x3) * (y2 - y3) != 0:
        return False
    d1 = (r - x1) ** 2 + (s - y1) ** 2
    d2 = (r - x2) ** 2 + (s - y2) ** 2
    return d1 == d2

def keygen(name: str) -> tuple[str, bytes, tuple]:
    nb = name.encode("latin-1", "replace")
    if not (4 <= len(nb) <= 24):
        raise SystemExit("nom : 4..24 caractères")
    r, s = point_p(nb)
    # Construction : A=(r+d,s), B=(r-d,s), C=(c,s) ⇒ y3=s annule les 2 sommes ;
    # dist(P,A)=|d|=dist(P,B).
    for d in range(1, 200):
        for c in list(range(1, 301)) + list(range(-1, -301, -1)):
            x1, y1 = r + d, s
            x2, y2 = r - d, s
            x3, y3 = c, s
            if valid(r, s, x1, y1, x2, y2, x3, y3):
                blob = struct.pack("<6i", x1, y1, x2, y2, x3, y3)
                # mov al, name[0] after CRC in eax — high bytes kept (bug/feature)
                eax = (crc32(nb) & 0xFFFFFF00) | nb[0]
                fname = format(eax, "x")  # wsprintf "%x"
                return fname, blob, (r, s, x1, y1, x2, y2, x3, y3)
    raise SystemExit("aucun keyfile trouvé")

def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-o", "--outdir", type=Path, default=Path("."))
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="revalide le prédicat")
    a = ap.parse_args()
    fname, blob, vals = keygen(a.name)
    r, s, x1, y1, x2, y2, x3, y3 = vals
    out = a.outdir / fname
    a.outdir.mkdir(parents=True, exist_ok=True)
    out.write_bytes(blob)
    if a.check and not valid(r, s, x1, y1, x2, y2, x3, y3):
        raise SystemExit("check FAIL")
    if a.q:
        print(fname)
    else:
        print(f"name={a.name!r} crc={crc32(a.name.encode()):08x} P=({r},{s})")
        print(f"keyfile={out} A=({x1},{y1}) B=({x2},{y2}) C=({x3},{y3})")
        print(f"bytes={blob.hex()}")

if __name__ == "__main__":
    main()
