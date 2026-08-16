#!/usr/bin/env python3
"""Solveur / démonstrateur de timotei-crackme-04.

Ce n'est PAS un lanceur du crackme.

    ./timotei-crackme-04 +ORC     # et
    ./timotei-crackme-04 rt

font la même chose : rien. L'entry point ELF (0x401000) est un stub

    nop ; push 0x401069 ; ret     # jmp vers sys_exit

donc argv n'est jamais lu. Ce script sert à trois trucs que le binaire
d'origine ne montre pas :

1. Reconstruire le check (FNV-1 32 bits, 4 octets, cible 0x6FCD79A2)
   tel qu'il est à 0x40103A — pour vérifier un candidat sans lancer
   le process.
2. Prouver que +ORC est le seul mot imprimable de 4 octets qui matche
   (énumération 96^3 + inversion du dernier XOR).
3. Montrer la différence original vs check réel : copie temporaire,
   e_entry patché à 0x401007 (le vrai start), puis exec. L'original
   sur disque n'est pas modifié. Sans ce patch, +ORC et rt sont
   identiques (stdout vide, exit 0).

Usage :
    python3 timotei-crackme-04-solve.py

Sortie attendue, dans l'ordre :
    - constantes lues dans le listing
    - hash de quelques candidats (+ORC / +HCU / …)
    - brute : un seul hit, b'+ORC'
    - trace octet par octet du FNV-1 de +ORC
    - 3 lancers live :
          +ORC  sans patch  → b''            (le stub)
          +ORC  avec patch  → b'_.:solved:._\\n\\x00'
          +HCU  avec patch  → b''            (mauvais hash)
"""

from __future__ import annotations

import os
import string
import struct
import subprocess
import tempfile
from pathlib import Path

BINARY = Path(__file__).resolve().parent / "timotei-crackme-04"

# Constantes du listing à 0x40102E / 0x401033 / 0x401047.
OFFSET = 0x811C9DC5  # FNV-1 32-bit offset basis
PRIME = 0x01000193  # FNV-1 32-bit prime
TARGET = 0x6FCD79A2  # hash accepté (cmp eax, imm32)

# Vrai début du check. L'e_entry ELF vaut 0x401000 (le stub).
REAL_EP = 0x401007


def fnv1_32(data: bytes) -> int:
    """Même boucle que nextbyte @ 0x40103A : mul puis xor, 32 bits.

    Ce n'est pas FNV-1a (xor puis mul). Seuls les octets fournis
    comptent — ici le crackme en envoie exactement 4 (strlen == 4).
    """
    h = OFFSET
    for b in data:
        h = (h * PRIME) & 0xFFFFFFFF
        h ^= b
    return h


def fnv1_trace(data: bytes) -> None:
    """Affiche chaque étape, pour recoller au listing sans gdb."""
    print(f"\n===== FNV-1 {data!r}  (rejoue 0x40103A) =====")
    print(f"offset = 0x{OFFSET:08x}")
    print(f"prime  = 0x{PRIME:08x}")
    print(f"target = 0x{TARGET:08x}")
    h = OFFSET
    for i, b in enumerate(data):
        prod = (h * PRIME) & 0xFFFFFFFF
        h2 = prod ^ b
        print(f"byte[{i}] {b:#04x} {chr(b)!r}")
        print(f"  mul  0x{h:08x} * 0x{PRIME:08x} = 0x{prod:08x}")
        print(f"  xor  0x{prod:08x} ^ 0x{b:02x}     = 0x{h2:08x}")
        h = h2
    print("match" if h == TARGET else "NO MATCH", hex(h))


def brute_fnv_printable() -> list[bytes]:
    """Tous les mots imprimables de 4 octets qui hashent vers TARGET.

    On n'énumère pas 96^4. Le dernier xor s'inverse :

        (h3 * prime) XOR d == TARGET
        d = (h3 * prime) XOR TARGET

    96^3 tests, d gardé s'il est imprimable. Un seul hit : b'+ORC'.
    """
    alphabet = (string.ascii_letters + string.digits + string.punctuation + " ").encode(
        "ascii"
    )
    found: list[bytes] = []
    for a in alphabet:
        ha = ((OFFSET * PRIME) & 0xFFFFFFFF) ^ a
        for b in alphabet:
            hb = ((ha * PRIME) & 0xFFFFFFFF) ^ b
            for c in alphabet:
                hc = ((hb * PRIME) & 0xFFFFFFFF) ^ c
                d = ((hc * PRIME) & 0xFFFFFFFF) ^ TARGET
                if d < 256 and d in alphabet:
                    found.append(bytes([a, b, c, d]))
    return found


def patch_entry(src: Path, ep: int) -> Path:
    """Copie le binaire et écrit `ep` dans e_entry (ELF64, offset 0x18).

    L'original n'est pas touché. La copie va dans /tmp et le caller
    la supprime. Changer e_entry de 0x401000 à 0x401007 saute le
    `push out / ret` : le noyau démarre directement sur le check.
    """
    data = bytearray(src.read_bytes())
    data[0x18:0x20] = struct.pack("<Q", ep)
    fd, name = tempfile.mkstemp(prefix="cm04-", suffix=".bin")
    os.close(fd)  # sinon ETXTBSY au exec (fd encore ouvert)
    tmp = Path(name)
    tmp.write_bytes(data)
    tmp.chmod(0o755)
    return tmp


def run_binary(password: str, *, patch: bool) -> None:
    """Lance le crackme avec argv[1]=password.

    patch=False : binaire d'origine → toujours stdout vide.
    patch=True  : copie, e_entry=0x401007 → le FNV tourne vraiment.
    """
    if not BINARY.is_file():
        print(f"(binaire introuvable: {BINARY})")
        return
    bin_path = BINARY
    tmp: Path | None = None
    if patch:
        tmp = patch_entry(BINARY, REAL_EP)
        bin_path = tmp
    try:
        r = subprocess.run(
            [str(bin_path), password],
            capture_output=True,
            timeout=1,
        )
    except subprocess.TimeoutExpired:
        print(f"\n=== live pw={password!r} patch={patch} TIMEOUT ===")
        return
    finally:
        if tmp is not None:
            tmp.unlink(missing_ok=True)
    print(f"\n=== live pw={password!r} patch={patch} rc={r.returncode} ===")
    print(r.stdout)


def main() -> None:
    print("=== timotei-crackme-04-solve.py ===")
    print("Pas un wrapper de ./timotei-crackme-04 : ce script retrouve")
    print("le mot de passe et montre POURQUOI ./timotei-crackme-04 +ORC")
    print("ne dit rien (EP = stub vers exit).")
    print()
    print(f"target FNV-1 = 0x{TARGET:08x}")
    print(f"strlen exigé = 4  (sub ecx, 4 / jne out)")
    print(f"EP original  = 0x401000  (nop; push out; ret)  ← d'où le silence")
    print(f"vrai start   = {REAL_EP:#x}          ← où le FNV tourne")

    print("\n=== 1. candidats sémantiques (hash seul, pas d'exec) ===")
    for c in (b"+ORC", b"+HCU", b"HCU+", b"ORC+", b"Frav", b"Alex", b"King"):
        print(f"  {c!r:12} {fnv1_32(c):08x}  {fnv1_32(c) == TARGET}")

    print("\n=== 2. brute imprimable (dernier octet inversé) ===")
    hits = brute_fnv_printable()
    print("hits:", hits)

    fnv1_trace(b"+ORC")

    print("\n=== 3. live : original vs copie patchée (original intact) ===")
    run_binary("+ORC", patch=False)
    run_binary("+ORC", patch=True)
    run_binary("+HCU", patch=True)
    print("\nLecture : sans patch, +ORC == n'importe quoi.")
    print("          avec patch, seul +ORC écrit _.:solved:._")


if __name__ == "__main__":
    main()
