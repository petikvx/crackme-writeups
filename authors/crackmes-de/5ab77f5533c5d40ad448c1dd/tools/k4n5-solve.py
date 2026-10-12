#!/usr/bin/env python3
"""Keygen — keygenning4newbies_crackme_5 by analyst (crackmes.de, keyfile).

  python3 tools/k4n5-solve.py petik
  python3 tools/k4n5-solve.py --check petik
  python3 tools/k4n5-solve.py --write analysis/key.dat petik
"""
from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE = ROOT / "original" / "crackme.exe"
TMG = (0x54, 0x4D, 0x47)  # "TMG"
CODE_OFF = 0x5030
CODE_LEN = 383  # jusqu'au 0xFF sentinelle
PRODUCT = 0x2A8BF4


def plaintext(label: str) -> bytes:
    """Contenu déchiffré de key.dat : 'K4N <label>' (3 octets XOR shellcode = K4N)."""
    lab = label.encode("latin-1")
    if not lab or b" " in lab or b"\0" in lab:
        raise SystemExit("label: non vide, sans espace ni NUL")
    return b"K4N " + lab


def encrypt_keyfile(plain: bytes) -> bytes:
    """Inverse du déchiffrement @0x40115a..0x4011a6."""
    s = len(plain)
    if s < 4 or s > 0x100:
        raise SystemExit("key.dat: taille 4..256")
    if s % 3 == 0:
        # la boucle xor par triplets lit i,i+1,i+2 — taille multiple de 3 OK
        pass
    cpp = bytearray(plain)
    for i in range(3, s, 3):
        for j in range(3):
            if i + j < s:
                cpp[i + j] ^= plain[j]
    cp = bytearray(cpp)
    cp[0] ^= TMG[0]
    cp[1] ^= TMG[1]
    cp[2] ^= TMG[2]
    return bytes(b ^ s for b in cp)


def decrypt_keyfile(cipher: bytes) -> bytes:
    s = len(cipher)
    buf = bytearray(b ^ s for b in cipher)
    buf[0] ^= TMG[0]
    buf[1] ^= TMG[1]
    buf[2] ^= TMG[2]
    i = 3
    while i < s:
        buf[i] ^= buf[0]
        if i + 1 < s:
            buf[i + 1] ^= buf[1]
        if i + 2 < s:
            buf[i + 2] ^= buf[2]
        i += 3
    return bytes(buf)


def shellcode_product(xor_key3: bytes) -> int:
    blob = EXE.read_bytes()[CODE_OFF : CODE_OFF + CODE_LEN]
    dec0 = blob[0] ^ xor_key3[0]
    dec1 = blob[1] ^ xor_key3[1]
    dec2 = blob[2] ^ xor_key3[2]
    return dec0 * dec1 * dec2


def registered_message(label: str) -> str:
    """Message construit par le shellcode déchiffré @0x405030."""
    consts = [0x06, 0x0D, 0x0E, 0x0E, 0x1C, 0x54, 0x3E, 0x26, 0x28, 0x23, 0x7D, 0x20, 0x07, 0x53, 0x20]
    xors = [0x54, 0x68, 0x69, 0x67, 0x6F, 0x20, 0x5B, 0x54, 0x4D, 0x47, 0x5D, 0x54, 0x68, 0x69]
    name = bytearray(consts)
    for i, x in enumerate(xors):
        name[i] ^= x
    # name[14] reste 0x20 ; label collé à l'offset 0x0f
    return (bytes(name) + label.encode("latin-1")).decode("latin-1")


def keygen(label: str = "petik") -> bytes:
    return encrypt_keyfile(plaintext(label))


def check(label: str = "petik") -> None:
    plain = plaintext(label)
    cipher = encrypt_keyfile(plain)
    back = decrypt_keyfile(cipher)
    assert back == plain, (back, plain)
    assert plain[:3] == b"K4N"
    prod = shellcode_product(plain[:3])
    assert prod == PRODUCT, hex(prod)
    msg = registered_message(label)
    assert msg.startswith("Registered to:")
    print(f"OK  plain={plain!r}  cipher={cipher.hex()}  msg={msg!r}  product={hex(prod)}")


def main(argv: list[str]) -> None:
    args = argv[1:]
    write_path: Path | None = None
    do_check = False
    if args and args[0] == "--check":
        do_check = True
        args = args[1:]
    if args and args[0] == "--write":
        write_path = Path(args[1])
        args = args[2:]
    label = args[0] if args else "petik"
    if do_check:
        check(label)
        return
    blob = keygen(label)
    print(f"label={label!r}  key.dat hex={blob.hex()}  ({len(blob)} bytes)")
    print(f"plain={plaintext(label)!r}  → UI « {registered_message(label)} »")
    if write_path:
        write_path.write_bytes(blob)
        print(f"wrote {write_path}")


if __name__ == "__main__":
    main(sys.argv)
