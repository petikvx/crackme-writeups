#!/usr/bin/env python3
"""Keygen MiSSiNG iN ByTES CrackMe #1 (MFC42D debug, VC++ 6).

serial = "%d" % (sum*4) + "-" + "%x" % volser + "-weloveyour" + volume_label

  sum = 0xCCCCCCCC (variable locale non initialisée, remplissage /GZ du debug)
        + Σ sext8( (len + sext8(c+1)) & 0xff )  pour chaque caractère c du nom
        + (CWnd*GetDesktopWindow()) >> 1        (global 0x4169f0, posé à l'init du dialogue)

La fin du serial dépend de la MACHINE : serial de volume du lecteur courant,
son label (19 car. max) et le pointeur CWnd du bureau (adresse heap MFC) -> options.
Usage : mib-crkme1-solve.py [nom] [--volser HEX] [--label TXT] [--desktop HEX] [-q]
"""
import argparse

def s8(x):
    x &= 0xff
    return x - 256 if x & 0x80 else x

def keygen(name: str, volser: int, label: str, desktop: int) -> str:
    n = name.encode('latin-1')
    if len(n) < 4:
        raise ValueError("le nom doit faire au moins 4 caractères")
    s = 0xCCCCCCCC
    for c in n:
        c1 = (c + 1) & 0xff
        b = (len(n) + s8(c1)) & 0xff
        s = (s + s8(b)) & 0xffffffff
    s = (s + (desktop >> 1)) & 0xffffffff
    s = (s << 2) & 0xffffffff
    if s & 0x80000000:
        s -= 1 << 32
    return "%d-%x-weloveyour%s" % (s, volser & 0xffffffff, label[:19])

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--volser", type=lambda x: int(x, 16), default=0x1234abcd,
                    help="serial de volume (hex) renvoyé par GetVolumeInformationA")
    ap.add_argument("--label", default="PETIK", help="label du volume")
    ap.add_argument("--desktop", type=lambda x: int(x, 16), default=0x00a1b2c4,
                    help="valeur CWnd::GetDesktopWindow() (pointeur) ; global = valeur>>1")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    k = keygen(a.name, a.volser, a.label, a.desktop)
    print(k if a.q else f"{a.name} -> {k}")
