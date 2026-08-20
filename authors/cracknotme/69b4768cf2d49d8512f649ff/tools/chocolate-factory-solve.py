#!/usr/bin/env python3
"""Keygen / solveur — CrackNotMe's Willy Wonka's Chocolate Factory (PE32+).

Golden Ticket = 16 caractères (tirets/espaces ignorés), 4 groupes de 4 :

  Ch0c-M1lk-CrMe-????

  W1 Cocoa      : S-box BE dword == 0xc3811deb  → Ch0c  (unique alnum)
  W2 Milk       : sommes pondérées & 0xff        → M1lk  (unique alnum)
  W3 Caramel    : transform 16-bit → 0x16cb7cb  → CrMe  (unique alnum)
  W4 Packaging  : CRC-16 poly 0x1021 == 0       → 202 suffixes alnum

Le keygen tire un (ou N) tickets valides en combinant le préfixe fixe
avec un suffixe Packaging de la table précalculée.

Usage :
  python3 chocolate-factory-solve.py              # ticket canon + détail
  python3 chocolate-factory-solve.py -q           # un ticket
  python3 chocolate-factory-solve.py --keygen     # keygen (1 ticket aléatoire)
  python3 chocolate-factory-solve.py --keygen -n 10
  python3 chocolate-factory-solve.py --keygen --all
  python3 chocolate-factory-solve.py --check 'Ch0c-M1lk-CrMe-choT'
"""

from __future__ import annotations

import argparse
import random
import string
import sys
from pathlib import Path

MAGIC_W1 = 0xC3811DEB
TARGET_W3 = 0x16CB7CB
POLY = 0x1021

WEIGHTS = (
    3, 7, 2, 5,
    5, 3, 8, 1,
    2, 9, 1, 4,
    6, 1, 4, 7,
)
EXPECTED_W2 = (0x2D, 0xDF, 0x6B, 0x9C)

G1 = b"Ch0c"
G2 = b"M1lk"
G3 = b"CrMe"
G4_CANON = b"choT"

# Suffixes Packaging alphanum tels que CRC(A,B,C,D)==0 (anti-debug=0).
W4_ALNUM = (
    '08nM', '1Lco', '1MsN', '1ngO', '1own', '3O5n', '3m1N', '46CG', '47Sf', '4AM7',
    '4Cmu', '4Roe', '4aiU', '4bY6', '4pkE', '54P4', '56pv', '5BNe', '5Ql7', '5SLu',
    '5aZd', '5pXt', '5qHU', '5rx6', '6Q9d', '746V', '856I', '8B89', 'ALk6', 'ANKt',
    'AlOT', 'C83G', 'DAEn', 'DbQo', 'DcAN', 'E4Xm', 'E5HL', 'EPtO', 'EQdn', 'Erpo',
    'GR2o', 'Gp6O', 'HS2p', 'Hq6P', 'IA32', 'J4HS', 'J5Xr', 'J7x0', 'JAfa', 'JPdq',
    'JQtP', 'JRD3', 'JcbA', 'JqP2', 'Jspp', 'K5kC', 'KAUP', 'KBe3', 'KQGa', 'Kaq2',
    'KbAQ', 'KcQp', 'KsCA', 'L93X', 'NOKk', 'NmOK', 'OLH9', 'OOxZ', 'P8eg', 'P9uF',
    'PMKU', 'Pmo7', 'PoOu', 'Q8VV', 'Q9Fw', 'QLhE', 'QMxd', 'Qnle', 'Rn96', 'S804',
    'T6Hm', 'T7XL', 'TRdO', 'TStn', 'TqpN', 'UBEO', 'UCUn', 'UaQN', 'VQ2N', 'Vs6n',
    'YA0A', 'YP2Q', 'Yc4a', 'Yr6q', 'Z6kb', 'ZBUq', 'ZCEP', 'ZSWa', 'ZaAp', 'Zca2',
    'ZqSA', 'ak9U', 'bJXE', 'bKHd', 'bXj6', 'bZJt', 'biLD', 'bxNT', 'cHK6', 'cJkt',
    'cZyE', 'choT', 'cymD', 'dF3o', 'dd7O', 'fDuO', 'fEen', 'ffqo', 'fgaN', 'g0xm',
    'g1hL', 'gTTO', 'gUDn', 'gvPo', 'h0hS', 'h1xr', 'h3X0', 'hEFa', 'hTDq', 'hUTP',
    'hVd3', 'hgBA', 'hup2', 'hwPp', 'i1KC', 'iDeq', 'iEuP', 'iFE3', 'iUga', 'ieQ2',
    'ifaQ', 'igqp', 'iwcA', 'jU22', 'kG3p', 'ke7P', 'lKkk', 'lXI9', 'lioK', 'mHh9',
    'mKXZ', 'mZZJ', 'myNK', 'nj9J', 'ph9t', 'qz86', 'rIkU', 'rXiE', 'rYyd', 'riO7',
    'rkou', 'rzme', 'sHHE', 'sIXd', 'sXZt', 'sYJU', 'sZz6', 'sjLe', 'syn7', 'uE3N',
    'ug7n', 'v2hm', 'v3xL', 'vVDO', 'vWTn', 'vuPN', 'wFeO', 'wGun', 'wdao', 'weqN',
    'x2Kb', 'xDU3', 'xFuq', 'xGeP', 'xWwa', 'xdqQ', 'xeap', 'xgA2', 'xusA', 'y1H0',
    'y2xS', 'y3hr', 'yGVa', 'yTt3', 'yVTq', 'yWDP', 'yeRA', 'ytPQ', 'zD3Q', 'zU1A',
    'zf7q', 'zw5a',
)


assert G4_CANON.decode() in W4_ALNUM


def load_sbox(pe: Path | None = None) -> bytes:
    if pe is None:
        pe = Path(__file__).resolve().parents[1] / "original" / "ChocolateFactory.exe"
    data = pe.read_bytes()
    off = 0x19800 + (0x14001B560 - 0x14001B000)
    return data[off : off + 256]


def normalize(ticket: str) -> bytes:
    cleaned = ticket.replace("-", "").replace(" ", "")
    return cleaned.encode("latin-1", errors="replace")


def workshop1(group: bytes, sbox: bytes, anti: int = 0) -> int:
    if len(group) != 4:
        raise ValueError("W1 needs 4 bytes")
    v = 0
    for b in group:
        v = (v << 8) | sbox[(b ^ anti) & 0xFF]
    return v & 0xFFFFFFFF


def workshop2(group: bytes) -> bool:
    if len(group) != 4:
        return False
    for i in range(4):
        s = sum(WEIGHTS[i * 4 + j] * group[j] for j in range(4)) & 0xFF
        if s != EXPECTED_W2[i]:
            return False
    return True


def workshop3(group: bytes) -> int:
    t8, t9, t10, t11 = group
    r8 = (t10 << 8) | t11
    edx = (t8 << 8) | t9
    ecx = (r8 - 0x3502) & 0xFFFF
    eax = ((ecx << 5) | (ecx >> 11)) & 0xFFFF
    eax = (eax * 0x7A69) & 0xFFFF
    ecx = eax
    edx ^= ecx >> 7
    edx ^= ecx
    edx &= 0xFFFFFFFF
    eax = (edx - 0x3F40) & 0xFFFF
    edx = (edx << 16) & 0xFFFFFFFF
    ecx = eax
    eax = ((ecx << 5) | (ecx >> 11)) & 0xFFFF
    eax = (eax * 0x7A69) & 0xFFFF
    ecx = eax
    ebx = (ecx >> 7) ^ ecx
    ebx ^= r8
    ebx |= edx
    return ebx & 0xFFFFFFFF


def _crc_byte(reg: int, byte: int) -> int:
    reg = (reg ^ ((byte & 0xFF) << 8)) & 0xFFFF
    for _ in range(8):
        if reg & 0x8000:
            reg = ((reg << 1) ^ POLY) & 0xFFFF
        else:
            reg = (reg << 1) & 0xFFFF
    return reg


def workshop4(a: bytes, b: bytes, c: bytes, d: bytes) -> int:
    s = (sum(a) & 0xFF) ^ (sum(b) & 0xFF) ^ (sum(c) & 0xFF)
    reg = (~s) & 0xFFFF
    for byte in d:
        reg = _crc_byte(reg, byte)
    return reg


def check(ticket: str, sbox: bytes | None = None, anti: int = 0) -> bool:
    raw = normalize(ticket)
    if len(raw) != 16:
        return False
    if sbox is None:
        try:
            sbox = load_sbox()
        except OSError:
            # hors arborescence : check structurel sans S-box fichier
            sbox = None
    a, b, c, d = raw[0:4], raw[4:8], raw[8:12], raw[12:16]
    if sbox is not None:
        if workshop1(a, sbox, anti) != MAGIC_W1:
            return False
    elif a != G1:
        return False
    if not workshop2(b):
        return False
    if workshop3(c) != TARGET_W3:
        return False
    if workshop4(a if sbox is not None else G1, b, c, d) != 0:
        return False
    return True


def format_ticket(flat16: bytes | str, dashed: bool = True) -> str:
    if isinstance(flat16, str):
        flat16 = normalize(flat16)
    if len(flat16) != 16:
        raise ValueError("need 16 chars")
    parts = [flat16[i : i + 4].decode("latin-1") for i in range(0, 16, 4)]
    return "-".join(parts) if dashed else "".join(parts)


def make_ticket(w4: str, dashed: bool = True) -> str:
    if len(w4) != 4:
        raise ValueError("W4 must be 4 chars")
    return format_ticket(G1 + G2 + G3 + w4.encode("latin-1"), dashed=dashed)


def keygen(
    n: int = 1,
    *,
    all_tickets: bool = False,
    dashed: bool = True,
    seed: int | None = None,
    prefer_canon: bool = False,
) -> list[str]:
    """Génère N Golden Tickets valides (préfixe fixe + suffixe CRC)."""
    if all_tickets:
        suffixes = list(W4_ALNUM)
    else:
        rng = random.Random(seed)
        if n <= 0:
            return []
        if prefer_canon and n == 1 and seed is None:
            suffixes = [G4_CANON.decode()]
        elif n >= len(W4_ALNUM):
            suffixes = list(W4_ALNUM)
            rng.shuffle(suffixes)
        else:
            suffixes = rng.sample(list(W4_ALNUM), n)
    return [make_ticket(s, dashed=dashed) for s in suffixes]


def find_w4(
    a: bytes = G1,
    b: bytes = G2,
    c: bytes = G3,
    charset: bytes | None = None,
    limit: int = 32,
) -> list[str]:
    """Brute (lent) — préférer W4_ALNUM / --keygen."""
    if charset is None:
        charset = (string.ascii_letters + string.digits).encode()
    out: list[str] = []
    for c0 in charset:
        for c1 in charset:
            for c2 in charset:
                for c3 in charset:
                    d = bytes((c0, c1, c2, c3))
                    if workshop4(a, b, c, d) == 0:
                        out.append(d.decode("latin-1"))
                        if len(out) >= limit:
                            return out
    return out


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Chocolate Factory (CrackNotMe) — keygen / solveur Golden Ticket"
    )
    ap.add_argument("-q", action="store_true", help="imprimer un ticket (canon)")
    ap.add_argument("--keygen", "-k", action="store_true", help="mode keygen")
    ap.add_argument("-n", type=int, default=1, help="nombre de tickets (--keygen)")
    ap.add_argument("--all", action="store_true", help="tous les tickets alnum (~202)")
    ap.add_argument("--flat", action="store_true", help="sans tirets")
    ap.add_argument("--seed", type=int, default=None, help="RNG seed (--keygen)")
    ap.add_argument("--check", metavar="T", help="vérifier un ticket")
    ap.add_argument(
        "--w4",
        action="store_true",
        help="lister des suffixes Packaging (table intégrée)",
    )
    ap.add_argument(
        "--limit", type=int, default=32, help="max pour --w4 (défaut 32)"
    )
    ap.add_argument("--pe", type=Path, help="chemin ChocolateFactory.exe (S-box)")
    args = ap.parse_args()

    dashed = not args.flat
    sbox = None
    if args.check is not None or (not args.keygen and not args.w4 and not args.q and not args.all):
        try:
            sbox = load_sbox(args.pe)
        except OSError as e:
            print(f"warn: S-box PE illisible ({e})", file=sys.stderr)

    if args.check is not None:
        ok = check(args.check, sbox)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.keygen or args.all:
        tickets = keygen(
            n=args.n,
            all_tickets=args.all,
            dashed=dashed,
            seed=args.seed,
        )
        for t in tickets:
            print(t)
        return 0

    if args.w4:
        for s in W4_ALNUM[: max(0, args.limit)]:
            print(make_ticket(s, dashed=dashed))
        return 0

    ticket = make_ticket(G4_CANON.decode(), dashed=dashed)
    if sbox is not None:
        assert check(ticket, sbox)

    if args.q:
        print(ticket)
        return 0

    print("=== Chocolate Factory keygen ===")
    print(f"ticket   : {ticket}")
    print(f"flat     : {make_ticket(G4_CANON.decode(), dashed=False)}")
    print(f"W1 Cocoa : {G1.decode()}  (S-box → {MAGIC_W1:#x})")
    print(f"W2 Milk  : {G2.decode()}  (weighted sums)")
    print(f"W3 Caramel: {G3.decode()}  (→ {TARGET_W3:#x})")
    print(f"W4 Pack  : {G4_CANON.decode()}  (+ {len(W4_ALNUM) - 1} autres alnum)")
    print(f"keygen   : --keygen -n N   |  --keygen --all  ({len(W4_ALNUM)} tickets)")
    if sbox is not None:
        print("check    : OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
