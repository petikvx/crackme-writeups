#!/usr/bin/env python3
"""Solveur — ShadowLegion TermBreaker

ELF64 Qt6 GUI : system code 8 chars [A-Z0-9] tel que

    Σ (i+1) * ord(code[i])  ==  2856    (i = 0..7)

Pas de username. Exemple thématique : TERMATUR.

Usage:
  python3 termbreaker-solve.py              # un code valide
  python3 termbreaker-solve.py -q
  python3 termbreaker-solve.py --count 5
  python3 termbreaker-solve.py --check TERMATUR
  python3 termbreaker-solve.py --check      # check du code par défaut
"""
from __future__ import annotations

import argparse
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "TermBreaker"
PRELOAD_SRC = Path(__file__).resolve().parent / "tb-live-preload.cpp"
PRELOAD_SO = Path(__file__).resolve().parent / "tb-live-preload.so"
TARGET = 2856
CHARSET = [chr(c) for c in range(ord("A"), ord("Z") + 1)] + [
    chr(c) for c in range(ord("0"), ord("9") + 1)
]
DEFAULT_CODE = "TERMATUR"


def score(code: str) -> int:
    if len(code) != 8:
        raise ValueError("longueur != 8")
    return sum((i + 1) * ord(c) for i, c in enumerate(code))


def is_valid(code: str) -> bool:
    if len(code) != 8:
        return False
    if any(c not in CHARSET for c in code):
        return False
    return score(code) == TARGET


def gen_codes(limit: int = 1, prefer_prefix: str = "TERM") -> list[str]:
    """DFS avec prune ; TERMATUR en tête si demandé, puis préfixe thématique."""
    found: list[str] = []

    def dfs(prefix: str, acc: int) -> None:
        if len(found) >= limit:
            return
        i = len(prefix)
        if i == 8:
            if acc == TARGET and prefix not in found:
                found.append(prefix)
            return
        rem_w = list(range(i + 1, 9))
        lo = acc + sum(w * 48 for w in rem_w)
        hi = acc + sum(w * 90 for w in rem_w)
        if lo > TARGET or hi < TARGET:
            return
        for c in CHARSET:
            dfs(prefix + c, acc + (i + 1) * ord(c))
            if len(found) >= limit:
                return

    if is_valid(DEFAULT_CODE) and DEFAULT_CODE not in found:
        found.append(DEFAULT_CODE)
    if len(found) >= limit:
        return found[:limit]
    if prefer_prefix and 0 < len(prefer_prefix) <= 8:
        if all(c in CHARSET for c in prefer_prefix):
            base = sum((i + 1) * ord(c) for i, c in enumerate(prefer_prefix))
            dfs(prefer_prefix, base)
    if len(found) < limit:
        dfs("", 0)
    return found[:limit]


def qt_lib_dir() -> Path | None:
    env = os.environ.get("QT611_LIB")
    if env and Path(env).is_dir():
        return Path(env)
    home = Path.home() / "Qt" / "6.11.2" / "gcc_64" / "lib"
    if home.is_dir():
        return home
    return None


def ensure_preload(qt_lib: Path) -> Path:
    qt = qt_lib.parent
    need_build = not PRELOAD_SO.is_file() or (
        PRELOAD_SRC.is_file() and PRELOAD_SO.stat().st_mtime < PRELOAD_SRC.stat().st_mtime
    )
    if need_build:
        cmd = [
            "g++",
            "-shared",
            "-fPIC",
            "-O2",
            "-std=c++17",
            f"-I{qt}/include",
            f"-I{qt}/include/QtCore",
            f"-I{qt}/include/QtGui",
            f"-I{qt}/include/QtWidgets",
            "-DQT_NO_VERSION_TAGGING",
            "-o",
            str(PRELOAD_SO),
            str(PRELOAD_SRC),
            f"-L{qt_lib}",
            "-lQt6Widgets",
            "-lQt6Gui",
            "-lQt6Core",
            "-ldl",
        ]
        subprocess.run(cmd, check=True)
    return PRELOAD_SO


def check_live(code: str) -> int:
    if not is_valid(code):
        print(f"invalid code {code!r} (charset/len/score)", file=sys.stderr)
        return 1
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    qt_lib = qt_lib_dir()
    if qt_lib is None:
        print(
            "Qt 6.11 lib introuvable (ex. ~/Qt/6.11.2/gcc_64/lib). "
            "Installer via: python3 -m aqt install-qt linux desktop 6.11.2 linux_gcc_64 --outputdir \"$HOME/Qt\"",
            file=sys.stderr,
        )
        return 1
    so = ensure_preload(qt_lib)
    env = os.environ.copy()
    env["LD_LIBRARY_PATH"] = f"{qt_lib}:{env.get('LD_LIBRARY_PATH', '')}"
    env["LD_PRELOAD"] = str(so)
    env["TB_CODE"] = code
    env.setdefault("QT_QPA_PLATFORM", "offscreen")
    r = subprocess.run([str(BIN)], capture_output=True, env=env, timeout=20)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = r.returncode == 0 and "ACCESS GRANTED" in out
    print(f"{code} score={score(code)} -> {'OK' if ok else 'FAIL'} (exit={r.returncode})")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description="TermBreaker system-code solver")
    ap.add_argument("-q", "--quiet", action="store_true", help="code seul")
    ap.add_argument("--count", type=int, default=1, help="nombre de codes à énumérer")
    ap.add_argument("--prefix", default="TERM", help="préfixe préféré pour la génération")
    ap.add_argument(
        "--check",
        nargs="?",
        const=DEFAULT_CODE,
        metavar="CODE",
        help=f"preuve live via LD_PRELOAD (défaut {DEFAULT_CODE})",
    )
    ap.add_argument("code", nargs="?", help="vérifier score d'un code (sans live)")
    args = ap.parse_args()

    if args.check is not None:
        return check_live(args.check)

    if args.code is not None:
        s = score(args.code) if len(args.code) == 8 else -1
        ok = is_valid(args.code)
        if args.quiet:
            print(args.code if ok else "")
        else:
            print(f"{args.code} score={s} valid={ok} target={TARGET}")
        return 0 if ok else 1

    codes = gen_codes(limit=max(1, args.count), prefer_prefix=args.prefix)
    if not codes:
        print("aucun code trouvé", file=sys.stderr)
        return 1
    if args.quiet:
        print(codes[0])
    else:
        for c in codes:
            print(f"{c}  # score={score(c)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
