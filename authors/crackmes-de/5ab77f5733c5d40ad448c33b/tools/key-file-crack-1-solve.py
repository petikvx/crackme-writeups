#!/usr/bin/env python3
"""CrackMe3 (kcom, key_file_crack_1) : génère TheKeyFile.txt.

Le crackme lit un fichier dont le nom est XOR-obfusqué (14 octets, clé 14)
et dont le contenu (15 octets) XOR 15 doit valoir "guess whos back".

Usage : key-file-crack-1-solve.py [-q] [--check EXE] [--out DIR]
"""
import argparse, os, subprocess, sys

NAME_ENC = b"ZfkEkwHgbk zvz"          # .data 0x403000
TARGET = b"guess whos back"           # .data 0x403010


def solve():
    name = bytes(c ^ len(NAME_ENC) for c in NAME_ENC).decode()
    content = bytes(c ^ len(TARGET) for c in TARGET)
    return name, content


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--out", default=".")
    ap.add_argument("--check", metavar="EXE", help="lance l'exe sous xvfb-run wine")
    a = ap.parse_args()
    name, content = solve()
    path = os.path.join(a.out, name)
    open(path, "wb").write(content)
    if a.q:
        print(name, content.decode("latin1"))
    else:
        print(f"fichier : {name}\ncontenu : {content!r}\nécrit   : {path}")
    if a.check:
        exe = os.path.abspath(a.check)
        r = subprocess.run(["xvfb-run", "-a", "wine", exe], cwd=a.out,
                           capture_output=True, text=True, timeout=60)
        print("wine rc =", r.returncode)


if __name__ == "__main__":
    sys.exit(main())
