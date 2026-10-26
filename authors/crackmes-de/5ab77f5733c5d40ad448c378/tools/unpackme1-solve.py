#!/usr/bin/env python3
"""
KLiZMA UnpackMe #1 : unpack (UPX modifié + wrapper XOR) puis UNREGISTERED -> REGISTERED.

Etapes (tout est reproduit hors-ligne, sans exécuter le binaire) :
  1. lit unpackme.exe dans le zip d'origine ;
  2. déchiffre le wrapper (XOR 0x62, 0x312 octets à 0x47e014) et en extrait
     les 3 patchs qui réparent le stub UPX (0x47cc80 / 0x47ccb2 / 0x47cdf7) ;
  3. émule le stub UPX (unicorn) jusqu'à 0x47cdae : image décompressée +
     filtre call/jmp (E8/E9) appliqué ;
  4. reconstruit la table d'imports (format UPX -> IMAGE_IMPORT_DESCRIPTOR) ;
  5. écrit un PE fonctionnel avec OEP 0x463c80 ;
  6. patch le caption DFM du Label2 : UNREGISTERED -> REGISTERED.

Usage : unpackme1-solve.py [-q] [--check] [-o out.exe] [zip]
"""
import argparse, os, struct, sys, zipfile

BASE = 0x400000
HERE = os.path.dirname(os.path.abspath(__file__))
DEF_ZIP = os.path.normpath(os.path.join(HERE, '..', 'original', 'UnpackMe#1_by_KLiZMA.zip'))
DEF_OUT = os.path.normpath(os.path.join(HERE, '..', 'analysis', 'unpackme.registered.exe'))
OEP = 0x463c80


def load_exe(zpath):
    with zipfile.ZipFile(zpath) as z:
        return z.read('unpackme.exe')


def unpack(d):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EBP, UC_X86_REG_ESI
    w = bytearray(d[0x32400:])                      # section wrapper .KLiZMA #3 @0x47e000
    for i in range(0x14, 0x14 + 0x312):             # xor dl,0x62 (loop @0x47e33e)
        w[i] ^= 0x62
    g = lambda a, n: bytes(w[a - 0x47e000:a - 0x47e000 + n])
    u32 = lambda a: struct.unpack('<I', g(a, 4))[0]
    stub, off2, dst3 = u32(0x47e2d4), u32(0x47e319), u32(0x47e31d)
    assert (stub, off2, dst3) == (0x47cc80, 0x32, 0x47cdf7)
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(BASE, 0x80000)
    mu.mem_write(0x44c000, d[0x400:0x31400])        # UPX1 (données compressées + stub)
    mu.mem_write(0x47d000, d[0x31400:0x32400])      # .rsrc (dir + noms d'imports du stub)
    mu.mem_write(stub, g(0x47e2d8, 30))             # patchs faits par le wrapper (VirtualProtect+rep movsb)
    mu.mem_write(stub + off2, g(0x47e2f6, 30))
    mu.mem_write(dst3, g(0x47e314, 5))
    mu.mem_map(0x100000, 0x10000)
    mu.reg_write(UC_X86_REG_ESP, 0x10f000)
    mu.emu_start(stub, 0x47cdae)                    # fin du filtre E8/E9, avant la boucle d'imports
    assert mu.reg_read(UC_X86_REG_ESI) == 0x401000
    return bytes(mu.mem_read(BASE, 0x80000))


def build_imports(mem, rva_base):
    """Table d'imports UPX @0x47a000 -> descripteurs standard dans une nouvelle section."""
    p = 0x47a000
    dlls = []
    while True:
        a = struct.unpack_from('<I', mem, p - BASE)[0]
        if a == 0:
            break
        b = struct.unpack_from('<I', mem, p - BASE + 4)[0]
        name_va = (a + 0x401000 + 0x7cddc) & 0xffffffff
        nm = mem[name_va - BASE:].split(b'\0')[0]
        p += 8
        funcs = []
        while mem[p - BASE]:                        # 1 octet marqueur (0x01 = par nom) puis nom\0
            assert mem[p - BASE] == 1, 'import par ordinal non géré'
            f = mem[p - BASE + 1:].split(b'\0')[0]
            funcs.append(f); p += len(f) + 2
        p += 1
        dlls.append((nm, 0x401000 + b, funcs))
    # layout de la section .idata
    ndesc = (len(dlls) + 1) * 20
    blob = bytearray(ndesc)
    descs = []
    for nm, iat_va, funcs in dlls:
        ilt_off = len(blob); blob += b'\0' * (4 * (len(funcs) + 1))
        hn = []
        for f in funcs:
            hn.append(len(blob)); blob += b'\0\0' + f + b'\0'
            if len(blob) & 1: blob += b'\0'
        name_off = len(blob); blob += nm + b'\0'
        if len(blob) & 1: blob += b'\0'
        for i, o in enumerate(hn):
            struct.pack_into('<I', blob, ilt_off + 4 * i, rva_base + o)
        descs.append((ilt_off, name_off, iat_va, hn))
    iat_fix = {}
    for k, (ilt, name, iat_va, hn) in enumerate(descs):
        struct.pack_into('<IIIII', blob, k * 20, rva_base + ilt, 0, 0, rva_base + name, iat_va - BASE)
        for i, o in enumerate(hn):
            iat_fix[iat_va + 4 * i] = rva_base + o
    return bytes(blob), ndesc, iat_fix, dlls


def build_pe(d, mem, patch=True):
    img = bytearray(mem[0x1000:0x7d000])            # section 0 : 0x401000..0x47d000
    idata_rva = 0x7e000
    blob, ndesc, iat_fix, dlls = build_imports(mem, idata_rva)
    for va, v in iat_fix.items():                   # IAT pré-remplie (le loader l'écrasera)
        struct.pack_into('<I', img, va - 0x401000, v)
    # patch final : caption du Label2 (DFM TForm1)
    old = b'UNREGISTERED'
    i = img.find(b'\x20' + b' ' * 20 + old)
    assert i >= 0 and img.count(old) == 1, 'caption introuvable'
    j = img.find(old)
    if patch:
        img[j:j + 12] = b'  REGISTERED'                  # même longueur -> pas de length byte à toucher
    hdr = bytearray(d[:0x400])
    pe = struct.unpack_from('<I', hdr, 0x3c)[0]
    struct.pack_into('<H', hdr, pe + 6, 3)           # NumberOfSections
    opt = pe + 24
    struct.pack_into('<I', hdr, opt + 16, OEP - BASE)  # EntryPoint
    struct.pack_into('<I', hdr, opt + 56, idata_rva + (len(blob) + 0xfff) // 0x1000 * 0x1000)  # SizeOfImage
    struct.pack_into('<I', hdr, opt + 64, 0)           # CheckSum
    dd = opt + 96
    struct.pack_into('<II', hdr, dd + 8, idata_rva, ndesc)          # import
    struct.pack_into('<II', hdr, dd + 5 * 8 * 0 + 8 * 2, 0x7d000, 0xddc)  # resource
    # TLS conservé (0x7cdfc) : toujours dans l'image ; IAT dir non nécessaire
    struct.pack_into('<II', hdr, dd + 8 * 12, 0, 0)
    sec = opt + 0xe0
    for k in range(4):
        hdr[sec + 40 * k:sec + 40 * k + 40] = b'\0' * 40
    def sh(k, name, va, vs, raw, rs, ch):
        hdr[sec + 40 * k:sec + 40 * k + 40] = struct.pack('<8sIIIIIIHHI', name, vs, va, rs, raw, 0, 0, 0, 0, ch)
    sh(0, b'.text', 0x1000, len(img), 0x400, len(img), 0xE0000060)
    rsrc = d[0x31400:0x32400]
    sh(1, b'.rsrc', 0x7d000, 0x1000, 0x400 + len(img), 0x1000, 0xC0000040)
    idat = blob + b'\0' * (-len(blob) % 0x200)
    sh(2, b'.idata', idata_rva, (len(blob) + 0xfff) // 0x1000 * 0x1000, 0x400 + len(img) + 0x1000, len(idat), 0xC0000040)
    return bytes(hdr) + bytes(img) + rsrc + idat, dlls


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('zip', nargs='?', default=DEF_ZIP)
    ap.add_argument('-o', '--out', default=DEF_OUT)
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--no-patch', action='store_true', help='unpack seul (caption UNREGISTERED conservé)')
    ap.add_argument('--check', action='store_true', help='relit le PE produit et vérifie caption + imports')
    a = ap.parse_args()
    d = load_exe(a.zip)
    mem = unpack(d)
    out, dlls = build_pe(d, mem, not a.no_patch)
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    open(a.out, 'wb').write(out)
    if a.check:
        import pefile
        p = pefile.PE(a.out)
        assert p.OPTIONAL_HEADER.AddressOfEntryPoint == OEP - BASE
        n = sum(len(x.imports) for x in p.DIRECTORY_ENTRY_IMPORT)
        assert n == sum(len(f) for _, _, f in dlls)
        assert (b'UNREGISTERED' in out) == a.no_patch
        print('check OK : %d DLL, %d imports' % (len(p.DIRECTORY_ENTRY_IMPORT), n), file=sys.stderr)
    print(a.out if a.q else 'PE unpacké + patché (REGISTERED) : ' + a.out)


if __name__ == '__main__':
    main()
