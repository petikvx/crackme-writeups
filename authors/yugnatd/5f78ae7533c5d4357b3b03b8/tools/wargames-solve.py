#!/usr/bin/env python3
"""Solveur — YugnatD's WarGames

ELF64 EXEC non-PIE, libc **statique** (gros fichier ≠ crypto).
Prédicat uniquement dans main @ 0x401d35.

  argc == 2  sinon  "Use ./WarGames pass"
  strlen(argv[1]) == 9  sinon  "Wrong Password !!!"
  blob pile = "gssw#tpcz"
      movabs rax, 0x6370742377737367   ; "gssw#tpc" LE  (VMA 0x401da2 / fichier 0x1da2)
      mov    byte [rbp-0x9], 0x7a      ; 'z'            (VMA 0x401db0 / fichier 0x1db0)
  srandom(1983)                        ; edi = 0x7bf, année du film WarGames
  for i in 0..8:
      blob[i] -= (rand() % 5) + 1      ; %5 = magic 0x66666667, pas d'idiv
      if blob[i] != argv[1][i]: fail; break
  fail → "Wrong Password !!!"   ok → "Congratulation !!!"
  exit code toujours 0  →  le --check matche le texte.

rand() = glibc TYPE_3 (DEG=31, SEP=3), défaut de srandom/rand.
Réimplémenté ici (stdlib/random_r.c) pour ne pas dépendre du libc hôte :
la suite a été recoupée avec le libc **lié dans le crackme** (GDB eax=322084512
au 1er rand) et ctypes libc.so.6.

Piège strings : « gssw#tpcH » = immediate 8 octets + opcode 0x48 du
`mov [rbp-0x11], rax`. Le 9ᵉ octet utile est 'z', pas 'H'.
Le 5ᵉ caractère du password est un **espace** ('#' - 3).

Usage:
  python3 tools/wargames-solve.py -q
  python3 tools/wargames-solve.py --table
  python3 tools/wargames-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "WarGames"
WIN = "Congratulation !!!"
LOSE = "Wrong Password !!!"
USAGE = "Use ./WarGames pass"

# Oracle : decode() doit retomber là-dessus. Si ça diverge, le TYPE_3 a bougé.
PASSWORD = "dont play"
SEED = 1983  # 0x7bf, mov edi avant call __srandom
ENC = b"gssw#tpcz"

# glibc stdlib/random.c — TYPE_3 = défaut de srandom()/rand()
# (TYPE_0 = LCG 15 bits, TYPE_1/2/4 = autres degrés ; pas utilisés ici).
_DEG = 31  # longueur du buffer d'état
_SEP = 3  # écart fptr − rptr (lagged Fibonacci additif)


def _srandom(seed: int) -> tuple[list[int], int, int]:
    """Init TYPE_3 + 10*DEG pas de warm-up (comme glibc srandom).

    state[0] = seed (0 est remappé en 1).
    state[i] = Park–Miller 16807 * state[i-1]  mod  2^31-1
    calculé sans overflow 32 bits via Schrage :
        2147483647 = 16807*127773 + 2836
        test = 16807*lo - 2836*hi ; si test < 0 : + 2147483647

    fptr démarre à SEP, rptr à 0. Le warm-up mélange le tableau avant
    le premier rand() visible par main.
    """
    word = seed & 0xFFFFFFFF
    if word == 0:
        word = 1
    state = [0] * _DEG
    state[0] = word
    for i in range(1, _DEG):
        # glibc caste en int32 avant la division Schrage
        signed = word - 0x100000000 if word >= 0x80000000 else word
        hi = signed // 127773
        lo = signed % 127773
        test = 16807 * lo - 2836 * hi
        if test < 0:
            test += 2147483647
        word = test & 0xFFFFFFFF
        state[i] = word
    fptr, rptr = _SEP, 0
    for _ in range(10 * _DEG):
        state, fptr, rptr, _val = _rand(state, fptr, rptr)
    return state, fptr, rptr


def _rand(state: list[int], fptr: int, rptr: int) -> tuple[list[int], int, int, int]:
    """Un pas TYPE_3 = un rand() glibc.

    state[fptr] += state[rptr]   (u32 wrap)
    résultat = cette somme >> 1  (LSB jeté → 31 bits, toujours ≥ 0)
    puis fptr et rptr avancent, wrap à DEG.

    En C, `rand() % 5` sur un positif = reste euclidien. GCC le baisse
    en imul 0x66666667 / sar (force reduction, voir write-up).
    """
    val = (state[fptr] + state[rptr]) & 0xFFFFFFFF
    state[fptr] = val
    result = val >> 1
    fptr += 1
    if fptr >= _DEG:
        fptr = 0
        rptr += 1
    else:
        rptr += 1
        if rptr >= _DEG:
            rptr = 0
    return state, fptr, rptr, result


def decode() -> str:
    """Inverse du check : pw[i] = enc[i] - ((rand() % 5) + 1).

    Le binaire décode le blob **en place** puis compare ; on fait la
    même soustraction. Delta ∈ {1,2,3,4,5} donc pas d'ambiguïté.
    """
    state, fptr, rptr = _srandom(SEED)
    out = bytearray(ENC)
    for i in range(9):
        state, fptr, rptr, r = _rand(state, fptr, rptr)
        out[i] = (out[i] - ((r % 5) + 1)) & 0xFF
    return out.decode("ascii")


def steps() -> list[tuple[int, str, int, int, str]]:
    """Table pédagogique (i, enc, rand(), delta, pw) pour --table / write-up."""
    state, fptr, rptr = _srandom(SEED)
    rows = []
    for i, c in enumerate(ENC):
        state, fptr, rptr, r = _rand(state, fptr, rptr)
        delta = (r % 5) + 1
        ch = chr((c - delta) & 0xFF)
        rows.append((i, chr(c), r, delta, ch))
    return rows


def _run(*args: str) -> subprocess.CompletedProcess[str]:
    # argv seulement : le crackme ne lit pas stdin.
    return subprocess.run(
        [str(BIN), *args],
        capture_output=True,
        text=True,
        timeout=5,
        check=False,
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument(
        "--check",
        action="store_true",
        help="binaire natif : OK, longueur, casse, usage",
    )
    ap.add_argument("--table", action="store_true", help="table i / rand / delta")
    args = ap.parse_args()
    password = decode()
    if password != PASSWORD:
        print(f"password inattendu: {password!r}")
        return 1
    if args.table:
        for i, enc, r, d, ch in steps():
            print(f"{i} {enc} rand={r} delta={d} -> {ch!r}")
        return 0
    if args.check:
        # KO utiles : 8 octets (rate le cmp strlen==9 avant srandom),
        # casse (le check est sensible), argc==1 (banner usage).
        good = _run(password)
        short = _run("dont pla")
        case = _run("Dont play")
        none = _run()
        out = good.stdout
        print(out.strip())
        ok = (
            WIN in out
            and LOSE not in out
            and good.returncode == 0
            and LOSE in short.stdout
            and LOSE in case.stdout
            and USAGE in none.stdout
        )
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(password)
    else:
        print(f"{password}  # srandom({SEED}), blob {ENC!r}")
        print(f"CMO{{{password}}}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
