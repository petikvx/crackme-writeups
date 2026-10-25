#!/usr/bin/env python3
"""Keygen pour memetic0 / Lattice-6 (lattice6, ELF64 Rust statique).

Le binaire contient une mini-VM (25 opcodes, programme de 808 slots chiffré par
splitmix64).  Le programme calcule  out = P·x + c  (mod 65537) avec x = SPN(serial),
P et c dérivés d'une éponge (blk) de (0xa1 || user || serial[0]).  La cible `out`
est fixe (16 constantes).  Ensuite le binaire fait un AEAD : le flag n'est déchiffré
que pour (user, serial) = (CrackMes1, serial valide)  -> l'user d'exemple `petik`
ne peut PAS produire de flag (voir README).

Usage :
  tools/lattice-solve.py                  # user CrackMes1, salt 0
  tools/lattice-solve.py --user petik     # serial valide pour la VM (out == cible), mais rejeté par l'AEAD
  tools/lattice-solve.py --check          # lance le vrai binaire (CLI) sur le résultat
  tools/lattice-solve.py -q               # n'affiche que le serial
"""
import argparse, os, struct, subprocess, sys, tempfile, zipfile, io

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, '..', 'original', 'lattice6-crackmes.zip')
M = (1 << 64) - 1
P = 65537
TARGET = [0x2eeb, 0xab4c, 0x38e, 0xd6d9, 0x11, 0xfa00, 0x56ce, 3, 0x1000, 0xea61, 0x4d, 0x7ab7, 0x320, 0x3039, 0xffff, 0x1092]
ALPHA = b'81LkD4RMhj9dvgeYZ30r62Hu/wCaofFmxiQXE+WKcl5sIUPSBbqJpnyNTGOtzV7A'
MIXM = bytes.fromhex('01010201010101020201010101020101')
TABLE_OFF, TABLE_N = 0x52553, 808     # slots chiffrés (VMA 0x452553)


def sm(x):  # splitmix64 finalizer (fn 0x40e353)
    x = (x + 0x9e3779b97f4a7c15) & M
    x = ((x ^ (x >> 30)) * 0xbf58476d1ce4e5b9) & M
    x = ((x ^ (x >> 27)) * 0x94d049bb133111eb) & M
    return x ^ (x >> 31)


def load_binary():
    with zipfile.ZipFile(ZIP) as z:
        try:
            return z.read('lattice6')
        except RuntimeError:
            return z.read('lattice6', pwd=b'crackmes.one')


def gmul(a, b):  # GF(2^8), poly 0x11d (fn 0x40e453)
    r = 0
    for _ in range(8):
        if b & 1: r ^= a
        hi = a & 0x80
        a = (a << 1) & 0xff
        if hi: a ^= 0x1d
        b >>= 1
    return r


def gpow254(a):
    r, x, e = 1, a, 0xfe
    while e:
        if e & 1: r = gmul(r, x)
        x = gmul(x, x); e >>= 1
    return r


def rol(x, n): return ((x << n) | (x >> (8 - n))) & 0xff


SB = [rol(b, 5) ^ rol(b, 2) ^ rol(b, 1) ^ 0xa5 for b in (gpow254(x) if x else 0 for x in range(256))]
ISB = [0] * 256
for i, v in enumerate(SB): ISB[v] = i


def mix4(w):
    return [gmul(MIXM[4*i], w[0]) ^ gmul(MIXM[4*i+1], w[1]) ^ gmul(MIXM[4*i+2], w[2]) ^ gmul(MIXM[4*i+3], w[3]) for i in range(4)]


def blk(b):  # fn 0x40e483 : 8 tours xor-clé / sbox / mix4 / rotation
    b = list(b); k = 0xa5
    for _ in range(8):
        k0 = k
        for i in range(32):
            b[i] ^= k; k = (k + 0x1d) & 0xff
        b = [SB[x] for x in b]
        for g in range(0, 32, 4): b[g:g+4] = mix4(b[g:g+4])
        b = b[1:] + b[:1]
        k = (k0 + 0xed) & 0xff
    return b


def mat_inv_gf256(m):
    n = len(m); a = [r[:] + [int(i == j) for j in range(n)] for i, r in enumerate(m)]
    for c in range(n):
        p = next(r for r in range(c, n) if a[r][c]); a[c], a[p] = a[p], a[c]
        iv = gpow254(a[c][c]); a[c] = [gmul(iv, v) for v in a[c]]
        for r in range(n):
            if r != c and a[r][c]:
                f = a[r][c]; a[r] = [v ^ gmul(f, w) for v, w in zip(a[r], a[c])]
    return [r[n:] for r in a]


MI = mat_inv_gf256([[MIXM[4*i+j] for j in range(4)] for i in range(4)])


def imix4(w):
    return [gmul(MI[i][0], w[0]) ^ gmul(MI[i][1], w[1]) ^ gmul(MI[i][2], w[2]) ^ gmul(MI[i][3], w[3]) for i in range(4)]


def mat_inv_mod(A):
    n = 16; a = [[v % P for v in r] + [int(i == j) for j in range(n)] for i, r in enumerate(A)]
    for c in range(n):
        p = next((r for r in range(c, n) if a[r][c]), None)
        if p is None: return None
        a[c], a[p] = a[p], a[c]
        iv = pow(a[c][c], P - 2, P); a[c] = [v * iv % P for v in a[c]]
        for r in range(n):
            if r != c and a[r][c]:
                f = a[r][c]; a[r] = [(v - f * w) % P for v, w in zip(a[r], a[c])]
    return [r[n:] for r in a]


def load_program(binary):
    """Déchiffre les 808 slots + inverse la permutation des opcodes (fn 0x407096)."""
    a = list(range(32)); s = 1; n = 32
    while n >= 2:
        s = sm(s); i = s % n; a[n-1], a[i] = a[i], a[n-1]; n -= 1
    perm = [0] * 32
    for i, v in enumerate(a): perm[v] = i
    st = 1; prog = []
    for i in range(TABLE_N):
        q = struct.unpack_from('<Q', binary, TABLE_OFF + 8*i)[0] ^ sm(((i * 0xd6e8fdb93a1c55e1) & M) ^ st)
        st = sm(((i * 0xa24baed496e3c17d) & M) ^ st ^ (q & 0xff))
        prog.append((perm[q & 0xff], (q >> 8) & 0xff, (q >> 16) & 0xff, (q >> 24) & 0xff, q >> 32))
    return prog


def run_vm(prog, user, serial33):
    mem = bytearray(0x2000); mem[0:len(user)] = user
    mem[0x40:0x44] = struct.pack('<I', len(user)); mem[0x50:0x71] = serial33
    R = [0] * 16; pc = 0
    for _ in range(0x1e8480):
        op, r, a, b, imm = prog[pc]; pc += 1
        if op == 0: return mem
        elif op == 1: R[r] = imm
        elif op == 2: R[r] = R[a]
        elif op == 3: R[r] = R[b] ^ R[a]
        elif op == 4: R[r] = (R[b] + R[a]) & M
        elif op == 5: R[r] = (R[a] - R[b]) & M
        elif op == 6: R[r] = R[b] & R[a]
        elif op == 7: R[r] = (R[b] * R[a]) & M
        elif op == 8: R[r] = mem[imm + R[a]]
        elif op == 9: mem[imm + R[r]] = R[a] & 0xff
        elif op == 10: R[r] = struct.unpack_from('<I', mem, imm + R[a])[0]
        elif op == 11: struct.pack_into('<I', mem, imm + R[r], R[a] & 0xffffffff)
        elif op == 12: R[r] = (imm + R[a]) & M
        elif op == 13: pc = imm
        elif op == 14:
            if R[r] == 0: pc = imm
        elif op == 15:
            if R[r] != 0: pc = imm
        elif op == 16: R[r] = int(R[a] == R[b])
        elif op == 17: R[r] = int(R[a] < R[b])
        elif op == 18: R[r] = SB[R[a] & 0xff]
        elif op == 19: p = R[r]; mem[p:p+4] = bytes(mix4(list(mem[p:p+4])))
        elif op == 20: p = R[r]; mem[p:p+32] = bytes(blk(mem[p:p+32]))
        elif op == 21: R[r] = (R[a] % P + R[b] % P) % P
        elif op == 22: R[r] = (R[a] % P - R[b] % P) % P
        elif op == 23: R[r] = (R[a] % P) * (R[b] % P) % P
        elif op == 24: R[r] %= P
    raise RuntimeError('trop de pas')


def words(mem, off): return [struct.unpack_from('<I', mem, off + 4*i)[0] for i in range(16)]


def solve(prog, user, salt):
    mem = run_vm(prog, user, bytes([salt]) + bytes(32))   # P, c, clés de tour ne dépendent que de (user, salt)
    key = mem[0xc0:0xc0 + 192]
    Pm = [words(mem, 0xa00 + 64*i) for i in range(16)]
    c = words(mem, 0xe00)
    Pi = mat_inv_mod(Pm)
    if Pi is None: return None
    d = [(t - ci) % P for t, ci in zip(TARGET, c)]
    x = [sum(Pi[i][j] * d[j] for j in range(16)) % P for i in range(16)]
    if any(v > 0xffff for v in x): return None
    b = []
    for v in x: b += [v >> 8, v & 0xff]
    for r in range(5, -1, -1):                  # inverse du SPN : perm, mix4⁻¹, sbox⁻¹, xor clé
        b = [b[(7*i + 3) & 31] for i in range(32)]
        for g in range(0, 32, 4): b[g:g+4] = imix4(b[g:g+4])
        b = [ISB[v] ^ key[32*r + i] for i, v in enumerate(b)]
    return bytes([salt]) + bytes(b)


def b64(s):
    out = ''
    for i in range(0, 33, 3):
        n = (s[i] << 16) | (s[i+1] << 8) | s[i+2]
        out += ''.join(chr(ALPHA[(n >> (18 - 6*k)) & 63]) for k in range(4))
    return out


def run_binary(binary, user, serial):
    with tempfile.TemporaryDirectory() as td:
        exe = os.path.join(td, 'lattice6'); open(exe, 'wb').write(binary); os.chmod(exe, 0o755)
        sf = os.path.join(td, 'serial.txt'); open(sf, 'w').write(serial)
        return subprocess.run([exe, user, sf], capture_output=True, text=True, timeout=20).stdout.strip()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--user', default='CrackMes1')
    ap.add_argument('--salt', type=int, default=0, help='1er octet du serial (0 pour CrackMes1)')
    ap.add_argument('--check', action='store_true', help='teste chaque salt sur le vrai binaire jusqu\'au flag')
    ap.add_argument('-q', action='store_true')
    a = ap.parse_args()
    binary = load_binary(); prog = load_program(binary); user = a.user.encode()
    salts = range(256) if a.check else [a.salt]
    for salt in salts:
        s = solve(prog, user, salt)
        if s is None: continue
        out = words(run_vm(prog, user, s), 0xe80)
        assert out == TARGET
        ser = b64(s)
        if a.check:
            res = run_binary(binary, a.user, ser)
            if res.startswith('CMO{'):
                print(ser if a.q else f'user={a.user} salt={salt} serial={ser}\n{res}'); return 0
        else:
            print(ser if a.q else f'user={a.user} salt={salt} serial={ser}  (VM out == cible)'); return 0
    print('aucun serial accepté par le binaire', file=sys.stderr); return 1


if __name__ == '__main__':
    sys.exit(main())
