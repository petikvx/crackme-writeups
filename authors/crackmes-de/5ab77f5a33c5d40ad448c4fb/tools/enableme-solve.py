#!/usr/bin/env python3
"""kde_enableme1 (macabre) — id 5ab77f5a33c5d40ad448c4fb. ELF32 KDE 3.5 / Qt 3.3 (GUI).

Objectif : activer le bouton « RegisterBtn » (créé désactivé) et cliquer (message « Good Job!! »).
Le constructeur fait (vtable QWidget +0x54 = setEnabled) :
      xor edx,edx ; mov [esp+4],edx ; mov [esp],ebx ; call [eax+0x54]     ; setEnabled(false)
présent 2 fois (@0x804cb5b et @0x804cddb : Form1::Form1 et le ctor dérivé/alloc). Les règles autorisent
le patch : `call [eax+0x54]` (ff 50 54) -> 3 NOP. Le patch est écrit sur une COPIE (analysis/enableme.patched).

  enableme-solve.py [-q] [--check]
"""
import argparse, sys
from pathlib import Path

SRC = Path(__file__).resolve().parent.parent / "analysis" / "kde-enableme1" / "enableme"
DST = SRC.parent / "enableme.patched"
SITES = [0x804CB5B, 0x804CDDB]            # vaddr -> offset fichier = vaddr - 0x8048000
OLD, NEW = bytes.fromhex("ff5054"), bytes.fromhex("909090")


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = bytearray(SRC.read_bytes())
    for va in SITES:
        o = va - 0x8048000
        assert d[o:o + 3] == OLD and d[o - 9:o - 5] == bytes.fromhex("89542404")[:0] or d[o:o + 3] == OLD, hex(va)
        d[o:o + 3] = NEW
    DST.write_bytes(d); DST.chmod(0o755)
    print(DST if a.q else f"patch : {', '.join(hex(v) for v in SITES)}  ff 50 54 -> 90 90 90   =>  {DST}")
    if a.check:
        p = DST.read_bytes(); s = SRC.read_bytes()
        diff = [i for i in range(len(p)) if p[i] != s[i]]
        ok = diff == [va - 0x8048000 + k for va in SITES for k in range(3)]
        print("check:", "OK" if ok else "KO", f"({len(diff)} octets modifiés ; pas de KDE3 ici : preuve statique)")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
