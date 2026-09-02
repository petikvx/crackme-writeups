#!/usr/bin/env python3
"""tropes_safe_cracker_1 (trope) — combo du « safe » MASM32.

Dialog « The Safe » : boutons 1–5 (IDs 1001–1005) + Open (1006).
Six chiffres appendés en ASCII à 0x403000 ; check @0x4010D3 contre
la table « 1234567890 » @0x4030FF (permutations + add/sub triviaux).

Combo : 435513 → MessageBox « Good Job. » / « Yup » ; sinon Beep.

Usage:
  python3 safe-cracker1-solve.py -q
  python3 safe-cracker1-solve.py --check
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "safe.exe"
REF = b"1234567890"  # VA 0x4030FF
COMBO = "435513"


def derive_combo(ref: bytes = REF) -> str:
    """Rejoue les 6 cmp du binaire (ordre indépendant pour la valeur)."""
    # input[0] == ref[4]+2-3 ; [2]==ref[4] ; [1]==ref[2]
    # [4]==ref[0] ; [5]==ref[2] ; [3]==ref[4]
    out = ["?"] * 6
    out[0] = chr(ref[4] + 2 - 3)
    out[2] = chr(ref[4])
    out[1] = chr(ref[2])
    out[4] = chr(ref[0])
    out[5] = chr(ref[2])
    out[3] = chr(ref[4])
    return "".join(out)


def check_combo(s: str, ref: bytes = REF) -> bool:
    if len(s) != 6:
        return False
    flag = 0
    tests = (
        (s[0], chr(ref[4] + 2 - 3)),
        (s[2], chr(ref[4])),
        (s[1], chr(ref[2])),
        (s[4], chr(ref[0])),
        (s[5], chr(ref[2])),
        (s[3], chr(ref[4])),
    )
    for a, b in tests:
        if a != b:
            flag = 1
    return flag == 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("-q", action="store_true", help="combo seule")
    ap.add_argument(
        "--check",
        action="store_true",
        help="dérive depuis REF, vérifie le prédicat (+ présence du PE)",
    )
    args = ap.parse_args()

    derived = derive_combo()
    assert derived == COMBO

    if args.check:
        ok = check_combo(derived)
        pe_ok = BIN.is_file()
        print(f"combo={derived} predicate={'OK' if ok else 'FAIL'} pe={'OK' if pe_ok else 'MISSING'}")
        if pe_ok:
            # sanity: string table still in .data
            data = BIN.read_bytes()
            if b"1234567890" not in data or b"Good Job." not in data:
                print("FAIL: expected strings missing from PE", file=sys.stderr)
                return 1
        return 0 if ok and pe_ok else 1

    if args.q:
        print(derived)
        return 0

    print("=== tropes_safe_cracker_1 ===")
    print(f"combo : {derived}")
    print("UI    : The Safe — boutons 4,3,5,5,1,3 puis Open")
    print("OK    : MessageBox « Good Job. » / « Yup »")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
