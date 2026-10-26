#!/usr/bin/env python3
"""Mini-émulateur DOS réel-mode (unicorn) : charge un MZ, émule INT 21h/10h/1Ah, stdin/stdout."""
import struct, sys
from unicorn import *
from unicorn.x86_const import *

def run(exe, stdin: bytes, maxins=5_000_000):
    d = open(exe, 'rb').read()
    h = struct.unpack('<14H', d[:28])
    hs = h[4] * 16
    img = d[hs:h[2] * 512 - (512 - h[1] if h[1] else 0)]
    psp = 0x1000; seg = psp + 0x10
    uc = Uc(UC_ARCH_X86, UC_MODE_16)
    uc.mem_map(0, 0x100000)
    mem = bytearray(img)
    nrel = h[3]; roff = h[12]
    for i in range(nrel):
        o, s = struct.unpack('<HH', d[roff + 4*i: roff + 4*i + 4])
        p = s * 16 + o
        v = struct.unpack('<H', mem[p:p+2])[0]
        mem[p:p+2] = struct.pack('<H', (v + seg) & 0xffff)
    uc.mem_write(seg * 16, bytes(mem))
    uc.mem_write(psp * 16, b'\xcd\x20' + b'\0' * 0xfe)
    uc.mem_write(psp * 16 + 2, struct.pack('<H', 0x9fff))
    uc.mem_write(psp * 16 + 0x2c, struct.pack('<H', 0))
    uc.reg_write(UC_X86_REG_CS, seg + h[11]); uc.reg_write(UC_X86_REG_IP, h[10])
    uc.reg_write(UC_X86_REG_SS, seg + h[7]); uc.reg_write(UC_X86_REG_SP, h[8])
    for r in (UC_X86_REG_DS, UC_X86_REG_ES): uc.reg_write(r, psp)
    st = {'in': bytearray(stdin), 'out': bytearray(), 'exit': None, 'vec': {}}
    def intr(uc, n, _):
        ax = uc.reg_read(UC_X86_REG_AX); ah = ax >> 8
        R = lambda r: uc.reg_read(r)
        def setf(c):
            f = R(UC_X86_REG_EFLAGS)
            uc.reg_write(UC_X86_REG_EFLAGS, (f | 1) if c else (f & ~1))
        if n == 0x21:
            if ah == 0x30: uc.reg_write(UC_X86_REG_AX, 0x0005)
            elif ah == 0x35: uc.reg_write(UC_X86_REG_BX, 0); uc.reg_write(UC_X86_REG_ES, 0)
            elif ah == 0x25: pass
            elif ah == 0x40:
                bx, cx, dx, ds = R(UC_X86_REG_BX), R(UC_X86_REG_CX), R(UC_X86_REG_DX), R(UC_X86_REG_DS)
                data = bytes(uc.mem_read(ds*16+dx, cx))
                if bx in (1, 2): st['out'] += data
                uc.reg_write(UC_X86_REG_AX, cx); setf(0)
            elif ah == 0x3f:
                bx, cx, dx, ds = R(UC_X86_REG_BX), R(UC_X86_REG_CX), R(UC_X86_REG_DX), R(UC_X86_REG_DS)
                # lecture ligne (stdin cuisiné)
                buf = st['in']
                if buf:
                    n_ = buf.find(b'\n') + 1 or len(buf)
                    n_ = min(n_, cx)
                    chunk = bytes(buf[:n_]); del buf[:n_]
                else:
                    chunk = b''
                uc.mem_write(ds*16+dx, chunk); uc.reg_write(UC_X86_REG_AX, len(chunk)); setf(0)
            elif ah == 0x44:  # ioctl getdev: console char device
                uc.reg_write(UC_X86_REG_DX, 0x80D3 if (ax & 0xff) == 0 else R(UC_X86_REG_DX)); setf(0)
            elif ah in (0x07, 0x08, 0x01):
                st['getch'] = True; st['exit'] = 'getch'; uc.emu_stop()
            elif ah == 0x4c:
                st['exit'] = ax & 0xff; uc.emu_stop()
            elif ah in (0x49, 0x4a, 0x58): setf(0)
            elif ah == 0x42: uc.reg_write(UC_X86_REG_AX, 0); uc.reg_write(UC_X86_REG_DX, 0); setf(0)
            else: print(f'[int21 ah={ah:#x} non géré]', file=sys.stderr); setf(0)
        elif n == 0x1a: uc.reg_write(UC_X86_REG_AX, 0); uc.reg_write(UC_X86_REG_CX, 0); uc.reg_write(UC_X86_REG_DX, 0)
        elif n == 0x10:
            if ah == 0x0e: st['out'].append(ax & 0xff)
            elif ah == 0x0f: uc.reg_write(UC_X86_REG_AX, 0x5003); uc.reg_write(UC_X86_REG_BX, 0)
            elif ah == 0x03: uc.reg_write(UC_X86_REG_DX, 0)
        elif n == 0x20: st['exit'] = 0; uc.emu_stop()
        else: print(f'[int {n:#x} non géré]', file=sys.stderr)
    uc.hook_add(UC_HOOK_INTR, intr)
    try:
        uc.emu_start((seg + h[11]) * 16 + h[10], 0, count=maxins)
    except UcError as e:
        st['err'] = str(e)
    # texte VGA éventuel
    vga = bytes(uc.mem_read(0xb8000, 80*25*2))[::2]
    st['vga'] = vga
    return st

if __name__ == '__main__':
    r = run(sys.argv[1], sys.stdin.buffer.read())
    sys.stdout.write(r['out'].decode('cp437', 'replace'))
    print('\n[exit]', r['exit'], r.get('err', ''))
