#!/usr/bin/env python3
"""exceptional (crp) — id 5ab77f5833c5d40ad448c39a. ELF32 C++ : le flot de contrôle passe par des
exceptions typées (except<int>, except<bool>, except<string>, except<vector<vector<int>>>, ok, ko).

Pour name != "Simon Templar" (len L >= 3) la clé est une chaîne de L chiffres :
  pour i = 0 .. L-1 :
      s  = name ; appliquer std::next_permutation(s) (name[i]*i) fois        (@0x80490d8 / 0x804a494)
      s  = rotate_gauche(s, i)                                                (@0x804a374)
      row_i = [ (signed char)c for c in s ]
  puis (@0x804916c) pour chaque ligne r :  e <- m_r * (e + r + 1)  avec m_r = 11 si r impair sinon 3r+3
  puis (handler @0x8049a21, sub 0x804a2b0) : e <- name[r] * e   (movsx)
  chiffre_r = (Σ row_r) % 10            (@0x8048ec0)  ;   key = ''.join(chiffre_r)
  La clé est comparée (memcmp, @0x804905c) à ce résultat : key == digits -> « accepted ».

  exceptional-solve.py [name] [-q] [--check]       (défaut name = petik)
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "exceptional" / "exceptional"


def next_perm(a: bytearray) -> bool:
    i = len(a) - 1
    while i > 0:
        if a[i - 1] < a[i]:
            break
        i -= 1
    if i <= 0:
        a.reverse()
        return False
    j = len(a) - 1
    while a[j] <= a[i - 1]:
        j -= 1
    a[i - 1], a[j] = a[j], a[i - 1]
    a[i:] = a[i:][::-1]
    return True


def keygen(name: str) -> str:
    b = name.encode()
    L = len(b)
    key = ""
    for r in range(L):
        s = bytearray(b)
        for _ in range(b[r] * r):
            next_perm(s)
        s = s[r:] + s[:r]
        m = 11 if r % 2 else 3 * r + 3
        sc = lambda x: x - 256 if x > 127 else x
        tot = sc(b[r]) * sum(m * (sc(c) + r + 1) for c in s)      # handler @0x8049a21 : x name[r]
        key += str(tot % 10)
    return key


def run(name, key):
    return subprocess.run([str(BIN)], input=f"{name}\n{key}\n", capture_output=True, text=True).stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen(a.name)
    print(k if a.q else f"name: {a.name}\nkey : {k}")
    if a.check:
        ok = "accepted" in run(a.name, k)
        bad = "failed" in run(a.name, k[:-1] + str((int(k[-1]) + 1) % 10))
        print("check:", "OK" if ok and bad else "KO", f"(accepted={ok}, clé altérée→failed={bad})")
        sys.exit(0 if ok and bad else 1)


if __name__ == "__main__":
    main()
