#!/usr/bin/env python3
"""crackmes.de's crackme_2 by fr1c — solveur.

VB5 natif : Form_Load fait `m_serial = "988535"` (membre de la Form, [Me+0x34]),
Command1_Click compare `Text2.Text` (champ Serial) à ce membre via __vbaStrCmp.
Le nom n'intervient pas : le serial est constant.
"""
import argparse, struct, sys
from pathlib import Path

SERIAL = "988535"

def extract(exe: Path) -> str:
    """Relit la constante UTF-16LE dans l'exe (VA 0x401F3C, longueur BSTR juste avant)."""
    d = exe.read_bytes()
    off = 0x133C                      # offset fichier de VA 0x401F3C (.text, raw==rva-0x0)
    n = struct.unpack_from("<I", d, off - 4)[0]
    return d[off:off + n].decode("utf-16le")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik", help="nom (ignoré par le crackme)")
    ap.add_argument("--exe", type=Path, default=Path(__file__).resolve().parent.parent / "original/Crackme2.exe")
    a = ap.parse_args()
    s = extract(a.exe) if a.exe.exists() else SERIAL
    assert s == SERIAL, s
    print(f"Name: {a.name}\nSerial: {s}")

if __name__ == "__main__":
    sys.exit(main())
