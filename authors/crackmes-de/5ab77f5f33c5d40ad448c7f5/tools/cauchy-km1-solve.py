#!/usr/bin/env python3
"""Keygen for Cauchy's KeygenMe no.1 (crackmes.de / HTBTeam).

Unlock the 216-bit RSA backdoor with cmdline `-htbt!` (or the 1-byte patch
documented in the write-up), then name → serial via RC4/TEA + RSA.

Example:
  ./cauchy-km1-solve.py petik
  ./cauchy-km1-solve.py -q petik
"""
from __future__ import annotations

import argparse
import struct
import sys

# Easy moduli (XOR-0xFF blobs @ 0x40100e / 0x401142), unlocked by `-htbt!`
P1 = 240985366002918909296416009698659
Q1 = 283147134056496125206437154455851
N1 = P1 * Q1
P2 = 251238060053420001643239680117243
Q2 = 264091152450441115281854810400227
N2 = P2 * Q2
E = 0x10001
D2 = pow(E, -1, (P2 - 1) * (Q2 - 1))
ECX_MIX = 0x2014  # dword mix loop count


def bswap32(x: int) -> int:
    return int.from_bytes((x & 0xFFFFFFFF).to_bytes(4, "little"), "big")


def rol(x: int, n: int) -> int:
    n &= 31
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF


def ror(x: int, n: int) -> int:
    n &= 31
    return ((x >> n) | (x << (32 - n))) & 0xFFFFFFFF


def shl(x: int, n: int) -> int:
    n &= 31
    return (x << n) & 0xFFFFFFFF


def name_hash(name: bytes) -> int:
    buf = bytearray(name + b"\0" * 16)
    ebx = len(name)
    edx = 0
    esi = 0
    while True:
        eax = struct.unpack_from("<I", buf, esi)[0]
        for _ in range(ebx):
            eax ^= 0x54425448
            eax = (eax - 0x5F726334) & 0xFFFFFFFF
            eax = rol(eax, 5)
            eax = shl(eax, 6)
            eax ^= 0x58769437
            eax = bswap32(eax)
            eax = (eax + 0x14867349) & 0xFFFFFFFF
        edx = (edx + eax) & 0xFFFFFFFF
        esi += 4
        if buf[esi] == 0:
            break
    return edx


def rc4_custom_ksa(key: bytes) -> list[int]:
    eax = 0xFFFEFDFC
    base = bytearray(4 + 256 + 8)
    for ecx in range(0x40, 0, -1):
        struct.pack_into("<I", base, ecx * 4, eax)
        eax = (eax - 0x04040404) & 0xFFFFFFFF
    S = list(base[4:260])
    eax = 0
    ebx = 0
    keylen = len(key)
    esi = keylen
    cl = 0
    first = True
    while True:
        if not first:
            ebx = (ebx + 1) & 0xFF
            esi -= 1
            if esi == 0:
                ebx = 0
                esi = keylen
        first = False
        dl = S[cl]
        al = (eax + key[ebx] + dl) & 0xFF
        S[cl], S[al] = S[al], S[cl]
        eax = al
        cl = (cl + 1) & 0xFF
        if cl == 0:
            break
    return S


def rc4_crypt(S: list[int], data: bytes) -> bytes:
    S = S[:]
    out = bytearray(data)
    eax = 0
    ebx = 0
    for i in range(len(out)):
        ebx = (ebx + 1) & 0xFF
        dl = S[ebx]
        eax = (eax + dl) & 0xFF
        S[ebx], S[eax] = S[eax], S[ebx]
        out[i] ^= S[(S[ebx] + S[eax]) & 0xFF]
    return bytes(out)


def tea_encrypt_block(v0: int, v1: int, k: list[int]) -> tuple[int, int]:
    s = 0
    for _ in range(32):
        s = (s + 0x9E3779B9) & 0xFFFFFFFF
        v0 = (v0 + ((((v1 << 4) + k[0]) ^ (v1 + s) ^ ((v1 >> 5) + k[1])) & 0xFFFFFFFF)) & 0xFFFFFFFF
        v1 = (v1 + ((((v0 << 4) + k[2]) ^ (v0 + s) ^ ((v0 >> 5) + k[3])) & 0xFFFFFFFF)) & 0xFFFFFFFF
    return v0, v1


def tea_decrypt_block(v0: int, v1: int, k: list[int]) -> tuple[int, int]:
    s = (0x9E3779B9 * 32) & 0xFFFFFFFF
    for _ in range(32):
        v1 = (v1 - ((((v0 << 4) + k[2]) ^ (v0 + s) ^ ((v0 >> 5) + k[3])) & 0xFFFFFFFF)) & 0xFFFFFFFF
        v0 = (v0 - ((((v1 << 4) + k[0]) ^ (v1 + s) ^ ((v1 >> 5) + k[1])) & 0xFFFFFFFF)) & 0xFFFFFFFF
        s = (s - 0x9E3779B9) & 0xFFFFFFFF
    return v0, v1


def mix_once_inv(eax: int) -> int:
    eax = (eax - 0x6C65676F) & 0xFFFFFFFF
    eax = bswap32(eax)
    eax ^= 0x6B4B4154
    eax = ror(eax, 0x65)
    eax = (eax - 0x4B776173) & 0xFFFFFFFF
    eax = bswap32(eax)
    eax = rol(eax, 0x72)
    eax ^= 0x68617565
    eax = bswap32(eax)
    eax ^= 0x64766564
    eax = (eax + 0x313378) & 0xFFFFFFFF
    eax = ror(eax, 5)
    eax = (eax + 0x68745541) & 0xFFFFFFFF
    eax ^= 0x15678448
    return eax


def mix_once_fwd(eax: int) -> int:
    eax ^= 0x15678448
    eax = (eax - 0x68745541) & 0xFFFFFFFF
    eax = rol(eax, 5)
    eax = (eax - 0x313378) & 0xFFFFFFFF
    eax ^= 0x64766564
    eax = bswap32(eax)
    eax ^= 0x68617565
    eax = ror(eax, 0x72)
    eax = bswap32(eax)
    eax = (eax + 0x4B776173) & 0xFFFFFFFF
    eax = rol(eax, 0x65)
    eax ^= 0x6B4B4154
    eax = bswap32(eax)
    eax = (eax + 0x6C65676F) & 0xFFFFFFFF
    return eax


def name_side(name: bytes) -> tuple[int, int]:
    """Return (tea_seed, C) with C = M^e mod N1."""
    H = name_hash(name)
    S = rc4_custom_ksa(struct.pack("<I", H))
    enc = bytearray(rc4_crypt(S, name) + b"\0" * 16)
    edx = 0
    esi = 0
    while True:
        eax = struct.unpack_from("<I", enc, esi)[0]
        if eax == 0:
            break
        eax ^= 0x54425448
        eax = (eax - 0x31323334) & 0xFFFFFFFF
        eax = rol(eax, 5)
        eax = shl(eax, 0x43)
        eax = (eax + 0x37946281) & 0xFFFFFFFF
        eax ^= 0x6D616554
        eax = ror(eax, 0x34)
        edx = (edx + eax) & 0xFFFFFFFF
        esi += 4
    tea_seed = edx
    esi = 0
    while enc[esi] != 0:
        v = (struct.unpack_from("<I", enc, esi)[0] + edx) & 0xFFFFFFFF
        struct.pack_into("<I", enc, esi, v)
        esi += 4
    raw = bytes(enc[: len(name)])
    M = int(raw.hex().upper(), 16)
    C = pow(M, E, N1)
    return tea_seed, C


def tea_key(seed: int) -> list[int]:
    k0 = seed
    k1 = (k0 * 2) & 0xFFFFFFFF
    k2 = k1 ^ 0x12345678
    k3 = (k2 - 0x7465616D) & 0xFFFFFFFF
    return [k0, k1, k2, k3]


def reverse_serial(M2: int, tea_seed: int) -> bytes:
    k = tea_key(tea_seed)
    hx = format(M2, "X")
    if len(hx) % 2:
        hx = "0" + hx
    buf = bytearray(bytes.fromhex(hx))
    padn = (8 - len(buf) % 8) % 8
    buf += b"\0" * padn
    for i in range(0, len(buf) - 7, 8):
        v0, v1 = struct.unpack_from("<2I", buf, i)
        v0, v1 = tea_decrypt_block(v0, v1, k)
        struct.pack_into("<2I", buf, i, v0, v1)
    tmp = bytearray(buf)
    if len(tmp) % 4:
        tmp += b"\0" * (4 - len(tmp) % 4)
    tmp += b"\0" * 4
    esi = 0
    while True:
        eax = struct.unpack_from("<I", tmp, esi)[0]
        if eax == 0:
            break
        for _ in range(ECX_MIX):
            eax = mix_once_inv(eax)
        struct.pack_into("<I", tmp, esi, eax)
        esi += 4
    buf = tmp
    for i in range(0, len(buf) - 7, 8):
        v0, v1 = struct.unpack_from("<2I", buf, i)
        v0, v1 = tea_decrypt_block(v0, v1, k)
        struct.pack_into("<2I", buf, i, v0, v1)
    while buf and buf[-1] == 0:
        buf.pop()
    return bytes(buf)


def tea_enc_all(buf: bytes, k: list[int]) -> bytearray:
    out = bytearray(buf)
    if len(out) % 8:
        out += b"\0" * (8 - len(out) % 8)
    i = 0
    while i < len(out) and out[i] != 0:
        chunk = out[i : i + 8]
        if len(chunk) < 8:
            chunk = chunk + b"\0" * (8 - len(chunk))
        v0, v1 = struct.unpack("<2I", chunk)
        v0, v1 = tea_encrypt_block(v0, v1, k)
        packed = struct.pack("<2I", v0, v1)
        for j in range(min(8, len(out) - i)):
            out[i + j] = packed[j]
        i += 8
    return out


def mix_fwd_all(buf: bytes) -> bytearray:
    out = bytearray(buf)
    if len(out) % 4:
        out += b"\0" * (4 - len(out) % 4)
    out += b"\0" * 4
    esi = 0
    while True:
        eax = struct.unpack_from("<I", out, esi)[0]
        if eax == 0:
            break
        for _ in range(ECX_MIX):
            eax = mix_once_fwd(eax)
        struct.pack_into("<I", out, esi, eax)
        esi += 4
    return out


def keygen(name: str) -> str:
    nb = name.encode("latin1")
    if not nb:
        raise ValueError("empty name")
    tea_seed, C = name_side(nb)
    M2 = pow(C, D2, N2)
    serial_bin = reverse_serial(M2, tea_seed)
    # round-trip check
    k = tea_key(tea_seed)
    fwd = tea_enc_all(serial_bin, k)
    fwd = mix_fwd_all(fwd)
    fwd = tea_enc_all(fwd, k)
    sl = fwd.find(b"\0")
    if sl < 0:
        sl = len(fwd)
    M2b = int(fwd[:sl].hex().upper(), 16)
    if pow(M2b, E, N2) != C:
        raise RuntimeError("keygen self-check failed")
    return serial_bin.hex().upper()


def main() -> int:
    ap = argparse.ArgumentParser(description="Cauchy KeygenMe #1 keygen")
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true", help="serial only")
    ap.add_argument("--check", action="store_true", help="self-check RSA equality")
    args = ap.parse_args()
    serial = keygen(args.name)
    if args.q:
        print(serial)
    else:
        print(f"name   : {args.name}")
        print(f"serial : {serial}")
        print("run with: cauchy_km1.exe -htbt!   (easy 216-bit RSA)")
        if args.check:
            tea_seed, C = name_side(args.name.encode("latin1"))
            print(f"check  : C={C}")
            print(f"unlock : -htbt!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
