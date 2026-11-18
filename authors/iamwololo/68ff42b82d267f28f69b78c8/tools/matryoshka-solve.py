#!/usr/bin/env python3
"""iamwololo's Matryoshka — keygen / solveur (pas d'utilisateur : la clé est fixe).

Usage :
  python3 -I tools/matryoshka-solve.py          # affiche la clé
  python3 -I tools/matryoshka-solve.py -q       # clé seule
  python3 -I tools/matryoshka-solve.py --check  # + exécute l'ELF d'origine (OK et KO)

Principe : download.bin = ZIP (pw crackmes.one) -> ELF "loader". Chaque couche
XOR un blob (.data+0x20, taille = dernier dword de .data) avec
(argv[1][0] - C), le charge dans un memfd et l'execve avec argv[1]+1.
Le bon XOR est celui qui redonne \x7fELF ; C est lu dans le `sub eax,C` de main.
Dernière couche : atoi(argv[1]) == 9.
"""
import argparse, io, os, re, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "download.bin")
PW = b"crackmes.one"


def data_sec(d):
    shoff = struct.unpack_from("<Q", d, 0x28)[0]
    ent, num, shstr = struct.unpack_from("<HHH", d, 0x3A)
    S = [struct.unpack_from("<IIQQQQIIQQ", d, shoff + i * ent) for i in range(num)]
    so = S[shstr][4]
    for s in S:
        if d[so + s[0]:d.index(b"\0", so + s[0])] == b".data":
            return s[4], s[5]


def unzip_elf(path):
    d = open(path, "rb").read()
    while d[:2] == b"PK":
        z = zipfile.ZipFile(io.BytesIO(d))
        # layer 1 contient aussi readme.txt : on prend le zip/ELF imbriqué
        name = [n for n in z.namelist() if n != "readme.txt"][0]
        d = z.read(name, pwd=PW)
    return d


def solve(path=BIN):
    d = unzip_elf(path)
    key = b""
    while True:
        m = re.search(rb"\x0f\xb6\x00\x83\xe8(.)\x88\x45\xdf", d, re.S)
        if not m:               # dernière couche : atoi(argv[1]) == 9
            cm = re.search(rb"\xe8....\x83\xf8(.)\x75", d, re.S)
            key += str(cm.group(1)[0]).encode()
            return d, key
        c = m.group(1)[0]
        off, sz = data_sec(d)
        n = struct.unpack_from("<I", d, off + sz - 4)[0]
        blob = d[off + 0x20:off + 0x20 + n]
        k = next(k for k in range(256) if bytes(b ^ k for b in blob[:4]) == b"\x7fELF")
        key += bytes([(k + c) & 0xFF])
        d = bytes(b ^ k for b in blob)


def run(key, path=BIN):
    with tempfile.TemporaryDirectory() as t:
        elf = os.path.join(t, "m")
        open(elf, "wb").write(unzip_elf(path))
        os.chmod(elf, 0o755)
        return subprocess.run([elf, key], capture_output=True, text=True).stdout.strip()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    _, key = solve()
    key = key.decode()
    print(key if a.q else f"clé : {key}")
    if a.check:
        ok, ko = run(key), run("fb38")
        print("OK :", repr(ok), "| KO (fb38) :", repr(ko))
        sys.exit(0 if "u win good job" in ok and not ko else 1)
