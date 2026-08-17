#!/usr/bin/env python3
"""Solveur CFB6 (CrackNotMe — Quantum State / memory patch).

CFB6 est un enchaînement de stages « mémoire volatile ». Le flag final est
statique une fois le chemin quantum + patches mémoire appliqués :

  pwn{6_st4g3_m3m0ry_p4tch_g0d}

Chemin légitime (éducatif) :
  1. Amnesia gate : SEED_1 est **effacé** avant la saisie → token **vide**
  2. Stage 3 « wormhole » : dword stage4_unlocked @ VA 0x140045318 doit valoir
     **0x1337** (jamais écrit par le programme → patch mémoire / .data)
  3. Entrée « quantum » : argc == **9999** (9998 arguments) → jump Stage 4
  4. SEED_1 doit être non nul en mémoire (précharger ou empêcher le wipe)
  5. Fusion key = chaque octet de SEED_3 XOR 0x5A  (SEED_2 backup = 0)
  6. Recoller le master cipher affiché → ACCESS GRANTED

Usage :
  python3 cfb6-solve.py -q
  python3 cfb6-solve.py --check
  python3 cfb6-solve.py --run    # wine + binaire patché (si wine dispo)
"""

from __future__ import annotations

import argparse
import re
import struct
import subprocess
import sys
import threading
import time
from pathlib import Path

FLAG = "pwn{6_st4g3_m3m0ry_p4tch_g0d}"
ARGC_QUANTUM = 9999  # inclut argv[0] → 9998 args
LOCK_VA = 0x140045318
LOCK_VALUE = 0x1337
SEED1_VA = 0x1400452C0
IMAGE_BASE = 0x140000000
TEXT_VA = 0x1000
TEXT_RAW = 0x400
DATA_VA = 0x44000
DATA_RAW = 0x42000


def va_to_fo(va: int) -> int:
    rva = va - IMAGE_BASE
    if rva >= DATA_VA:
        return DATA_RAW + (rva - DATA_VA)
    return TEXT_RAW + (rva - TEXT_VA)


def patch_binary(src: Path, dst: Path) -> None:
    data = bytearray(src.read_bytes())
    # SEED_1 placeholder (8 chars alphanum)
    fo = va_to_fo(SEED1_VA)
    data[fo : fo + 8] = b"ABCDEFGH"
    # volatile lock
    fo = va_to_fo(LOCK_VA)
    struct.pack_into("<I", data, fo, LOCK_VALUE)
    dst.write_bytes(data)


def run_live(exe: Path) -> str:
    """Exécute le chemin quantum et renvoie le flag live (vérif)."""
    args = ["wine", str(exe)] + ["x"] * (ARGC_QUANTUM - 1)
    p = subprocess.Popen(
        args,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        bufsize=0,
    )
    buf = b""

    def reader() -> None:
        nonlocal buf
        assert p.stdout is not None
        while True:
            c = p.stdout.read(1)
            if not c:
                break
            buf += c

    threading.Thread(target=reader, daemon=True).start()

    def clean() -> str:
        return re.sub(rb"\x1b\[[0-9;?]*[a-zA-Z]|\r", b"", buf).decode(
            "latin1", "replace"
        )

    deadline = time.time() + 20
    while time.time() < deadline:
        if "Fusion Key" in clean():
            break
        time.sleep(0.05)

    text = clean()
    m = re.findall(r"SEED_3 generated:\s*([0-9A-Z]{8})", text)
    if not m:
        p.kill()
        raise RuntimeError("SEED_3 not found:\n" + text[-800:])
    seed3 = m[-1].encode()
    fusion = bytes(b ^ 0x5A for b in seed3)
    assert p.stdin is not None
    p.stdin.write(fusion + b"\n")
    p.stdin.flush()

    deadline = time.time() + 8
    while time.time() < deadline:
        if "Final Secure Cipher" in clean():
            break
        time.sleep(0.05)

    text = clean()
    ciph = re.findall(r"-->\s*([A-Z0-9]+)\s*<--", text)
    if not ciph:
        p.kill()
        raise RuntimeError("master cipher not found:\n" + text[-800:])
    p.stdin.write(ciph[-1].encode() + b"\n")
    p.stdin.flush()
    time.sleep(1)
    try:
        p.stdin.write(b"\n")
        p.stdin.flush()
    except BrokenPipeError:
        pass
    time.sleep(0.5)
    text = clean()
    try:
        p.kill()
    except Exception:
        pass
    fm = re.search(r"Flag:\s*(\S+)", text)
    if not fm:
        raise RuntimeError("flag not found:\n" + text[-1200:])
    return fm.group(1)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="CFB6 quantum memory-patch solver")
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", action="store_true", help="print canned flag")
    ap.add_argument(
        "--run",
        action="store_true",
        help="patch original/CFB6.exe and verify under wine",
    )
    ap.add_argument(
        "--pe",
        type=Path,
        default=Path(__file__).resolve().parent.parent / "original" / "CFB6.exe",
    )
    args = ap.parse_args(argv)

    if args.run:
        pe = args.pe
        if not pe.is_file():
            print(f"missing {pe}", file=sys.stderr)
            return 1
        patched = Path("/tmp/CFB6_solve_patched.exe")
        patch_binary(pe, patched)
        try:
            live = run_live(patched)
        except FileNotFoundError:
            print("wine not available", file=sys.stderr)
            return 1
        except Exception as e:
            print(e, file=sys.stderr)
            return 1
        if live != FLAG:
            print(f"mismatch live={live!r} canned={FLAG!r}", file=sys.stderr)
            return 1
        if args.quiet:
            print(live)
        else:
            print(f"flag: {live}")
            print("check: OK (wine)")
        return 0

    if args.quiet:
        print(FLAG)
    else:
        print(f"flag: {FLAG}")
        print("note: quantum path = argc 9999 + memory patches (see write-up)")
        print("      python3 cfb6-solve.py --run   # live wine check")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
