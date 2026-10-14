#!/usr/bin/env python3
"""matrix_acid_crack (acid_crack) — VB6 P-code : serial = CStr(LitI4 0x00024EA2).

Le P-code du clic « Check » pousse le littéral 32 bits 0x00024EA2 (octets f5 a2 4e 02 00
à l'offset fichier 0xe78c), le convertit en chaîne (VarBstrFromI4 -> "151202") et le
compare à Text1 (VarBstrCmp). Une 2e comparaison avec "Acid_Crack" n'ouvre qu'un easter egg.

  python3 tools/matrix_acid_crack-solve.py        # explication + serial
  python3 tools/matrix_acid_crack-solve.py -q     # serial seul
  python3 tools/matrix_acid_crack-solve.py --check   # relit le littéral dans original/matrix.exe
"""
import struct, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "matrix.exe"
OFF = 0xE78C  # opcode LitI4 (0xF5) + imm32

def serial_from_binary():
    d = EXE.read_bytes()
    assert d[OFF] == 0xF5, f"opcode inattendu {d[OFF]:#x} @ {OFF:#x}"
    return str(struct.unpack_from("<i", d, OFF + 1)[0])

SERIAL = str(0x00024EA2)  # "151202"

if __name__ == "__main__":
    if "--check" in sys.argv:
        s = serial_from_binary()
        print(f"littéral P-code @ {OFF:#x} -> {s} :", "OK" if s == SERIAL else "KO")
        sys.exit(0 if s == SERIAL else 1)
    if "-q" in sys.argv:
        print(SERIAL)
    else:
        print(f"LitI4 0x00024EA2 -> CStr -> serial = {SERIAL}")
