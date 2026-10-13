#!/usr/bin/env python3
"""hypercrackme3 by thehyper (crackmes.de) — keygen.

Le serial est transformé en chaîne de chiffres (lettre/ponctuation -> 2 chiffres
(c//10)%10, c%10 ; chiffre -> lui-même), puis lu par paires : chaque paire
« ab » redonne le caractère chr(10*a+b).  Le résultat doit égaler le nom
(comparaison insensible à la casse).  Donc serial = code ASCII décimal (2
chiffres) de chaque caractère du nom en majuscule.

Contraintes sur le nom : >= 5 caractères, codes majuscules < 100 (A-Z, chiffres,
ponctuation courante), et chaque lettre au plus len(nom)//2 - 1 fois.

  ./hypercrackme3-solve.py [nom]        # défaut : petik
  ./hypercrackme3-solve.py -q petik
  ./hypercrackme3-solve.py --check NOM SERIAL
"""
import sys

def name_ok(name: str) -> bool:                       # len >= 5 + sub_401150
    if len(name) < 5:
        return False
    lim = (len(name) >> 1) - 1
    cnt = {}
    for c in name:
        if c.isascii() and c.isalpha():
            cnt[c.upper()] = cnt.get(c.upper(), 0) + 1
    return all(v <= lim for v in cnt.values())

def transform(serial: str) -> str:                    # 0x4012D7..0x4014CE
    digits = []
    for c in serial:
        o = ord(c)
        if 0x41 <= o <= 0x5A or 0x39 < o < 0x41 or 0x61 <= o <= 0x7A:
            digits += [(o // 10) % 10, o % 10]
        elif 0x30 <= o <= 0x39:
            digits.append(o - 0x30)
    return "".join(chr(10 * digits[2 * k] + digits[2 * k + 1]) for k in range(len(digits) // 2))

def check(name: str, serial: str) -> bool:
    return name_ok(name) and transform(serial).upper() == name.upper()

def keygen(name: str) -> str:
    if not name_ok(name):
        raise SystemExit("nom refusé (>=5 car., lettre répétée au plus len//2-1 fois)")
    out = ""
    for c in name.upper():
        if ord(c) >= 100:
            raise SystemExit(f"caractère {c!r} : code {ord(c)} >= 100, impossible")
        out += "%02d" % ord(c)
    assert check(name, out)
    return out

def main(argv):
    if len(argv) > 3 and argv[1] == "--check":
        ok = check(argv[2], argv[3]); print("OK" if ok else "KO"); return 0 if ok else 1
    q = "-q" in argv
    args = [a for a in argv[1:] if a != "-q"]
    name = args[0] if args else "petik"
    s = keygen(name)
    print(s if q else f"name={name}  serial={s}")
    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv))
