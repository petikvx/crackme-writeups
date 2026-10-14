#!/usr/bin/env python3
"""qhfs_crackme1 by qhf — crackmes.one 5ab77f5633c5d40ad448c2bd : keygen name→serial.

Alphabet (37 chars, répété 3× en .rdata @0x443000) :
  AJXGRFV6BKOW3Y9TM4S2ZU I70H5Q81PDECLN

Pour i in 0..3 :
  name_char = name.upper()[len//4 * (i+1) - 1]
  pour chacun des 3 caractères serial[i*3 .. i*3+2] :
    |pos(serial_c) - pos(name_char)| <= 5   (pos = index dans l'alphabet)

Exemple minimal : répéter name_char trois fois → petik → PPPEEETTTIII

  ./qhfs_crackme1-solve.py petik
  ./qhfs_crackme1-solve.py -q petik
  ./qhfs_crackme1-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
BIN = HERE.parent / "original" / "crackme1.exe"
ALPH = "AJXGRFV6BKOW3Y9TM4S2ZU I70H5Q81PDECLN"
assert len(ALPH) == 37 and len(set(ALPH)) == 37


def keygen(name: str) -> str:
    name = name.upper()
    if len(name) <= 3:
        raise ValueError("name must be longer than 3 chars")
    q = len(name) // 4
    out: list[str] = []
    for i in range(4):
        nc = name[q * (i + 1) - 1]
        if nc not in ALPH:
            raise ValueError(f"name char {nc!r} not in alphabet")
        # 3 chars at distance 0 (toujours valide ; d'autres offsets ∈ [-5,5] OK)
        out.append(nc * 3)
    return "".join(out)


def check_pred(name: str, serial: str) -> bool:
    name, serial = name.upper(), serial.upper()
    if len(serial) != 12:
        return False
    q = len(name) // 4
    for i in range(4):
        np = ALPH.index(name[q * (i + 1) - 1])
        for j in range(i * 3, i * 3 + 3):
            if abs(ALPH.index(serial[j]) - np) > 5:
                return False
    return True


def wine_run(name: str, serial: str, timeout: float = 8.0) -> str:
    r = subprocess.run(
        ["xvfb-run", "-a", "wine", str(BIN)],
        input=f"{name}\n{serial}\n",
        capture_output=True,
        text=True,
        timeout=timeout,
    )
    return (r.stdout or "") + (r.stderr or "")


def main() -> None:
    ap = argparse.ArgumentParser(description="keygen qhfs_crackme1 (qhf)")
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true", help="serial seulement")
    ap.add_argument("--check", action="store_true", help="vérifie prédicat + wine")
    a = ap.parse_args()
    serial = keygen(a.name)
    if a.q and not a.check:
        print(serial)
        return
    if not a.check:
        print(f"{a.name} → {serial}")
        return
    ok = True
    for name, want in ((a.name, True), ("quinton", True), ("petik", False)):
        s = keygen(name) if want else "AAAAAAAAAAAA"
        pred = check_pred(name, s)
        print(f"pred {name!r:10} {s!r:14} → {pred} {'OK' if pred == want else 'KO'}")
        ok &= pred == want
    if BIN.is_file():
        for name, s, want_good in (
            ("petik", keygen("petik"), True),
            ("petik", "AAAAAAAAAAAA", False),
        ):
            out = wine_run(name, s)
            got = "Good job" in out
            print(f"wine {name!r}/{s!r}: {'Good' if got else 'Wrong'} {'OK' if got == want_good else 'KO'}")
            ok &= got == want_good
    else:
        print("binaire absent, skip wine", file=sys.stderr)
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
