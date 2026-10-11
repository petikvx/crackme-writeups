#!/usr/bin/env python3
"""Keygen lincrkme_01 (crackmes.de / digitalbyte) — Linux ELF32.

serial = username inversé (le '\n' de fgets est exclu) ; username >= 6 caractères.
Anti-debug : ptrace(PTRACE_TRACEME) dans __do_global_dtors_inx -> sous gdb,
le flag 0x8049904 passe à 1 et main affiche toujours « username too short!! ».

Usage : solve.py [NAME]   (défaut : petikvx, car « petik » fait 5 caractères)
        solve.py --check NAME SERIAL
"""
import sys

def keygen(name: str) -> str:
    if len(name) < 6:
        raise ValueError("username trop court (>= 6 caractères requis)")
    return name[::-1]

if __name__ == "__main__":
    a = sys.argv[1:]
    if a[:1] == ["--check"]:
        ok = keygen(a[1]) == a[2]
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    name = a[0] if a else "petikvx"
    print(f"{name} / {keygen(name)}")
