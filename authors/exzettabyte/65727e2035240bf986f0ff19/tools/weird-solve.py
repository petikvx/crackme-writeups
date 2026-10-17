#!/usr/bin/env python3
"""exzettabyte — Weird (UPX) : main n'affiche que "Something weird" ; le flag est dans secret(), jamais appelée.

secret @0x401d05 (binaire dépacké) : construit 38 octets sur la pile avec
    movabs x4 (0x6c6830726e68656f, 0x3a3e3e3b396b306a, 0x303d6c3a3c3d303e, 0x6f6c3e3b3d303131) + dword 0x3e6c3e6c + word 0x746b
puis buf[i] ^= 9 pour i < 0x26 et printf("Flag : %s", buf).
Le solveur dépacke avec tools/upx-3.96 (sortie temporaire), lit les immediates, XOR ; --check appelle secret() sous gdb.
Usage : weird-solve.py [-q] [--check]
"""
import argparse, re, struct, subprocess, sys, tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE, UPX = ROOT / "original" / "weird", ROOT.parent.parent.parent / "tools" / "upx-3.96"
tmp = Path(tempfile.mkdtemp()) / "weird.unpacked"
subprocess.run([str(UPX), "-d", "-o", str(tmp), str(EXE)], capture_output=True, check=True)
d = tmp.read_bytes()
VMA = 0x401D05
off = d.index(bytes.fromhex("f30f1efa554889e54883ec50"), 0)            # prologue de secret()
body = d[off:off + 0xA0]
quads = [struct.unpack_from("<Q", body, m.start() + 2)[0] for m in re.finditer(rb"\x48[\xb8\xba]", body)][:4]
dword = struct.unpack_from("<I", body, body.index(bytes.fromhex("c745f0")) + 3)[0]      # mov DWORD PTR [rbp-0x10], imm32
word = struct.unpack_from("<H", body, body.index(bytes.fromhex("66c745f4")) + 4)[0]     # mov WORD PTR [rbp-0xc], imm16
key = body[body.index(bytes.fromhex("c645bf")) + 3]                                     # mov BYTE PTR [rbp-0x41], imm8
n = body[body.index(bytes.fromhex("48c745c8")) + 4]                                     # mov QWORD PTR [rbp-0x38], imm32
raw = b"".join(struct.pack("<Q", q) for q in quads) + struct.pack("<I", dword) + struct.pack("<H", word)
flag = bytes(c ^ key for c in raw[:n]).decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(flag); sys.exit(0)
print(f"{n} octets, XOR {key:#x}  ->  flag = {flag}")
if a.check:
    fflush = int(subprocess.run(f"nm {tmp} | awk '$3==\"fflush\"{{print $1}}'", shell=True, capture_output=True, text=True).stdout.split()[0], 16)
    out = subprocess.run(["gdb", "-q", "-batch", "-ex", "set debuginfod enabled off", "-ex", "catch syscall write", "-ex", "run", "-ex", "delete",
                          "-ex", f"call ((int(*)()){VMA:#x})()", "-ex", f"call ((int(*)(void*)){fflush:#x})(0)", str(EXE)],
                         capture_output=True, text=True).stdout
    ok = f"Flag : {flag}" in out
    plain = subprocess.run([str(EXE)], capture_output=True, text=True).stdout.strip()
    print("gdb (binaire d'origine packé) :", "OK" if ok else "KO", "| exécution normale :", plain)
    sys.exit(0 if ok and plain == "Something weird" else 1)
