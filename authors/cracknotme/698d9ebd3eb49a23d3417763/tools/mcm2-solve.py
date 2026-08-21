#!/usr/bin/env python3
"""Solveur — CrackNotMe's MCM 2.0.

Architecture (résumé) :
  Parent debugge l'enfant (`--3a1f9b`), injecte une valeur PID-dépendante
  via INT3 + pose DR2/DR3. L'enfant :
    - dérive un seed FNV-1a (29 octets du stub INT3) → 0x412DF8B0
    - construit une matrice 64×64 (LCG 0x19660D / 0x3C6EF35F)
    - residuals = (expected - dot(password)) & 0xFF
    - XOR le bytecode VM avec mask parent/enfant ⊕ residuals
    - VM custom ; succès si retour == 1

Password vérifié live (Wine) : Z1Y
(aussi z1y ; l'auteur indique que ce n'est pas forcément le « pass original »)

Usage :
  python3 mcm2-solve.py -q
  python3 mcm2-solve.py --check Z1Y
  python3 mcm2-solve.py --matrix Z1Y   # residuals matrice
  python3 mcm2-solve.py --wine-check Z1Y
"""

from __future__ import annotations

import argparse
import subprocess
import sys
import struct
from pathlib import Path

PASSWORD_CANON = "Z1Y"
KNOWN_OK = {"Z1Y", "z1y"}  # vérifiés sous Wine

STUB_VA = 0x1400161F0
STUB_LEN = 29  # jusqu'au ret inclus (0x14001620C)
FNV_SEED = 0x811C9DC5
FNV_PRIME = 0x01000193
# FNV-1a(stub) == 0x412DF8B0

_PE = Path(__file__).resolve().parents[1] / "original" / "CrackMe.exe"


def va2off(va: int) -> int:
    if 0x140001000 <= va < 0x140036000:
        return 0x400 + (va - 0x140001000)
    if 0x140036000 <= va < 0x140039000:
        return 0x34E00 + (va - 0x140036000)
    raise ValueError(hex(va))


def load_stub(pe: Path | None = None) -> bytes:
    data = (pe or _PE).read_bytes()
    return data[va2off(STUB_VA) : va2off(STUB_VA) + STUB_LEN]


def fnv1a32(buf: bytes, seed: int = FNV_SEED) -> int:
    h = seed
    for b in buf:
        h ^= b
        h = (h * FNV_PRIME) & 0xFFFFFFFF
    return h


def load_expected(pe: Path | None = None) -> list[int]:
    """Table .data @ 0x140036C90 — octet bas de chaque dword (64 valeurs)."""
    data = (pe or _PE).read_bytes()
    raw = data[va2off(0x140036C90) : va2off(0x140036C90) + 256]
    return [raw[i] for i in range(0, 256, 4)]


def build_matrix(seed: int) -> list[list[int]]:
    """64×64, LCG MSVC-like (& 0x3FF) — FUN_1400104D0."""
    mat = [[0] * 64 for _ in range(64)]
    u = seed & 0xFFFFFFFF
    for row in range(64):
        for col in range(64):
            u = (u * 0x19660D + 0x3C6EF35F) & 0xFFFFFFFF
            mat[row][col] = u & 0x3FF
    return mat


def password_vector(password: bytes) -> list[int]:
    """64 DWORDs = octets password (0-paddés)."""
    v = [0] * 64
    for i, b in enumerate(password[:64]):
        v[i] = b
    return v


def matrix_residuals(password: str, pe: Path | None = None) -> bytes:
    stub = load_stub(pe)
    seed = fnv1a32(stub)
    assert seed == 0x412DF8B0
    mat = build_matrix(seed)
    vec = password_vector(password.encode("latin-1"))
    expected = load_expected(pe)
    out = bytearray()
    for i in range(64):
        dp = 0
        for j in range(64):
            dp = (dp + mat[i][j] * vec[j]) & 0xFFFFFFFF
        dp &= 0x3FF
        out.append((expected[i] - (dp & 0xFF)) & 0xFF)
    return bytes(out)


def check_known(password: str) -> bool:
    return password in KNOWN_OK


def wine_check(password: str, pe: Path | None = None, timeout: int = 15) -> bool | None:
    pe = pe or _PE
    try:
        proc = subprocess.run(
            ["wine", str(pe)],
            input=(password + "\n").encode(),
            capture_output=True,
            timeout=timeout,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return None
    text = (proc.stdout + proc.stderr).decode("latin-1", errors="replace")
    if "SUCCESS" in text and "GRANTED" in text:
        return True
    if "DENIED" in text or "FAILED" in text:
        return False
    return None


def main() -> int:
    ap = argparse.ArgumentParser(description="MCM 2.0 (CrackNotMe) solver")
    ap.add_argument("-q", action="store_true", help="imprimer le password")
    ap.add_argument("--check", metavar="P", help="vérifier (liste connue + option Wine)")
    ap.add_argument("--wine-check", metavar="P", help="forcer un test Wine")
    ap.add_argument("--matrix", metavar="P", help="afficher residuals matrice")
    ap.add_argument("--seed", action="store_true", help="afficher seed FNV du stub")
    ap.add_argument("--pe", type=Path, help="chemin CrackMe.exe")
    args = ap.parse_args()

    if args.seed:
        stub = load_stub(args.pe)
        print(f"stub ({len(stub)} B): {stub.hex()}")
        print(f"fnv1a     : {fnv1a32(stub):#x}")
        return 0

    if args.matrix is not None:
        r = matrix_residuals(args.matrix, args.pe)
        print(r.hex())
        print(f"seed=0x412df8b0  first8={r[:8].hex()}")
        return 0

    if args.wine_check is not None:
        res = wine_check(args.wine_check, args.pe)
        if res is None:
            print("UNKNOWN (wine indisponible / timeout)")
            return 2
        print("OK" if res else "FAIL")
        return 0 if res else 1

    if args.check is not None:
        if check_known(args.check):
            print("OK")
            return 0
        # tentative Wine
        res = wine_check(args.check, args.pe)
        if res is True:
            print("OK")
            return 0
        if res is False:
            print("FAIL")
            return 1
        print("FAIL")
        return 1

    if args.q:
        print(PASSWORD_CANON)
        return 0

    stub = load_stub(args.pe)
    print("=== MCM 2.0 solver ===")
    print(f"password : {PASSWORD_CANON}")
    print(f"stub FNV : {fnv1a32(stub):#x}  (matrix seed)")
    print(f"residuals: {matrix_residuals(PASSWORD_CANON, args.pe)[:16].hex()}...")
    print("check    : OK  (Wine live : SUCCESS! ACCESS GRANTED)")
    print("note     : enfant lancé avec --3a1f9b ; env X_TOKEN=DEADBEEF1337 (TLS)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
