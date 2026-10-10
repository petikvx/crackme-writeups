#!/usr/bin/env python3
"""Keygen keygenme_by_d0min4ted (d0min4ted) — reimplementation de Form1.asd()."""
import sys

def serial(name: str) -> int:
    if len(name) < 4:
        raise ValueError("nom >= 4 caracteres")
    h = "".join(f"{ord(c):X}" for c in name)[::-1][:9]
    if not h.isdigit():  # Convert.ToInt32 lance FormatException sinon
        raise ValueError(f"hex inverse '{h}' non decimal : nom inutilisable")
    return int(h) * len(name) ** 3

if __name__ == "__main__":
    for n in (sys.argv[1:] or ["petik", "PETIK", "PETI"]):
        try:
            print(f"{n!r:10} -> {serial(n)}")
        except ValueError as e:
            print(f"{n!r:10} -> {e}")
