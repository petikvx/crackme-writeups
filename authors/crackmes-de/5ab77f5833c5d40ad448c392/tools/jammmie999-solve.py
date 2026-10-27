#!/usr/bin/env python3
"""Keygen pour CrackMe.exe (jammmie999) — SoftwareLocker TrialMaker.

Le "serial" dépend de l'ID affiché par la boîte de dialogue (base string,
25 lettres/chiffres majuscules liés au matériel). Identifier = "999".

  jammmie999-solve.py <ID>           -> serial
  jammmie999-solve.py -q <ID>        -> serial seul
  jammmie999-solve.py --check        -> auto-test sur vecteurs (valeurs issues
                                        de la vraie DLL, voir README)
Exemple (ID de démonstration dérivé de "petik") : voir --demo.
"""
import argparse
import sys

IDENT = "999"


def boring(st: str) -> str:
    s = list(st)
    n = len(s)
    for i in range(n):
        num = (i * ord(s[i])) % n
        c = s.pop(i)
        s.insert(num, c)
    return "".join(s)


def inverse_by_base(st: str, base: int) -> str:
    out = []
    i = 0
    while i < len(st):
        ln = base if i + base <= len(st) - 1 else len(st) - i
        out.append(st[i:i + ln][::-1])
        i += base
    return "".join(out)


def change_char(ch: str, e) -> str:
    ch = ch.upper()
    o = ord(ch)
    if 'A' <= ch <= 'H':
        return chr(o + 2 * e[0])
    if 'I' <= ch <= 'P':
        return chr(o - e[2])
    if 'Q' <= ch <= 'Z':
        return chr(o - e[1])
    if '0' <= ch <= '4':
        return chr(o + 5)
    if '5' <= ch <= '9':
        return chr(o - 5)
    return '0'


def make_password(base: str, ident: str = IDENT) -> str:
    e = [int(c) for c in ident]
    st = boring(base)
    for b in e:
        st = inverse_by_base(st, b)
    return "".join(change_char(c, e) for c in st)


def hw_id(info: str) -> str:
    """ID affiché = Boring(InverseByBase(info25, 10)) (info25 = infos matériel)."""
    return boring(inverse_by_base(info, 10))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("id", nargs="?")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--demo", action="store_true", help="ID dérivé de 'petik'")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        import json, os
        p = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "analysis", "vectors.json")
        for k, v in json.load(open(p)).items():
            r = make_password(k)
            print(k, r, "OK" if r == v else "KO (attendu %s)" % v)
            if r != v:
                sys.exit(1)
        return
    if a.demo:
        a.id = hw_id(("PETIK" * 5)[:25])
    if not a.id:
        ap.error("ID requis")
    pw = make_password(a.id.strip().upper())
    print(pw if a.q else "ID %s -> serial %s" % (a.id, pw))


if __name__ == "__main__":
    main()
