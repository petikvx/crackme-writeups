#!/usr/bin/env python3
"""Unpacker statique pour deroko x64_unpackme (packed.exe).

Usage: unpackme-solve.py <packed.exe|unpackme.zip> [-o out.exe] [-q]
Le stub : RtlDecompressBuffer(LZNT1|MAX=0x102) de [ctx+0x78] -> RVA [ctx+0x58],
puis résolution d'imports (descripteurs à [ctx+0x30]) et jmp OEP [ctx+0x40].
Ici on fait la même chose hors-ligne : décompresse, ajoute les sections, fixe l'EP.
"""
import argparse, struct, sys, zipfile, io

def lznt1(src, outsize):
    out = bytearray(); i = 0
    while i + 2 <= len(src) and len(out) < outsize:
        h = struct.unpack_from('<H', src, i)[0]; i += 2
        if h == 0: break
        size = (h & 0xFFF) + 1; end = i + size
        if not h & 0x8000:
            out += src[i:end]; i = end; continue
        chunk_start = len(out)
        while i < end:
            flags = src[i]; i += 1
            for b in range(8):
                if i >= end: break
                if not flags >> b & 1:
                    out.append(src[i]); i += 1
                else:
                    t = struct.unpack_from('<H', src, i)[0]; i += 2
                    pos = len(out) - chunk_start
                    lb = 12  # bits de longueur : 12 - bits(pos-1) + 4 (LZNT1)
                    p = pos - 1
                    while p >= 0x10: p >>= 1; lb -= 1
                    off = (t >> lb) + 1; ln = (t & ((1 << lb) - 1)) + 3
                    for _ in range(ln): out.append(out[-off])
    return bytes(out)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('inp'); ap.add_argument('-o', default='unpacked.exe'); ap.add_argument('-q', action='store_true')
    a = ap.parse_args()
    data = open(a.inp, 'rb').read()
    if data[:2] == b'PK':
        data = zipfile.ZipFile(io.BytesIO(data)).read('packed.exe')
    pe = struct.unpack_from('<I', data, 0x3c)[0]
    nsec = struct.unpack_from('<H', data, pe + 6)[0]
    sec = pe + 24 + 240
    # section 2 = stub : RVA 0xf000, raw 0x400
    vs, rva, rs, raw = struct.unpack_from('<IIII', data, sec + 40 + 8)
    ctx = data[raw:raw + 0x80]
    q = lambda o: struct.unpack_from('<Q', ctx, o)[0]
    imp, oep, csize, usize, dstrva, srcrva = q(0x30), q(0x40), q(0x48), q(0x50), q(0x58), q(0x78)
    src = data[raw + srcrva - rva: raw + srcrva - rva + csize]
    img = lznt1(src, usize)
    assert len(img) == usize, (len(img), usize)
    # image complète : headers originaux + image décompressée
    full = bytearray(0x16000)
    full[:0x400] = data[:0x400]
    full[dstrva:dstrva + usize] = img
    # sections reconstruites (frontières d'après data directories)
    secs = [(b'.text', 0x1000, 0x6000, 0x60000020), (b'.rdata', 0x7000, 0x3000, 0x40000040),
            (b'.data', 0xa000, 0x3000, 0xC0000040), (b'.pdata', 0xd000, 0x1000, 0x40000040),
            (b'.rsrc', 0xe000, 0x1000, 0x40000040)]
    # (les sections du stub sont écrasées)
    struct.pack_into('<H', full, pe + 6, len(secs))
    struct.pack_into('<I', full, pe + 24 + 16, oep)               # EP
    struct.pack_into('<I', full, pe + 24 + 112 + 8, imp)           # Import dir RVA
    struct.pack_into('<I', full, pe + 24 + 112 + 12, 0x3c)
    for k, (n, r, v, f) in enumerate(secs):
        struct.pack_into('<8sIIIIIIHHI', full, sec + 40 * k, n, v, r, v, r, 0, 0, 0, 0, f)
    # fichier: alignement 0x1000 (raw == rva) pour simplicité
    struct.pack_into('<I', full, pe + 24 + 36, 0x1000)             # FileAlignment
    full[sec + 40 * len(secs):sec + 40 * (len(secs) + 2)] = b'\0' * 80
    open(a.o, 'wb').write(full[:0xf000])
    if not a.q:
        print(f'imports RVA={imp:#x} OEP={oep:#x} compressed={csize:#x} -> {usize:#x}')
        print('écrit', a.o)

if __name__ == '__main__':
    main()
