#!/usr/bin/env python3
"""CrackMe Extreme v1.0 (the_rapture) — extrait les serials depuis l'assembly .NET.

Les deux checks sont des comparaisons VB `CompareString(entrée, "littéral")`.
Le solveur parse le ZIP d'origine, les métadonnées .NET (#US heap) et les corps IL
de Form4.checkbtn_Click / Form6.checkbtn2_Click : il lit le 1er `ldstr` de chaque
méthode (= serial attendu).  Aucun nom n'est vérifié (nom d'exemple : petik).

Usage : extreme-solve.py [-q] [--check] [--name petik] [chemin/zip_ou_exe]
"""
import argparse, io, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT = os.path.join(HERE, "..", "original", "CrackMe_Extreme_v1.0.zip.zip")


def load_exe(path):
    data = open(path, "rb").read()
    if data[:2] == b"PK":
        z = zipfile.ZipFile(io.BytesIO(data))
        n = next(n for n in z.namelist() if n.lower().endswith(".exe") and "extreme" in n.lower())
        return z.read(n)
    return data


def us_heap(pe):
    i = pe.find(b"BSJB")
    ver = struct.unpack_from("<I", pe, i + 12)[0]
    p = i + 16 + ver
    ns = struct.unpack_from("<H", pe, p + 2)[0]
    p += 4
    for _ in range(ns):
        off, size = struct.unpack_from("<II", pe, p)
        name = pe[p + 8:p + 24].split(b"\0")[0]
        p += 8 + (len(name) + 4) // 4 * 4
        if name == b"#US":
            return pe[i + off:i + off + size]
    raise SystemExit("pas de #US")


def us_get(heap, off):
    b = heap[off]
    if b & 0x80 == 0:
        ln, s = b, 1
    elif b & 0xC0 == 0x80:
        ln, s = ((b & 0x3F) << 8) | heap[off + 1], 2
    else:
        ln, s = struct.unpack(">I", heap[off:off + 4])[0] & 0x1FFFFFFF, 4
    return heap[off + s:off + s + ln - 1].decode("utf-16le")


def extract(pe):
    """ldstr (0x72 <tok>) dont l'opérande est suivi, dans les 12 octets, d'un `call CompareString`
    (0x28 xx xx xx 0A) ⇒ littéral comparé à la saisie."""
    heap = us_heap(pe)
    found = []
    for i in range(len(pe) - 5):
        if pe[i] == 0x72 and pe[i + 4] == 0x70:
            off = pe[i + 1] | pe[i + 2] << 8 | pe[i + 3] << 16
            if off >= len(heap):
                continue
            window = pe[i + 5:i + 20]
            if b"\x28" in window and window[window.index(b"\x28") + 4:][:1] == b"\x0a":
                try:
                    found.append(us_get(heap, off))
                except Exception:
                    pass
    return found


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("path", nargs="?", default=DEFAULT)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--name", default="petik")
    a = ap.parse_args()
    s = extract(load_exe(a.path))
    # le littéral comparé précède le message de succès dans la même méthode
    s1 = s[s.index("You have cracked this part of the program good job") - 1]
    s2 = s[s.index("Good Job") - 1]
    if a.check:
        assert (s1, s2) == ("c60r4a26c4k89m6e3-rapture", "r2a6p4t8u9r6e3"), (s1, s2)
        print("OK", s1, s2)
        return
    if a.q:
        print(s1); print(s2)
        return
    print(f"Serial 1 (bouton Serial)        : {s1}")
    print(f"Serial 2 (Serial/Name, nom={a.name}) : {s2}   (le nom n'est pas vérifié)")


main()
