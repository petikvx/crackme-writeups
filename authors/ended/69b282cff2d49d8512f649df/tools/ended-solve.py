#!/usr/bin/env python3
"""ended's catgirl.crack : mot de passe fixe, comparaison OrdinalIgnoreCase.

Le solveur relit le mot de passe directement dans le #US heap de
CatgirlCrack.dll (2e ldstr de Main) au lieu de le coder en dur, puis
--check rejoue les 3 branches du Main en Python.
usage: ended-solve.py [-q] [--check] [CatgirlCrack.dll]
"""
import argparse, io, struct, sys, zipfile, pathlib

HERE = pathlib.Path(__file__).resolve().parent.parent
ZIP = HERE / "original" / "download.bin"


def load_dll(path):
    if path:
        return open(path, "rb").read()
    outer = zipfile.ZipFile(ZIP)
    inner = zipfile.ZipFile(io.BytesIO(outer.read("catgirlcrack.zip", pwd=b"crackmes.one")))
    return inner.read("Catgirl.Crack/CatgirlCrack.dll")


def user_strings(d):
    m = d.find(b"BSJB")
    n = struct.unpack("<I", d[m + 12:m + 16])[0]
    p = m + 16 + n + 2
    cnt = struct.unpack("<H", d[p:p + 2])[0]; p += 2
    for _ in range(cnt):
        off, sz = struct.unpack("<II", d[p:p + 8]); p += 8
        e = d.index(b"\0", p); name = d[p:e]; p = (e + 4) & ~3
        if name == b"#US":
            return d[m + off:m + off + sz]


def ldstr_tokens(d):
    """tokens ldstr (0x72 tt tt tt 0x70) du corps de Main (IL au debut du .text)."""
    start = d.index(bytes.fromhex("1330030071000000"))  # en-tete fat de Main
    body = d[start + 12:start + 12 + 0x71]
    out, i = [], 0
    while i < len(body):
        if body[i] == 0x72 and body[i + 4] == 0x70:
            out.append(struct.unpack("<I", body[i + 1:i + 4] + b"\0")[0]); i += 5
        else:
            i += 1
    return out


def read_us(us, off):
    ln = us[off]  # blobs < 128 octets pour nos chaines
    if ln & 0x80:
        ln = ((ln & 0x3f) << 8) | us[off + 1]; off += 2
    else:
        off += 1
    return us[off:off + ln - 1].decode("utf-16le")


def get_password(d):
    us = user_strings(d)
    toks = ldstr_tokens(d)       # banner, art, "Mint", good, "meow", wrong1, wrong2
    return read_us(us, toks[2])


def verdict(pw, inp):
    if inp.lower() == pw.lower():
        return "good"
    if inp.lower() == "meow":
        return "first-guess"
    return "wrong"


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("dll", nargs="?")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = get_password(load_dll(a.dll))
    if a.q:
        print(pw)
    else:
        print(f"password = {pw}  (insensible a la casse ; pas de user)")
    if a.check:
        assert verdict(pw, "Mint") == "good" and verdict(pw, "MINT") == "good"
        assert verdict(pw, "meow") == "first-guess" and verdict(pw, "foo") == "wrong"
        print("check OK")
