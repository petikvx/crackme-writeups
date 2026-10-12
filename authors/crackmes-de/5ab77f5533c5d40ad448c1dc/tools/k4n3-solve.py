#!/usr/bin/env python3
"""Keygen — keygenning4newbies_crackme_3 by analyst (crackmes.de, MSVC).

  python3 tools/k4n3-solve.py petik
  python3 tools/k4n3-solve.py --check petik
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "k4n3.exe"
DATA = EXE.read_bytes()
TABLE = list(struct.unpack_from("<16I", DATA, 0x5030))
ALPH = b"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
SUFFIX = b" is a whore."
EXPECTED = DATA[0x5114 : 0x5114 + 18]


def _i32(x: int) -> int:
    x &= 0xFFFFFFFF
    return x if x < 0x80000000 else x - 0x100000000


def _le_u32(buf: bytes | bytearray, off: int) -> int:
    b = bytes(buf[off : off + 4])
    if len(b) < 4:
        b = b + b"\0" * (4 - len(b))
    return struct.unpack("<I", b)[0]


def hash_name(name: bytes) -> int:
    buf = bytearray(name + SUFFIX + b"\0" * 80)
    ebx = struct.unpack("<I", b"eheh")[0]
    edi = 0
    for i in range(16):
        eax = _le_u32(buf, i * 4)
        eax = (eax + (TABLE[i] ^ edi)) & 0xFFFFFFFF
        eax = ((eax << 7) | (eax >> 25)) & 0xFFFFFFFF
        ebx ^= eax
        edi += 1
    return ebx


def stream_from_hash(h: int) -> bytes:
    out = bytearray()
    for _ in range(18):
        out.append(ALPH[h % 26])
        x = (h << 3) & 0xFFFFFFFF
        sq = _i32(x) * _i32(x)
        h = ((sq & 0xFFFFFFFF) + ((sq >> 32) & 0xFFFFFFFF)) & 0xFFFFFFFF
    return bytes(out)


def keygen(name: str) -> str:
    nb = name.encode("latin-1")
    if not (1 <= len(nb) <= 64):
        raise SystemExit("name: 1..64 chars")
    stream = stream_from_hash(hash_name(nb))
    serial = bytes((stream[i] ^ i ^ EXPECTED[i]) + 0x30 for i in range(18))
    return serial.decode("latin-1")


def check_python(name: str, serial: str) -> bool:
    if len(serial) != 18:
        return False
    # length gate: (len*3)<<2 + 0xCD == 0x1A5 → len==18
    stream = bytearray(stream_from_hash(hash_name(name.encode("latin-1"))))
    for i, ch in enumerate(serial.encode("latin-1")):
        if ch < 0x30:
            return False
        stream[i] ^= ch - 0x30
    for i in range(18):
        stream[i] ^= i
    return bytes(stream) == EXPECTED


def emulate_hash(name: str) -> int:
    """Unicorn: vrai 0x401080 sur un buffer name (suffixe ajouté par le binaire)."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EAX

    pe = pefile.PE(str(EXE))
    base = pe.OPTIONAL_HEADER.ImageBase
    img = pe.get_memory_mapped_image()
    size = (len(img) + 0xFFF) & ~0xFFF
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, size)
    mu.mem_write(base, img)
    mu.mem_map(0x100000, 0x20000)
    mu.mem_write(0x101000, name.encode("latin-1") + b"\0" * 128)
    mu.mem_write(0x10F000, struct.pack("<II", 0xDEAD0000, 0x101000))
    mu.reg_write(UC_X86_REG_ESP, 0x10F000)
    mu.emu_start(0x401080, 0xDEAD0000, count=200000)
    return mu.reg_read(UC_X86_REG_EAX) & 0xFFFFFFFF


def main(argv: list[str]) -> None:
    args = argv[1:]
    do_check = False
    if args and args[0] == "--check":
        do_check = True
        args = args[1:]
    name = args[0] if args else "petik"
    serial = keygen(name)
    # print latin-1 safely
    sys.stdout.buffer.write(serial.encode("latin-1") + b"\n")
    if do_check:
        assert check_python(name, serial), "python check failed"
        h_py = hash_name(name.encode("latin-1"))
        h_emu = emulate_hash(name)
        print(f"--check hash python={h_py:#x} unicorn={h_emu:#x}", file=sys.stderr)
        assert h_py == h_emu, (h_py, h_emu)
        assert not check_python(name, "0" * 18)
        print("OK", file=sys.stderr)


if __name__ == "__main__":
    main(sys.argv)
