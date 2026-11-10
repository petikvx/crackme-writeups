#!/usr/bin/env python3
"""mintcocs learning_vm : keygen/solveur (Mach-O arm64, mini-VM Objective-C).

Le ZIP original/download.bin contient `vm` (Mach-O arm64, pass `crackmes.one`).
Le programme VM (100 octets @ __const 0x100001de4) fait :
    acc = 0
    pour i in 0..20 : acc = rol8(acc ^ code[i], 1) ; exiger acc == T[i]
Inversion : code[i] = ror8(T[i], 1) ^ acc_prec.

Usage : learning-vm-solve.py [-q] [--check] [--bin original/download.bin]
"""
import argparse, io, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_BIN = os.path.join(HERE, "..", "original", "download.bin")


def load_vm(path):
    raw = open(path, "rb").read()
    if raw[:2] == b"PK":
        z = zipfile.ZipFile(io.BytesIO(raw))
        raw = z.read(z.namelist()[0], pwd=b"crackmes.one")
    return raw


def get_program(vm):
    # __const @ file offset 0x1de4, NSData dataWithBytes:length:0x64 (cf. main)
    return vm[0x1DE4:0x1DE4 + 0x64]


def rol1(x): return ((x << 1) | (x >> 7)) & 0xFF
def ror1(x): return ((x >> 1) | (x << 7)) & 0xFF


def solve(mem):
    table = mem[3:0x18]  # 21 octets
    acc, out = 0, []
    for t in table:
        c = ror1(t) ^ acc
        out.append(c)
        acc = t
    return bytes(out)


def run_vm(prog, code):
    """Emulateur des opcodes utilises (semantique lue dans -[VM run])."""
    mem = bytearray(256); mem[:len(prog)] = prog
    r = [0] * 4; pc = 0; zf = False; outp = ""
    def fb():
        nonlocal pc
        b = mem[pc]; pc += 1; return b
    def fw():
        return fb() | (fb() << 8)
    while True:
        op = fb()
        if op == 0x01: a = fb(); v = fb(); r[a] = v
        elif op == 0x40: pc = fw()
        elif op == 0x41:
            a = fw(); pc = a if zf else pc
        elif op == 0x42:
            a = fw(); pc = pc if zf else a
        elif op == 0x60:
            a, base, ln = fb(), fw(), fb()
            s = code.encode()[:ln]; s = s.split(b"\n")[0]
            for i, c in enumerate(s): mem[(base + i) & 0xFF] = c
            r[a] = len(s)
        elif op == 0x61:
            a, b = fb(), fb(); r[a] = rol1(r[a] ^ r[b])
        elif op == 0x64:
            d, base, ix = fb(), fw(), fb(); r[d] = mem[(base + r[ix]) & 0xFFFF]
        elif op == 0x30:
            a, b = fb(), fb(); zf = ((r[a] - r[b]) & 0xFF) == 0
        elif op == 0x12: a = fb(); r[a] = (r[a] + 1) & 0xFF
        elif op == 0x65:
            p = fw()
            while mem[p]: outp += chr(mem[p]); p += 1
        elif op == 0xFF: return outp
        else: raise SystemExit(f"opcode {op:#x} non gere @ {pc-1:#x}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--bin", default=DEF_BIN)
    a = ap.parse_args()
    prog = get_program(load_vm(a.bin))
    code = solve(prog).decode("latin1")
    if a.q:
        print(code)
    else:
        print("code :", code)
    if a.check:
        ok = run_vm(prog, code); ko = run_vm(prog, "A" * 21)
        print(f"emul OK -> {ok!r} ; emul 'A'*21 -> {ko!r}")
        assert ok == "OK" and ko == "NO"


if __name__ == "__main__":
    main()
