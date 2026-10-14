#!/usr/bin/env python3
"""Patcher pour « full_patchme » (qHF) : écrit patchme_patched.exe (6 objectifs du rules.txt).

  ./full_patchme-solve.py [original/patchme.exe] [-o analysis/patchme_patched.exe] [-q]
"""
import argparse, hashlib, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent.parent

def va(x):  # .text : VA 0x401000 -> offset fichier 0x400
    return x - 0x401000 + 0x400

def u16(s):
    return s.encode("utf-16le")

PATCHES = [
    # (offset, octets attendus, nouveaux octets, description)
    (va(0x40146b), b"\x75\xc4", b"\xeb\xc4", "WM_INITDIALOG : jne -> jmp, saute le nag de démarrage"),
    (va(0x401410), b"\x0f\x84\xd3\x00\x00\x00", b"\x90" * 6, "WM_CLOSE/Exit : plus de saut vers le nag de fin"),
    (va(0x4014e9), b"\xc7\x04\x24\x00\x00", b"\xe9\x32\xff\xff\xff", "menu File->Exit (1007) : jmp direct vers EndDialog"),
    (va(0x401588), b"\x74\x5c", b"\xeb\x5c", "bouton Add ListItem : je -> jmp, ajoute l'item"),
    # .rsrc : MENU 104, item Save (id 1006) : flags MF_DISABLED (2) -> 0, puis texte (même longueur, 30 car.)
    (0x1b10, b"\x02\x00\xee\x03", b"\x00\x00\xee\x03", "menu Save : retire MF_DISABLED"),
    (0x1b14, u16("Save (Registered Version Only)"), u16("Save (patched by petik)".ljust(30)), "texte du menu Save"),
    (None, u16("qHF's PatchMe (Unregistered Version)"), u16("qHF's PatchMe (Registered Version)".ljust(36)), "caption du dialogue 101"),
    (None, u16("UNREGISTERED VERSION"), u16("REGISTERED VERSION!!"), "texte de l'About (dialogue 102)"),
]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("src", nargs="?", default=str(HERE / "original/patchme.exe"))
    ap.add_argument("-o", "--out", default=str(HERE / "analysis/patchme_patched.exe"))
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    d = bytearray(Path(a.src).read_bytes())
    for off, old, new, desc in PATCHES:
        assert len(old) == len(new), desc
        if off is None:
            off = d.find(old, 0x1a00)
            assert off > 0 and d.find(old, off + 1) < 0, desc
        assert d[off:off + len(old)] == old, f"octets inattendus @ {off:#x} ({desc})"
        d[off:off + len(new)] = new
        if not a.q:
            print(f"{off:#06x}  {old.hex()[:24]:24} -> {new.hex()[:24]:24}  {desc}")
    Path(a.out).write_bytes(d)
    print(f"écrit {a.out}  sha256={hashlib.sha256(d).hexdigest()}")

if __name__ == "__main__":
    main()
