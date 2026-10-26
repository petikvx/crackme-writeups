#!/usr/bin/env python3
"""crackme_5_stupid (KLiZMA) : unpack FSG (émulation unicorn) + patch 2 octets.

Usage:
  crackme5-stupid-solve.py [-q] [--check] [ZIP]
Sorties (dans analysis/) : crackme5-unpacked.exe, crackme5-patched.exe
Ne touche jamais à original/.
"""
import argparse, hashlib, os, struct, subprocess, sys, zipfile
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
from unicorn.x86_const import UC_X86_REG_ESP

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
ZIP = os.path.join(ROOT, "original", "CrackMe_#5_by_KLiZMA.zip")
OUT = os.path.join(ROOT, "analysis")
BASE = 0x400000
EP = 0x40776D          # stub FSG : mov eax,0x400154 ; jmp eax
FSG_DONE = 0x4001C6    # début de la résolution d'imports FSG (décompression finie)
OEP = 0x401220         # [ebx+0xc] dans la table FSG
PUSH_STR = 0x4012C8    # mov dword [esp],0x403000 ("Not patched!") avant puts
STR_VA = 0x403000


def fsg_unpack(exe):
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(BASE, 0x8000)
    mu.mem_write(BASE, exe[:0x200])
    mu.mem_write(0x407000, exe[0x200:0x200 + 0x7E4])
    mu.mem_map(0x500000, 0x100000)
    mu.reg_write(UC_X86_REG_ESP, 0x5F0000)
    mu.emu_start(EP, FSG_DONE, count=5_000_000)
    return bytearray(mu.mem_read(BASE, 0x8000))


def rebuild_pe(img):
    """Image décompressée -> PE valide (1 section RWX, imports reconstruits)."""
    # table FSG @0x405000 : (IAT_va, nom_dll_va) x3 ; entrées = va_nom-1, fin 0x7fffffff/-1
    pairs = [struct.unpack_from("<II", img, 0x5000 + 8 * i) for i in range(3)]
    imp_rva = 0x5300
    names = {}
    for n, (iat, dll) in enumerate(pairs):
        o = iat - BASE
        while True:
            v = struct.unpack_from("<I", img, o)[0]
            if v in (0x7FFFFFFF, 0xFFFFFFFF):
                struct.pack_into("<I", img, o, 0)           # terminateur de thunks
                break
            struct.pack_into("<I", img, o, v - BASE - 1)   # RVA du hint/name
            o += 4
    for n, (iat, dll) in enumerate(pairs):                 # IMAGE_IMPORT_DESCRIPTOR
        struct.pack_into("<IIIII", img, imp_rva + 20 * n, iat - BASE, 0, 0, dll - BASE, iat - BASE)
    for o in range(0x7000, 0x8000):                        # purge de la section SVKP
        img[o] = 0
    hdr = bytearray(0x400)
    hdr[:0x40] = img[:0x40]
    struct.pack_into("<I", hdr, 0x3C, 0x80)
    pe = bytearray()
    pe += b"PE\0\0" + struct.pack("<HHIIIHH", 0x14C, 1, 0, 0, 0, 0xE0, 0x107)
    opt = struct.pack("<HBBIIIIIIIIIHHHHHHIIIIHHIIIIII", 0x10B, 0, 0, 0x6000, 0, 0, OEP - BASE, 0x1000, 0x1000,
                      BASE, 0x1000, 0x200, 4, 0, 1, 0, 4, 0, 0, 0x7000, 0x400, 0, 3, 0,
                      0x200000, 0x1000, 0x100000, 0x1000, 0, 16)
    opt += struct.pack("<II", 0, 0) + struct.pack("<II", imp_rva, 0x3C) + b"\0" * (8 * 14)
    pe += opt
    pe += b".all\0\0\0\0" + struct.pack("<IIIIIIHHI", 0x6000, 0x1000, 0x6000, 0x400, 0, 0, 0, 0, 0xE0000060)
    hdr[0x80:0x80 + len(pe)] = pe
    return bytes(hdr) + bytes(img[0x1000:0x7000])


def patch(pe):
    p = bytearray(pe)
    off = lambda va: 0x400 + (va - BASE - 0x1000)
    assert bytes(p[off(PUSH_STR):off(PUSH_STR) + 3]) == b"\xc7\x04\x24" and struct.unpack_from("<I", p, off(PUSH_STR + 3))[0] == STR_VA
    p[off(PUSH_STR + 3)] = 0x04            # mov [esp],0x403000 -> 0x403004 : "patched!"
    assert p[off(STR_VA + 4)] == ord("p")
    p[off(STR_VA + 4)] = ord("P")          # -> "Patched!"
    return bytes(p)


def run(path):
    cmd = ["xvfb-run", "-a", "wine", path]
    return subprocess.run(cmd, capture_output=True, timeout=90).stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("zip", nargs="?", default=ZIP)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="exécute sous Wine (original / unpacked / patched)")
    a = ap.parse_args()
    z = zipfile.ZipFile(a.zip)
    try:
        exe = z.read("crackme.exe")
    except RuntimeError:
        exe = z.read("crackme.exe", pwd=b"crackmes.one")
    unp = rebuild_pe(fsg_unpack(exe))
    pat = patch(unp)
    os.makedirs(OUT, exist_ok=True)
    pu, pp, po = (os.path.join(OUT, n) for n in ("crackme5-unpacked.exe", "crackme5-patched.exe", "crackme5-orig.exe"))
    open(pu, "wb").write(unp); open(pp, "wb").write(pat); open(po, "wb").write(exe)
    if a.q:
        print(hashlib.sha256(pat).hexdigest())
        return
    print("patched ->", pp, "(2 octets : imm32 0x403000->0x403004 @0x4012cb, 'p'->'P' @0x403004)")
    if a.check:
        for p in (po, pu, pp):
            print(os.path.basename(p), "=>", repr(run(p)))


if __name__ == "__main__":
    main()
