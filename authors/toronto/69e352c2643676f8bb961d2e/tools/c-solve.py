#!/usr/bin/env python3
"""c (Toronto) -- mot de passe en dur, encode en hex dans le binaire.

main() decode deux chaines via sub_12A0 (hex ASCII -> octets, 2 car. hex / octet) :
  - off_4100 = "Enter password: "       (prompt)
  - off_4118 = "Shake it, baby!"        (mot de passe attendu, compare via strcmp)
Le reste (sub_1330, 20 chaines "deadbeef", "secret_key", "fake_key", ... a
off_4060) est un leurre : decode pour i%3==0 mais le resultat n'est jamais
utilise (juste pour polluer un dump de strings/decompile naif).

Usage : c-solve.py [-q]
"""
import argparse

PASSWORD = "Shake it, baby!"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    print(PASSWORD if a.q else f"mot de passe = {PASSWORD!r}")


if __name__ == "__main__":
    main()
