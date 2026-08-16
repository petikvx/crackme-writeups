#!/usr/bin/env python3
"""Solveur timotei-crackme-12 — serial « n1-n2 » (sub_40112F).

Format UI : un champ Serial, défaut « 1234-5678 », bouton &Check.

Prédicat (msvcrt atoi + somme des diviseurs propres) :
  n1 = atoi(serial)           # s'arrête au '-'
  n2 = atoi(après le premier '-')
  s(n) = Σ { d | 1 ≤ d < n, n % d == 0 }   # boucle @ 0x4011D5
  succès ⇔ s(n1) == n2  et  s(n2) == n1

Donc (n1, n2) est une **paire amiable**, ou un **nombre parfait** si n1 == n2.

Exemples :
  220-284   (classique)
  284-220
  6-6       (parfait)
  28-28

Usage :
  python3 timotei-crackme-12-solve.py
  python3 timotei-crackme-12-solve.py 220-284
  python3 timotei-crackme-12-solve.py --check 1234-5678
"""

from __future__ import annotations

import re
import sys

# paires amiables / parfaits usuels (petits, OK pour la boucle O(n))
KNOWN = [
    (6, 6),
    (28, 28),
    (220, 284),
    (284, 220),
    (496, 496),
    (1184, 1210),
    (1210, 1184),
    (2620, 2924),
    (2924, 2620),
    (5020, 5564),
    (5564, 5020),
    (6232, 6368),
    (6368, 6232),
    (8128, 8128),
]


def c_atoi(s: str) -> int:
    m = re.match(r"^[+-]?\d+", s)
    if not m:
        return 0
    return int(m.group())


def aliquot(n: int) -> int:
    """Somme des diviseurs propres, comme 0x4011D5 (ebx = 1 .. n-1)."""
    if n <= 1:
        return 0
    # n peut être négatif si le serial commence par '-'
    if n < 0:
        # div non signée dans le binaire → comportement différent ;
        # on reste sur le cas positif usuel.
        n = n & 0xFFFFFFFF
    s = 0
    for b in range(1, n):
        if n % b == 0:
            s += b
    return s


def parse_serial(serial: str) -> tuple[int, int] | None:
    if not serial or "-" not in serial:
        return None
    n1 = c_atoi(serial)
    idx = serial.find("-")
    n2 = c_atoi(serial[idx + 1 :])
    return n1, n2


def serial_ok(serial: str) -> tuple[bool, dict]:
    info: dict = {"serial": serial}
    if not serial:
        return False, {**info, "reason": "empty"}
    parsed = parse_serial(serial)
    if not parsed:
        return False, {**info, "reason": "no '-'"}
    n1, n2 = parsed
    s1, s2 = aliquot(n1), aliquot(n2)
    info.update(n1=n1, n2=n2, s_n1=s1, s_n2=s2)
    if s1 != n2:
        return False, {**info, "reason": f"s(n1)={s1} != n2={n2}"}
    if s2 != n1:
        return False, {**info, "reason": f"s(n2)={s2} != n1={n1}"}
    kind = "perfect" if n1 == n2 else "amicable"
    return True, {**info, "kind": kind}


def main() -> int:
    args = [a for a in sys.argv[1:] if not a.startswith("-") or a in ("--check",)]
    # simple argv
    argv = sys.argv[1:]
    print("=== timotei-crackme-12-solve.py ===")
    print("serial n1-n2 : s(n1)==n2 && s(n2)==n1  (amiable / parfait)\n")

    if argv and argv[0] in ("-h", "--help"):
        print(__doc__)
        return 0

    if argv and argv[0] == "--check":
        if len(argv) < 2:
            print("usage: --check SERIAL", file=sys.stderr)
            return 2
        ok, info = serial_ok(argv[1])
        print("OK" if ok else "FAIL", info)
        return 0 if ok else 1

    if argv:
        # afficher / vérifier les serials donnés
        rc = 0
        for s in argv:
            ok, info = serial_ok(s)
            status = "Registered" if ok else "Unregistered"
            print(f"  {s:20} → {status}  {info}")
            if not ok:
                rc = 1
        return rc

    print("exemples valides :")
    for a, b in KNOWN:
        s = f"{a}-{b}"
        ok, info = serial_ok(s)
        print(f"  {s:16}  ({info.get('kind')})  ok={ok}")

    print()
    print("défaut UI 1234-5678 →", serial_ok("1234-5678")[0])
    print()
    print("recommandé : 220-284")
    print("  wine timotei-crackme-12.exe   # Serial: 220-284  → Check")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
