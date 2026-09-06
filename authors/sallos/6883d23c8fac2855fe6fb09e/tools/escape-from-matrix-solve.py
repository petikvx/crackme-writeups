#!/usr/bin/env python3
"""Solveur — Sallos's EscapeFromMatrix (escapematrix.exe)

PE32 GUI MASM32 : dialog « Escape from Matrix ».
Saisie edit 1004, validation bouton RED pill (1003).

Prédicat (sub_401349) :
  5×4 octets XOR clé LE 0x13228F73, empaquetés BE, vs 5 DWORDs ;
  puis si len==23 → return 0 → MessageBox « Welcome to the real world. »
  (vrai succès / EndDialog). Tout autre cas → return 1 → decoy UI
  (« I didn't say it would be easy, Neo. ») — y compris mauvais password.

Password : citation Matrix « Your mind makes it real » (23 chars).
Les 3 derniers caractères ne sont pas comparés (seul le préfixe 20 + len).

Usage :
  python3 escape-from-matrix-solve.py -q
  python3 escape-from-matrix-solve.py --check
  python3 escape-from-matrix-solve.py --check --wine
"""
from __future__ import annotations

import argparse
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "escapematrix.exe"
HARNESS = Path(__file__).resolve().parent / "escape-from-matrix-wine-check.exe"

KEY = 0x13228F73
KEY_BYTES = bytes([KEY & 0xFF, (KEY >> 8) & 0xFF, (KEY >> 16) & 0xFF, (KEY >> 24) & 0xFF])

EXPECTED = (
    0x2AE05761,  # dword_403000
    0x53E24B7D,  # *hMem (WM_INITDIALOG)
    0x17AF4F72,  # push pile
    0x18EA5133,  # dword_40309D
    0x1AFB0261,  # *dword_403170 (WM_INITDIALOG)
)

# Préfixe inversé depuis les 5 DWORDs (20) + suffixe citation (3)
PREFIX20 = "Your mind makes it r"
PASSWORD = "Your mind makes it real"  # len 23


def password_from_expected() -> str:
    out = bytearray()
    for exp in EXPECTED:
        be = exp.to_bytes(4, "big")
        for i in range(4):
            out.append(be[i] ^ KEY_BYTES[i])
    return out.decode("ascii")


def encode_block(block: bytes) -> int:
    edx = 0
    for i, b in enumerate(block):
        edx = ((edx << 8) | (b ^ KEY_BYTES[i])) & 0xFFFFFFFF
    return edx


def check_returns_zero(pw: str) -> bool:
    """True ssi sub_401349 renverrait 0 (MessageBox succès)."""
    raw = pw.encode("latin1", errors="replace")
    buf = bytearray(64)
    n = min(len(raw), 63)
    buf[:n] = raw[:n]
    length = n

    targets = list(EXPECTED)
    # après counter 4, expected devient *(edi-4)=0x16EE4E13 (non utilisé si len==23)
    follow = [0x16EE4E13]

    ebx_key = KEY
    counter = 0
    expected = targets[0]
    queue = targets[1:] + follow
    pos = 0

    while True:
        edx = 0
        for _ in range(4):
            al = buf[pos] ^ (ebx_key & 0xFF)
            pos += 1
            ebx_key >>= 8
            edx = ((edx << 8) | al) & 0xFFFFFFFF

        if counter <= 4:
            cur = expected
            expected = queue[counter]
        else:
            if length == 0x17:
                return True  # return 0 in binary
            cur = counter

        edx ^= cur
        ebx_key = KEY
        counter += 1
        if edx == 0:
            continue
        return False  # return 1 in binary (decoy)


def wine_check(pw: str) -> bool:
    if not HARNESS.is_file():
        print(f"missing harness {HARNESS}", file=sys.stderr)
        return False
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return False

    xvfb = "/tmp/xvfb-extract/usr/bin/xvfb-run"
    if os.path.isfile(xvfb) and os.access(xvfb, os.X_OK):
        cmd = [xvfb, "-a", "wine", str(HARNESS), str(BIN), pw]
    elif os.environ.get("DISPLAY"):
        cmd = ["wine", str(HARNESS), str(BIN), pw]
    else:
        print("no xvfb-run / DISPLAY for Wine GUI", file=sys.stderr)
        return False

    try:
        out = subprocess.check_output(cmd, stderr=subprocess.STDOUT, timeout=60)
    except (subprocess.CalledProcessError, subprocess.TimeoutExpired) as e:
        data = getattr(e, "output", None) or b""
        if isinstance(e, subprocess.CalledProcessError) and e.output:
            data = e.output
        text = data.decode(errors="replace") if data else str(e)
        sys.stderr.write(text)
        # harness exits 1 on FAIL
        if "MSGBOX" in text and "Welcome" in text and "\nOK" in text.replace("\r", ""):
            print(text)
            return True
        print(f"wine-check failed: {e}", file=sys.stderr)
        return False
    text = out.decode(errors="replace")
    # filter wine wow64 noise
    lines = [ln for ln in text.splitlines() if "err:environ" not in ln]
    print("\n".join(lines))
    return any(ln.strip() == "OK" for ln in lines) and any(
        "Welcome" in ln or "real world" in ln for ln in lines
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument("--check", action="store_true", help="vérifier prédicat (+ Wine si --wine)")
    ap.add_argument("--wine", action="store_true", help="avec --check : preuve live Wine UI")
    args = ap.parse_args()

    pref = password_from_expected()
    if pref != PREFIX20:
        print(f"prefix mismatch: {pref!r}", file=sys.stderr)
        return 1
    pw = PASSWORD

    if args.q:
        print(pw)
        return 0

    if args.check:
        # blocs
        for i in range(5):
            got = encode_block(pw[i * 4 : (i + 1) * 4].encode())
            if got != EXPECTED[i]:
                print(f"FAIL block {i}: {got:#x} != {EXPECTED[i]:#x}")
                return 1
        if len(pw) != 23 or not check_returns_zero(pw):
            print("FAIL predicate (need len 23 + 5 blocks)")
            return 1
        if check_returns_zero("wrong"):
            print("FAIL: wrong password should not return 0")
            return 1
        if check_returns_zero(PREFIX20):
            print("FAIL: truncated 20 should be decoy (return 1)")
            return 1
        print("predicate: OK")
        if args.wine:
            if not wine_check(pw):
                print("FAIL wine")
                return 1
            print("wine: OK")
        else:
            print("OK")
        return 0

    print("=== Sallos EscapeFromMatrix ===")
    print(f"password : {pw!r}  (len {len(pw)})")
    print("UI       : edit 1004 + « You take the RED pill » (1003)")
    print("success  : MessageBox « Welcome to the real world. »")
    print("decoy    : mauvais / len≠23 → « I didn't say it would be easy, Neo. »")
    return 0


if __name__ == "__main__":
    sys.exit(main())
