#!/usr/bin/env python3
"""Quite a simple crackme (sftmlg) -- mot de passe en clair.

Visible directement dans `strings` (hint de l'auteur : "stored in plain
text, does not contain any letters uppercase, or lowercase").

Usage : quite-simple-solve.py [-q]
"""
import argparse

PASSWORD = "@!#-3~&,$;7?/.:%42+`"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    print(PASSWORD if a.q else f"mot de passe = {PASSWORD!r}")


if __name__ == "__main__":
    main()
