#!/usr/bin/env python3
"""httpd (FreeBSD/Go backdoor ICMP) : retrouve la clé AES (= IV) et déchiffre le flag.

Usage : httpd-solve.py [-q] [--ttl N ...]  (pas de user : pas de 'petik' ici)
"""
import struct, sys, argparse
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

CT = struct.pack('<4Q', 0xc07edfb429a5f151, 0xb34e3d248f2f3b2a,
                 0x8cdd9c0bcfb0ed5a, 0x0c64c43e9b0ee6cd)
PAYLOAD = bytes.fromhex('c6de5fe5')   # ICMP data (cmp dword [pkt+0x2a])
ID = bytes.fromhex('3713')            # cmp word [pkt+0x26] == 0x1337 (LE)

def key_from(frag, ttl, proto, ck):
    """ck = 2 octets du checksum ICMP tels que sur le fil (pkt[0x24:0x26])."""
    w24 = ck
    d2a = PAYLOAD
    lo = struct.unpack('<H', d2a[0:2])[0]; hi = struct.unpack('<H', d2a[2:4])[0]
    w = struct.unpack('<H', w24)[0]
    rol8 = lambda x: ((x << 8) | (x >> 8)) & 0xffff
    k0 = rol8(hi ^ w)
    k14 = rol8(w ^ lo)
    return (struct.pack('<H', k0) + frag + bytes([ttl, proto]) + w24 + d2a
            + ID + struct.pack('<H', k14))

def dec(k):
    d = Cipher(algorithms.AES(k), modes.CBC(k)).decryptor()
    return d.update(CT) + d.finalize()

def icmp_ck(seq):
    s = 0x0800 + 0x3713 + seq + 0xc6de + 0x5fe5
    while s >> 16: s = (s & 0xffff) + (s >> 16)
    return (~s) & 0xffff

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--ttl', type=int, nargs='*', default=[64, 128, 255, 63, 32])
    a = ap.parse_args()
    for frag in (b'\x40\x00', b'\x00\x00'):
        for ttl in a.ttl:
            for seq in range(65536):
                ck = struct.pack('>H', icmp_ck(seq))
                k = key_from(frag, ttl, 1, ck)
                p = dec(k)
                if p.startswith(b'CMO{') or all(32 <= c < 127 for c in p):
                    if a.q: print(p.decode())
                    else:
                        print(f'frag={frag.hex()} ttl={ttl} seq={seq} key={k.hex()}\nflag: {p.decode()}')
                    return 0
    return 1
sys.exit(main())
