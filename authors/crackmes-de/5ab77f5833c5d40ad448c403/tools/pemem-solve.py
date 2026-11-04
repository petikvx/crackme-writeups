#!/usr/bin/env python3
"""Solveur crackmes.de's pemem (deroko) : keygen name -> serial XXXXXXXX-XXXXXXXX-XXXXXXXX.

crackme.exe = stub aPLib (EP 0x40d4c5) -> loader 0x401000 qui déchiffre (xor rolling 0xdeadc0de,
+0xdeadbeef, rol 7) un PE embarqué (0x40126a, 0x4000 octets) et le mappe à la main.
Prédicat du PE interne (VA 0x401154..0x401240) :

    m  = md5(name)                       (name > 4 caractères)
    a  = hex(serial[0:8]); b = rol(hex(serial[9:17]),7); c = ror(hex(serial[18:26]),9)
    T32(i) = dword LE à 0x40216d+i       (table de 259 octets lue en octets chevauchants)
    sum = (T32(m0)^T32(m3)^a) + (T32(m4)^T32(m8)^b) + (T32(m9)^T32(m10)^c)
    OK  <=>  bits 0..30 de sum nuls (le "clc / jb / shr / loop" teste 31 bits)

Keygen : on choisit les trois termes = 0 (sum == 0).
Usage : pemem-solve.py [-q] [--check] [--name petik] [--zip original/crackme.zip]
--check : lance le binaire d'origine sous xvfb-run wine + xdotool (saisie name/serial, OK -> "solved").
"""
import argparse, hashlib, io, os, struct, subprocess, sys, time, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_ZIP = os.path.join(HERE, "..", "original", "crackme.zip")
M = 0xFFFFFFFF
rol = lambda x, n: ((x << n) | (x >> (32 - n))) & M
ror = lambda x, n: rol(x, 32 - n)


def aplib(src):
    """aPLib depacker (format du stub 0x40d56e)."""
    out = bytearray(); pos = 0; tag = 0; cnt = 0

    def bit():
        nonlocal tag, cnt, pos
        if cnt == 0:
            tag = src[pos]; pos += 1; cnt = 8
        b = (tag >> 7) & 1; tag = (tag << 1) & 0xFF; cnt -= 1
        return b

    def gamma():
        r = 1
        while True:
            r = (r << 1) | bit()
            if not bit(): return r

    out.append(src[pos]); pos += 1
    last = 0; lwm = 0
    while True:
        if not bit():                       # literal
            out.append(src[pos]); pos += 1; lwm = 0
        elif not bit():                     # match gamma
            off = gamma()
            if lwm == 0 and off == 2:
                off = last; ln = gamma()
            else:
                off = ((off - (3 if lwm == 0 else 2)) << 8) + src[pos]
                pos += 1
                ln = gamma()
                if off >= 32000: ln += 1
                if off >= 1280: ln += 1
                if off < 128: ln += 2
            last = off; lwm = 1
            for _ in range(ln): out.append(out[-off])
        elif not bit():                     # short match
            b = src[pos]; pos += 1
            ln = 2 + (b & 1); off = b >> 1
            if off == 0: break
            last = off; lwm = 1
            for _ in range(ln): out.append(out[-off])
        else:                               # single byte match
            off = 0
            for _ in range(4): off = (off << 1) | bit()
            out.append(out[-off] if off else 0); lwm = 0
    return bytes(out)


def inner_pe(zpath):
    z = zipfile.ZipFile(zpath); z.setpassword(b"crackmes.one")
    exe = z.read("crackme.exe")
    packed = exe[0x200:0x200 + 0x4678]
    loader = aplib(packed)                  # chargé en 0x401000
    enc = loader[0x126a - 0x1000:0x126a - 0x1000 + 0x4000]
    b = 0xDEADC0DE; out = bytearray()
    for i in range(0x1000):
        out += struct.pack("<I", struct.unpack_from("<I", enc, 4 * i)[0] ^ b)
        b = rol((b + 0xDEADBEEF) & M, 7)
    return bytes(out)


def table(pe):
    # CODE: VA 0x401000 -> file 0x600 ; table à VA 0x40216d
    t = pe[0x600 + 0x216d - 0x1000:0x600 + 0x216d - 0x1000 + 0x100 + 3]
    return lambda i: struct.unpack_from("<I", t, i)[0]


def serial(name, T):
    m = hashlib.md5(name.encode()).digest()
    a = T(m[0]) ^ T(m[3])
    b = T(m[4]) ^ T(m[8])
    c = T(m[9]) ^ T(m[10])
    return "%08X-%08X-%08X" % (a, ror(b, 7), rol(c, 9))


def wine_check(name, ser, exe_bytes):
    import tempfile
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "crackme.exe"); open(p, "wb").write(exe_bytes)
        script = f"""set -e
wine {p} & WP=$!
sleep 6
W=$(xdotool search --name crackme | head -1)
xdotool windowfocus $W; sleep 0.5
xdotool type --delay 80 '{name}'; xdotool key Tab; xdotool type --delay 80 '{ser}'
xdotool key Tab; xdotool key Return; sleep 2
xdotool search --name solved | head -1
"""
        r = subprocess.run(["xvfb-run", "-a", "bash", "-c", script], capture_output=True, text=True)
        return bool(r.stdout.strip())


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--zip", default=DEF_ZIP)
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if len(a.name) <= 4: sys.exit("name > 4 caractères requis")
    pe = inner_pe(a.zip)
    s = serial(a.name, table(pe))
    if a.check:
        exe = zipfile.ZipFile(a.zip, "r"); exe.setpassword(b"crackmes.one")
        ok = wine_check(a.name, s, exe.read("crackme.exe")) and not wine_check(a.name, "00000000-00000000-00000000", exe.read("crackme.exe"))
        print("OK" if ok else "FAIL", a.name, s); sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name} serial={s}")
