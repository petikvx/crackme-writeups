#!/usr/bin/env python3
"""wut — frd (two_ring_vow.exe) : mot de passe de 15 caractères.

Le verifier construit lui-même la chaîne de référence, octet par octet, avec
une fonction pure `ref_char(i)` @ 0x1400019a0 (tables constantes .rdata,
aucun état global). On l'émule sous Unicorn pour i = 0..14 → mot de passe.

  python3 tools/frd-solve.py                 # affiche le mot de passe
  python3 tools/frd-solve.py --verify        # + test live sous wine (code retour 0)
"""
import argparse, io, subprocess, sys, tempfile, zipfile
from pathlib import Path
import pefile
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RAX

HERE = Path(__file__).resolve().parent.parent
ZIP = HERE / "original" / "two_ring_vow.zip"
REF_CHAR = 0x1400019A0   # unsigned char ref_char(size_t i), i <= 14
LEN = 15


def extract(dst: Path) -> Path:
    with zipfile.ZipFile(ZIP) as z:
        z.setpassword(b"crackmes.one")
        for n in z.namelist():
            if n.lower().endswith((".exe", ".dll")):
                (dst / Path(n).name).write_bytes(z.read(n))
    return dst / "two_ring_vow.exe"


def password(exe: Path) -> str:
    pe = pefile.PE(str(exe))
    base = pe.OPTIONAL_HEADER.ImageBase
    img = pe.get_memory_mapped_image()
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, (len(img) + 0xFFF) & ~0xFFF)
    mu.mem_write(base, img)
    stk, ret = 0x7FF00000, 0xDEAD0000
    mu.mem_map(stk, 0x100000)
    mu.mem_map(ret, 0x1000)
    out = bytearray()
    for i in range(LEN):
        sp = stk + 0x80000
        mu.mem_write(sp, ret.to_bytes(8, "little"))   # adresse de retour factice
        mu.reg_write(UC_X86_REG_RSP, sp)
        mu.reg_write(UC_X86_REG_RCX, i)               # ABI Win64 : 1er arg = rcx
        mu.emu_start(REF_CHAR, ret)
        out.append(mu.reg_read(UC_X86_REG_RAX) & 0xFF)
    return out.decode("ascii")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--verify", action="store_true")
    a = ap.parse_args()
    with tempfile.TemporaryDirectory() as td:
        exe = extract(Path(td))
        pw = password(exe)
        print(pw)
        if a.verify:
            r = subprocess.run(["wine", str(exe)], input=pw + "\n", capture_output=True,
                               text=True, cwd=td, timeout=60)
            last = [l for l in r.stdout.splitlines() if l.strip()][-1]
            print(f"wine rc={r.returncode} : {last}")
            sys.exit(0 if r.returncode == 0 else 1)


if __name__ == "__main__":
    main()
