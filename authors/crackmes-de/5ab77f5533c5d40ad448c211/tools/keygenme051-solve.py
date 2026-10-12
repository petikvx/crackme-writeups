#!/usr/bin/env python3
"""Keymaker « Keygenme 0.51 » (bswap) — émulation Unicorn du VRAI code de calcul (image dé-FSG).

0x401217..0x4013ee : le buffer nom (4 dwords, restes du buffer initial compris) passe par une moulinette (bswap/sar/idiv...) qui réécrit 0x403092..0x4030b1.
0x4013f3..0x401460 : chaque octet de clé c -> 1 si (c ^ 0x30) < 0x50, sinon 0 ;
                     chaque octet « nom » b -> 1 si 0xc1 < b < 0xf0, sinon 0.
0x401462..0x401499 : clé[1..12] doit égaler nom[2..13] (3 dwords de 0/1).
Donc clé = 1 caractère libre + 12 caractères : '1' là où le bit vaut 1, 'a' là où il vaut 0.
usage : keygenme051-solve.py [NOM] | --check NOM CLE
"""
import os, sys
from unicorn import *
from unicorn.x86_const import *
HERE = os.path.dirname(os.path.abspath(__file__))
IMG = os.path.join(HERE, '..', 'analysis', 'Keygenme051-unfsg.bin')
NAME, KEY = 0x403092, 0x4030b3

def run(name, key):
    img = open(IMG, 'rb').read()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, (len(img) + 0xfff) & ~0xfff); mu.mem_write(0x400000, img)
    # GetDlgItemTextA n'écrit que le texte + '\0' : le reste du buffer garde les octets initiaux
    # (« iTisgrEattoby… » / « jdsfdsfa3200… ») et entre dans le calcul -> on ne remet PAS à zéro.
    mu.mem_write(NAME, name.encode()[:0x20] + b'\0'); mu.mem_write(KEY, key.encode()[:0x20] + b'\0')
    mu.mem_map(0x100000, 0x10000); mu.reg_write(UC_X86_REG_ESP, 0x108000); mu.reg_write(UC_X86_REG_EBP, 0x108800)
    mu.emu_start(0x401217, 0x401462)
    nbits = bytes(mu.mem_read(0x403094, 12))
    end = []
    def hk(mu, addr, size, _):
        if addr in (0x40149b, 0x4014b0): end.append(addr); mu.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hk, begin=0x401462, end=0x4014b0)
    mu.emu_start(0x401462, 0x401500)
    ok = end == [0x4014b0]
    return nbits, ok

def keygen(name):
    nbits, _ = run(name, 'x')
    return 'x' + ''.join('1' if b else 'a' for b in nbits)

if __name__ == '__main__':
    a = sys.argv[1:]
    if a[:1] == ['--check']:
        print('OK' if run(a[1], a[2])[1] else 'KO'); sys.exit()
    n = a[0] if a else 'petik'
    k = keygen(n)
    print(f'Name = {n}\nKey  = {k}\ncheck: {"OK" if run(n, k)[1] else "KO"}')
