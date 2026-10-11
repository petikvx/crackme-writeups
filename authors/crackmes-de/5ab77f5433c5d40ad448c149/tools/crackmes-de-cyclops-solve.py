#!/usr/bin/env python3
"""cyclops (crackmes.de / cyclops) — extrait le serial en dur de .data (0x403020)."""
import sys, zipfile, io, struct, pathlib
here = pathlib.Path(__file__).resolve().parent.parent
z = zipfile.ZipFile(here / "original" / "cyclops.zip")
pe = z.read("cyclops.exe")
# .data : VA 0x403000 ; on cherche le RawPointer via la table des sections
peoff = struct.unpack_from("<I", pe, 0x3c)[0]
nsec = struct.unpack_from("<H", pe, peoff + 6)[0]
opt = struct.unpack_from("<H", pe, peoff + 20)[0]
sec = peoff + 24 + opt
for i in range(nsec):
    name, vsz, va, rsz, raw = struct.unpack_from("<8sIIII", pe, sec + 40 * i)
    if name.rstrip(b"\0") == b".data":
        off = raw + (0x403020 - 0x400000 - va)
        serial = pe[off:pe.index(b"\0", off)].decode()
        break
assert serial == "<BrD-SoB>", serial
print(serial)
