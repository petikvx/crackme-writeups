#!/usr/bin/env python3
"""crackme1 by dlap (DOS MZ) — patch JE→JNE + déchiffrement du message.

Le binaire calcule un checksum sur 3 octets de son propre code (CS:002D..002F)
qui vaut naturellement 0x7B, puis JE vers « May be later... ».
Le vrai message est chiffré (octet - 0x7B) et n'est affiché que si le
branchement tombe dans la boucle de déchiffrement (AH=02).

Solution :
  - patch file offset 0x22F : 74→75 (JE → JNE), OU
  - déchiffrer statiquement avec la clé 0x7B.

Usage:
  python3 dlap-crackme1-solve.py           # message + écrit le patch
  python3 dlap-crackme1-solve.py --check   # vérifie checksum + déchiffrement
  python3 dlap-crackme1-solve.py --patch OUT.EXE
"""
from __future__ import annotations

import argparse
import hashlib
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "CRACKME1.EXE"
JE_OFF = 0x22F
ENC_OFF = 0x2B5  # DS:1B5 = CS:B5 = file 0x200+0xB5
HEADER = 0x200
KEY_EXPECTED = 0x7B
GOOD = "You got it. Now write a solution, and send to me. DLAP@mail.ru"


def load() -> bytearray:
    data = bytearray(EXE.read_bytes())
    assert data[:2] == b"MZ", "pas un MZ"
    return data


def checksum_ax(img: bytes) -> int:
    """Simule le checksum runtime (CS image = file[0x200:])."""
    s = img[0x2D] + img[0x2E] + img[0x2F]
    ax = (s & 0xFF) | 0x100  # xor ax,ax ; 3× add al ; add ah,1
    return ax // 3  # div bl=3 → AL=quot, AH=0 ici


def decrypt(data: bytes, key: int = KEY_EXPECTED) -> str:
    enc = data[ENC_OFF:]
    out = bytearray()
    for b in enc:
        if b == 0x24:  # '$'
            break
        out.append((b - key) & 0xFF)
    return out.decode("ascii")


def patch(data: bytearray) -> bytearray:
    assert data[JE_OFF] == 0x74 and data[JE_OFF + 1] == 0x1D, (
        f"JE inattendu @ {JE_OFF:#x}: {data[JE_OFF:JE_OFF+2].hex()}"
    )
    out = bytearray(data)
    out[JE_OFF] = 0x75  # JNE
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--check", action="store_true", help="assert checksum+message")
    ap.add_argument("--patch", metavar="OUT", help="écrire l'EXE patché")
    ap.add_argument("-q", action="store_true", help="message seul")
    args = ap.parse_args()

    data = load()
    h = hashlib.sha256(data).hexdigest()
    img = bytes(data[HEADER:])
    ax = checksum_ax(img)
    msg = decrypt(data, ax & 0xFF)

    if args.q:
        print(msg)
        return 0

    print(f"[*] SHA-256 CRACKME1.EXE = {h}")
    print(f"[*] checksum AX = {ax:#06x} (cible JMP = 0x007b)")
    print(f"[*] message déchiffré = {msg!r}")
    print(f"[+] patch : offset fichier {JE_OFF:#x} : JE (74) → JNE (75)")

    if args.check:
        assert ax == KEY_EXPECTED, ax
        assert msg == GOOD, msg
        assert data[JE_OFF] == 0x74
        print("[+] --check OK")

    if args.patch:
        out = patch(data)
        Path(args.patch).write_bytes(out)
        print(f"[+] écrit {args.patch} ({len(out)} octets)")

    if not args.check and not args.patch:
        # défaut : vérif + écrire analysis/
        assert ax == KEY_EXPECTED and msg == GOOD
        out_path = ROOT / "analysis" / "CRACKME1-patched.EXE"
        out_path.write_bytes(patch(data))
        print(f"[+] patch écrit → {out_path.relative_to(ROOT)}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
