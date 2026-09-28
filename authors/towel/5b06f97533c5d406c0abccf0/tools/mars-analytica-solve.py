#!/usr/bin/env python3
"""Citizen ID de Mars Analytica (Towel, NSEC 2018).

VM aplatie, 19 octets imprimables (33..126). Le prédicat tient en 17
égalités ; ce script les résout. ``--check`` rejoue l'ID sur le binaire
packé d'origine.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "original" / "MarsAnalytica"
LO, HI = 33, 126


def _in(v: int) -> bool:
    return LO <= v <= HI


def solve() -> str:
    sols: list[bytes] = []
    # 15049 = 101 * 149. Seul 101 tient dans un octet du jeu.
    s16 = 101
    for s13 in range(LO, HI + 1):
        s5 = 149 - s13
        if not _in(s5):
            continue
        for s3 in range(LO, HI + 1):
            s11 = s3 - 11
            if not _in(s11):
                continue
            s12 = s5 - s3 + 110  # s5 - s3 - s12 == -110
            if not _in(s12):
                continue
            for s14 in range(LO, HI + 1):
                s7 = s13 * s14 - 2083  # s7 - s13*s14 == -2083
                if not _in(s7):
                    continue
                prod = s14 ^ s7
                if prod == 0 or 7200 % prod != 0:
                    continue
                s17 = 7200 // prod
                if not _in(s17):
                    continue
                for s8 in range(LO, HI + 1):
                    for s15 in range(LO, HI + 1):
                        s4 = s8 + s15 - 176  # s8 - s4 + s15 == 176
                        if not _in(s4):
                            continue
                        # s18 * s4 == 5408 - s15 + s12
                        num = 5408 - s15 + s12
                        if s4 == 0 or num % s4 != 0:
                            continue
                        s18 = num // s4
                        if not _in(s18):
                            continue
                        # (s2 + s4) xor s8 == 3
                        for s2 in range(LO, HI + 1):
                            if ((s2 + s4) ^ s8) != 3:
                                continue
                            if s15 * s3 + s11 * s2 != 18888:
                                continue
                            s0 = 182 - s2 + s5 - s16  # s0 + s2 - s5 + s16 == 182
                            if not _in(s0):
                                continue
                            for s6 in range(LO, HI + 1):
                                for s1 in range(LO, HI + 1):
                                    if s11 * s6 + s3 * s1 != 17872:
                                        continue
                                    if s16 * s2 + (s17 ^ s0) * s1 != 9985:
                                        continue
                                    if ((s15 - s7) ^ (s18 ^ s1)) != 83:
                                        continue
                                    if s11 - s3 != -11:
                                        continue
                                    # s10*s8 + s9 == 5630 - s13, s9 in range
                                    target = 5630 - s13
                                    for s10 in range(LO, HI + 1):
                                        s9 = target - s10 * s8
                                        if not _in(s9):
                                            continue
                                        if (s14 * s6) * (((s12 - s10) ^ s13)) != 16335:
                                            continue
                                        v = ((s10 ^ s9) - (s11 + s18)) & 0xFFFFFFFF
                                        v ^= s6
                                        if v >= 0x80000000:
                                            v -= 0x100000000
                                        if v != -199:
                                            continue
                                        if (s16 - s17) * (((s9 + s5) ^ s0)) != 5902:
                                            continue
                                        raw = bytes(
                                            [
                                                s0, s1, s2, s3, s4, s5, s6, s7, s8, s9,
                                                s10, s11, s12, s13, s14, s15, s16, s17, s18,
                                            ]
                                        )
                                        sols.append(raw)
                                        if len(sols) > 1:
                                            break
    if len(sols) != 1:
        raise SystemExit(f"attendu 1 solution, obtenu {len(sols)}: {sols!r}")
    return sols[0].decode()


def main() -> None:
    ap = argparse.ArgumentParser(description="Mars Analytica citizen ID")
    ap.add_argument("-q", action="store_true", help="n'afficher que l'ID")
    ap.add_argument("--check", action="store_true", help="rejouer l'ID sur le binaire d'origine")
    args = ap.parse_args()
    cid = solve()
    if args.check:
        proc = subprocess.run(
            [str(BIN)],
            input=(cid + "\n").encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        out = proc.stdout
        if b"ACCESS GRANTED" not in out or b"FLAG-l0rdoFb1N" not in out:
            sys.stdout.buffer.write(out)
            raise SystemExit(1)
        if cid.encode().replace(b"-", b"") not in out:
            sys.stdout.buffer.write(out)
            raise SystemExit(1)
        print("ok")
        return
    if args.q:
        print(cid)
        return
    print(f"citizen ID: {cid}")
    print(f"flag:       FLAG-l0rdoFb1N{cid.replace('-', '')}")


if __name__ == "__main__":
    main()
