#!/usr/bin/env python3
"""Solveur timotei-crackme-09 — PE32 GUI serial (sub_40112F).

GetDlgItemText → lstrlen → atoi → sum(s[i]+123456) → repne scasw "CM"
→ n >= 2023 → sum % n == 0 → "Registered".

  sum = n + Σ s[i] + L×0x1E240
  succès ⇔ L>0 ∧ "CM"@offset pair ∧ n≥2023 ∧ sum%n==0

Exemples : 2191CMCM, 141157CM, 164685CM

Usage :
  python3 timotei-crackme-09-solve.py
  python3 timotei-crackme-09-solve.py 2023CM
  wine timotei-crackme-09.exe   # coller un serial, Generate
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
BINARY = HERE / "timotei-crackme-09.exe"

CONST = 0x1E240  # 123456
MIN_N = 0x7E7  # 2023
CM_WORD = 0x4D43  # 'C' | 'M'<<8
MAX_LEN = 50  # GetDlgItemText cchMax 0x32 ; EM_LIMITTEXT 0x31

EXAMPLES = ["2191CMCM", "141157CM", "164685CM", "17646xCM"]


def c_atoi(s: str) -> int:
    """msvcrt atoi approximé : préfixe [+-]?digits, sinon 0."""
    m = re.match(r"^[+-]?\d+", s)
    if not m:
        return 0
    return int(m.group())


def has_cm_word(s: bytes) -> bool:
    """repne scasw : words LE, jusqu'à len(s) itérations depuis s[0].

    Le binaire lit au-delà du NUL dans le buffer BSS (zéros) : on pad assez.
    """
    buf = s + b"\x00" * (2 * len(s) + 4)
    left = len(s)
    i = 0
    while left > 0:
        w = buf[i] | (buf[i + 1] << 8)
        if w == CM_WORD:
            return True
        i += 2
        left -= 1
    return False


def serial_sum(s: bytes, n: int) -> int:
    """ecx après la boucle movsx / add 0x1E240 (ASCII → positif)."""
    total = n & 0xFFFFFFFF
    for ch in s:
        sb = ch - 256 if ch >= 128 else ch
        total = (total + sb + CONST) & 0xFFFFFFFF
    return total


def serial_ok(s: str) -> tuple[bool, dict]:
    """Prédicat exact de sub_40112F (hors I/O GUI)."""
    raw = s.encode("latin-1", errors="replace")
    info: dict = {"serial": s, "len": len(raw)}
    if len(raw) == 0:
        return False, {**info, "reason": "empty"}
    if len(raw) > MAX_LEN:
        raw = raw[:MAX_LEN]
        info["len"] = len(raw)
        info["truncated"] = True

    n = c_atoi(s)
    sm = serial_sum(raw, n)
    cm = has_cm_word(raw)
    info.update(n=n, sum=sm, cm=cm)

    if not cm:
        return False, {**info, "reason": "no CM word (even offset)"}
    if n < MIN_N:
        return False, {**info, "reason": f"n={n} < 2023"}
    if n == 0:
        return False, {**info, "reason": "div0"}
    rem = sm % (n & 0xFFFFFFFF)
    info["rem"] = rem
    if rem != 0:
        return False, {**info, "reason": f"sum%n = {rem}"}
    return True, info


def find_serials(limit: int = 12) -> list[str]:
    """Brute : str(n)+'CM' avec n digits pair (CM à offset pair)."""
    out: list[str] = []
    for n in range(MIN_N, 500_000):
        sn = str(n)
        if len(sn) % 2 != 0:
            continue
        cand = sn + "CM"
        ok, _ = serial_ok(cand)
        if ok:
            out.append(cand)
            if len(out) >= limit:
                break
    # formes courtes CMCM
    for n in range(MIN_N, 50_000):
        sn = str(n)
        if len(sn) % 2 != 0:
            continue
        cand = sn + "CMCM"
        ok, _ = serial_ok(cand)
        if ok and cand not in out:
            out.append(cand)
            if len(out) >= limit + 5:
                break
    return out


def main() -> None:
    print("=== timotei-crackme-09-solve.py ===")
    print("PE32 GUI — sub_40112F @ 0x40112F\n")
    print(f"  CONST  = 0x{CONST:X} ({CONST})")
    print(f"  MIN_N  = 0x{MIN_N:X} ({MIN_N})")
    print(f"  CM     = word 0x{CM_WORD:04X}  (\"CM\" offset pair via scasw)")
    print()
    print("  sum = n + Σ s[i] + L×CONST")
    print("  ok  ⇔ L>0 ∧ has_CM ∧ n≥2023 ∧ sum%n==0")
    print()

    args = [a for a in sys.argv[1:] if not a.startswith("-")]
    if args:
        for a in args:
            ok, info = serial_ok(a)
            print(f"  {a!r:20} → {'OK' if ok else 'FAIL'}  {info}")
        return

    print("exemples connus :")
    for ex in EXAMPLES:
        ok, info = serial_ok(ex)
        print(f"  {ex:16}  n={info['n']:<8} sum={info['sum']:<10} → {ok}")

    print("\ncontre-exemples :")
    for bad in ["", "Crackmes.One", "2023CM", "12345CM", "2023cm"]:
        ok, info = serial_ok(bad)
        print(f"  {bad!r:20} → {ok}  ({info.get('reason', 'ok')})")

    print("\nrecherche digits+CM (n digits pair)…")
    found = find_serials(8)
    for s in found[:8]:
        _, info = serial_ok(s)
        print(f"  {s:16}  n={info['n']}")

    print("\n=== live ===")
    print(f"  cd {HERE}")
    print("  wine timotei-crackme-09.exe   # ou VM Windows")
    print("  # coller p.ex. 2191CMCM dans Serial, clic Generate")
    print("  # Status → Registered")
    if BINARY.is_file():
        print(f"  binaire : {BINARY.name} présent")


if __name__ == "__main__":
    main()
