#!/usr/bin/env python3
"""Solveur — kamil123's Mini LLM Sentinel (crackme03.exe PE64 MinGW)

Password 16 octets ``AI-`` + 12 chars + ``!``. Un petit MLP (6→8 tanh→1
sigmoid) score des features (préfixe/suffixe, checksum Σ bytes ≡ 101
(mod 256), classes chiffre/A-Z/a-z, unicité). Accepté si sigmoid ≥ 0.5
et len == 16.

Le LLM embarqué n’est **pas** le prédicat mot de passe : c’est le
sentinel anti-analyse (patch autorisé).

Usage :
  python tools/mini-llm-sentinel-solve.py
  python tools/mini-llm-sentinel-solve.py -q --user petik
  python tools/mini-llm-sentinel-solve.py --user petik --check
"""
from __future__ import annotations

import argparse
import math
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme03.exe"
DEFAULT_USER = "petik"
WIN = "ACCESS GRANTED"

VA_CLASS = 0x14006C540
VA_PREFIX = 0x14006C713
VA_WEIGHTS = 0x14006C720
WEIGHT_SEED = 0xEB78774D
PERM_SEED = 0xB07EC09E
IMAGE_BASE = 0x140000000


def xorshift32(x: int) -> int:
    x &= 0xFFFFFFFF
    x ^= (x << 13) & 0xFFFFFFFF
    x ^= x >> 17
    x ^= (x << 5) & 0xFFFFFFFF
    return x & 0xFFFFFFFF


def pe_sections(data: bytes) -> tuple[int, list[tuple[int, int, int, int]]]:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    coff = e_lfanew + 4
    nsec = struct.unpack_from("<H", data, coff + 2)[0]
    opt_size = struct.unpack_from("<H", data, coff + 16)[0]
    opt = coff + 20
    image_base = struct.unpack_from("<Q", data, opt + 24)[0]
    sec_off = opt + opt_size
    secs = []
    for i in range(nsec):
        o = sec_off + i * 40
        vsz, va, rsz, raw = struct.unpack_from("<IIII", data, o + 8)
        secs.append((va, vsz, raw, rsz))
    return image_base, secs


def va_to_off(va: int, image_base: int, secs) -> int:
    rva = va - image_base
    for sva, vsz, raw, rsz in secs:
        if sva <= rva < sva + max(vsz, rsz):
            return raw + (rva - sva)
    raise ValueError(f"VA not mapped: {va:#x}")


class Model:
    def __init__(self, blob: bytes):
        image_base, secs = pe_sections(blob)
        off = lambda va: va_to_off(va, image_base, secs)
        raw_tab = blob[off(VA_CLASS) : off(VA_CLASS) + 256]
        self.clas = bytes(((i * 51 + 0x5B) & 0xFF) ^ raw_tab[i] for i in range(256))
        ct = blob[off(VA_PREFIX) : off(VA_PREFIX) + 3]
        k = (0 - 105) & 0xFF
        self.prefix = bytes(ct[i] ^ ((k + 65 * i) & 0xFF) for i in range(3))
        self.suffix = ((0 - 105) & 0xFF) ^ 0xB6
        ctw = blob[off(VA_WEIGHTS) : off(VA_WEIGHTS) + 260]
        seed = WEIGHT_SEED
        wraw = []
        for i in range(65):
            seed = xorshift32(seed)
            wraw.append(seed ^ struct.unpack_from("<I", ctw, i * 4)[0])
        w = [struct.unpack("<f", struct.pack("<I", x))[0] for x in wraw]
        self.Wh = [w[i * 6 : (i + 1) * 6] for i in range(8)]
        self.bh = w[48:56]
        self.Wo = w[56:64]
        self.bo = w[64]
        perm = bytearray(range(6))
        seed = PERM_SEED
        ptr = 0
        r8 = 5
        while True:
            ptr -= 1
            seed = xorshift32(seed)
            edx = seed % r8
            perm[ptr + 5], perm[edx] = perm[edx], perm[ptr + 5]
            r8 -= 1
            if r8 == 1:
                break
        self.perm = list(perm)

    def score(self, pw: str) -> dict:
        b = pw.encode("latin1")
        n = len(b)
        uniq = len(set(b))
        c0 = c1 = c2 = 0
        all3 = 1
        s = 0
        for ch in b:
            cl = self.clas[ch]
            s += ch
            c0 += cl & 1
            c1 += (cl >> 1) & 1
            c2 += (cl >> 2) & 1
            all3 &= (cl >> 3) & 1
        prefix_ok = n >= 3 and b[:3] == self.prefix
        suffix_ok = n >= 1 and b[-1] == self.suffix
        gate = int(bool(all3 and prefix_ok and suffix_ok))
        sm = s & 0xFF
        dist = abs(sm - 101)
        cscore = 0.0 if dist > 128 else max(0.0, 1.0 - dist * 0.015625)
        rawf = [
            float(gate),
            cscore,
            1.0 if c0 > 3 else 0.0,
            uniq * 0.0625,
            c1 * 0.0625,
            c2 * 0.0625,
        ]
        feat = [0.0] * 6
        for i, v in enumerate(rawf):
            feat[self.perm[i]] = v
        hidden = []
        for i in range(8):
            acc = self.bh[i]
            for j in range(6):
                acc += self.Wh[i][j] * feat[j]
            hidden.append(math.tanh(acc))
        z = self.bo
        for i in range(8):
            z += self.Wo[i] * hidden[i]
        sig = 1.0 / (1.0 + math.exp(-z))
        return {
            "ok": n == 16 and sig >= 0.5,
            "sig": sig,
            "n": n,
            "sum8": sm,
            "c0": c0,
            "c1": c1,
            "c2": c2,
            "uniq": uniq,
            "gate": gate,
        }

    def generate(self, user: str = DEFAULT_USER) -> str:
        """AI- + 12 chars (user + padding digits) + ! ; checksum et ≥4 chiffres."""
        if not user.isascii() or not user.isprintable() or "\t" in user or "\n" in user:
            raise SystemExit(f"user {user!r} : ASCII printable requis")
        for ch in user.encode("ascii"):
            if (self.clas[ch] & 8) == 0:
                raise SystemExit(f"user {user!r} : caractère hors charset class bit3")
        if len(user) > 12:
            raise SystemExit(f"user {user!r} trop long (max 12 dans le payload)")
        pref = self.prefix.decode("ascii")
        mid = list(user) + ["0"] * (12 - len(user))
        # au moins 4 chiffres dans le mot de passe entier
        digits_here = sum(c.isdigit() for c in mid)
        need = max(0, 4 - digits_here)
        # les positions de padding (après user) servent de levier checksum
        pad_idx = list(range(len(user), 12))
        if len(pad_idx) < max(need, 1):
            # pas assez de padding : remplacer la fin du user par des digits
            # (on garde autant du nick que possible)
            raise SystemExit(
                f"user {user!r} : pas assez de place pour 4 chiffres + checksum "
                f"(raccourcir, ou choisir un nick plus court)"
            )
        for i in range(need):
            mid[pad_idx[i]] = "0"
        pw0 = pref + "".join(mid) + chr(self.suffix)
        cur = sum(pw0.encode("ascii")) & 0xFF
        delta = (101 - cur) & 0xFF
        # répartir delta sur le dernier octet de padding (0-9 wrap via plusieurs)
        last = pad_idx[-1]
        # on peut ajouter jusqu'à 9 par position digit ; s'il faut plus, utiliser
        # plusieurs positions de padding
        rest = delta
        for i in reversed(pad_idx):
            if rest == 0:
                break
            base = ord(mid[i])
            if not (48 <= base <= 57):
                mid[i] = "0"
                base = 48
                rest = (rest) % 256  # already
            room = 57 - base  # up to '9'
            add = min(room, rest)
            # si rest > room, descendre vers '0' et ajouter 256-... non :
            # on augmente modulo en sautant vers un autre digit + 256k impossible
            # sur un seul char. On utilise add puis le reste sur le suivant.
            mid[i] = chr(base + add)
            rest -= add
        if rest:
            # encore trop : on pousse le premier padding en bouclant 0-9
            # et on reporte 10 sur d'autres — pour rest < 10*len(pad) max 90
            # cas rest restant : augmenter cycliquement
            for _ in range(rest):
                for i in reversed(pad_idx):
                    if mid[i].isdigit() and mid[i] != "9":
                        mid[i] = chr(ord(mid[i]) + 1)
                        break
                else:
                    raise SystemExit("checksum: padding saturé")
        pw = pref + "".join(mid) + chr(self.suffix)
        r = self.score(pw)
        if not r["ok"]:
            # repli connu pour petik ; sinon brute 7 digits
            pw = self._brute(user)
        return pw

    def _brute(self, user: str) -> str:
        pref = self.prefix.decode("ascii")
        suf = chr(self.suffix)
        core = user[:12]
        pad_n = 12 - len(core)
        if pad_n <= 0:
            raise SystemExit("brute impossible")
        # 4 digits min : remplir de digits, fixer checksum sur les derniers
        from itertools import product

        # ancrer autant de 0 que possible, brute 3 derniers digits + adjust
        head = "0" * max(0, pad_n - 3)
        tail_n = pad_n - len(head)
        for tail in product("0123456789", repeat=tail_n):
            mid = core + head + "".join(tail)
            pw = pref + mid + suf
            if self.score(pw)["ok"]:
                return pw
        raise SystemExit(f"pas de password trouvé pour user={user!r}")


GOLDEN = [
    "AI-60h08e4ne8z9!",
    "AI-11111111111r!",
    "AI-a777764222((!",
]


def main() -> int:
    ap = argparse.ArgumentParser(description="keygen Mini LLM Sentinel")
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument("--user", default=DEFAULT_USER, help="nick à coller dans le payload (défaut petik)")
    ap.add_argument("--check", action="store_true", help="vérifie golden + keygen")
    ap.add_argument("--score", metavar="PW", help="score un password")
    args = ap.parse_args()
    if not BIN.is_file():
        print(f"binaire introuvable: {BIN}", file=sys.stderr)
        return 2
    m = Model(BIN.read_bytes())
    if args.score is not None:
        r = m.score(args.score)
        print(f"{args.score!r} ok={r['ok']} sig={r['sig']:.4f} sum8={r['sum8']} c0={r['c0']}")
        return 0 if r["ok"] else 1
    pw = m.generate(args.user)
    if args.check:
        bad = []
        for g in GOLDEN:
            r = m.score(g)
            if not r["ok"]:
                bad.append(g)
        r = m.score(pw)
        if bad or not r["ok"]:
            print("CHECK FAIL", bad, pw, r, file=sys.stderr)
            return 1
        if not args.q:
            print(f"check ok  golden={len(GOLDEN)}  {args.user}->{pw}  sig={r['sig']:.4f}")
        else:
            print(pw)
        return 0
    if args.q:
        print(pw)
    else:
        r = m.score(pw)
        print(f"{args.user} -> {pw}  (sig={r['sig']:.4f}, sum8={r['sum8']})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
