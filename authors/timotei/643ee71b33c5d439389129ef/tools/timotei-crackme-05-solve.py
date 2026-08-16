#!/usr/bin/env python3
"""Solveur / démonstrateur de timotei-crackme-05.

Ce n'est PAS un émulateur Windows.

Le crackme est un PE32 : sous Linux, ./timotei-crackme-05.exe ne tourne
pas (format Windows). Ce script :

1. Rejoue le check (taille exacte 0x16, checksum 8 bits) sans exec.
2. Écrit un keyfile valide : timotei.crackme#5.enjoy!  (22 octets)
   dans CE dossier — CreateFileA l'ouvre en chemin relatif.
3. Si `wine` est dans le PATH, lance le .exe pour montrer
   « .:keyfile:.accepted:. ». Sinon, affiche comment faire
   (Wine ou VirtualBox) — voir le write-up, section 10.

Usage :
    python3 timotei-crackme-05-solve.py
"""

from __future__ import annotations

import shutil
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
BINARY = HERE / "timotei-crackme-05.exe"
KEYNAME = "timotei.crackme#5.enjoy!"
KEYPATH = HERE / KEYNAME

NEED = 0x16  # 22 — sub byte NumberOfBytesRead, 16h / jnz fail
SUM_LEN = 0x15  # 21 — boucle loc_401056

# 21 octets au choix ; le 22e est calculé. N'importe quel payload marche.
FEATURED = b"crackme#5 keyfile OK!"


def checksum(payload: bytes) -> int:
    """Somme 8 bits des 21 premiers octets (add dl, [eax])."""
    if len(payload) != SUM_LEN:
        raise ValueError(f"payload doit faire {SUM_LEN} octets, pas {len(payload)}")
    return sum(payload) & 0xFF


def make_keyfile(payload: bytes = FEATURED) -> bytes:
    return payload + bytes([checksum(payload)])


def key_ok(data: bytes) -> bool:
    """Prédicat exact : len==22 et data[21] == sum(data[:21]) & 0xFF."""
    if len(data) != NEED:
        return False
    return data[21] == checksum(data[:21])


def write_keyfile(payload: bytes = FEATURED) -> Path:
    blob = make_keyfile(payload)
    KEYPATH.write_bytes(blob)
    return KEYPATH


def run_wine() -> None:
    wine = shutil.which("wine") or shutil.which("wine32")
    if not wine:
        print("\n=== live Wine ===")
        print("wine absent. Le keyfile est prêt ; pour voir « accepted » :")
        print("  # option A — Wine (voir write-up §10)")
        print("  sudo dpkg --add-architecture i386 && sudo apt update")
        print("  sudo apt install wine32 wine64")
        print(f"  cd {HERE}")
        print("  wine timotei-crackme-05.exe")
        print("  # option B — VirtualBox : copier le .exe + le keyfile")
        print("  #            dans la même VM, même dossier, lancer le .exe")
        return
    print(f"\n=== live Wine ({wine}) cwd={HERE} ===")
    try:
        r = subprocess.run(
            [wine, str(BINARY.name)],
            cwd=HERE,
            capture_output=True,
            timeout=8,
            input=b"\n",
        )
    except subprocess.TimeoutExpired as e:
        out = (e.stdout or b"") + (e.stderr or b"")
        print("TIMEOUT (souvent « Press any key » qui attend). stdout/stderr :")
        print(out)
        return
    print(f"rc={r.returncode}")
    print("stdout:", r.stdout)
    if r.stderr:
        print("stderr:", r.stderr)


def main() -> None:
    print("=== timotei-crackme-05-solve.py ===")
    print("Check : CreateFileA(timotei.crackme#5.enjoy!) + ReadFile 50h")
    print(f"        puis  (octets_lus & 0xFF) - 0x{NEED:x} == 0")
    print(f"        puis  sum(buf[0..{SUM_LEN-1}]) & 0xFF == buf[{SUM_LEN}]")
    print()

    print(f"FEATURED payload ({len(FEATURED)} o) = {FEATURED!r}")
    print(f"checksum          = {checksum(FEATURED):#04x} {bytes([checksum(FEATURED)])!r}")
    blob = make_keyfile()
    print(f"keyfile           = {blob!r}  ({len(blob)} o)")
    print(f"key_ok(featured)  = {key_ok(blob)}")
    print(f"key_ok(21 A + 0)  = {key_ok(b'A'*21 + b'\\x00')}")
    print(f"key_ok(trop court)= {key_ok(b'short')}")

    path = write_keyfile()
    print(f"\nécrit : {path}")
    print(f"hex    : {path.read_bytes().hex()}")

    # contre-exemples
    bad = bytearray(blob)
    bad[-1] ^= 1
    print(f"key_ok(checksum++)= {key_ok(bytes(bad))}")

    if not BINARY.is_file():
        print(f"(binaire introuvable: {BINARY})")
        return
    run_wine()


if __name__ == "__main__":
    main()
