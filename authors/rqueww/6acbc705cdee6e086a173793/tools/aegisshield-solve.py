#!/usr/bin/env python3
"""AegisShield (rqueww) : récupère le flag sans connaître le mot de passe.

Le flag (AES-256-CTR) est déchiffré avec une clé dérivée du hash 64 bits du mot
de passe. On fabrique une COPIE patchée (sous analysis/, jamais original/) où :
  1. sub_140007FE0 (hash) retourne directement la cible : mov rax, imm64 ; ret
  2. dword_14004A000 (CRC attendu de .text, anti-tamper) est mis à 0.
Puis on lance la copie sous Wine ; n'importe quel mot de passe donne le flag.

Usage : aegisshield-solve.py [-q] [--build-only]
"""
import argparse, os, re, shutil, struct, subprocess, sys

TARGET = 0x2A8FADFD62AD902E
HASH_FN, CRC_VAR = 0x140007FE0, 0x14004A000
here = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(here, '..', 'original', 'AegisShield_crackme_1.exe')
DST = os.path.join(here, '..', 'analysis', 'aegis-patched-hash.exe')

def file_off(d, va):
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    n = struct.unpack_from('<H', d, pe + 6)[0]
    opt = struct.unpack_from('<H', d, pe + 20)[0]
    base = struct.unpack_from('<Q', d, pe + 48)[0]
    for i in range(n):
        _, vs, rva, rs, ro = struct.unpack_from('<8sIIII', d, pe + 24 + opt + 40 * i)
        if rva <= va - base < rva + vs:
            return va - base - rva + ro
    raise ValueError(hex(va))

def build():
    d = bytearray(open(SRC, 'rb').read())
    o = file_off(d, HASH_FN)
    d[o:o + 11] = b'\x48\xb8' + struct.pack('<Q', TARGET) + b'\xc3'
    o = file_off(d, CRC_VAR)
    d[o:o + 4] = bytes(4)
    os.makedirs(os.path.dirname(DST), exist_ok=True)
    open(DST, 'wb').write(d)

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true'); ap.add_argument('--build-only', action='store_true')
    a = ap.parse_args()
    build()
    if a.build_only: sys.exit(0)
    r = subprocess.run(['wine', DST], input='petik\n', capture_output=True, text=True,
                       env={**os.environ, 'WINEDEBUG': '-all'}, timeout=120)
    m = re.search(r'CMO\{[^}]*\}', r.stdout)
    if not m: print(r.stdout, file=sys.stderr); sys.exit(1)
    print(m.group(0) if a.q else r.stdout)
