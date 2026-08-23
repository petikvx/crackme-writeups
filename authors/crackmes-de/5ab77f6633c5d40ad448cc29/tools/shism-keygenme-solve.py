#!/usr/bin/env python3
"""shism KeyGenMe 0.1 — name → serial (Asc last XOR Zastita key).

Le binaire d’origine reseed Zastita via GetTickCount à chaque clic, donc le
XOR change à chaque essai. Le keygen cible le modèle **à graine fixe**
(GetTickCount patché → 0x12345678), pour lequel la clé Zastita vaut :

    KEY = 0x2AA192C8

Formule (identique au binaire) :

    serial = Asc(username[-1]) XOR KEY

Exemple : user **petik** → serial **715231907**.

  ./shism-keygenme-solve.py -q
  ./shism-keygenme-solve.py --user petik
  ./shism-keygenme-solve.py --check
"""
from __future__ import annotations

import argparse
import sys

# GetTickCount forcé à 0x12345678 (voir analysis/SKeygen-fixedseed.exe)
FIXED_SEED_KEY = 0x2AA192C8


def keygen(name: str, key: int = FIXED_SEED_KEY) -> int:
    if not (5 <= len(name) <= 7):
        # Messages UI : >4 et <8 ; le code tolère jusqu’à 10, on reste sur l’UI.
        raise ValueError("username length must be 5..7 (UI)")
    return ord(name[-1]) ^ (key & 0xFFFFFFFF)


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--user", "--name", default="petik")
    ap.add_argument("--check", action="store_true", help="vérifie petik→715231907")
    ap.add_argument(
        "--key",
        type=lambda s: int(s, 0),
        default=FIXED_SEED_KEY,
        help="XOR key (default fixed-seed 0x2AA192C8)",
    )
    args = ap.parse_args()
    key = args.key & 0xFFFFFFFF

    if args.check:
        got = keygen("petik", key)
        ok = got == 715231907 and key == FIXED_SEED_KEY
        print(
            f"petik → {got} (expect 715231907) key=0x{key:08X} {'OK' if ok else 'FAIL'}"
        )
        return 0 if ok else 1

    try:
        serial = keygen(args.user, key)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.q:
        print(serial)
    else:
        print(f"user={args.user!r} serial={serial}")
        print(
            f"  Asc({args.user[-1]!r})={ord(args.user[-1])} XOR 0x{key:08X} = {serial}"
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
