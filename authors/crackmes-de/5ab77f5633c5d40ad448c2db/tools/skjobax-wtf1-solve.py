#!/usr/bin/env python3
"""wtf_serial_protected_round_1 by skjobax — extraction du VBScript + keygen.

L'EXE PureBasic embarque en overlay (offset 0x3600) un VBScript compressé
JCALG1 (signature « JC »), décompressé au runtime par la routine 0x402E40
puis exécuté via MSScriptControl. On émule cette routine avec unicorn.

  ./skjobax-wtf1-solve.py petik            # serial pour « petik » → 10040d
  ./skjobax-wtf1-solve.py --extract EXE    # dump du VBScript décompressé
"""
import argparse, struct, sys

def keygen(name: str) -> str:
    n = len(name)
    if not 1 <= n <= 12:
        raise ValueError("longueur 1..12 (Len=0 → division par zéro, Len>12 → Chr(20*Len) > 255)")
    key = n * 20
    # VBScript : Mod prioritaire sur +, + prioritaire sur &
    tail = ((key * 9) + 10) % n + 20 + 20      # = (10 mod n) + 40
    # la boucle « Do While i = 90 » ne s'exécute jamais (i = 65) → cod = ""
    return f"{key}{tail}" + chr(n * 20)        # Chr en cp1252 (≥ 128 pour n ≥ 7)

def extract(exe: str) -> bytes:
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_ESP
    pe = pefile.PE(exe)
    img = pe.get_memory_mapped_image(); base = pe.OPTIONAL_HEADER.ImageBase
    src = open(exe, "rb").read()[0x3600:]
    assert src[:2] == b"JC"
    size = struct.unpack("<I", src[2:6])[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, 0x10000); mu.mem_write(base, img[:0x10000])
    mu.mem_map(0x100000, 0x10000); mu.mem_write(0x100000, src)
    mu.mem_map(0x200000, 0x10000); mu.mem_map(0x300000, 0x10000)
    ret = 0x9000000; mu.mem_map(ret, 0x1000)
    sp = 0x30F000
    for v in (0x200000, 0x100000, ret):       # stdcall decompress(src, dst)
        sp -= 4; mu.mem_write(sp, struct.pack("<I", v))
    mu.reg_write(UC_X86_REG_ESP, sp)
    mu.emu_start(0x402E40, ret, count=10_000_000)
    return bytes(mu.mem_read(0x200000, size))

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--extract", metavar="EXE")
    a = ap.parse_args()
    if a.extract:
        sys.stdout.write(extract(a.extract).decode("latin-1"))
    else:
        s = keygen(a.name)
        print(s.encode("cp1252", "replace").decode("cp1252"), repr(s))
