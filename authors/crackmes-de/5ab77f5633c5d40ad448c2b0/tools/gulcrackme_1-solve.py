#!/usr/bin/env python3
"""gulcrackme_1 (gul) — crackmes.one 5ab77f5633c5d40ad448c2b0 : patcher.

Le chemin « secret » est mort : à VA 0x40135E, `mov ecx,1 ; test ecx,ecx ; je` saute toujours
par-dessus le bloc qui calcule le hash ELF (PJW) de .text (0x1000 octets depuis 0x401000),
le compare à la constante [0x402064], puis appelle [0x402068] ^ hash (= 0x4011C1, la routine
qui déchiffre le bitmap 0x6A et affiche « Well done. Congratz! =D »).
Toute modification de .text change le hash : le patcher met donc ecx à 0 PUIS recalcule les
deux constantes de .rdata (hors zone hashée) pour que le pointeur retombe sur 0x4011C1.

  ./gulcrackme_1-solve.py original/gulcrkme1.exe analysis/gulcrkme1-patched.exe
"""
import struct, sys
import pefile

TARGET = 0x4011C1           # routine « secret »

def elf_hash(b: bytes) -> int:
    h = 0
    for c in b:
        h = ((h << 4) + c) & 0xFFFFFFFF
        g = h & 0xF0000000
        if g:
            h ^= g >> 24
        h &= ~g & 0xFFFFFFFF
    return h

def patch(src: str, dst: str) -> None:
    pe = pefile.PE(src)
    def off(va): return pe.get_offset_from_rva(va - 0x400000)
    pe.set_bytes_at_offset(off(0x40135E), b"\xB9\x00\x00\x00\x00")   # mov ecx,0
    img = pe.get_memory_mapped_image()
    h = elf_hash(img[0x1000:0x2000])
    pe.set_dword_at_offset(off(0x402064), h)
    pe.set_dword_at_offset(off(0x402068), h ^ TARGET)
    pe.write(dst)
    print(f"hash .text patché = {h:#010x} ; [0x402064]={h:#010x} [0x402068]={h ^ TARGET:#010x} -> {dst}")

if __name__ == "__main__":
    patch(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else "gulcrkme1-patched.exe")
