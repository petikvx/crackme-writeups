#!/usr/bin/env python3
"""Keygen « Assassination » (bswap, 2003).

Le thread 0x4012d1 attend la case 0x12c cochée, lit Name (0xc8) et Serial (0xc9), puis :
  serial[1..L-1] -= 4                                   (0x40143f)
  H(name[0:4], name[4:8], name[8:12])      -> 0x4030a0  (0x401513, 30 tours déroulés)
  H'(ser[0:4], ser[4:8], ser[8:12])        -> 0x4030bf  (0x401a86, même tour en boucle x30,
                                                         mais avec ser[0:4] - 4 à la place du 1er dword)
  octets 1..len(name) des deux buffers égaux, len(name) > 3  -> « -- REGISTERED! -- »
Donc il suffit que ser' = le32(dword(name[0:4]) + 4) || name[4:], puis serial = ser'[0] + (ser'[i] + 4).
--check émule le VRAI code (0x4013fb..0x4014cf) de l'image dépackée avec Unicorn.
usage : assassination-solve.py [NOM] | --check NOM SERIAL
"""
import os, struct, sys
HERE = os.path.dirname(os.path.abspath(__file__))
IMG = os.path.join(HERE, '..', 'analysis', 'Assassination-unfsg.bin')

def keygen(name):
    n = name.encode('latin-1')
    assert 3 < len(n) <= 20, 'nom : 4 à 20 caractères'
    nb = (n + bytes(4))[:4]
    s = bytearray(struct.pack('<I', (struct.unpack('<I', nb)[0] + 4) & 0xffffffff)[:min(4, len(n))] + n[4:])
    for i in range(1, len(s)):
        s[i] = (s[i] + 4) & 0xff
    return s.decode('latin-1')

def emulate(name, serial):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EBP
    img = open(IMG, 'rb').read()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, (len(img) + 0xfff) & ~0xfff); mu.mem_write(0x400000, img)
    mu.mem_write(0x4030a0, bytes(24)); mu.mem_write(0x4030bf, bytes(24))
    n, s = name.encode('latin-1')[:19], serial.encode('latin-1')[:19]
    mu.mem_write(0x4030a0, n); mu.mem_write(0x4030bf, s)
    mu.mem_write(0x403018, struct.pack('<I', len(n)))      # retour de WM_GETTEXT (nom)
    mu.mem_map(0x100000, 0x10000); mu.reg_write(UC_X86_REG_ESP, 0x108000); mu.reg_write(UC_X86_REG_EBP, 0x108800)
    res = []
    def hk(mu, a, sz, _):
        if a in (0x401412, 0x401387, 0x4014bb): res.append(a); mu.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hk)
    mu.emu_start(0x4013fb, 0x401500, count=2_000_000)
    return {0x4014bb: 'REGISTERED', 0x401387: 'BONE', 0x401412: 'Bswap'}.get(res[0] if res else 0, '?')

if __name__ == '__main__':
    a = sys.argv[1:]
    if a[:1] == ['--check']:
        print(emulate(a[1], a[2])); sys.exit()
    n = a[0] if a else 'petik'
    k = keygen(n)
    print(f'Name   = {n}\nSerial = {k}\nemu    : {emulate(n, k)}')
