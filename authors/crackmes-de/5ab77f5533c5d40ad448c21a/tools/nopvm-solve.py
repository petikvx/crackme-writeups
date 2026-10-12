#!/usr/bin/env python3
"""Générateur de mots de passe pour crackme_nop_vm (Opcode0x90).
Bytecode 0x40141a : eax = 0x1337C0DE ; pour i = 0.. : eax += le32(buf[i:i+4]) ; stop après l'octet '\\n'.
Il faut eax == 0x0A4F4CAB. buf = mot de passe + fin de ligne (console Windows : "\\r\\n") + zéros.
Chaque octet j pèse w_j = 1, 0x101, 0x10101 puis 0x01010101 (j>=3) : on fixe un « corps » imprimable
(préfixe 'petik' + 0..3 alnum de bourrage), puis on résout les 3 premiers octets.
usage : nopvm-solve.py [--prefix petik] [--eol crlf|lf] [-q] [--check PASS]
"""
import argparse, itertools, struct
C, TARGET, M = 0x1337C0DE, 0x0A4F4CAB, 1 << 32
EOLS = {'crlf': b'\r\n', 'lf': b'\n'}

def vm_hash(buf: bytes) -> int:
    buf = buf + b'\0' * 4; eax = C; i = 0
    while True:
        ebx = struct.unpack('<I', buf[i:i+4])[0]; eax = (eax + ebx) % M; i += 1
        if ebx & 0xff == 0x0a: return eax

def solve(prefix: bytes, eol: bytes):
    pr = range(0x20, 0x7f)   # 0x20 (espace) indispensable : b2 = 0x20 est forcé
    alnum = b'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    for pad in itertools.chain.from_iterable(itertools.product(alnum, repeat=k) for k in range(0, 4)):
        body = prefix + bytes(pad)                        # octets 3.. du mot de passe
        rest = vm_hash(b'\0\0\0' + body + eol)            # contribution du corps + EOL
        r = (TARGET - rest) % M                           # à fournir par b0 + 0x101*b1 + 0x10101*b2
        for b2 in pr:
            r2 = r - 0x10101 * b2
            if r2 < 0: break
            b1, b0 = divmod(r2, 0x101)
            if 0x20 <= b1 < 0x7f and 0x20 <= b0 < 0x7f:
                pw = bytes([b0, b1, b2]) + body
                assert vm_hash(pw + eol) == TARGET
                return pw.decode()
    return None

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--prefix', default='petik'); ap.add_argument('--eol', choices=EOLS, default='crlf')
    ap.add_argument('-q', action='store_true'); ap.add_argument('--check')
    a = ap.parse_args(); eol = EOLS[a.eol]
    if a.check is not None:
        ok = vm_hash(a.check.encode() + eol) == TARGET; print('OK' if ok else 'KO'); raise SystemExit(not ok)
    pw = solve(a.prefix.encode(), eol)
    print(pw if a.q else f'mot de passe ({a.eol}) : {pw}')
