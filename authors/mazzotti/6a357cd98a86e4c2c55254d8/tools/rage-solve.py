#!/usr/bin/env python3
"""
Mazzotti's Rage keygen (crackme)
ELF64 PIE, C++ (libstdc++), stripped. Une seule chaine lue (cin >> s,
donc sans espace), transformee EN PLACE par XOR, puis :
  1) somme des octets (signed, movsx) de la chaine transformee == 0x2dc (732)
  2) la chaine transformee est ensuite parsee par std::stoi (strtol) ;
     seul le PREFIXE numerique compte (stoi ignore le reste) ; la valeur
     entiere obtenue doit valoir 13 modulo 27 (x % 27 == 13).

Transformation @ 0x14b0 (taille N = s.size(), doit etre >= 8) :
  v = s[N-3]                       (octet ORIGINAL, avant toute modif)
  s[0]  ^= v
  s[i]  ^= (v + i) & 0xFF          pour i = 1 .. N-1

On choisit la sortie desiree T (chaine transformee) :
  T[0], T[1] = '1', '3'            -> stoi() lit 13 -> 13 % 27 == 13 OK
  T[N-3]      = impose par v (pas libre)
  autres T[i] = libres, choisis pour que la somme totale vaille 732
               et que T[2] ne soit pas un chiffre (sinon stoi lirait
               plus que "13")

On recherche v (0..255) tel que l'equation sur l'indice special soit
compatible, puis on inverse T -> s original (= ce qu'il faut taper /
envoyer sur stdin). Le resultat contient generalement un octet non
imprimable (ex. 0x00) : pas tapable au clavier, mais parfaitement valide
envoye sur stdin (ce que fait ce script, et ce qu'accepte std::cin >> s
qui ne s'arrete que sur les espaces/retours a la ligne).

Usage :
    python3 tools/rage-solve.py --check
    python3 tools/rage-solve.py -q | xxd
"""
import argparse
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "crackme"

TARGET_SUM = 0x2DC  # 732
WHITESPACE = {0x20, 0x09, 0x0A, 0x0B, 0x0C, 0x0D}


def mask(v: int, i: int) -> int:
    return (v + i) & 0xFF


def sbyte(b: int) -> int:
    return b - 256 if b >= 128 else b


def find_payload(n: int, avoid_null: bool = False):
    special = n - 3
    if special < 2:
        return None
    for v in range(256):
        t_special = v ^ mask(v, special)
        free_positions = [i for i in range(2, n) if i != special]
        needed = TARGET_SUM - ord("1") - ord("3") - sbyte(t_special)
        k = len(free_positions)
        if k == 0:
            continue
        if not (-100 * k <= needed <= 100 * k):
            continue
        base, rem = divmod(needed, k) if needed >= 0 else (needed // k, needed % k)
        # distribution simple : base partout, ajustement sur les premiers
        base = needed // k
        rem = needed - base * k
        vals = [base] * k
        step = 1 if rem >= 0 else -1
        for idx in range(abs(rem)):
            vals[idx] += step
        if sum(vals) != needed or not all(-100 <= x <= 100 for x in vals):
            continue

        T = [0] * n
        T[0], T[1] = ord("1"), ord("3")
        T[special] = t_special
        for p, val in zip(free_positions, vals):
            T[p] = val & 0xFF
        if 0x30 <= T[2] <= 0x39:
            continue  # ne doit pas prolonger le "13" en un nombre plus grand
        if sum(sbyte(b) for b in T) != TARGET_SUM:
            continue

        O = [None] * n
        O[special] = v
        O[0] = T[0] ^ v
        for i in range(1, n):
            if i == special:
                continue
            O[i] = T[i] ^ mask(v, i)

        buf = O[:]
        buf[0] ^= v
        for i in range(1, n):
            buf[i] ^= mask(v, i)
        if buf != T:
            continue
        if any(b in WHITESPACE for b in O):
            continue
        if avoid_null and any(b == 0 for b in O):
            continue
        return bytes(O), bytes(T)
    return None


def build_payload():
    for n in range(8, 16):
        res = find_payload(n)
        if res:
            return res
    raise RuntimeError("aucune charge utile trouvee (bug dans le solveur ?)")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que les octets a envoyer (hex)")
    ap.add_argument("--check", action="store_true", help="execute le binaire et verifie le succes")
    args = ap.parse_args()

    payload, transformed = build_payload()

    if not args.quiet:
        print(f"[+] octets a envoyer (stdin) : {payload.hex()}")
        print(f"[+] apres transformation XOR : {transformed!r} (somme = {sum(sbyte(b) for b in transformed)})")
    else:
        print(payload.hex())

    if args.check:
        proc = subprocess.run(
            [str(args.binary)],
            input=payload + b"\n",
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=5,
        )
        out = proc.stdout.decode(errors="replace")
        if not args.quiet:
            print("----- sortie du programme -----")
            print(out.strip())
            print("--------------------------------")
        ok = "Good job" in out
        print("CHECK:", "OK" if ok else "FAIL", file=sys.stderr)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
