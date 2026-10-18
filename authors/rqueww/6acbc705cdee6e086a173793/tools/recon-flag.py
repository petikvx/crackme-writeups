#!/usr/bin/env python3
"""Recon : dérive la clé AES-256 à partir du hash cible (sans connaître le mot de passe)
et tente de déchiffrer le flag embarqué (39 octets)."""
import itertools, struct
from Crypto.Cipher import AES
M = (1 << 64) - 1
rol = lambda x, n: ((x << (n % 64)) | (x >> (64 - n % 64))) & M if n % 64 else x
A, B = 0x5851F42D4C957F2D, 0x14057B7EF767814F
K = [0x243F6A8885A308D3, 0x13198A2E03707344, 0xA4093822299F31D0, 0x082EFA98EC4E6C89]
v3 = 0x2A8FADFD62AD902E
v4, v5, v6, v11 = rol(v3, 21), (~v3) & M, v3 ^ 0x243F6A8885A308D3, v3
v7, v8, v9, v10 = 3, 13, 5, 0
def L(x): return (A * x + B) & M
idx = lambda i: K[(i - 3) & 3]            # &v447[v7] avec v447+3 == v450
for _ in range(4):
    v12 = rol(L(v11) ^ rol(idx(v7), v9), v8)
    v13 = rol(v3, v10); v14 = rol(v13, 17)
    v15 = ((v14 ^ v12) + 2 * (v12 & v14)) & M
    v16 = (~(v15 ^ v12)) & M
    v17 = rol(L(v5) ^ rol(K[(v7 - 2) & 3], v9), v8)
    v18 = v15 & v12 & v13
    v19 = rol(v3, (v10 + 1) & 0xff); v20 = rol(v19, 17)
    v21 = rol(L(v4) ^ rol(K[(v7 - 3) ^ 2], v9), v8)
    s = ((v20 ^ v17) + 2 * (v17 & v20)) & M
    n11 = (v16 - 2 * v18) & M
    n5 = ((~(s ^ v17)) - 2 * (s & v17 & v19)) & M
    v22 = rol(v3, (v10 + 2) & 0xff); v23 = rol(v22, 17)
    v24 = ((v23 ^ v21) + 2 * (v21 & v23)) & M
    v25 = (~(v24 ^ v21)) & M
    v26 = rol(L(v6) ^ rol(K[v7 & 3], v9), v8)
    v27 = 2 * (v24 & v21 & v22)
    v28 = rol(v3, (v10 + 3) & 0xff); v29 = rol(v28, 17)
    n4 = (v25 - v27) & M
    t = ((v29 ^ v26) + 2 * (v26 & v29)) & M
    n6 = ((~(t ^ v26)) - 2 * (t & v26 & v28)) & M
    v11, v5, v4, v6 = n11, n5, n4, n6
    v7 += 1; v10 += 9; v8 += 7; v9 += 11
regs = [v11, v5, v4, v6]
ct = (0x885C4BDA0C205A35DEF7FAFA62D556FC).to_bytes(16, 'little') + \
     (0x57AC14548AD8912D2B12E419DC617B76).to_bytes(16, 'little')
ct = ct[:31] + (0xDC74BDD2A2596257).to_bytes(8, 'little')
print('regs', [hex(r) for r in regs]); print('ct', ct.hex())
def keys():
    for order in itertools.permutations(range(4)):
        for f in range(4):
            def tr(q):
                return [q, rol(q, 32), int.from_bytes(q.to_bytes(8, 'little'), 'big'),
                        int.from_bytes(rol(q, 32).to_bytes(8, 'little'), 'big')][f]
            yield (order, f), b''.join(tr(regs[i]).to_bytes(8, 'little') for i in order)
for tag, key in keys():
    ecb = AES.new(key, AES.MODE_ECB)
    for ctr in range(2):
        pass
    # test: premier bloc = AES_k(ctr) ^ ct ; ctr inconnu -> déchiffrer ECB inverse de (ct0 ^ "CMO{...")
    # on n'a que 4 octets connus : on affiche le bloc ECB-inverse pour inspection
    dec = ecb.decrypt(ct[:16])
    if dec[:4] == b'CMO{' : print('ECB hit', tag)
    # CTR standard 0
    for iv in (bytes(16), (1).to_bytes(16, 'big'), (1).to_bytes(16, 'little')):
        ks = ecb.encrypt(iv)
        if bytes(a ^ b for a, b in zip(ks, ct))[:4] == b'CMO{':
            print('CTR hit', tag, iv.hex())

print('--- variante clé dwords inversés, ctr = A3E6117C4B92D85F || idx')
def rev4(b): return b''.join(b[i:i + 4][::-1] for i in range(0, len(b), 4))
for tag, key in keys():
    for kk in (key, rev4(key)):
        ecb = AES.new(kk, AES.MODE_ECB)
        out = b''
        for blk in range(3):
            ctr = bytes([0xA3, 0xE6, 0x11, 0x7C, 0x4B, 0x92, 0xD8, 0x5F, blk]) + bytes(7)
            out += bytes(a ^ b for a, b in zip(ecb.encrypt(ctr), ct[16 * blk:16 * blk + 16]))
        if out[:4] == b'CMO{':
            print('HIT', tag, kk == key, out[:39])
