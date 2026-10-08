#!/usr/bin/env python3
"""Solveur — TrynaToBe6for6Def's My Second Crackme (Easy + Flag)

Seed .data 0x1337 + MBA ((mul*seed+add)>>16)&0xff + XOR linéaire SSE
→ password 14 octets. Flag affiché : CMO{<password>}.

Usage:
  python3 tools/my-second-crackme-solve.py -q
  python3 tools/my-second-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "My_Second_Crackme.exe"

# dword_140004000 — fichier offset 0x3000 (.data RVA 0x4000)
SEED_OFF = 0x3000
# cmp rax, 56252CAB5D734876h dans sub_140001440
TARGET_QWORD = 0x56252CAB5D734876
TARGET_LE = struct.pack("<Q", TARGET_QWORD)

# (mul, add) → ((mul * seed + add) >> 16) & 0xFF
# k[0..7] empilés par packuswb après psrld 10h (ordre eax, r11, ecx, edx, r8, r9, r10, esi)
K_MBA = [
    (0xC2A29A69, 0xD3DC167E),
    (0x8D6072DD, 0x961BAFAD),
    (0xCFDDDF21, 0xCD1DCF18),
    (0x0FFA0F0D, 0xAF5AAD71),
    (0xEF1C5E89, 0x20DA7756),
    (0x5AD7FE55, 0xAFE533D7),
    (0xC8333031, 0x69ACC4C4),
    (0x6BFE3E19, 0x391EB2E2),
]
# checks scalaires (p[4]^p[5], p[6]^p[5], p[4]^p[3], p[0], p[3]^p[2], p[1]^p[2])
KA = (0xD3DC57F9, 0xC21F1C8A, 0x83)
KB = (0x9B355305, 0x3EAD62FB, 0x0F)
KC = (0xEBA1483D, 0x0DAA96F5, 0xBC)
KD = (0x41C64E6D, 0x3039, 0x35)  # LCG glibc 1103515245*s+12345
KE = (0xEE067F11, 0xD6651C2C, 0x15)
KF = (0x807DBCB5, 0xA70427DF, 0x14)


def mba_byte(seed: int, mul: int, add: int) -> int:
    return (((mul * seed + add) & 0xFFFFFFFF) >> 16) & 0xFF


def password_from_seed(seed: int) -> str:
    k = [mba_byte(seed, m, a) for m, a in K_MBA]
    t = list(TARGET_LE)
    p = [0] * 14
    # p0 depuis le LCG ; p1 depuis le qword SSE (R0 = k0 ^ p0 ^ p1)
    p[0] = mba_byte(seed, KD[0], KD[1]) ^ KD[2]
    p[1] = k[0] ^ p[0] ^ t[0]
    p[2] = mba_byte(seed, KF[0], KF[1]) ^ p[1] ^ KF[2]
    p[3] = mba_byte(seed, KE[0], KE[1]) ^ p[2] ^ KE[2]
    p[4] = mba_byte(seed, KC[0], KC[1]) ^ p[3] ^ KC[2]
    p[5] = mba_byte(seed, KA[0], KA[1]) ^ p[4] ^ KA[2]
    p[6] = mba_byte(seed, KB[0], KB[1]) ^ p[5] ^ KB[2]
    # chaîne adjacente SSE sur p[6..13] (R2..R7, R1)
    p[7] = k[2] ^ p[6] ^ t[2]
    p[8] = k[3] ^ p[7] ^ t[3]
    p[9] = k[4] ^ p[8] ^ t[4]
    p[10] = k[5] ^ p[9] ^ t[5]
    p[11] = k[6] ^ p[10] ^ t[6]
    p[12] = k[1] ^ p[11] ^ t[1]
    p[13] = k[7] ^ p[12] ^ t[7]
    return bytes(p).decode("ascii")


def load_seed(data: bytes) -> int:
    if len(data) < SEED_OFF + 4:
        raise SystemExit("PE trop court pour dword_140004000")
    return struct.unpack_from("<I", data, SEED_OFF)[0]


def flag_for(pw: str) -> str:
    return f"CMO{{{pw}}}"


def run_bin(pw: str) -> subprocess.CompletedProcess[str]:
    cmd = [str(BIN)]
    if sys.platform != "win32":
        cmd = ["wine", str(BIN)]
    return subprocess.run(
        cmd,
        input=pw + "\n\n",
        capture_output=True,
        text=True,
        timeout=20,
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    blob = BIN.read_bytes()
    seed = load_seed(blob)
    pw = password_from_seed(seed)
    fl = flag_for(pw)
    if args.check:
        if TARGET_LE not in blob:
            print("FAIL: immédiat SSE introuvable dans le PE", file=sys.stderr)
            return 1
        if seed != 0x1337:
            print(f"FAIL: seed inattendu {seed:#x}", file=sys.stderr)
            return 1
        r = run_bin(pw)
        out = (r.stdout or "") + (r.stderr or "")
        print(out.strip())
        ok = "Yeaaaaa" in out and fl in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
    else:
        print(f"{pw}  # flag {fl}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
