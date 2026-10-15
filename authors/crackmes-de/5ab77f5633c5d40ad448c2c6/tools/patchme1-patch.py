#!/usr/bin/env python3
"""patchme_1 by d00msweek — patcher reproductible.

But (nfo) : « Make the nag disappear and the "good" MsgBox appear! »

Patch (offsets fichier == RVA, FileAlignment = SectionAlignment = 0x1000) :
  1. GUI table VB (0x4013a8), entrée Form1 (nag) : flags +0x28  0x110 -> 0x100
     (on retire le bit 0x10 = « form de démarrage » : le nag n'est plus chargé)
  2. Code cave .text @ 0x402d00 : faux « Sub Main » qui appelle directement le
     handler Form3.Command1_Click (0x4028a0 : MsgBox "PatchME Solved ! Good BYe"
     puis End) avec un faux objet Me dont AddRef/Release = `ret 4`.
  3. En-tête VB5! (0x401314) : lpSubMain (+0x2c) 0 -> 0x402d00.

usage : tools/patchme1-patch.py [in.exe] [out.exe]
"""
import hashlib, struct, sys

SRC = sys.argv[1] if len(sys.argv) > 1 else "original/PatchME1.exe"
DST = sys.argv[2] if len(sys.argv) > 2 else "PatchME1-patched.exe"
ORIG_SHA = None  # vérifié via la taille + octets attendus ci-dessous

d = bytearray(open(SRC, "rb").read())
VA = lambda off: 0x400000 + off
VBHDR, GUI, CAVE, GOOD = 0x1314, 0x13A8, 0x2D00, 0x4028A0

assert d[VBHDR:VBHDR + 4] == b"VB5!", "en-tête VB5! introuvable"
assert struct.unpack_from("<I", d, VBHDR + 0x2C)[0] == 0, "lpSubMain déjà patché ?"
assert struct.unpack_from("<I", d, GUI + 0x28)[0] == 0x110, "flags Form1 inattendus"
assert d[CAVE:CAVE + 0x40] == bytes(0x40), "cave non vide"

obj, vtbl, stub = CAVE + 0x20, CAVE + 0x24, CAVE + 0x30
code = (b"\x68" + struct.pack("<I", VA(obj))                      # push offset fakeMe
        + b"\xE8" + struct.pack("<i", GOOD - (VA(CAVE) + 10))      # call Form3.Command1_Click
        + b"\x33\xC0\xC3")                                         # xor eax,eax ; ret
d[CAVE:CAVE + len(code)] = code
struct.pack_into("<I", d, obj, VA(vtbl))                          # fakeMe -> vtbl
struct.pack_into("<III", d, vtbl, 0, VA(stub), VA(stub))          # QI, AddRef, Release
d[stub:stub + 3] = b"\xC2\x04\x00"                                # ret 4
struct.pack_into("<I", d, GUI + 0x28, 0x100)                      # Form1 : plus startup
struct.pack_into("<I", d, VBHDR + 0x2C, VA(CAVE))                 # lpSubMain = cave

open(DST, "wb").write(d)
print(f"{DST} écrit ; sha256 = {hashlib.sha256(d).hexdigest()}")
