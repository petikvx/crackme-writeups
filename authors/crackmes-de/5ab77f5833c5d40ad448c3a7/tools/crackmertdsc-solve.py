#!/usr/bin/env python3
"""CrackmeRTDSC.exe (sas0, crackmes.de) — code DOS dépendant de l'écart de deux RDTSC.

Le programme lit un code (INT 21h/0Ah) puis calcule delta = rdtsc2 - rdtsc1 et compare
les 8 premiers octets saisis à  DS:[delta .. delta+8]  (table de 88 octets dans l'image).
Code valide = table[delta:delta+8].

  python3 tools/crackmertdsc-solve.py              # delta mesuré sur cette machine (gcc) sinon 0x1c
  python3 tools/crackmertdsc-solve.py --delta 28   # delta imposé
  python3 tools/crackmertdsc-solve.py --all        # tous les codes possibles (delta 0..0x50)
  python3 tools/crackmertdsc-solve.py --check      # émule (unicorn) le binaire d'origine : OK/KO
  python3 tools/crackmertdsc-solve.py -q           # code seul
"""
import argparse, os, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, '..', 'original', 'crackmeRTDSC.zip')
TABLE_OFF = 0x60      # table dans l'image (DS = base+6 paragraphes => DS:0 = image+0x60)
TABLE_LEN = 0x58


def load_img():
    z = zipfile.ZipFile(ZIP); z.setpassword(b'crackmes.one')
    return bytearray(z.read('CrackmeRTDSC.exe')[0x200:])


def table():
    return bytes(load_img()[TABLE_OFF:TABLE_OFF + TABLE_LEN])


def code_for(delta):
    t = table()
    if not 0 <= delta <= TABLE_LEN - 8:
        raise SystemExit(f'delta 0x{delta:x} hors table (0..0x{TABLE_LEN-8:x})')
    return t[delta:delta + 8].decode()


def measure():
    """Écart typique de `rdtsc; mov ebx,eax; rdtsc; sub eax,ebx` (mode sur 200 essais)."""
    src = r'''#include <stdio.h>
int main(){unsigned c[512]={0};for(int i=0;i<200;i++){unsigned b;
asm volatile("rdtsc\n mov %%eax,%%ebx\n rdtsc\n sub %%ebx,%%eax":"=a"(b)::"edx","ebx");if(b<512)c[b]++;}
int m=0;for(int i=0;i<512;i++)if(c[i]>c[m])m=i;printf("%d\n",m);}'''
    with tempfile.TemporaryDirectory() as d:
        c, e = os.path.join(d, 'm.c'), os.path.join(d, 'm')
        open(c, 'w').write(src)
        try:
            subprocess.run(['gcc', '-O1', c, '-o', e], check=True, capture_output=True)
            return int(subprocess.run([e], capture_output=True, text=True).stdout)
        except Exception:
            return None


def run(code, delta, S=0x1000):
    """Émulation DOS minimale ; rdtsc forcé (t, t+delta) par hook ; renvoie le dernier message."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INTR, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_CS, UC_X86_REG_IP, UC_X86_REG_SS, UC_X86_REG_SP,
                                   UC_X86_REG_DS, UC_X86_REG_ES, UC_X86_REG_AX, UC_X86_REG_DX,
                                   UC_X86_REG_EAX, UC_X86_REG_EDX, UC_X86_REG_EIP)
    img = load_img()
    w = struct.unpack_from('<H', img, 1)[0]
    struct.pack_into('<H', img, 1, (w + S) & 0xFFFF)        # relocation unique (mov ax,imm16)
    mu = Uc(UC_ARCH_X86, UC_MODE_16); mu.mem_map(0, 0x200000); base = S * 16
    mu.mem_write(base, bytes(img))
    mu.reg_write(UC_X86_REG_CS, S); mu.reg_write(UC_X86_REG_IP, 0)
    mu.reg_write(UC_X86_REG_SS, S + 0x1b); mu.reg_write(UC_X86_REG_SP, 0x400)
    mu.reg_write(UC_X86_REG_DS, S - 0x10); mu.reg_write(UC_X86_REG_ES, S - 0x10)
    out, n = [], [0]
    def intr(mu, num, _):
        ah = mu.reg_read(UC_X86_REG_AX) >> 8
        ds = mu.reg_read(UC_X86_REG_DS) * 16
        if num == 0x21 and ah == 9:
            a = ds + mu.reg_read(UC_X86_REG_DX)
            out.append(bytes(mu.mem_read(a, 100)).split(b'$')[0].decode('latin1').strip())
        elif num == 0x21 and ah == 0x0a:                    # lecture tamponnée : [max][len][octets][CR]
            a = ds + mu.reg_read(UC_X86_REG_DX)
            b = code.encode()[:30]
            mu.mem_write(a + 1, bytes([len(b)]) + b + b'\r')
        elif num == 0x21 and ah == 0x4c: mu.emu_stop()
    def hook(mu, addr, size, _):
        if mu.mem_read(addr, 2) == b'\x0f\x31':             # rdtsc : on impose les compteurs
            mu.reg_write(UC_X86_REG_EAX, 1000 + (delta if n[0] else 0)); mu.reg_write(UC_X86_REG_EDX, 0)
            n[0] += 1
            mu.reg_write(UC_X86_REG_EIP, mu.reg_read(UC_X86_REG_EIP) + 2)
    mu.hook_add(UC_HOOK_INTR, intr)
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(base, base + 0x1000, count=20000)
    return out[-1]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true'); ap.add_argument('--check', action='store_true')
    ap.add_argument('--all', action='store_true'); ap.add_argument('--delta', type=lambda x: int(x, 0))
    a = ap.parse_args()
    if a.all:
        for d in range(TABLE_LEN - 7): print(f'delta=0x{d:02x} ({d:2d})  {code_for(d)}')
        return
    d = a.delta if a.delta is not None else (measure() or 0x1c)
    code = code_for(d)
    if a.q: print(code); return
    print(f'delta = 0x{d:x} ({d}) -> code : {code}')
    if a.check:
        allok = all('Hehe' in run(code_for(dd), dd) for dd in range(TABLE_LEN - 7))
        good, bad = run(code, d), run(code, d + 1 if d + 1 <= TABLE_LEN - 8 else d - 1)
        print('bon delta   :', good); print('mauvais delta:', bad)
        ok = allok and good != bad and 'Hehe' in good
        print('OK' if ok else 'KO'); sys.exit(0 if ok else 1)

if __name__ == '__main__':
    main()
