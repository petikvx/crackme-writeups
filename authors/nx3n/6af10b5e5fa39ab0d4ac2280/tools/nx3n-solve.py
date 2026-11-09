#!/usr/bin/env python3
"""nx3n 'Find a password' : extrait le mot de passe de cmpr() (0x140002110)
et, avec --check, le valide contre le binaire d'origine (wine/xvfb)."""
import argparse, struct, subprocess, sys, pathlib

EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "my_first_crackme.exe"
CMPR_VA, IMAGE_BASE = 0x140002110, 0x140000000

def extract():
    d = EXE.read_bytes()
    pe = struct.unpack_from("<I", d, 0x3c)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    opt = struct.unpack_from("<H", d, pe + 20)[0]
    sec = pe + 24 + opt
    rva = CMPR_VA - IMAGE_BASE
    for i in range(nsec):
        vsz, va, rsz, raw = struct.unpack_from("<IIII", d, sec + 40 * i + 8)
        if va <= rva < va + max(vsz, rsz):
            off = raw + rva - va
            break
    code, pw = d[off:off + 0x100], bytearray()
    p = code.index(b"\x41\x80\x3c\x24")
    # motif: 41 80 3c 24 <b> (idx 0) puis 41 80 7c 24 <idx> <b>
    if code[p:p+4] == b"\x41\x80\x3c\x24":
        pw.append(code[p+4]); p += 5 + (6 if code[p+5] == 0x0f else 2)
    while code[p:p+4] == b"\x41\x80\x7c\x24":
        pw.append(code[p+5]); p += 6 + (6 if code[p+6] == 0x0f else 2)
    if pw and pw[-1] == 0:
        pw.pop()
    return pw.decode()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = extract()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        for cand in (pw, "petik"):
            o = subprocess.run(["xvfb-run", "-a", "wine", str(EXE)], input=cand + "\n\n",
                               capture_output=True, text=True).stdout
            print(f"{cand!r:28} ->", "Right!" if "Right!" in o else "Wrong!")
