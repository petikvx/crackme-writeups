#!/usr/bin/env python3
"""crackmes.de's crackme_5 by fr1c — solveur statique.

VB5 natif, 10 CheckBox. Command1_Click lit Check1..Check10.Value (getters Form
+0x2fc..+0x320, vtable CheckBox +0xe0) dans des locaux, puis fait un ET de 10
égalités `Value == 1` / `Value == 0`. Ce script relit ces tests dans l'exe :
  - getters :  8B 83 <off32>  (mov eax,[ebx+off])  ... 8D 8D|95 <disp32> (lea reg,[ebp+disp]) ;
  - tests   :  66 39 85|8D <disp32>  (cmp word [ebp+disp], ax|cx),
    ax = 1 (mov eax,1) sauf après 33 C0 (xor eax,eax) ; cx = 0 (xor ecx,ecx).
Mapping vérifié sous wine : +0x2fc = case « 1 », ..., +0x320 = case « 10 ».
"""
import re, struct, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original/CrackMe5.exe"
TEXT_VA, TEXT_RAW = 0x401000, 0x400           # .text : rva 0x1000 / raw 0x400 (pefile)
FUNC, TEST = 0x402c10, 0x402f97               # Command1_Click, début du bloc de tests

def off(va): return va - TEXT_VA + TEXT_RAW

def solve(d: bytes):
    body = d[off(FUNC):off(TEST)]
    disp2box = {}
    for m in re.finditer(rb"\x8b\x83(....)", body, re.S):
        g = struct.unpack("<I", m.group(1))[0]
        if not 0x2fc <= g <= 0x320: continue
        l = re.search(rb"\x8d[\x8d\x95](....)", body[m.end():], re.S)
        disp2box[struct.unpack("<i", l.group(1))[0]] = (g - 0x2fc) // 4 + 1
    blk = d[off(TEST):off(TEST) + 0xe4]
    want, ax = {}, 1
    for i in range(len(blk) - 6):
        if blk[i:i+2] == b"\x33\xc0": ax = 0
        if blk[i:i+2] == b"\x66\x39" and blk[i+2] in (0x85, 0x8d):
            disp = struct.unpack_from("<i", blk, i + 3)[0]
            want[disp2box[disp]] = ax if blk[i+2] == 0x85 else 0
    return want

def main():
    want = solve(EXE.read_bytes())
    assert len(want) == 10, want
    on = [k for k in sorted(want) if want[k]]
    print("Cases à cocher :", " ".join(map(str, on)))
    print("Cases vides    :", " ".join(str(k) for k in sorted(want) if not want[k]))

if __name__ == "__main__":
    sys.exit(main())
