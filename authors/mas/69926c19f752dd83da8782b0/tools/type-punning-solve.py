#!/usr/bin/env python3
"""Solveur — MAS's Type Punning

Le binaire n'est pas un checker : c'est l'encodeur qui a produit
encoded_flag.txt. Pour chaque octet de flag.txt :

    dword = 0x10000                    # type punning : 00 00 01 00 LE
    dword.byte0 = c ^ (rand() % 10 + 1)
    write 4 octets

srand(time(NULL)) au lancement. Seed auteur (hint site) :
    2026-02-16 03:30:00 Asia/Amman  →  1771201800

Flag : z+{7yp3_Punn1n9}  (plus un \\n dans flag.txt)

Usage:
  python3 tools/type-punning-solve.py -q
  python3 tools/type-punning-solve.py --check
"""
from __future__ import annotations

import argparse
import ctypes
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "challenge"
ENC = ROOT / "original" / "encoded_flag.txt"
FLAG = "z+{7yp3_Punn1n9}"
SEED = 1771201800  # 2026-02-16 03:30:00 +03 Amman
FAKETIME_C = r"""
#include <time.h>
time_t time(time_t *tloc) {
    const time_t fake = 1771201800;
    if (tloc) *tloc = fake;
    return fake;
}
"""


def _libc():
    libc = ctypes.CDLL("libc.so.6")
    libc.srand.argtypes = [ctypes.c_uint]
    libc.rand.restype = ctypes.c_int
    return libc


def decode(blob: bytes, seed: int = SEED) -> bytes:
    if len(blob) % 4:
        raise ValueError(f"longueur {len(blob)} non multiple de 4")
    libc = _libc()
    libc.srand(seed)
    out = bytearray()
    for i in range(0, len(blob), 4):
        dword = int.from_bytes(blob[i : i + 4], "little")
        if dword & 0xFFFFFF00 != 0x10000:
            raise ValueError(f"dword {i}: {dword:#x} n'a pas le motif 0x100XX")
        key = libc.rand() % 10 + 1
        out.append((dword & 0xFF) ^ key)
    return bytes(out)


def encode(plain: bytes, seed: int = SEED) -> bytes:
    libc = _libc()
    libc.srand(seed)
    out = bytearray()
    for c in plain:
        key = libc.rand() % 10 + 1
        buf = bytearray((0x10000).to_bytes(4, "little"))
        buf[0] = c ^ key
        out += buf
    return bytes(out)


def keys_for(n: int, seed: int = SEED) -> list[int]:
    libc = _libc()
    libc.srand(seed)
    return [libc.rand() % 10 + 1 for _ in range(n)]


def _live_check(plain: bytes) -> None:
    """Rejoue original/challenge avec time() = SEED et compare encoded_flag.txt."""
    gcc = shutil.which("gcc")
    if gcc is None:
        raise RuntimeError("gcc absent : skip live")
    with tempfile.TemporaryDirectory(prefix="typepun-") as td:
        tdir = Path(td)
        (tdir / "faketime.c").write_text(FAKETIME_C)
        so = tdir / "faketime.so"
        subprocess.run(
            [gcc, "-shared", "-fPIC", "-o", str(so), str(tdir / "faketime.c")],
            check=True,
            capture_output=True,
            timeout=15,
        )
        shutil.copy2(BIN, tdir / "challenge")
        os.chmod(tdir / "challenge", 0o755)
        (tdir / "flag.txt").write_bytes(plain)
        env = os.environ.copy()
        env["LD_PRELOAD"] = str(so)
        r = subprocess.run(
            [str(tdir / "challenge")],
            cwd=tdir,
            env=env,
            capture_output=True,
            timeout=5,
            check=False,
        )
        if r.returncode != 0:
            raise RuntimeError(
                f"challenge exit {r.returncode} stdout={r.stdout!r} stderr={r.stderr!r}"
            )
        got = (tdir / "encoded_flag.txt").read_bytes()
        expect = ENC.read_bytes()
        if got != expect:
            raise RuntimeError("encoded_flag.txt live ≠ original")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="n'imprimer que le flag")
    ap.add_argument(
        "--check",
        action="store_true",
        help="décode encoded_flag.txt + rejoue le binaire (LD_PRELOAD time)",
    )
    ap.add_argument(
        "--dump-keys",
        action="store_true",
        help="afficher le flux rand()%%10+1 pour la seed Amman",
    )
    args = ap.parse_args()

    blob = ENC.read_bytes()
    plain = decode(blob)
    flag = plain.rstrip(b"\n").decode("ascii")
    if flag != FLAG:
        print(f"flag inattendu: {plain!r}", file=sys.stderr)
        return 1

    if args.dump_keys:
        print(keys_for(len(plain)))
        return 0

    if args.check:
        if encode(plain) != blob:
            print("FAIL encode roundtrip", file=sys.stderr)
            return 1
        try:
            _live_check(plain)
        except Exception as e:
            print(f"FAIL live: {e}", file=sys.stderr)
            return 1
        print(flag)
        print("OK")
        return 0

    print(flag if args.q else f"{flag}  # srand({SEED}) Amman, type pun 0x10000")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
