#!/usr/bin/env python3
"""Solveur qcrk_2 by qnix (id 5ab77f5333c5d40ad448c0f5).

Pas de comparaison de clé : la fonction gagnante `crap` @ 0x08048686
(qui affiche « ---[[[ CRACKED ]]]--- ») n'est JAMAIS appelée par le flot
normal. On y arrive par débordement de pile.

main copie argv[2] via snprintf(buf2, 0xc00, "%s", argv[2]) dans un tampon
de 0x800 octets situé à ebp-0x808 : écrire plus de 0x800 octets déborde
jusqu'à l'adresse de retour sauvegardée (ebp+4), à l'offset 0x80c = 2060.
On remplit donc 2060 octets puis on écrase le retour par &crap (0x08048686).

argv[1] est quelconque (strlen <= 0x3ff). Pas de canari (GCC 3.4.4 sans SSP
actif), binaire non-PIE : l'adresse de crap est fixe.
"""
from __future__ import annotations

import argparse
import os
import pty
import select
import struct
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
BIN = HERE.parent / "analysis" / "qcrk2"

CRAP = 0x08048686
OFFSET = 2060
PAYLOAD = b"A" * OFFSET + struct.pack("<I", CRAP)


def run_live() -> str:
    """Lance le binaire d'origine via un PTY (stdout ligne-bufferisé), pour
    que « CRACKED » soit flushé avant le SIGSEGV qui suit crap."""
    out = bytearray()
    pid, fd = pty.fork()
    if pid == 0:
        os.execv(str(BIN), [str(BIN), b"petik", PAYLOAD])
        os._exit(127)
    try:
        while True:
            r, _, _ = select.select([fd], [], [], 3)
            if not r:
                break
            try:
                d = os.read(fd, 4096)
            except OSError:
                break
            if not d:
                break
            out.extend(d)
    finally:
        os.waitpid(pid, 0)
    return out.decode(errors="replace")


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("-q", action="store_true", help="payload brut sur stdout")
    p.add_argument("--check", action="store_true", help="exécute le binaire live")
    args = p.parse_args()
    if args.q:
        sys.stdout.buffer.write(PAYLOAD)
        return 0
    print(f"argv[1] = petik (quelconque)")
    print(f"argv[2] = 'A'*{OFFSET} + &crap(0x{CRAP:08x})  (len {len(PAYLOAD)})")
    print("usage : ./qcrk2 petik \"$(python3 tools/qcrk_2-solve.py -q)\"")
    if not args.check:
        return 0
    out = run_live()
    if "CRACKED" not in out:
        print(out, file=sys.stderr)
        return 1
    print("check: OK — ---[[[ CRACKED ]]]--- affiché par crap")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
