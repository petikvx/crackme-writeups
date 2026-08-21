#!/usr/bin/env python3
"""Keygen / solveur — CrackNotMe's Turbine Control KeyGenMe (PE32+).

HWID affiché : TCU-XXXXX (5 chars A-Z0-9, tirés au hasard via rdtsc/rand).
License     : XXXX-YYYY-ZZZZ-WWWW (19 chars, tirets aux offsets 4/9/14)

  W1  dérivé du HWID (+ anti BeingDebugged=0x1f) → charset ASCII printable sans '-'
  W2  chaîne S-box[sum(W1)]  (@ 0x140089940)
  W3  g0*g1 == 0x13b0 (5040)  et  g2+g3 == 0x96 (150)   (prédicat opaque FP toujours vrai)
  W4  sprintf("%04u", poly31(W1||W2||W3) % 10000)

Blacklist (pièges → beep / faux chemin) :
  TCAL-DIAG-MSTR-2024
  ADMN-ROOT-PASS-9999

Usage :
  python3 turbine-solve.py --hwid LA015          # keygen
  python3 turbine-solve.py --hwid LA015 -q
  python3 turbine-solve.py --check '<<<<-S~Fp-0iAU-4658' --hwid AAAAA
  python3 turbine-solve.py --run                 # smoke Wine (HWID patché AAAAA)
  python3 turbine-solve.py --keygen -n 5 --hwid TEST1
"""

from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PE_PATH = ROOT / "original" / "TurbineControl.exe"

ANTI_BEING = 0x1F  # PEB.BeingDebugged == 0 → 0x1f ; debugger → 0x2a
ANTI_NTGF = 0  # NtGlobalFlag & 0x70 == 0
TARGET_PRODUCT = 0x13B0  # 5040
TARGET_SUM = 0x96  # 150
SBOX_RVA = 0x140089940
BLACKLIST = (
    "TCAL-DIAG-MSTR-2024",
    "ADMN-ROOT-PASS-9999",
)
DEFAULT_G3 = b"0iAU"  # '0'*'i'==5040 ; 'A'+'U'==150


def load_sbox(pe: Path | None = None) -> bytes:
    pe = pe or PE_PATH
    data = pe.read_bytes()
    # .rdata VMA 0x140088000 → file 0x87200
    off = 0x87200 + (SBOX_RVA - 0x140088000)
    return data[off : off + 256]


def block1(hwid: bytes, anti: int = ANTI_BEING) -> bytes:
    if len(hwid) != 5:
        raise ValueError("HWID must be 5 bytes (sans le préfixe TCU-)")
    out = bytearray(4)
    for i in range(4):
        ecx = ((hwid[i] + 3) & 0xFF) ^ hwid[4] ^ anti
        ecx %= 0x5D
        cl = (ecx + 0x21) & 0xFF
        out[i] = cl if cl < 0x2D else (cl + 1) & 0xFF
    return bytes(out)


def block2(g1: bytes, sbox: bytes, anti: int = ANTI_NTGF) -> bytes:
    s = (sum(g1) + anti) & 0xFF
    out = bytearray(4)
    out[0] = sbox[s]
    for i in range(1, 4):
        out[i] = sbox[(out[i - 1] + s) & 0xFF]
    return bytes(out)


def block3_ok(g3: bytes) -> bool:
    if len(g3) != 4:
        return False
    return (g3[0] * g3[1] == TARGET_PRODUCT) and (g3[2] + g3[3] == TARGET_SUM)


def block4(g1: bytes, g2: bytes, g3: bytes) -> bytes:
    h = 0
    for b in g1 + g2 + g3:
        h = (h * 31 + b) & 0xFFFFFFFF
    return f"{h % 10000:04d}".encode()


def normalize_key(key: str) -> str:
    return key.strip()


def parse_key(key: str) -> tuple[bytes, bytes, bytes, bytes]:
    key = normalize_key(key)
    if len(key) != 19 or key[4] != "-" or key[9] != "-" or key[14] != "-":
        raise ValueError("format attendu : XXXX-YYYY-ZZZZ-WWWW")
    parts = key.split("-")
    if len(parts) != 4 or any(len(p) != 4 for p in parts):
        raise ValueError("4 groupes de 4 caractères requis")
    return tuple(p.encode("latin-1") for p in parts)  # type: ignore[return-value]


def keygen(
    hwid: str,
    *,
    sbox: bytes | None = None,
    g3: bytes = DEFAULT_G3,
    anti1: int = ANTI_BEING,
    anti2: int = ANTI_NTGF,
) -> str:
    hw = hwid.encode("ascii")
    if len(hw) != 5:
        raise ValueError("passer les 5 chars après TCU- (ex. LA015)")
    if not block3_ok(g3):
        raise ValueError("g3 invalide (produit/somme)")
    sb = sbox if sbox is not None else load_sbox()
    g1 = block1(hw, anti=anti1)
    g2 = block2(g1, sb, anti=anti2)
    g4 = block4(g1, g2, g3)
    key = "-".join(x.decode("latin-1") for x in (g1, g2, g3, g4))
    if key in BLACKLIST:
        # ultra improbable avec notre g3 ; changer g3 si ça arrive
        raise RuntimeError(f"keygen a collé une blacklist key: {key}")
    return key


def check_key(
    key: str,
    hwid: str,
    *,
    sbox: bytes | None = None,
    anti1: int = ANTI_BEING,
    anti2: int = ANTI_NTGF,
) -> bool:
    if normalize_key(key) in BLACKLIST:
        return False
    try:
        g1, g2, g3, g4 = parse_key(key)
    except ValueError:
        return False
    hw = hwid.encode("ascii")
    sb = sbox if sbox is not None else load_sbox()
    if block1(hw, anti=anti1) != g1:
        return False
    if block2(g1, sb, anti=anti2) != g2:
        return False
    if not block3_ok(g3):
        return False
    if block4(g1, g2, g3) != g4:
        return False
    return True


def _patch_hwid_fixed(data: bytearray, hwid5: bytes = b"AAAAA") -> None:
    """Remplace generate_hwid @ 0x14000999c par un stub qui écrit hwid5."""
    if len(hwid5) != 5:
        raise ValueError("hwid5")
    off = 0x400 + (0x14000999c - 0x140001000)
    # mov dword [rcx], imm32 ; mov byte [rcx+4], imm8 ; mov byte [rcx+5], 0 ; ret
    stub = bytearray(
        [
            0xC7,
            0x01,
            *hwid5[:4],
            0xC6,
            0x41,
            0x04,
            hwid5[4],
            0xC6,
            0x41,
            0x05,
            0x00,
            0xC3,
        ]
    )
    data[off : off + len(stub)] = stub


def run_wine_smoke(hwid5: str = "AAAAA", quiet: bool = False) -> int:
    """Smoke-test : patch temporaire HWID + pipe de la clé sous Wine."""
    raw = bytearray(PE_PATH.read_bytes())
    hw = hwid5.encode("ascii")
    _patch_hwid_fixed(raw, hw)
    key = keygen(hwid5)
    env = os.environ.copy()
    env["WINEDEBUG"] = "-all"
    with tempfile.TemporaryDirectory(prefix="turbine-") as td:
        exe = Path(td) / "TurbineControl.exe"
        exe.write_bytes(raw)
        try:
            p = subprocess.run(
                ["wine", str(exe)],
                input=(key + "\n\n").encode(),
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                env=env,
                timeout=30,
                check=False,
            )
        except FileNotFoundError:
            print("wine introuvable", file=sys.stderr)
            return 2
        except subprocess.TimeoutExpired:
            print("timeout wine", file=sys.stderr)
            return 2
    out = p.stdout.decode("latin-1", errors="replace")
    out = re.sub(r"\x1b\[[0-9;?]*[a-zA-Z]|\x1b\].*?\x07", "", out)
    ok = "Calibration Unlocked" in out
    if not quiet:
        print(out)
        print(f"[keygen] HWID=TCU-{hwid5}  key={key}  ok={ok}")
    else:
        print(key if ok else "FAIL")
    return 0 if ok else 1


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--hwid", help="5 chars après TCU- (ex. LA015)")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'imprimer que la clé")
    ap.add_argument("--check", metavar="KEY", help="vérifier une clé (avec --hwid)")
    ap.add_argument("--keygen", action="store_true", help="alias explicite du mode keygen")
    ap.add_argument("-n", type=int, default=1, help="avec --keygen : répéter (même HWID / g3)")
    ap.add_argument(
        "--g3",
        default=DEFAULT_G3.decode("latin-1"),
        help=f"groupe 3 custom (défaut {DEFAULT_G3.decode()})",
    )
    ap.add_argument(
        "--run",
        action="store_true",
        help="smoke Wine : HWID patché AAAAA + clé (preuve live)",
    )
    args = ap.parse_args(argv)

    if args.run:
        return run_wine_smoke(quiet=args.quiet)

    if args.check is not None:
        if not args.hwid:
            print("--check nécessite --hwid", file=sys.stderr)
            return 2
        ok = check_key(args.check, args.hwid)
        if args.quiet:
            print("OK" if ok else "FAIL")
        else:
            print(f"check {args.check!r} vs TCU-{args.hwid}: {'OK' if ok else 'FAIL'}")
            if normalize_key(args.check) in BLACKLIST:
                print("(blacklist / honey key)")
        return 0 if ok else 1

    if not args.hwid:
        ap.print_help()
        print("\nExemple : python3 turbine-solve.py --hwid LA015", file=sys.stderr)
        return 2

    try:
        g3 = args.g3.encode("latin-1")
        if len(g3) != 4 or not block3_ok(g3):
            raise ValueError(
                f"--g3 doit vérifier g0*g1=={TARGET_PRODUCT} et g2+g3=={TARGET_SUM}"
            )
        sb = load_sbox()
        for i in range(max(1, args.n)):
            key = keygen(args.hwid, sbox=sb, g3=g3)
            if args.quiet:
                print(key)
            else:
                g1, g2, g3b, g4 = parse_key(key)
                print(f"HWID : TCU-{args.hwid}")
                print(f"KEY  : {key}")
                print(f"  W1={g1!r}  W2={g2!r}  W3={g3b!r}  W4={g4!r}")
                if args.n > 1 and i + 1 < args.n:
                    print("---")
    except Exception as e:
        print(f"erreur: {e}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
