#!/usr/bin/env python3
"""Keygen — d00msweek's crackme #2 (VB6 natif).

Command1_Click (0x4022b0) : pour chacune des 3 cases (1 lettre chacune), une
cascade de 26 __vbaStrCmp(Text, "A".."Z") recopie la lettre « miroir » (Atbash,
A<->Z, B<->Y…) dans une Variant locale :
   case 1 (getter +0x2fc) -> [ebp-0x24]
   case 2 (getter +0x300) -> [ebp-0x34]
   case 3 (getter +0x304) -> [ebp-0x44]
Puis Code attendu = "ZYX" & v24 & v34 & v44 & "XXX" (__vbaVarAdd ×4),
comparé à txtCode.Text (getter +0x314) par __vbaVarTstEq -> MsgBox
"Email me … on how you did it!" (titre "Congrats!") sinon "Sorry! :p".

usage : tools/d00m2-solve.py PET            # -> ZYXKVGXXX
        tools/d00m2-solve.py --check PET ZYXKVGXXX
"""
import sys

def atbash(c):
    return chr(ord("Z") - (ord(c) - ord("A")))

def code(serial):
    s = serial.upper()
    if len(s) != 3 or not all("A" <= c <= "Z" for c in s):
        raise SystemExit("serial = exactement 3 lettres A–Z (une par case)")
    return "ZYX" + "".join(atbash(c) for c in s) + "XXX"

if __name__ == "__main__":
    a = sys.argv[1:]
    if len(a) == 3 and a[0] == "--check":
        ok = code(a[1]) == a[2]
        print("Congrats!" if ok else "Sorry! :p")
        sys.exit(0 if ok else 1)
    s = a[0] if a else "PET"
    print(f"serial {s.upper()} -> code {code(s)}")
