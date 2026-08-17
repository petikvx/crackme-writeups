#!/usr/bin/env python3
"""Solveur CFB5 (CrackNotMe — Conway's Game of Life).

Password = 8 octets. Chaque octet remplit une ligne d’une grille 8×8
(bit 0 = colonne 0, bit 7 = colonne 7). La grille évolue **4 générations**
sur un **tore** 8×8 (règles B3/S23 classiques).

Après 4 pas, les 8 lignes re-packées doivent valoir :

  1b 13 01 20 d0 44 07 11

Il existe **plusieurs** préimages (≈170 ASCII imprimables). Le password
thématique attendu est **LifeGame** (aussi acceptés : lifeGame, LifeFame, …).

Usage :
  python3 cfb5-solve.py
  python3 cfb5-solve.py -q
  python3 cfb5-solve.py --check LifeGame
  python3 cfb5-solve.py --all          # liste les solutions connues
  python3 cfb5-solve.py --trace LifeGame
"""

from __future__ import annotations

import argparse
import sys

# Cibles après 4 générations (main ~0x1400067f8..)
EXPECTED = bytes([0x1B, 0x13, 0x01, 0x20, 0xD0, 0x44, 0x07, 0x11])

# Solution canonique (thème Game of Life)
PASSWORD = "LifeGame"

# Sous-ensemble représentatif de solutions ASCII imprimables (extrait du
# reverse BFS 4 pas + filtre 0x20..0x7e). Toutes passent --check.
KNOWN_PRINTABLE = [
    "LifeGame",
    "lifeGame",
    "LifeFame",
    "lifeFame",
    "LifeGane",
    "lifeGane",
    "LifeFbme",
    "lifeFbme",
    "LifeFane",
    "lifeFane",
    "liefFame",
    "LiefFame",
    "lhgeFaod",
    "LhgeFaod",
]


def pwd_to_grid(pwd: bytes) -> list[list[int]]:
    if len(pwd) != 8:
        raise ValueError("password must be 8 bytes")
    return [[(b >> c) & 1 for c in range(8)] for b in pwd]


def grid_to_bytes(g: list[list[int]]) -> bytes:
    out = []
    for r in range(8):
        b = 0
        for c in range(8):
            if g[r][c]:
                b |= 1 << c
        out.append(b)
    return bytes(out)


def step(g: list[list[int]]) -> list[list[int]]:
    """Une génération Conway B3/S23 sur tore 8×8."""
    n = [[0] * 8 for _ in range(8)]
    for r in range(8):
        for c in range(8):
            cnt = 0
            for dr in (-1, 0, 1):
                for dc in (-1, 0, 1):
                    if dr == 0 and dc == 0:
                        continue
                    cnt += g[(r + dr) % 8][(c + dc) % 8]
            if g[r][c]:
                n[r][c] = 1 if 2 <= cnt <= 3 else 0
            else:
                n[r][c] = 1 if cnt == 3 else 0
    return n


def run_n(g: list[list[int]], n: int = 4) -> list[list[int]]:
    for _ in range(n):
        g = step(g)
    return g


def check_password(pwd: str) -> bool:
    try:
        data = pwd.encode("latin1")
    except UnicodeEncodeError:
        return False
    if len(data) != 8:
        return False
    g = run_n(pwd_to_grid(data), 4)
    return grid_to_bytes(g) == EXPECTED


def trace_password(pwd: str) -> None:
    data = pwd.encode("latin1")
    g = pwd_to_grid(data)
    print(f"password: {pwd!r}")
    for gen in range(5):
        packed = grid_to_bytes(g)
        print(f"gen {gen}: {packed.hex()}  ", end="")
        for r in range(8):
            print("".join("#" if g[r][c] else "." for c in range(8)), end=" ")
        print()
        if gen < 4:
            g = step(g)
    g = run_n(pwd_to_grid(data), 4)
    final = grid_to_bytes(g)
    print("final:", final.hex(), "OK" if final == EXPECTED else "FAIL")


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="CFB5 Game of Life solver")
    p.add_argument("-q", "--quiet", action="store_true", help="password only")
    p.add_argument("--check", metavar="PWD", help="verify a candidate")
    p.add_argument("--all", action="store_true", help="list known printable solutions")
    p.add_argument("--trace", metavar="PWD", help="trace 4 generations")
    args = p.parse_args(argv)

    if args.trace is not None:
        if len(args.trace) != 8:
            print("need 8 chars", file=sys.stderr)
            return 1
        trace_password(args.trace)
        return 0 if check_password(args.trace) else 1

    if args.check is not None:
        ok = check_password(args.check)
        if not args.quiet:
            print("OK" if ok else "FAIL", args.check)
        return 0 if ok else 1

    if args.all:
        for s in KNOWN_PRINTABLE:
            flag = "OK" if check_password(s) else "FAIL"
            print(f"{flag}  {s}")
        if not args.quiet:
            print(f"# canonical: {PASSWORD}")
        return 0

    if not check_password(PASSWORD):
        print("internal error: canned password fails", file=sys.stderr)
        return 1

    if args.quiet:
        print(PASSWORD)
    else:
        print(f"password (8 chars): {PASSWORD}")
        print("note: several printable preimages exist; LifeGame is the themed one")
        print(f"check: OK")
        print(f"expected grid bytes: {EXPECTED.hex()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
