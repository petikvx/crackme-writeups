#!/usr/bin/env python3
"""HyperCrackMe6 (TheHyper) — keygen.

Le serial est lu dans le PRESSE-PAPIERS (CF_TEXT) au lancement : format XXXX-XXXX-XXXX-XXXX-XXXX (24 car.).
  g0..g4 = les 5 groupes lus comme DWORD little-endian
  seed   = ((g0 % 0xffff + g1 % 0xffff + g2 % 0xffff) % 0xffff) // 0xff   -> srand(seed)
  buf[i] = rand() % 26 + 0x20  (i < 39, rand MSVC)
  buf[0:4] ^= g3 ; buf[4:8] ^= g4 ; buf[8:] = "ker!"
  conditions : buf[0] == 'G', buf[7] == 'c',
               v = 0 ; pour i in 1..6 : v = ((v + (buf[i] << 6)) ^ K) ; v == 0xd780
  K = 0xb033a146 : accumulateur des checksums de code des couches déchiffrées + PEB.BeingDebugged (=0)
      (constant : relevé par émulation, indépendant des adresses d'API).
Succès : MessageBox(buf) avec le titre « HyperCrackMe6 <TheHyper> ».

  python3 tools/hypercrackme6-solve.py [PREFIXE] [--n 3] [--seed 1]
"""
import argparse, random, string

K = 0xb033a146
ALNUM = (string.ascii_letters + string.digits).encode()

class MsRand:
    def __init__(self, s): self.s = s & 0xffffffff
    def __call__(self):
        self.s = (self.s * 0x343fd + 0x269ec3) & 0xffffffff
        return (self.s >> 16) & 0x7fff

def dw(b): return int.from_bytes(b, "little")

def check(serial: bytes):
    if len(serial) != 24 or any(serial[i] != 0x2d for i in (4, 9, 14, 19)): return None
    g = [serial[i:i + 4] for i in (0, 5, 10, 15, 20)]
    seed = ((dw(g[0]) % 0xffff + dw(g[1]) % 0xffff + dw(g[2]) % 0xffff) % 0xffff) // 0xff
    r = MsRand(seed); buf = bytearray(r() % 26 + 0x20 for _ in range(39))
    for i in range(4): buf[i] ^= g[3][i]; buf[4 + i] ^= g[4][i]
    buf[8:12] = b"ker!"
    if buf[0] != 0x47 or buf[7] != 0x63: return None
    v = 0
    for c in buf[1:7]: v = ((v + (c << 6)) & 0xffffffff) ^ K
    return bytes(buf[:12]) if v == 0xd780 else None

def keygen(prefix=b"PETI-KPET-IKPE", rng=random):
    assert len(prefix) == 14
    g = [prefix[0:4], prefix[5:9], prefix[10:14]]
    seed = ((dw(g[0]) % 0xffff + dw(g[1]) % 0xffff + dw(g[2]) % 0xffff) % 0xffff) // 0xff
    r = MsRand(seed); rr = [r() % 26 + 0x20 for _ in range(8)]
    s0, s7 = rr[0] ^ 0x47, rr[7] ^ 0x63
    if s0 not in ALNUM or s7 not in ALNUM: return None
    for _ in range(3_000_000):
        mid = bytes(rng.choice(ALNUM) for _ in range(6))
        s = prefix + b"-" + bytes([s0]) + mid[:3] + b"-" + mid[3:] + bytes([s7])
        if check(s): return s
    return None

if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("prefix", nargs="?", default="PETI-KPET-IKPE")
    ap.add_argument("--n", type=int, default=1); ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--check"); a = ap.parse_args()
    if a.check:
        m = check(a.check.encode()); print("VALIDE" if m else "INVALIDE", m or ""); raise SystemExit(0 if m else 1)
    rng = random.Random(a.seed)
    for _ in range(a.n):
        s = keygen(a.prefix.encode(), rng)
        if not s: raise SystemExit("préfixe inutilisable (caractère forcé non alphanumérique) : en essayer un autre")
        print(s.decode(), "->", check(s))
