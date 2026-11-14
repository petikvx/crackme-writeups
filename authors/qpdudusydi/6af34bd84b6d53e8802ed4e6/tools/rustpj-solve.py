#!/usr/bin/env python3
"""Solveur qpdudusydi « Rust Crackme (XOR) Easy » (rustpj.exe, dans original/download.bin = ZIP).

Le prédicat : input.trim() == bytes([...16 octets...]) XOR 0x5a (octets écrits en immediates
dans main, VA 0x140002f6d..0x140002fa9, clé 0x5a en 0x140002fad).

  python3 tools/rustpj-solve.py          # affiche la réponse
  python3 tools/rustpj-solve.py -q       # réponse seule
  python3 tools/rustpj-solve.py --check  # vérifie via wine (xvfb-run) sur le binaire d'origine
"""
import argparse, os, re, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "download.bin")
ZIP_PW = b"crackmes.one"
MAIN_VA, KEY_VA = 0x140002F6D, 0x140002FAD


def load_exe():
    z = zipfile.ZipFile(BIN)
    return z.read("rustpj.exe", pwd=ZIP_PW)


def va_to_off(d, va):
    import struct
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    n = struct.unpack_from("<H", d, pe + 6)[0]
    opt = struct.unpack_from("<H", d, pe + 20)[0]
    base = struct.unpack_from("<Q", d, pe + 48)[0]
    for i in range(n):
        _, vs, rva, rs, raw = struct.unpack_from("<8sIIII", d, pe + 24 + opt + 40 * i)
        if base + rva <= va < base + rva + vs:
            return raw + va - base - rva
    raise ValueError(hex(va))


def solve():
    d = load_exe()
    o = va_to_off(d, MAIN_VA)
    # 17 x "mov BYTE PTR [rbp+disp8], imm8" = C6 45 <disp> <imm> (4 octets)
    enc = []
    for i in range(17):
        assert d[o + 4 * i] == 0xC6 and d[o + 4 * i + 1] == 0x45
        enc.append(d[o + 4 * i + 3])
    key = enc[16]  # le dernier octet (rbp+0x37) est la clé 0x5a, passée par pointeur (r9)
    return bytes(b ^ key for b in enc[:16]).decode()


def check(ans):
    with tempfile.TemporaryDirectory() as t:
        p = os.path.join(t, "rustpj.exe")
        open(p, "wb").write(load_exe())
        for s, want in ((ans, "Correct!"), ("petik", "Wrong!")):
            r = subprocess.run(["xvfb-run", "-a", "wine", p], input=s + "\n", text=True,
                               capture_output=True, timeout=60)
            ok = want in r.stdout
            print(f"{s!r}: {r.stdout.strip().splitlines()[-1]}  [{'OK' if ok else 'KO'}]")
            if not ok:
                return 1
    return 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    ans = solve()
    print(ans if a.q else f"Réponse : {ans}")
    if a.check:
        sys.exit(check(ans))
