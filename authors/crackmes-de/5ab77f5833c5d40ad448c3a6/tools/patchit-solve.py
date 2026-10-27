#!/usr/bin/env python3
"""patchIT / PATCHME.EXE (sas0, crackmes.de) — patch DOS : chemin « Nop this isn't the right msg » -> « Good work you did it :) ».

Le code est chiffré dword par dword (déchiffré au runtime par la routine en CS:0087).
Le dword chiffré à l'offset image 0x54 contient `mov eax, 0x7C` (saut vers le mauvais message) ;
on le remplace par `mov eax, 0x6C` (saut vers le bloc « Good work »).

  python3 tools/patchit-solve.py                       # écrit analysis/PATCHME.patched.EXE
  python3 tools/patchit-solve.py --check               # émule (unicorn) l'original puis le patché
  python3 tools/patchit-solve.py -q                    # affiche seulement l'octet/dword patché
"""
import argparse, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, '..', 'original', 'patchIT.zip')
M = 0xFFFFFFFF
ror = lambda x, n: ((x >> n) | (x << (32 - n))) & M
rol = lambda x, n: ((x << n) | (x >> (32 - n))) & M

# bloc 1 (image 0x54, 16 octets) : ror4 ; sub K1 ; rol4 ; not ; xor K2
def dec1(e): return (~rol((ror(e, 4) - 0x47852369) & M, 4) & M) ^ 0x15935746
def enc1(p): return rol((ror(~(p ^ 0x15935746) & M, 4) + 0x47852369) & M, 4)

HDR = 0x200          # début de l'image dans le fichier
PATCH_OFF = 0x54     # dword (image) : 33 66 B8 7C = junk, 66 B8, imm8 0x7C
GOOD, BAD = 0x6C, 0x7C


def load():
    return bytearray(zipfile.ZipFile(ZIP).read('PATCHME.EXE'))


def make_patch(exe):
    off = HDR + PATCH_OFF
    old = struct.unpack_from('<I', exe, off)[0]
    plain = dec1(old)
    assert plain == 0x7CB86633, hex(plain)          # 33 66 B8 7C
    new = enc1((plain & 0x00FFFFFF) | (GOOD << 24))
    out = bytearray(exe)
    struct.pack_into('<I', out, off, new)
    return out, off, old, new


def run(exe, S=0x1000):
    """Émulation DOS minimale (INT 21h/16h) ; renvoie les chaînes affichées."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INTR
    from unicorn.x86_const import (UC_X86_REG_CS, UC_X86_REG_IP, UC_X86_REG_SS, UC_X86_REG_SP,
                                   UC_X86_REG_DS, UC_X86_REG_ES, UC_X86_REG_AX, UC_X86_REG_DX)
    img = bytearray(exe[HDR:])
    w = struct.unpack_from('<H', img, 1)[0]            # relocation unique : offset 0001
    struct.pack_into('<H', img, 1, (w + S) & 0xFFFF)
    mu = Uc(UC_ARCH_X86, UC_MODE_16); mu.mem_map(0, 0x200000); base = S * 16
    mu.mem_write(base, bytes(img))
    mu.reg_write(UC_X86_REG_CS, S); mu.reg_write(UC_X86_REG_IP, 0)
    mu.reg_write(UC_X86_REG_SS, S + 0x1b); mu.reg_write(UC_X86_REG_SP, 0x400)
    mu.reg_write(UC_X86_REG_DS, S - 0x10); mu.reg_write(UC_X86_REG_ES, S - 0x10)
    out = []
    def intr(mu, n, _):
        ax = mu.reg_read(UC_X86_REG_AX); ah = ax >> 8
        if n == 0x21 and ah == 9:
            a = mu.reg_read(UC_X86_REG_DS) * 16 + mu.reg_read(UC_X86_REG_DX)
            out.append(bytes(mu.mem_read(a, 100)).split(b'$')[0].decode('latin1').strip())
        elif n == 0x21 and ah == 0x4c: mu.emu_stop()
        elif n == 0x16: mu.reg_write(UC_X86_REG_AX, 0x0d)
    mu.hook_add(UC_HOOK_INTR, intr)
    mu.emu_start(base, base + 0x1000, count=20000)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    ap.add_argument('-o', default=os.path.join(HERE, '..', 'analysis', 'PATCHME.patched.EXE'))
    a = ap.parse_args()
    exe = load()
    patched, off, old, new = make_patch(exe)
    if a.q:
        print(f'file+0x{off:x}: {old:08x} -> {new:08x}'); return
    os.makedirs(os.path.dirname(a.o), exist_ok=True)
    open(a.o, 'wb').write(patched)
    print(f'patch: offset fichier 0x{off:x}, dword {old:08x} -> {new:08x}  ({a.o})')
    diff = [i for i in range(len(exe)) if exe[i] != patched[i]]
    print('octets modifiés :', ', '.join(f'0x{i:x}:{exe[i]:02x}->{patched[i]:02x}' for i in diff))
    if a.check:
        r0, r1 = run(exe), run(patched)
        print('original :', r0[-1]); print('patché   :', r1[-1])
        ok = 'Nop' in r0[-1] and 'Good work' in r1[-1]
        print('OK' if ok else 'KO'); sys.exit(0 if ok else 1)

if __name__ == '__main__':
    main()
