#!/usr/bin/env python3
"""svidnet — ZEXOR v1 (wayland/GTK3) : récupère la licence en dur.

valid(const char*) @0x1319 fait strcmp(saisie, UH) ; UH @0x4108 est un char* initialisé
par une relocation R_X86_64_RELATIVE (addend -> .rodata+0x8). Le solveur relit la
relocation puis la chaîne dans le fichier ELF (aucune exécution).

Usage : zexor-solve.py [-q] [--check]   (--check : appelle valid() sous gdb, pas d'écran requis)
"""
import argparse, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "ZEXORv1_wayland"
UH_VADDR = 0x4108


def sections(d):
    shoff, = struct.unpack_from("<Q", d, 0x28)
    shentsize, shnum, shstrndx = struct.unpack_from("<HHH", d, 0x3A)
    out = []
    for i in range(shnum):
        n, t, f, addr, off, size = struct.unpack_from("<IIQQQQ", d, shoff + i * shentsize)
        out.append((t, addr, off, size))
    return out


def v2o(secs, va):
    for t, addr, off, size in secs:
        if t != 8 and addr and addr <= va < addr + size:   # 8 = NOBITS
            return va - addr + off
    raise ValueError(hex(va))


def uh_string(d):
    secs = sections(d)
    for t, addr, off, size in secs:
        if t == 4:                                          # SHT_RELA
            for o in range(off, off + size, 24):
                r_off, info, addend = struct.unpack_from("<QQq", d, o)
                if r_off == UH_VADDR and info & 0xFFFFFFFF == 8:   # R_X86_64_RELATIVE
                    p = v2o(secs, addend)
                    return d[p:d.index(b"\0", p)].decode()
    raise SystemExit("relocation UH introuvable")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    key = uh_string(EXE.read_bytes())
    if a.q:
        print(key); return
    print("license key =", key)
    if a.check:
        gdb = ["gdb", "-q", "-batch", "-ex", "break *0x55555555552a", "-ex", "run"]
        for s in (key, "x"):
            gdb += ["-ex", f'call (int)((int(*)(const char*))0x555555555319)("{s}")']
        out = subprocess.run(gdb + [str(EXE)], capture_output=True, text=True).stdout
        vals = [l.split("=")[1].strip() for l in out.splitlines() if l.startswith("$")]
        ok = vals == ["1", "0"]
        print("check valid(key), valid('x') =", vals, "OK" if ok else "KO")
        sys.exit(0 if ok else 1)

main()
