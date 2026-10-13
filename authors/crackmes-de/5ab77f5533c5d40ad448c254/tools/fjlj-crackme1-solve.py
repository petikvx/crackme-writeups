#!/usr/bin/env python3
"""Keygen crackmes.de fjlj_crackme1 (crackme#1_FJLJ.exe).

Le nom (4..15 car.) subit 3 passes en place : b = ((b ^ k) - s + 0x30) & 0xFF,
(k, s) = (0xDE,0x7A), (0xA2,0xB2), (0xF2,0x8E). La sortie de chaque passe est
concaténée (avec le terminateur transformé), puis 0x94/0xB4 -> '-', 0xE8 -> fin.
Tous les octets du serial doivent être dans 0x22..0x7D sinon « invalid name! ».

  ./fjlj-crackme1-solve.py petik           # -> serial
  ./fjlj-crackme1-solve.py petik --check   # rejoue le binaire sous Unicorn (tools/emu.py)
"""
import subprocess, sys
from pathlib import Path
PASSES = [(0xDE, 0x7A), (0xA2, 0xB2), (0xF2, 0x8E)]

def keygen(name: str) -> str:
    if not 4 <= len(name) <= 15:
        raise ValueError("nom : 4 à 15 caractères")
    buf = bytearray(name.encode("latin1")) + b"\0"
    out = bytearray()
    for k, s in PASSES:
        for i in range(len(buf)):
            buf[i] = ((buf[i] ^ k) - s + 0x30) & 0xFF
        out += buf
    ser = bytearray()
    for b in out:
        if b == 0x90:
            break
        if b in (0x94, 0xB4):
            b = 0x2D
        elif b == 0xE8:
            break
        ser.append(b)
    if any(not (0x21 < c < 0x7E) for c in ser):
        raise ValueError("ce nom donne un serial non imprimable (« invalid name! »)")
    return ser.decode("latin1")

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    serial = keygen(name)
    print(serial)
    if "--check" in sys.argv:
        emu = Path(__file__).resolve().parent / "emu.py"
        r = subprocess.run([sys.executable, str(emu), name, serial], capture_output=True, text=True)
        ok = "Correct good job!" in r.stdout
        print(r.stdout.strip().splitlines()[2] if ok else r.stdout)
        sys.exit(0 if ok else 1)
