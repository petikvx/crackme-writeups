#!/usr/bin/env python3
"""crackme_delphi_1.0 (defc0n1, crackmes.de) — mot de passe statique.

TForm1.Button1Click @ 0x491054 : Insert1.Text (TEdit) -> UnicodeString,
UStrEqual (0x405AF8) avec la constante littérale @ 0x4910E0 ; égal -> « Contraseña aceptada ;-) ».
Le solveur relit la UnicodeString Delphi 2009 (longueur u32 à -4, UTF-16LE) dans le binaire.

  ./defc0n1-delphi1-solve.py            # explications
  ./defc0n1-delphi1-solve.py -q         # mot de passe seul
  ./defc0n1-delphi1-solve.py --check X  # simule le prédicat sur X
"""
import argparse, pathlib, struct
EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "crackme_delphi_1.0.exe"
PW_VA, OK_VA, KO_VA = 0x4910E0, 0x491104, 0x491140

def ustr(img: bytes, va: int) -> str:
    import pefile
    pe = pefile.PE(data=img)
    off = pe.get_offset_from_rva(va - pe.OPTIONAL_HEADER.ImageBase)
    n = struct.unpack("<I", img[off - 4:off])[0]
    return img[off:off + 2 * n].decode("utf-16le")

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true"); ap.add_argument("--check")
    a = ap.parse_args()
    img = EXE.read_bytes()
    pw, ok, ko = (ustr(img, v) for v in (PW_VA, OK_VA, KO_VA))
    if a.check is not None:
        good = a.check == pw   # UStrEqual : comparaison exacte, sensible à la casse
        print(ok if good else ko); raise SystemExit(0 if good else 1)
    if a.q:
        print(pw); return
    print(f"constante @ {PW_VA:#x} = {pw!r}\nOK  @ {OK_VA:#x} = {ok!r}\nKO  @ {KO_VA:#x} = {ko!r}")
    print(f"mot de passe : {pw}")

if __name__ == "__main__":
    main()
