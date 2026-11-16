#!/usr/bin/env python3
"""hellgate1 (liboxin) — solveur : 16 octets (32 hex) qui « ferment la trace ».

Le crackme n'a pas de login : l'entrée est directement le bloc de 16 octets.
Le prédicat (mini-VM, 9 rounds) est inversible : on part de la cible
C11 ^ C14 et on remonte les 9 rounds (cf. README.md).

Usage :
  python3 hellgate-solve.py            # imprime la réponse
  python3 hellgate-solve.py -q         # réponse seule
  python3 hellgate-solve.py --check [chemin/hellgate.exe]   # preuve Wine (xvfb-run)
"""
import argparse, shutil, struct, subprocess, sys

M32 = 0xFFFFFFFF
# Tables dumpées depuis la VM (tools/hellgate-emu.py) — constantes, indépendantes de l'entrée.
RK = bytes.fromhex("981d54dfad190cea49b87597140d54936aef76a10a6865d2d37b6b0793994a6c7f1e17f5fd6b7dbb9baef6d74a8064e3ea60f4b17109798a2a6a46a1a972d2b42b89c5fe1b90260ea9bd9df6c023e67a79557d1d6c7a5630653396210354b5d28df427335e52268af1162dc2bb39e63c6f1fcc247a44176bfdbf8934f385acce56a7766755067afb4a847c73bfa72a28")
K9 = bytes.fromhex("acc8d30f11105096c8e24e55f6c49e43eb50a82f75ed3602ee7fa776dd3452d80dea7747b4628d8a1d4992bf2f1332fe2428b133ec9883ea5afc4024c3b19e6dca29a8b38fddd777fdda55d523022fa91f834d557e6b73d280fd9c347a5e746661f125c2e5879cbb6c7c136010e9e2269e4daa4f00cb14b1f9583240f42fff534ffd3da75d44eda357bfb88d08c96b5c")
C11 = bytes.fromhex("e257808994ce12f38edfaa12fc817d23")
C14 = bytes.fromhex("26c9642ce30e664d9c9cb4fdaa5474ef")
SBOX = bytes.fromhex("78c481c8c15e1f2e655d52bc35990ce587d483b68c4bfe45710097a2622a0386a6bb6acc493fef75c570443923403882f71a368f02db4a15f92fb10ebaa15b57560fa8851259fdb2e36d4684cae01824ac30e6aaf5f6e8add3b966b341322c90dd956826f47ec6d5af915fd9de0b969ea56748318bcdb0b4be2dae1b2527ee8008df1c549ca9b8ec58777de7d2f3b705d1a3c95a7369013db57be9989b8817478dda298a554c64a79ffc61a0040d2b511928f879ce34fffaa421074e6f229aab53d0d6fb8e6316e2608974e1503b3cbfc06ebdd76b20c3f14d7feb111309f237cb1d7c4fe43e760a93dc42944306c714c21e7a72ead810ed9d5cf06c333acf92")
ROT = (13, 7, 17, 3)
MUL = (0xCBA5CA77, 0xA6F982F3, 0xC96079B1, 0x7D74B79F)  # impairs -> inversibles mod 2^32
ISBOX = bytes(SBOX.index(i) for i in range(256))


def rol(x, n): return ((x << n) | (x >> (32 - n))) & M32
def ror(x, n): return rol(x, 32 - n)
def u32(b, o): return struct.unpack_from("<I", b, o)[0]


def forward(block: bytes) -> bytes:
    w = list(struct.unpack("<4I", block))
    for k in range(9):
        for i in range(4):
            w[i] ^= u32(RK, 16 * k + 4 * i)
            w[i] = sum(SBOX[((w[i] >> 8 * j) & 0xFF) ^ K9[16 * k + 4 * i + j]] << 8 * j for j in range(4))
        w[0] = (w[0] + w[1]) & M32
        w[1] = (w[1] + w[2]) & M32
        w[2] = (w[2] + w[3]) & M32
        w[3] = (w[3] + w[0]) & M32
        w = [(rol(w[i], ROT[i]) * MUL[i]) & M32 for i in range(4)]
    return struct.pack("<4I", *w)


def inverse(target: bytes) -> bytes:
    w = list(struct.unpack("<4I", target))
    for k in range(8, -1, -1):
        w = [ror((w[i] * pow(MUL[i], -1, 1 << 32)) & M32, ROT[i]) for i in range(4)]
        a0, a1, a2, a3 = w
        w3 = (a3 - a0) & M32
        w2 = (a2 - w3) & M32
        w1 = (a1 - w2) & M32
        w0 = (a0 - w1) & M32
        w = [w0, w1, w2, w3]
        for i in range(4):
            v = sum((ISBOX[(w[i] >> 8 * j) & 0xFF] ^ K9[16 * k + 4 * i + j]) << 8 * j for j in range(4))
            w[i] = v ^ u32(RK, 16 * k + 4 * i)
    return struct.pack("<4I", *w)


def solve() -> str:
    target = bytes(a ^ b for a, b in zip(C11, C14))
    block = inverse(target)
    assert forward(block) == target
    return block.hex()


def check(exe: str, ans: str) -> int:
    runner = ["xvfb-run", "-a", "wine"] if shutil.which("xvfb-run") else ["wine"]
    for label, inp in (("OK", ans), ("KO", "00112233445566778899aabbccddeeff")):
        out = subprocess.run(runner + [exe], input=inp + "\n", capture_output=True, text=True, timeout=120).stdout
        print(f"[{label}] {inp}\n{out.strip()}\n")
    return 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="original/hellgate.exe", metavar="EXE",
                    help="rejoue sous Wine (exe extrait du ZIP, ex. analysis/extracted/hellgate.exe)")
    a = ap.parse_args()
    ans = solve()
    if a.q:
        print(ans)
    else:
        print(f"input (32 hex) : {ans}")
    if a.check:
        sys.exit(check(a.check, ans))
