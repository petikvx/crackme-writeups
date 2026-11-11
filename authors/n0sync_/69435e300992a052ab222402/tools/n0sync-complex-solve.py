#!/usr/bin/env python3
"""n0sync_'s Complex — solveur / vérificateur.

Le binaire lit deux std::complex<double> (cin >> z) :
  1) fun()  : z == (1.0, 1.1)   -> "you got something"
  2) efun() : z == (11.0, 1.1)  -> "Congratulations!,"
Les constantes sont lues dans .rdata du binaire (pas codées en dur ici).

Usage :
  n0sync-complex-solve.py            # affiche les 2 entrées
  n0sync-complex-solve.py -q         # une entrée par ligne (stdin du crackme)
  n0sync-complex-solve.py --check    # émule fun()/efun() de l'exe avec Unicorn
  (l'exe est extrait de original/download.bin, un ZIP, mdp crackmes.one)
Pas de Wine dans cet environnement : --check émule le code x86-64 réel de
fun()/efun() ; seuls cin>>complex et cout<< sont remplacés par des stubs Python.
"""
import argparse, io, struct, sys, zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ZIP = ROOT / "original" / "download.bin"
RDATA = 0x140004000
FUN, EFUN = 0x1400014F0, 0x140001450
CIN_CPLX, COUT_INS = 0x1400015B0, 0x1400015B8


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("untitled1.exe", pwd=b"crackmes.one")


def constants(pe):
    # .rdata file offset 0x2200 <-> VA 0x140004000
    f = lambda va: struct.unpack_from("<d", pe, 0x2200 + va - RDATA)[0]
    return f(0x140004080), f(0x140004088), f(0x140004090)


def fmt(re, im):
    return f"({re:g},{im:g})"


def parse_complex(s):
    """Format libstdc++ : 're' | '(re)' | '(re,im)'."""
    s = s.strip()
    if s.startswith("("):
        parts = s.strip("()").split(",")
        return float(parts[0]), float(parts[1]) if len(parts) > 1 else 0.0
    return float(s), 0.0


def check(pe, inputs):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RDX, UC_X86_REG_R8
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    base = 0x140000000
    mu.mem_map(base, 0x20000)
    mu.mem_write(base, pe[:0x600])
    for va, off, size in ((0x1000, 0x600, 0x18A0), (0x3000, 0x2000, 0xE0), (0x4000, 0x2200, 0xC90)):
        mu.mem_write(base + va, pe[off:off + size])
    mu.mem_map(0x7000000, 0x10000)
    mu.mem_map(0x10000, 0x1000)
    mu.mem_write(0x10000, b"\xf4")  # return address -> hlt
    out, q = [], list(inputs)

    def hook(uc, addr, size, _):
        if addr == CIN_CPLX:
            dst = uc.reg_read(UC_X86_REG_RDX)
            re, im = parse_complex(q.pop(0))
            uc.mem_write(dst, struct.pack("<dd", re, im))
            ret = True
        elif addr == COUT_INS:
            n, p = uc.reg_read(UC_X86_REG_R8), uc.reg_read(UC_X86_REG_RDX)
            out.append(bytes(uc.mem_read(p, n)).decode().strip())
            ret = True
        else:
            return
        rsp = uc.reg_read(UC_X86_REG_RSP)
        uc.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(rsp, 8))[0])
        uc.reg_write(UC_X86_REG_RSP, rsp + 8)

    mu.hook_add(UC_HOOK_CODE, hook, begin=CIN_CPLX, end=COUT_INS)
    rsp = 0x7008000
    mu.mem_write(rsp, struct.pack("<Q", 0x10000))
    mu.reg_write(UC_X86_REG_RSP, rsp)
    try:
        mu.emu_start(FUN, 0x10000)
    except Exception as e:  # hlt à 0x10000 = fin normale
        pass
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pe = load_exe()
    r2, i, r1 = constants(pe)
    ans = [fmt(r1, i), fmt(r2, i)]
    if a.q:
        print("\n".join(ans)); return
    print("Entrée 1 (Enter something:)       :", ans[0])
    print("Entrée 2 (Enter something again:) :", ans[1])
    if a.check:
        for label, inp in (("OK", ans), ("KO 1re", ["(1,1)"]), ("KO 2e", [ans[0], "(1,1.1)"])):
            print(label, inp, "->", check(pe, inp))


if __name__ == "__main__":
    main()
