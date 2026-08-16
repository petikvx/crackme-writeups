#!/usr/bin/env python3
"""Solveur / démonstrateur de timotei-crackme-07.

PE32 MASM32, password console, self-modifying code.

Flow :
  VirtualProtect(.text, RXW)
  WriteConsole prompt
  ReadConsole → buffer
  xor dword [0x40106B], first_4_bytes(buffer)
  ; exécute le code déchiffré à 0x40106B

Sur disque, 0x40106B = 9F 46 90 90.
Pour obtenir un « jmp short » vers le succès (0x40107C) :
  9F 46 90 90  XOR  password[0:4]  =  EB 0F ?? ??
  d'où password[0:2] == b'tI'
  (les 2 octets suivants libres)

Usage :
  python3 timotei-crackme-07-solve.py
  wineconsole timotei-crackme-07.exe   # taper p.ex. tIme
"""

from __future__ import annotations

import shutil
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
BINARY = HERE / "timotei-crackme-07.exe"

# octets chiffrés à VA 0x40106B
DISK = bytes.fromhex("9f469090")
# jmp short $+0x11 → 0x40107C
WANT_PREFIX = bytes.fromhex("eb0f")

FEATURED = b"tIme"  # un des innombrables tI**


def decrypt(password: bytes) -> bytes:
    """4 octets déchiffrés à 0x40106B (password paddé/tronqué à 4)."""
    pw = (password + b"\x00\x00\x00\x00")[:4]
    return bytes(d ^ p for d, p in zip(DISK, pw))


def is_success_jmp(dec: bytes) -> bool:
    """True si les 2 premiers octets sont un jmp short vers 0x40107C."""
    return len(dec) >= 2 and dec[0] == 0xEB and dec[1] == 0x0F


def password_ok(password: bytes | str) -> bool:
    if isinstance(password, str):
        password = password.encode("latin1", errors="replace")
    # ReadConsole : on ne regarde que les 4 premiers octets (souvent avant \r\n)
    return is_success_jmp(decrypt(password[:4]))


def password_for(suffix: bytes = b"me") -> bytes:
    """Construit un mot de passe tI + suffix (2 octets)."""
    suf = (suffix + b"me")[:2]
    return b"tI" + suf


def explain(password: bytes) -> None:
    dec = decrypt(password)
    print(f"password[0:4] = {password[:4]!r}")
    print(f"DISK          = {DISK.hex()}")
    print(f"DISK XOR pw   = {dec.hex()}  {dec!r}")
    if is_success_jmp(dec):
        print("→ jmp short 0x40107C  (WriteConsole « l0gIn aCcEpTeD »)")
    elif dec == bytes.fromhex("e90c0000"):
        print("→ jmp near 0x40107C")
    else:
        print("→ pas le saut de succès (souvent crash ou ExitProcess)")


def run_wine(password: str = "tIme") -> None:
    wine = shutil.which("wineconsole") or shutil.which("wine")
    if not wine or not BINARY.is_file():
        print("\n=== live ===")
        print("Wine / binaire absent. En console interactive :")
        print(f"  cd {HERE}")
        print("  wineconsole timotei-crackme-07.exe")
        print(f"  # taper : {password}")
        return
    print(f"\n=== live ({wine}) password={password!r} ===")
    print("(ReadConsole lit la vraie console ; un pipe rate souvent.)")
    try:
        # wineconsole + input : meilleur effort
        r = subprocess.run(
            [wine, str(BINARY.name)]
            if "wineconsole" not in wine
            else [wine, "--backend=curses", str(BINARY.name)],
            cwd=HERE,
            input=(password + "\r\n").encode(),
            capture_output=True,
            timeout=6,
        )
        print("stdout:", r.stdout)
        if r.stderr:
            print("stderr:", r.stderr[:300])
        print("rc:", r.returncode)
    except subprocess.TimeoutExpired as e:
        print("TIMEOUT — sortie partielle :", e.stdout)


def main() -> None:
    print("=== timotei-crackme-07-solve.py ===")
    print("SMC : xor dword [0x40106B], password_dword")
    print("succès si le code déchiffré commence par EB 0F (jmp → login accepted)")
    print()
    print("famille : b'tI' + 2 octets quelconques")
    print()

    for pw in (b"tIme", b"tI!!", b"tIxy", b"fail", b"tI"):
        ok = password_ok(pw)
        print(f"  {pw!r:12}  {decrypt(pw).hex():12}  {'OK' if ok else 'no'}")

    print()
    explain(FEATURED)

    # inverse explicite
    print("\nconstruction :")
    print("  want = EB 0F ?? ??")
    print("  pw0 = 9F^EB = 74 = 't'")
    print("  pw1 = 46^0F = 49 = 'I'")
    print("  pw2,pw3 libres (ex. 'me' → tIme)")

    run_wine("tIme")


if __name__ == "__main__":
    main()
