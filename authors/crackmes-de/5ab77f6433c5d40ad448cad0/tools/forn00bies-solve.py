#!/usr/bin/env python3
"""Solveur 4n006135 / forn00bies (borismilner) — levels 0–3.

Usage:
  python3 tools/forn00bies-solve.py              # résumé
  python3 tools/forn00bies-solve.py -q           # une ligne par niveau
  python3 tools/forn00bies-solve.py --level 1 --user petik
  python3 tools/forn00bies-solve.py --level 2 --uid 305419896
  python3 tools/forn00bies-solve.py --level 3 -q
  python3 tools/forn00bies-solve.py --check      # Wine smoke (tous)
"""
from __future__ import annotations

import argparse
import os
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "_u"
CONST_L2 = 0xB16B00B5


def level0_password() -> str:
    return "Easy"


def level1_password(user: str) -> int:
    # sum of signed char values including the final NUL (adds 0)
    return sum(user.encode("latin1"))


def level2_password(uid: int) -> str:
    """Keygen from User Id (rdtsc low 32). Buffer prefilled with 'O'."""
    uid &= 0xFFFFFFFF
    buf = bytearray(b"O" * 32)
    if uid & 1:
        buf[0] = 0x2A
    if uid <= CONST_L2:
        buf[1] = 0x2A
    # jnp after `inc edi` → edi becomes 0x40d022, PF always even → always '*'
    buf[2] = 0x2A
    # forced '*' at [3] is overwritten by the first letter
    ebx = uid
    i = 3
    for ecx in range(0x1C, 0, -1):
        ebx >>= 1
        edx = ebx % 0x1A
        buf[i] = (edx + 0x41) if (ecx & 1) else (edx + 0x61)
        i += 1
    # [31] stays 'O'
    return bytes(buf).decode("latin1")


def level3_check(eax: int) -> bool:
    eax &= 0xFFFFFFFF
    if bin(eax & 0xFF).count("1") % 2 != 0:
        return False
    if (eax >> 30) & 1:
        return False
    if (eax & 1) == 0:
        return False
    if (eax >> 31) & 1 == 0:
        return False
    eax2 = (eax << 1) & 0xFFFFFFFF
    a, b = eax2, 0x60000000
    res = (a + b) & 0xFFFFFFFF
    of = ((a ^ res) & (b ^ res) & 0x80000000) != 0
    if not of:
        return False
    if ((res | 0x20000000) & 0x70000) != 0:
        return False
    b0, b1, b2, b3 = struct.pack("<I", eax)
    if b1 != (bin(eax).count("1") & 0xFF):
        return False
    return True


def level3_guesses(limit: int = 5) -> list[int]:
    """Valid dword guesses (scanf %d). First hit is the write-up example."""
    known = 0x90000603
    assert level3_check(known)
    if limit <= 1:
        return [known]
    good: list[int] = [known]
    for v in range(1 << 26):
        eax = 0x80000001
        eax |= (v & 0x3FFF) << 1
        eax |= ((v >> 14) & 0xFFF) << 18
        if eax == known or not level3_check(eax):
            continue
        good.append(eax)
        if len(good) >= limit:
            break
    return good


def _wine(exe: Path, data: bytes, extra_args: list[str] | None = None, cwd: Path | None = None) -> str:
    env = {**os.environ, "WINEDEBUG": "-all"}
    r = subprocess.run(
        ["wine", str(exe.name if cwd else exe), *(extra_args or [])],
        input=data,
        capture_output=True,
        env=env,
        timeout=25,
        cwd=str(cwd or exe.parent),
    )
    return r.stdout.decode("latin1", "replace")


def _patch_l2(uid: int, out: Path) -> None:
    """Freeze rdtsc User Id for reproducible --check."""
    data = bytearray((BIN / "level-2.exe").read_bytes())
    idx = data.find(bytes.fromhex("0f3189c353"))
    if idx < 0:
        raise RuntimeError("rdtsc pattern not found")
    # push imm32 uid (replaces rdtsc; mov ebx,eax; push ebx)
    data[idx : idx + 5] = bytes([0x68]) + (uid & 0xFFFFFFFF).to_bytes(4, "little")
    # after printf: pop esi; pop ebx; nop  (instead of add esp,8)
    # VA 0x401410 → file 0x810
    if data[0x810:0x813] != bytes.fromhex("83c408"):
        raise RuntimeError("unexpected add esp,8")
    data[0x810:0x813] = bytes.fromhex("5e5b90")
    out.write_bytes(data)


def check_all(user: str) -> int:
    ok = 0
    # L0
    out = _wine(BIN / "level-0.exe", (level0_password() + "\n").encode(), cwd=BIN)
    print("L0:", "OK" if "Good" in out else "FAIL")
    ok += "Good" in out
    # L1
    pw = level1_password(user)
    out = _wine(BIN / "level-1.exe", f"{user}\n{pw}\n".encode(), cwd=BIN)
    print(f"L1 ({user}/{pw}):", "OK" if "Good" in out else "FAIL")
    ok += "Good" in out
    # L2 patched
    uid = 0x12345678
    with tempfile.TemporaryDirectory() as td:
        tdp = Path(td)
        (tdp / "msvcrt.dll").write_bytes((BIN / "msvcrt.dll").read_bytes())
        patched = tdp / "level-2.exe"
        _patch_l2(uid, patched)
        pw2 = level2_password(uid)
        out = _wine(patched, (pw2 + "\n").encode(), cwd=tdp)
        last = [ln for ln in out.replace("\r", "").split("\n") if ln.strip()]
        good = bool(last) and "Good job" in last[-1]
        print(f"L2 (uid={uid:#x}):", "OK" if good else "FAIL", repr(last[-1] if last else out[-80:]))
        ok += good
    # L3
    g = level3_guesses(1)[0]
    signed = struct.unpack("<i", struct.pack("<I", g))[0]
    out = _wine(BIN / "level-3.exe", f"{signed}\n".encode(), cwd=BIN)
    print(f"L3 ({signed}):", "OK" if "Good" in out else "FAIL")
    ok += "Good" in out
    return 0 if ok == 4 else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--level", type=int, choices=[0, 1, 2, 3], default=None)
    ap.add_argument("--user", default="petik", help="L1 username (default petik)")
    ap.add_argument("--uid", type=lambda s: int(s, 0), default=None, help="L2 User Id (int/0x…)")
    ap.add_argument("--check", action="store_true", help="Wine smoke-test all levels")
    args = ap.parse_args()

    if args.check:
        return check_all(args.user)

    levels = [args.level] if args.level is not None else [0, 1, 2, 3]
    lines: list[str] = []

    if 0 in levels:
        lines.append(f"L0\t{level0_password()}")
    if 1 in levels:
        lines.append(f"L1\t{args.user}\t{level1_password(args.user)}")
    if 2 in levels:
        uid = args.uid if args.uid is not None else 0x12345678
        lines.append(f"L2\tuid={uid}\t{level2_password(uid)}")
    if 3 in levels:
        g = level3_guesses(1)[0]
        signed = struct.unpack("<i", struct.pack("<I", g))[0]
        lines.append(f"L3\t{signed}\t({g:#010x})")

    if args.quiet:
        for ln in lines:
            print(ln.split("\t", 1)[-1] if args.level is not None else ln)
    else:
        print("4n006135 / forn00bies (levels 0–3)")
        for ln in lines:
            print(" ", ln.replace("\t", "  "))
        if args.level is None:
            print("\nExemples:")
            print(f"  L1 petik → {level1_password('petik')}")
            print(f"  L2 uid=0x12345678 → {level2_password(0x12345678)}")
            g = level3_guesses(1)[0]
            print(f"  L3 → {struct.unpack('<i', struct.pack('<I', g))[0]}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
