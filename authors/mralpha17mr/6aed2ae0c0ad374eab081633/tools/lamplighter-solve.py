#!/usr/bin/env python3
"""lamplighter (mrAlpha17mr) keygen : name -> NK-XXXX-XXXX-XXXX + token CMO{...}.

Lit original/download.bin (zip dans zip), décode la charge _wake (XOR "lamp" + zlib),
récupère le PNG embarqué (clé = LSB rouge des 128 premiers pixels) et recalcule le serial.
Usage : lamplighter-solve.py [--name petik] [-q] [--check]
"""
import argparse, base64, io, os, re, subprocess, sys, tempfile, zipfile, zlib

HERE = os.path.dirname(os.path.abspath(__file__))
DL = os.path.join(HERE, "..", "original", "download.bin")


def load():
    outer = zipfile.ZipFile(DL)
    inner = zipfile.ZipFile(io.BytesIO(outer.read(outer.namelist()[0], pwd=b"crackmes.one")))
    pub = inner.read("lamplighter.py").decode()
    b = re.search(r'b64decode\("""(.*?)"""', pub, re.S).group(1)
    raw = base64.b64decode(b)
    k = b"lamp"
    src = zlib.decompress(bytes(c ^ k[i % 4] for i, c in enumerate(raw))).decode()
    png = base64.b64decode("".join(re.search(r'PNG_B64 = """(.*?)"""', src, re.S).group(1).split()))
    return pub, png


def picture_key(png):
    pos, idat, w, h = 8, b"", 0, 0
    while pos < len(png):
        n = int.from_bytes(png[pos:pos+4], "big"); tag = png[pos+4:pos+8]; d = png[pos+8:pos+8+n]; pos += 12 + n
        if tag == b"IHDR": w, h = int.from_bytes(d[:4], "big"), int.from_bytes(d[4:8], "big")
        if tag == b"IDAT": idat += d
    raw = zlib.decompress(idat)
    stride = w * 3 + 1  # 1 octet de filtre (0) + w pixels RGB par ligne
    bits = [raw[(i // w) * stride + 1 + (i % w) * 3] & 1 for i in range(128)]  # LSB rouge, ligne par ligne
    out = bytearray(16)
    for i, bit in enumerate(bits): out[i//8] |= bit << (i % 8)
    return bytes(out)


def fold(s): return [ord(c) - 32 if 97 <= ord(c) <= 122 else ord(c) for c in s]
M = 0xFFFFFFFF
rol = lambda x, r: ((x << r) | (x >> (32 - r))) & M


def derive(name, key):
    raw = fold(name)
    h = 0x6C616D70
    for i, b in enumerate(raw):
        h ^= (b + key[i % 16] * (i + 1)) & M
        h = rol((h * 0x01000193) & M, 5)
    g = int.from_bytes(key[0:4], "little")
    for i, b in enumerate(reversed(raw)):
        g ^= (b + 0x20 + key[(i + 7) % 16]) & 0xFF
        g = rol((g * 0x85EBCA6B) & M, 3)
    p = int.from_bytes(key[4:8], "little") ^ (len(raw) * 0x100 + raw[0])
    for i, b in enumerate(raw):
        p = (p + b * (i + 3) + key[(i * 3) % 16]) & M
        p ^= p >> 13
        p = (p * 0x27D4EB2D + 0x165667B1) & M
    a = ((h ^ int.from_bytes(key[8:10], "little")) ^ key[14]) & 0xFFFF
    b = ((g ^ int.from_bytes(key[10:12], "little")) ^ (key[15] << 1)) & 0xFFFF
    c = ((p ^ int.from_bytes(key[12:14], "little") ^ (h >> 16)) ^ ((key[14] << 8) | key[15])) & 0xFFFF
    return a, b, c


def solve(name):
    _, png = load()
    key = picture_key(png)
    a, b, c = derive(name, key)
    return f"NK-{a:04X}-{b:04X}-{c:04X}"


def check(name, serial):
    pub, _ = load()
    d = tempfile.mkdtemp()
    p = os.path.join(d, "lamplighter.py")
    open(p, "w").write(pub)
    r = subprocess.run([sys.executable, "-I", p], input=f"{name}\n{serial}\n", capture_output=True, text=True)
    return r.stdout.strip().splitlines()[-1]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="exécute le crackme d'origine")
    a = ap.parse_args()
    s = solve(a.name)
    print(s if a.q else f"name={a.name}\nserial={s}")
    if a.check:
        print(check(a.name, s))
