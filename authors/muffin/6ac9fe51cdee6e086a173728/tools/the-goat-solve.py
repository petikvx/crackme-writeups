#!/usr/bin/env python3
"""muffin The Goat — FNV target, ChaCha20 flag, string decrypt.

Replays the *clean* path (anti-debug byte v10 == 0): MBA inverse → FNV
0x08ed4f07b58a0243 → name ``ye`` → HMAC-SHA256 → IETF ChaCha20 →
``flag{yeah you got it}``.

Hex-Rays invented nonce dword 0xEC1D8D93; the file has 0xEC1C4F93 at
VA 0x140025030. Always read the nonce from the PE.
"""
from __future__ import annotations

import argparse
import hashlib
import hmac
import struct
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parents[1] / "original" / "crackme.exe"
IMAGEBASE = 0x140000000

GOLDEN = 0x9E3779B97F4A7C15
FNV_OFF = 0xCBF29CE484222325
FNV_PRIME = 0x100000001B3
TAB = bytes.fromhex("9e3779b97f4a7c152ba10cd45e6c88f3")

MBA_MUL = 0x6164B99C58E8ABFD
MBA_XOR = 0x355AC876118344EB
MBA_TARGET = 0x09C7CAF8BC1DB9DC

# 32-byte blob v75 (NimMainModule stack), Hex-Rays immediates — verified.
V75 = bytes.fromhex(
    "bb54aac4b89dc868ba37d9cc21b2cece"
    "245d1ef853e39fc89f09b43ceb7e57a0"
)
V90 = bytes.fromhex("5e19fde90cf9b4838622421e57a12862")

ANSWER = "ye"
FLAG = b"flag{yeah you got it}"


def splitmix64(x: int) -> int:
    x = (x + GOLDEN) & 0xFFFFFFFFFFFFFFFF
    x ^= x >> 30
    x = x * 0xBF58476D1CE4E5B9 & 0xFFFFFFFFFFFFFFFF
    x ^= x >> 27
    x = x * 0x94D049BB133111EB & 0xFFFFFFFFFFFFFFFF
    return (x ^ (x >> 31)) & 0xFFFFFFFFFFFFFFFF


def goatcod(seed: int, idx: int) -> int:
    return (splitmix64(seed + idx) >> 56) & 0xFF


def fnv1a64(data: bytes) -> int:
    h = FNV_OFF
    for b in data:
        h = (h ^ b) * FNV_PRIME & 0xFFFFFFFFFFFFFFFF
    return h


def pe_sections(data: bytes) -> dict[str, tuple[int, int, int, int]]:
    """name -> (va, vsz, raw, rsz)."""
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    nsec = struct.unpack_from("<H", data, e_lfanew + 6)[0]
    opt = struct.unpack_from("<H", data, e_lfanew + 20)[0]
    off = e_lfanew + 24 + opt
    out = {}
    for i in range(nsec):
        rec = data[off + i * 40 : off + (i + 1) * 40]
        name = rec[0:8].split(b"\x00", 1)[0].decode("ascii", "replace")
        vsz, va, rsz, raw = struct.unpack_from("<IIII", rec, 8)
        out[name] = (IMAGEBASE + va, vsz, raw, rsz)
    return out


def va_to_off(secs: dict, va: int) -> int:
    for _name, (sva, vsz, raw, rsz) in secs.items():
        if sva <= va < sva + max(vsz, rsz):
            return raw + (va - sva)
    raise KeyError(hex(va))


def dec_str(payload: bytes, tag: int) -> bytes:
    out = bytearray()
    for i, b in enumerate(payload):
        out.append(
            ((7 * i + 90) ^ b ^ TAB[(5 * i + tag) & 0xF] ^ ((i * i + 51) & 0xFF))
            & 0xFF
        )
    return bytes(out)


def goat_xor(buf: bytes, seed: int, key: bytes, base_idx: int) -> bytes:
    out = bytearray(buf)
    for i in range(len(out)):
        out[i] ^= goatcod(seed, i + base_idx) ^ key[i & 0x1F]
    return bytes(out)


def target_fnv() -> int:
    need_x2 = MBA_TARGET ^ MBA_XOR
    return (need_x2 * pow(MBA_MUL, -1, 2**64)) & 0xFFFFFFFFFFFFFFFF


def chacha20_block(key: bytes, nonce: bytes, counter: int) -> bytes:
    def qr(s, a, b, c, d):
        s[a] = (s[a] + s[b]) & 0xFFFFFFFF
        s[d] ^= s[a]
        s[d] = ((s[d] << 16) | (s[d] >> 16)) & 0xFFFFFFFF
        s[c] = (s[c] + s[d]) & 0xFFFFFFFF
        s[b] ^= s[c]
        s[b] = ((s[b] << 12) | (s[b] >> 20)) & 0xFFFFFFFF
        s[a] = (s[a] + s[b]) & 0xFFFFFFFF
        s[d] ^= s[a]
        s[d] = ((s[d] << 8) | (s[d] >> 24)) & 0xFFFFFFFF
        s[c] = (s[c] + s[d]) & 0xFFFFFFFF
        s[b] ^= s[c]
        s[b] = ((s[b] << 7) | (s[b] >> 25)) & 0xFFFFFFFF

    const = b"expand 32-byte k"
    st = list(struct.unpack("<16I", const + key + struct.pack("<I", counter) + nonce))
    w = st[:]
    for _ in range(10):
        qr(w, 0, 4, 8, 12)
        qr(w, 1, 5, 9, 13)
        qr(w, 2, 6, 10, 14)
        qr(w, 3, 7, 11, 15)
        qr(w, 0, 5, 10, 15)
        qr(w, 1, 6, 11, 12)
        qr(w, 2, 7, 8, 13)
        qr(w, 3, 4, 9, 14)
    out = [(w[i] + st[i]) & 0xFFFFFFFF for i in range(16)]
    return struct.pack("<16I", *out)


def chacha20_xor(key: bytes, nonce: bytes, counter: int, data: bytes) -> bytes:
    out = bytearray(data)
    off = 0
    ctr = counter
    while off < len(out):
        block = chacha20_block(key, nonce, ctr)
        n = min(64, len(out) - off)
        for i in range(n):
            out[off + i] ^= block[i]
        off += n
        ctr += 1
    return bytes(out)


def derive_key(h: int) -> bytes:
    """sub_14000A790: HMAC-SHA256(HMAC-SHA256(v90, v75), le64(h)||sha256(v75)[:7]||0x01)."""
    inner = hmac.new(V90, V75, hashlib.sha256).digest()
    msg = h.to_bytes(8, "little") + hashlib.sha256(V75).digest()[:7] + b"\x01"
    return hmac.new(inner, msg, hashlib.sha256).digest()


def nim_payload(data: bytes, secs: dict, va: int, n: int) -> bytes:
    off = va_to_off(secs, va)
    return data[off + 8 : off + 8 + n]


def unseal(data: bytes, secs: dict) -> tuple[int, bytes]:
    va, vsz, raw, _rsz = secs[".goatsec"]
    gsec = data[raw : raw + vsz]
    seed = int.from_bytes(gsec[0:8], "little")
    key = bytes(gsec[8 + i] ^ goatcod(seed, i) for i in range(32))
    mac_st = int.from_bytes(gsec[40:48], "little")
    mac_ks = 0
    for i in range(8):
        mac_ks |= goatcod(seed, 40 + i) << (8 * i)
    if (mac_st ^ mac_ks) != fnv1a64(key):
        raise SystemExit("goatsec MAC mismatch")
    return seed, key


def decrypt_flag(data: bytes, secs: dict, seed: int, key: bytes, h: int) -> tuple[bytes, bytes, bytes, bytes]:
    ct_raw = data[va_to_off(secs, 0x140024FF0) : va_to_off(secs, 0x140024FF0) + 21]
    sh_raw = data[va_to_off(secs, 0x140025008) : va_to_off(secs, 0x140025008) + 32]
    nonce = data[va_to_off(secs, 0x140025028) : va_to_off(secs, 0x140025028) + 12]
    ct = goat_xor(ct_raw, seed, key, 64)
    expect = goat_xor(sh_raw, seed, key, 88)
    k = derive_key(h)
    pt = chacha20_xor(k, nonce, 0, ct)
    digest = hashlib.sha256(pt).digest()
    return pt, digest, expect, ct


def normalize(s: str) -> str:
    return " ".join(s.replace("\t", " ").replace("\r", " ").replace("\n", " ").split()).lower()


def main() -> int:
    ap = argparse.ArgumentParser(description="muffin The Goat solver")
    ap.add_argument("-q", action="store_true", help="flag only")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--name", default="", help="candidate artist (default: recovered ye)")
    args = ap.parse_args()

    data = EXE.read_bytes()
    secs = pe_sections(data)
    seed, key = unseal(data, secs)
    h = target_fnv()
    pt, digest, expect, ct = decrypt_flag(data, secs, seed, key, h)
    ok = digest == expect and pt == FLAG
    name_ok = fnv1a64(normalize(ANSWER).encode()) == h

    if args.name:
        nn = normalize(args.name)
        name_ok = fnv1a64(nn.encode()) == h

    if args.q:
        sys.stdout.write(pt.decode("ascii", "replace") + "\n")
        return 0 if ok else 1

    prompt = dec_str(nim_payload(data, secs, 0x140025090, 0x2C), 20) + dec_str(
        nim_payload(data, secs, 0x1400250D8, 9), 21
    )
    honeypot = dec_str(nim_payload(data, secs, 0x140025140, 0x2A), 22)

    print(f"goatsec seed  {seed:#018x}")
    print(f"rolling key   {key.hex()}")
    print(f"target FNV    {h:#018x}")
    print(f"answer        {ANSWER!r}  fnv_ok={name_ok}")
    print(f"prompt        {prompt!r}")
    print(f"honeypot      {honeypot!r}")
    print(f"flag ct       {ct.hex()}")
    print(f"flag pt       {pt!r}")
    print(f"sha256 match  {ok}")

    if args.check:
        nonce = data[va_to_off(secs, 0x140025028) : va_to_off(secs, 0x140025028) + 12]
        if nonce != bytes.fromhex("e1811b4cdab215dc934f1cec"):
            print("CHECK FAIL: nonce dword mismatch (Hex-Rays trap 0xEC1D8D93)")
            return 1
        if not ok:
            print("CHECK FAIL: sha256(flag) != expected")
            return 1
        if not name_ok:
            print("CHECK FAIL: FNV(ye) != MBA inverse")
            return 1
        dirty = h ^ GOLDEN
        if fnv1a64(b"kanye") == h or fnv1a64(b"kanye west") == h:
            print("CHECK FAIL: honeypot collided with clean target")
            return 1
        print(f"dirty FNV     {dirty:#018x}  (v10 set: hash ^= GOLDEN)")
        print("CHECK OK")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
