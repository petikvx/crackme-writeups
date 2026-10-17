#!/usr/bin/env python3
"""jeffli6789 — bubbly : calcule une sequence d'index de swaps adjacents qui
trie le tableau fige dword_201020 (20 entiers, vu via IDA) ; le binaire lit
un index par scanf, echange arr[i]<->arr[i+1] (XOR swap), relance le check de
tri a chaque tour et affiche "Well done!" + cat flag.txt une fois trie.

Usage : bubbly-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "main"
ARR = [1, 2, 6, 0, 3, 5, 4, 8, 7, 12, 9, 10, 13, 17, 11, 18, 14, 19, 16, 15]


def bubble_swaps(arr: list[int]) -> list[int]:
    a = list(arr)
    swaps = []
    changed = True
    while changed:
        changed = False
        for i in range(len(a) - 1):
            if a[i] > a[i + 1]:
                a[i], a[i + 1] = a[i + 1], a[i]
                swaps.append(i)
                changed = True
    return swaps


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la liste d'index")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    swaps = bubble_swaps(ARR)
    if a.q:
        print(" ".join(map(str, swaps)))
        return 0
    print(f"{len(swaps)} swaps : {swaps}")
    if a.check:
        stdin = "\n".join(map(str, swaps)) + "\n"
        r = subprocess.run([str(EXE)], input=stdin, capture_output=True, text=True)
        ok = "Well done!" in r.stdout
        print("check:", "OK" if ok else "KO", "-", r.stdout.strip().splitlines()[-2:])
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
