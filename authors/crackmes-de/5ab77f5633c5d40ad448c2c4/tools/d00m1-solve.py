#!/usr/bin/env python3
"""Solveur — d00msweek's crackme #1 (VB6 natif).

Form_Load (0x402080) range 4 BSTR dans l'objet Form :
  [+0x34]="CFD"  [+0x38]="XXQ"  [+0x3C]="RQA"  [+0x40]="ASD"
cmdCheck_Click (0x401e00) : __vbaStrCmp(txtSerial.Text, m34 & m38 & m3C & m40)
→ MsgBox "Congrats" si égal, sinon "Sorry / Try Again :(".

usage : tools/d00m1-solve.py            # affiche le serial (lu dans le binaire)
        tools/d00m1-solve.py --check S  # vérifie un serial
"""
import re, struct, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "d00m1.exe"
IMAGE_BASE, TEXT_VA, TEXT_RAW = 0x400000, 0x1000, 0x1000

def parts():
    d = EXE.read_bytes()
    # mov edx, imm32 ; lea ecx, [esi+disp8] ; call edi   (__vbaStrCopy dans Form_Load)
    out = {}
    for m in re.finditer(rb"\xba(....)\x8d\x4e(.)\xff\xd7", d, re.S):
        va = struct.unpack("<I", m.group(1))[0]
        off = va - IMAGE_BASE - TEXT_VA + TEXT_RAW
        end = d.index(b"\0\0", off)
        end += (end - off) % 2
        out[m.group(2)[0]] = d[off:end].decode("utf-16le")
    return [out[k] for k in sorted(out)]

def serial():
    return "".join(parts())

if __name__ == "__main__":
    s = serial()
    if len(sys.argv) == 3 and sys.argv[1] == "--check":
        ok = sys.argv[2] == s
        print("Congrats" if ok else "Sorry — Try Again :(")
        sys.exit(0 if ok else 1)
    print(" + ".join(parts()), "=>", s)
