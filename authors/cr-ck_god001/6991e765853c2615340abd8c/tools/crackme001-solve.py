#!/usr/bin/env python3
"""Solveur — Cr@ck_God001's Crackme (CrackMe.001_1.exe)

GUI Win32 (MSVC) : 4 champs numériques (stoi) + bouton Register.

Contrôles (GetDlgItemTextW) :
  ID 0x79 → A  ;  ID 0x7c → B  ;  ID 0x7a → C  ;  ID 0x7b → D

Prédicat (après pow / mulsd) :
  A == 8**4 * 0.25 == 1024
  C == 8**4 * 0.5  == 2048
  B == 4**8 * 0.125 == 8192
  D == 0x200 == 512

Chaque champ doit contenir au moins 4 caractères wide (ex. \"1024\").

Usage :
  python3 crackme001-solve.py -q
  python3 crackme001-solve.py --check
"""

from __future__ import annotations

import argparse
import sys

# Ordre des IDs dans le binaire (pas forcément l’ordre visuel/tab)
# Valeurs numériques + forme à saisir (≥ 4 caractères wide requis)
VALUES_BY_ID = {
    0x79: (1024, "1024"),  # A → r13 ; pow(8,4)*0.25
    0x7C: (8192, "8192"),  # B → r12 ; pow(4,8)*0.125
    0x7A: (2048, "2048"),  # C → r15 ; pow(8,4)*0.5
    0x7B: (512, "0512"),   # D → ebx ; cmp 0x200 (padding: len>=4)
}

# Ordre tab / saisie probable (IDs croissants 121..124)
TAB_ORDER_IDS = (0x79, 0x7A, 0x7B, 0x7C)


def values_tab_order() -> list[str]:
    return [VALUES_BY_ID[i][1] for i in TAB_ORDER_IDS]


def check() -> bool:
    a, b, c, d = (VALUES_BY_ID[i][0] for i in (0x79, 0x7C, 0x7A, 0x7B))
    texts = [VALUES_BY_ID[i][1] for i in (0x79, 0x7C, 0x7A, 0x7B)]
    return (
        a == 1024
        and b == 8192
        and c == 2048
        and d == 512
        and all(len(t) >= 4 for t in texts)
        and all(int(t) == v for t, v in zip(texts, (a, b, c, d)))
    )


def main() -> int:
    ap = argparse.ArgumentParser(description="CrackMe.001 solver")
    ap.add_argument("-q", action="store_true", help="4 valeurs (ordre tab IDs)")
    ap.add_argument("--check", action="store_true", help="vérifier le prédicat")
    ap.add_argument("--ids", action="store_true", help="afficher par control ID")
    args = ap.parse_args()

    tab = values_tab_order()
    if args.q:
        print(" ".join(tab))
        return 0

    if args.check:
        ok = check()
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    print("=== Cr@ck_God001 CrackMe.001 ===")
    print("tab order (IDs 0x79,0x7a,0x7b,0x7c):", " ".join(tab))
    if args.ids:
        for cid in TAB_ORDER_IDS:
            num, text = VALUES_BY_ID[cid]
            print(f"  ID {cid:#x} ({cid}) = {text} (int {num})")
    print("note   : 512 saisi comme 0512 (GetDlgItemText len >= 4)")
    print("result : Success (MessageBox) si les 4 égalités tiennent")
    return 0


if __name__ == "__main__":
    sys.exit(main())
