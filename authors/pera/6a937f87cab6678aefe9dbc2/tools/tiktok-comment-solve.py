#!/usr/bin/env python3
"""Solveur — Pera's Tiktok comment crackme (double crackme SDL)

ELF64 GUI : ./thisismebtw [text] [passwrd]

Deux barres indépendantes (vert = OK, rouge = KO) :

  Partie 1 (barre haute) — hash custom sur text, len > 3 :
    h = 5381
    for c in text: h = len + ((33*h) ^ c)   # uint32
    OK si (h ^ 0x7FADBEEF) % 0x26F5 == 42

  Partie 2 (barre basse) — seulement si partie 1 échoue,
  len(text)==len(pass)>3 :
    a=b=0
    for t,p: a = ((t^p)+a) ^ 0x55
             s = t+p+b ; b = (s & ~0xFF) | ((s & 0xFF) ^ 0xAA)
    OK si (b ^ a) % 0x539 == 42

Les deux verts en même temps sont impossibles (partie 2 exige !partie1).

Usage:
  python3 tiktok-comment-solve.py              # exemples petik + part1
  python3 tiktok-comment-solve.py -q
  python3 tiktok-comment-solve.py --part 1
  python3 tiktok-comment-solve.py --part 2 --text petik
  python3 tiktok-comment-solve.py --check
"""
from __future__ import annotations

import argparse
import itertools
import os
import string
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "thisismebtw"
DEFAULT_TEXT = "petik"
ALPHABET = (string.ascii_lowercase + string.digits).encode()


def u32(x: int) -> int:
    return x & 0xFFFFFFFF


def hash_text(s: bytes) -> int:
    h = 5381
    n = len(s)
    for c in s:
        h = u32(n + (u32(33 * h) ^ c))
    return h


def check_part1(text: bytes) -> bool:
    if len(text) <= 3:
        return False
    return (hash_text(text) ^ 0x7FADBEEF) % 0x26F5 == 42


def accum(text: bytes, pwd: bytes) -> tuple[int, int]:
    a = 0
    b = 0
    for t, p in zip(text, pwd):
        a = u32(((t ^ p) + a) ^ 0x55)
        s = u32(t + p + b)
        b = (s & 0xFFFFFF00) | ((s & 0xFF) ^ 0xAA)
    return a, b


def check_part2(text: bytes, pwd: bytes) -> bool:
    if check_part1(text):
        return False
    if len(text) != len(pwd) or len(text) <= 3:
        return False
    a, b = accum(text, pwd)
    return (b ^ a) % 0x539 == 42


def find_part1(max_len: int = 6, limit: int = 1) -> list[bytes]:
    found: list[bytes] = []
    for L in range(4, max_len + 1):
        for prod in itertools.product(ALPHABET, repeat=L):
            s = bytes(prod)
            if check_part1(s):
                found.append(s)
                if len(found) >= limit:
                    return found
    return found


def find_part2(text: bytes, limit: int = 1) -> list[bytes]:
    if check_part1(text):
        raise ValueError(
            f"{text!r} valide déjà la partie 1 — choisir un text qui échoue"
        )
    if len(text) <= 3:
        raise ValueError("text doit avoir len > 3")
    found: list[bytes] = []
    for prod in itertools.product(ALPHABET, repeat=len(text)):
        pwd = bytes(prod)
        if check_part2(text, pwd):
            found.append(pwd)
            if len(found) >= limit:
                return found
    return found


def _gdb_env() -> dict[str, str]:
    """Préfixe un SDL2_image local (/tmp/…) s’il existe (dev sans paquet système)."""
    env = dict(os.environ)
    extra = Path("/tmp/sdl2img/usr/lib/x86_64-linux-gnu")
    if extra.is_dir():
        prev = env.get("LD_LIBRARY_PATH", "")
        env["LD_LIBRARY_PATH"] = f"{extra}:{prev}" if prev else str(extra)
    return env


def gdb_flags(text: str, password: str) -> tuple[int, int] | None:
    """Lit v11/v12 juste après le store (main+0x420) via gdb."""
    if not BIN.is_file():
        return None
    try:
        r = subprocess.run(
            [
                "gdb",
                "-batch",
                "-ex",
                "set debuginfod enabled off",
                "-ex",
                "set disable-randomization on",
                "-ex",
                "break *main+0x420",
                "-ex",
                f"run {text} {password}",
                "-ex",
                'printf "FLAGS %d %d\\n", *(unsigned char*)($rbp-0x2d72), *(unsigned char*)($rbp-0x2d71)',
                "-ex",
                "quit",
                str(BIN),
            ],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(ROOT),
            env=_gdb_env(),
        )
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return None
    for line in (r.stdout + r.stderr).splitlines():
        if line.startswith("FLAGS "):
            _, a, b = line.split()
            return int(a), int(b)
    return None


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--text", "--user", default=DEFAULT_TEXT, help="text pour partie 2 (défaut: petik)")
    ap.add_argument("--part", type=int, choices=(1, 2), help="ne résoudre qu'une partie")
    ap.add_argument("-q", action="store_true", help="sortie minimale")
    ap.add_argument("--check", action="store_true", help="vérifie les flags via gdb")
    ap.add_argument("--limit", type=int, default=1, help="nombre de solutions à afficher")
    args = ap.parse_args()

    text_b = args.text.encode()

    if args.check:
        p1 = find_part1(limit=1)
        if not p1:
            print("no part1", file=sys.stderr)
            return 1
        pwds = find_part2(text_b, limit=1)
        if not pwds:
            print("no part2", file=sys.stderr)
            return 1
        cases = [
            (p1[0].decode(), "xxxx", 1, 0, "part1"),
            (args.text, pwds[0].decode(), 0, 1, "part2"),
            (args.text, "aaaaa", 0, 0, "fail"),
        ]
        ok_all = True
        for t, p, e1, e2, label in cases:
            got = gdb_flags(t, p)
            if got is None:
                print(f"{label}: gdb unavailable — pure python checks only")
                # fall back
                tb, pb = t.encode(), p.encode()
                g1, g2 = int(check_part1(tb)), int(check_part2(tb, pb))
            else:
                g1, g2 = got
            status = "OK" if (g1, g2) == (e1, e2) else "FAIL"
            if status != "OK":
                ok_all = False
            print(f"{label}: {t} {p} -> v11={g1} v12={g2} (expect {e1},{e2}) {status}")
        return 0 if ok_all else 1

    do1 = args.part in (None, 1)
    do2 = args.part in (None, 2)

    if do1:
        sols = find_part1(limit=args.limit)
        if not sols:
            print("aucune solution partie 1", file=sys.stderr)
            return 1
        for s in sols:
            if args.q:
                print(s.decode())
            else:
                print(f"part1 text={s.decode()!r}  (passwrd quelconque, ex. xxxx)")

    if do2:
        try:
            sols = find_part2(text_b, limit=args.limit)
        except ValueError as e:
            print(e, file=sys.stderr)
            return 1
        if not sols:
            print("aucune solution partie 2", file=sys.stderr)
            return 1
        for p in sols:
            if args.q:
                if args.part == 2:
                    print(p.decode())
                else:
                    print(f"{args.text} {p.decode()}")
            else:
                print(f"part2 text={args.text!r} passwrd={p.decode()!r}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
