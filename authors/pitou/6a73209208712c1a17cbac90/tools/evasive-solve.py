#!/usr/bin/env python3
"""Solveur — pitou's Evaisve / Evasive.exe (PE64 Fatpack).

1. Extraire la resource FPACK (.rsrc) → LZMA FORMAT_ALONE → PE interne
2. Rejouer le setup de main : 40× `mov dword [rbp+disp], imm`
   → tableau ; clé = tab[38] ; flag = chr(tab[i] ^ key) pour i in 0..37
3. Leurres : flag.txt « F12ag_i5_somehow_1_hidden_XD » (pas le vrai)

Usage :
  python3 evasive-solve.py
  python3 evasive-solve.py -q
  python3 evasive-solve.py --path ../original/Evasive.exe
"""

from __future__ import annotations

import argparse
import lzma
import struct
import sys
from pathlib import Path

DEFAULT = Path(__file__).resolve().parents[1] / "original" / "Evasive.exe"
DECOY = "F12ag_i5_somehow_1_hidden_XD"
FLAG = "IEEE{S031me_T1mes_We_h1s_t0_Su111ffer}"


def sections(d: bytes):
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    optsz = struct.unpack_from("<H", d, pe + 20)[0]
    imgbase = struct.unpack_from("<Q", d, pe + 24 + 24)[0]
    out = []
    for i in range(nsec):
        o = pe + 24 + optsz + i * 40
        vsz, va, rsz, praw = struct.unpack_from("<IIII", d, o + 8)
        out.append((va, max(vsz, rsz), praw))
    return imgbase, out


def va2off(d: bytes, va: int) -> int:
    imgbase, secs = sections(d)
    r = va - imgbase
    for sva, sz, praw in secs:
        if sva <= r < sva + sz:
            return praw + r - sva
    raise ValueError(f"RVA outside sections: {r:#x}")


def unpack(loader: bytes) -> bytes:
    # FPACK resource @ VA 0x1400060AC, size 0x849C
    blob = loader[va2off(loader, 0x1400060AC) :][:0x849C]
    if blob[:5] != b"\x5d\x00\x00\x10\x00":
        raise ValueError("unexpected LZMA properties on FPACK blob")
    expected = struct.unpack_from("<Q", blob, 5)[0]
    inner = lzma.LZMADecompressor(format=lzma.FORMAT_ALONE).decompress(blob)
    if inner[:2] != b"MZ" or len(inner) != expected:
        raise ValueError("bad inner PE after LZMA")
    return inner


def extract_flag(inner: bytes) -> str:
    # 40× mov dword [rbp+disp8], imm32 from 0x1400014A5 .. 0x1400015BD
    raw = inner[va2off(inner, 0x1400014A5) : va2off(inner, 0x1400015BD)]
    if len(raw) % 7:
        raise ValueError("unexpected instruction stream length")
    tab: dict[int, int] = {}
    for p in range(0, len(raw), 7):
        if raw[p : p + 2] != b"\xc7\x45":
            raise ValueError(f"unexpected insn at +{p:#x}: {raw[p:p+7].hex()}")
        disp = struct.unpack_from("<b", raw, p + 2)[0]
        imm = struct.unpack_from("<I", raw, p + 3)[0]
        idx, rem = divmod(disp + 0x20, 4)
        if rem or idx in tab:
            raise ValueError(f"bad disp/idx at +{p:#x}")
        tab[idx] = imm
    if sorted(tab) != list(range(40)):
        raise ValueError("incomplete dword table")
    key = tab[38]
    return "".join(chr(tab[i] ^ key) for i in range(38))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--path", type=Path, default=DEFAULT, help="path to Evasive.exe")
    ap.add_argument("-q", action="store_true", help="flag only")
    ap.add_argument("--check", action="store_true", help="verify against known flag")
    args = ap.parse_args()

    inner = unpack(args.path.read_bytes())
    fl = extract_flag(inner)

    if args.check:
        ok = fl == FLAG
        print(fl)
        print("OK" if ok else f"FAIL expected={FLAG!r}")
        return 0 if ok else 1

    if args.q:
        print(fl)
    else:
        print(f"inner_pe={len(inner)} bytes")
        print(f"decoy={DECOY}")
        print(f"flag={fl}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
