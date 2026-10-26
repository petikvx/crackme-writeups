#!/usr/bin/env python3
"""Mini-émulateur DOS 16 bits (unicorn) pour KEYGENME.EXE (Borland C++ 1991).

- charge l'EXE MZ en mémoire (original non modifié), applique les relocs ;
- émule les INT 21h utiles (30, 25/35, 4A, 40, 3F, 44, 4C, 48/49, 58, 67) ;
- l'émulateur FPU de Borland (INT 34h..3Dh) est remplacé en mémoire par de vrais
  opcodes x87 (CD 3x -> 9B D8+x), comme le fait le runtime quand un 8087 est présent.
"""
import struct, sys
from unicorn import *
from unicorn.x86_const import *

PSP = 0x1000
def run(exe_path, stdin_bytes, verbose=False, max_ins=20_000_000):
    d = open(exe_path, 'rb').read()
    last, pages, nrel, hdr = struct.unpack('<4H', d[2:10])
    ss, sp, _, ip, cs, reloff = struct.unpack('<6H', d[14:26])
    size = (pages - 1) * 512 + (last or 512)
    img = bytearray(d[hdr * 16:size])
    load = PSP + 0x10
    for i in range(nrel):
        o, s = struct.unpack('<2H', d[reloff + 4 * i:reloff + 4 * i + 4])
        p = s * 16 + o
        struct.pack_into('<H', img, p, (struct.unpack_from('<H', img, p)[0] + load) & 0xFFFF)
    # FPU emulator fixups : CD 34..3B -> 9B D8..DF ; CD 3D -> 9B 90 (fwait)
    for i in range(len(img) - 1):
        if img[i] == 0xCD and 0x34 <= img[i + 1] <= 0x3B:
            img[i], img[i + 1] = 0x9B, 0xD8 + img[i + 1] - 0x34
        elif img[i] == 0xCD and img[i + 1] == 0x3D:
            img[i], img[i + 1] = 0x9B, 0x90
    mu = Uc(UC_ARCH_X86, UC_MODE_16)
    mu.mem_map(0, 0x100000)
    mu.mem_write(load * 16, bytes(img))
    mu.mem_write(PSP * 16 + 0x2C, b'\0\0')
    mu.mem_write(PSP * 16, b'\xCD\x20')
    # environnement minimal
    mu.mem_write(0x9000 * 16, b'\0\0\x01\0A:\\K.EXE\0')
    mu.mem_write(PSP * 16 + 0x2C, struct.pack('<H', 0x9000))
    mu.mem_write(PSP * 16 + 2, struct.pack('<H', 0x9FFF))
    # FPU on
    mu.reg_write(UC_X86_REG_CR0, mu.reg_read(UC_X86_REG_CR0) & ~0x4 & ~0x8)
    for r, v in ((UC_X86_REG_DS, PSP), (UC_X86_REG_ES, PSP), (UC_X86_REG_SS, ss + load),
                 (UC_X86_REG_SP, sp), (UC_X86_REG_CS, cs + load), (UC_X86_REG_IP, ip)):
        mu.reg_write(r, v)
    st = {'in': bytearray(stdin_bytes), 'out': bytearray(), 'done': False, 'code': None, 'alloc': 0x2000}

    def intr(mu, n, ud):
        ah = mu.reg_read(UC_X86_REG_AH)
        al = mu.reg_read(UC_X86_REG_AL)
        def setcf(c):
            fl = mu.reg_read(UC_X86_REG_EFLAGS)
            # flags poussés par INT : on modifie la copie sur la pile (iret) si elle existe
            sp_ = mu.reg_read(UC_X86_REG_SP); ssg = mu.reg_read(UC_X86_REG_SS)
            return
        if n == 0x21:
            if ah == 0x30:
                mu.reg_write(UC_X86_REG_AX, 0x0005)
            elif ah == 0x35:
                mu.reg_write(UC_X86_REG_BX, 0); mu.reg_write(UC_X86_REG_ES, 0)
            elif ah in (0x25, 0x4A, 0x49, 0x67, 0x58):
                pass
            elif ah == 0x40:
                bx = mu.reg_read(UC_X86_REG_BX); cx = mu.reg_read(UC_X86_REG_CX)
                a = mu.reg_read(UC_X86_REG_DS) * 16 + mu.reg_read(UC_X86_REG_DX)
                data = bytes(mu.mem_read(a, cx))
                if bx in (1, 2): st['out'] += data
                mu.reg_write(UC_X86_REG_AX, cx)
            elif ah == 0x3F:
                bx = mu.reg_read(UC_X86_REG_BX); cx = mu.reg_read(UC_X86_REG_CX)
                a = mu.reg_read(UC_X86_REG_DS) * 16 + mu.reg_read(UC_X86_REG_DX)
                # console : une ligne à la fois
                if bx == 0:
                    buf = st['in']
                    k = buf.find(b'\n'); k = len(buf) if k < 0 else k + 1
                    k = min(k, cx)
                    chunk = bytes(buf[:k]).replace(b'\n', b'\r\n') if False else bytes(buf[:k])
                    del buf[:k]
                    mu.mem_write(a, chunk); mu.reg_write(UC_X86_REG_AX, len(chunk))
            elif ah == 0x44:
                mu.reg_write(UC_X86_REG_DX, 0x0000)  # fichier (pas un tty) -> I/O tamponnée
            elif ah == 0x48:
                mu.reg_write(UC_X86_REG_AX, st['alloc']); st['alloc'] += 0x100
            elif ah == 0x4C:
                st['code'] = al; st['done'] = True; mu.emu_stop()
            elif ah == 0x2C or ah == 0x2A:
                pass
            else:
                if verbose: print('INT21 inconnu AH=%02x' % ah, file=sys.stderr)
        elif n == 0x20:
            st['done'] = True; mu.emu_stop()
        else:
            if verbose: print('INT %02x AH=%02x' % (n, ah), file=sys.stderr)
    mu.hook_add(UC_HOOK_INTR, intr)
    try:
        mu.emu_start((cs + load) * 16 + ip, 0xFFFFF, count=max_ins)
    except UcError as e:
        if verbose: print('UcError', e, 'cs:ip=%x:%x' % (mu.reg_read(UC_X86_REG_CS), mu.reg_read(UC_X86_REG_IP)), file=sys.stderr)
    return bytes(st['out']), st['done'], st['code']

if __name__ == '__main__':
    out, done, code = run(sys.argv[1], sys.argv[2].encode().decode('unicode_escape').encode(), verbose=True)
    print(out.decode('latin1')); print(done, code)
