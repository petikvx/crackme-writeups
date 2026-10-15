#!/usr/bin/env python3
"""
arshi's LvArshu (Flag) — alias "TWO-RING VOW" (two_ring_vow.exe)
WIP — PAS ENCORE RESOLU. Voir analysis/NOTES.md pour l'etat complet.

Ce script reimplemente en Python les fonctions sub_140001780 /
sub_1400018D0 / sub_1400019A0 (pures, deterministes, ne dependent que de
l'index et de tables fixes en .rdata) extraites du decompile IDA
(analysis/two_ring_vow.exe.i64.c). Il recalcule les 15 octets de
reference candidats : "LvY0uArshu130(T" (a verifier -- voir NOTES.md,
le "(" final est suspect, peut-etre une erreur d'implementation).

Lit directement les octets de .rdata depuis le binaire via objdump (pas
besoin d'etat externe / pickle).

Usage :
    python3 tools/wip-emulate-sub1400019A0.py
"""
import re
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
EXE = HERE.parent / "original" / "extracted" / "two_ring_vow.exe"

M32 = 0xFFFFFFFF


def dump_rdata(start: int, stop: int) -> bytes:
    out = subprocess.run(
        ["objdump", "-s", f"--start-address={start:#x}", f"--stop-address={stop:#x}", str(EXE)],
        capture_output=True, text=True, check=True,
    ).stdout
    data = bytearray()
    for line in out.splitlines():
        m = re.match(r"^\s*([0-9a-f]+)\s+([0-9a-f ]+?)  ", line)
        if not m:
            continue
        hexpart = m.group(2).replace(" ", "")
        data += bytes.fromhex(hexpart)
    return bytes(data)


def rol32(x, n):
    x &= M32
    n &= 31
    return x if n == 0 else ((x << n) | (x >> (32 - n))) & M32


def rol8(x, n):
    x &= 0xFF
    n &= 7
    return x if n == 0 else ((x << n) | (x >> (8 - n))) & 0xFF


def BYTE(v, i):
    return (v >> (8 * i)) & 0xFF


def main():
    blob = dump_rdata(0x1400CA880, 0x1400CA9C0)

    def grab(addr, n, base=0x1400CA880):
        off = addr - base
        return blob[off:off + n]

    CA880 = grab(0x1400CA880, 128)
    CA900 = grab(0x1400CA900, 20)
    CA920 = grab(0x1400CA920, 48)
    CA960 = grab(0x1400CA960, 40)
    CA988 = grab(0x1400CA988, 16)
    CA998 = grab(0x1400CA998, 16)
    CA9A8 = grab(0x1400CA9A8, 24)

    def sub_140001780(a1, a2):
        t1 = CA880[12 * (a1 % 10) + (a2 + 3 * a1) % 12]
        t2 = CA960[(5 * a1 + 3 * a2) % 40]
        t3 = (40503 * a1) & M32
        t4 = (73244475 * a2) & M32
        t5 = CA900[(7 * a2 + 11 * a1 + 2) % 20]
        t6 = CA920[(7 * a1 + 5 * a2 + 1) % 48]
        inner = ((t1 << 24) ^ t2 ^ t3 ^ t4 ^ (t5 << 16) ^ (t6 << 8) ^ 0xE17A9C53) & M32
        rolled = rol32(inner, (a2 + 3 * a1) & M32)
        v2 = (rolled + 374761393 * a2 + 668265261) & M32
        b0, b1, b2, b3 = BYTE(v2, 0), BYTE(v2, 1), BYTE(v2, 2), BYTE(v2, 3)
        v3 = ((b1 ^ b2) | (b3 << 8)) & M32
        return (b3 ^ v2 ^ v3) & M32

    def sub_1400018D0(a1, a2):
        a2 &= M32
        for i in range(1024):
            v5 = sub_140001780(a1, i)
            v6 = (a1 + i) & 7
            if v6 == 3:
                a2 = (a2 * ((2 * v5 + 1) & M32)) & M32
                continue
            parity0 = ((a1 + i) & 4) == 0
            if parity0:
                if v6 == 1:
                    a2 = (a2 + v5 + a1) & M32
                elif v6 == 2:
                    shift = ((v5 & 0xFF) >> 1) + 1
                    a2 = (a2 & 0xFFFFFF00) | rol8(a2 & 0xFF, shift)
                else:
                    a2 = (a2 ^ v5) & M32
                continue
            if v6 == 5:
                a2 = (a2 & 0xFFFFFF00) | rol8(a2 & 0xFF, 4)
                continue
            if v6 == 6:
                shift = (~(a1 ^ v5)) & 7
                a2 = (a2 & 0xFFFFFF00) | rol8(a2 & 0xFF, shift)
                continue
            v7 = (a2 - v5) & M32
            v5mod = (v5 & 0xFFFFFF00) | rol8(v5 & 0xFF, 3)
            v8 = (a2 ^ v5mod) & M32
            a2 = v7
            if v6 == 4:
                a2 = v8
        return a2

    def sub_1400019A0(a1):
        v7 = (a1 - 1525552717) & M32
        v9 = ((37353 * a1) ^ 0x7A4D3C21) & M32
        v11, v2 = a1 + 3, a1 + 57
        v3, v4, v5, v6 = a1, 11 * a1, 13 * a1, 7 * a1
        base_idx = 12 * (a1 % 10)
        while v11 != v2:
            v15 = CA920[v4 % 48]; v4 += 3
            v18 = ((CA900[v5 % 20] << 16) ^ (v15 << 8)) & M32; v5 += 7
            v21 = (CA960[v6 % 40] ^ v18) & M32; v6 += 5
            idx = v3 % 12; v3 += 2
            v24 = rol32((v9 ^ ((CA880[base_idx + idx] << 24) & M32) ^ v21) & M32, v11)
            v11 += 9
            v9 = (v24 + v7) & M32
            v7 = (v7 + 521288629) & M32
        hibyte, byte1, byte2 = BYTE(v9, 3), BYTE(v9, 1), BYTE(v9, 2)
        mix = (hibyte ^ CA988[a1] ^ CA998[a1] ^ CA9A8[a1]) & 0xFF
        rotated = rol8(mix, (a1 % 7) + 1)
        inner2 = (byte1 ^ rotated) & 0xFF
        inner3 = (v9 + inner2) & M32
        final_byte = (byte2 ^ inner3) & 0xFF
        return sub_1400018D0(a1, final_byte) & 0xFF

    ref = [sub_1400019A0(j) for j in range(15)]
    print("octets :", ref)
    print("hex    :", [hex(x) for x in ref])
    print("texte  :", repr(bytes(ref).decode("latin1")))


if __name__ == "__main__":
    main()
