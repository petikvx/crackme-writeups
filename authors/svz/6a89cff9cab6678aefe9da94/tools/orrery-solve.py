#!/usr/bin/env python3
"""Keygen for SVz's Orrery (crackmes.one 6a89cff9cab6678aefe9da94).

Five planets on an 8×8 board (cells 1..8). Edge probes behave like Black Box:
absorbed / reflected / deflected. The daily survey is embedded in the binary
(ORRERY_DAY = Unix day number, 2026-08-21 … 2036-08-20).

Serial = Crockford-base32 of (name_hash XOR packed_planets) || FNV-10bit.
"""

from __future__ import annotations

import argparse
import os
import struct
import sys
from datetime import date, timedelta
from pathlib import Path

ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
DAY0 = 0x50CE  # 2026-08-21 as days since 1970-01-01
DAY_COUNT = 0xE44 + 1  # inclusive
TABLE_FILE_OFF = 0x29A0  # PE: VA 0x1400051a0 → file offset

# Edge probes in binary order (row-major 10×10, border but not corner)
EDGES: list[tuple[int, int]] = []
for _i in range(100):
    _y, _x = divmod(_i, 10)
    if ((_x == 0) or (_x == 9)) ^ ((_y == 0) or (_y == 9)):
        EDGES.append((_x, _y))


def _exe_candidates() -> list[Path]:
    here = Path(__file__).resolve().parent
    root = here.parent
    return [
        root / "analysis" / "extracted" / "orrery-1.0" / "orrery.exe",
        root / "original" / "orrery.exe",
    ]


def load_survey_table(exe: Path | None = None) -> bytes:
    path = exe
    if path is None:
        for c in _exe_candidates():
            if c.is_file():
                path = c
                break
    if path is None or not path.is_file():
        raise FileNotFoundError("orrery.exe not found (extract original/orrery-1.0.zip)")
    data = path.read_bytes()
    need = TABLE_FILE_OFF + DAY_COUNT * 32
    if len(data) < need:
        raise ValueError(f"PE too small for survey table ({len(data)} < {need})")
    return data[TABLE_FILE_OFF : TABLE_FILE_OFF + DAY_COUNT * 32]


def unix_day(d: date | None = None) -> int:
    d = d or date.today()
    return (d - date(1970, 1, 1)).days


def resolve_day(day_arg: str | None) -> int:
    """Return Unix day number in the binary's valid range."""
    if day_arg is None or day_arg == "":
        env = os.environ.get("ORRERY_DAY")
        if env:
            day_arg = env
        else:
            return unix_day()
    if day_arg.isdigit() or (day_arg.startswith("-") and day_arg[1:].isdigit()):
        return int(day_arg)
    # YYYY-MM-DD
    return unix_day(date.fromisoformat(day_arg))


def survey_for_day(table: bytes, day: int) -> bytes:
    idx = day - DAY0
    if idx < 0 or idx >= DAY_COUNT:
        raise ValueError(
            f"day {day} out of range (need {DAY0}..{DAY0 + DAY_COUNT - 1}, "
            f"i.e. 2026-08-21 .. 2036-08-20)"
        )
    return table[idx * 32 : (idx + 1) * 32]


def name_hash(name: str) -> int:
    """Trim whitespace, toupper, FNV-1a-32, mask to 30 bits — matches 0x1400014a0."""
    s = name
    i, j = 0, len(s)
    while i < j and s[i].isspace():
        i += 1
    while j > i and s[j - 1].isspace():
        j -= 1
    s = s[i:j]
    if not s:
        return 0x811C9DC5 & 0x3FFFFFFF
    buf = s.upper().encode("ascii", "ignore")[:0x100]
    h = 0x811C9DC5
    for b in buf:
        h = ((h ^ b) * 0x01000193) & 0xFFFFFFFF
    return h & 0x3FFFFFFF


def fnv10_of_u30(payload: int) -> int:
    raw = struct.pack("<I", payload & 0xFFFFFFFF)
    h = 0x811C9DC5
    for b in raw:
        h = ((h ^ b) * 0x01000193) & 0xFFFFFFFF
    return h & 0x3FF


def pack_planets(planets: list[tuple[int, int]]) -> int:
    """Five (x,y) in 1..8 → 30-bit value (sorted 6-bit codes, MSB first)."""
    codes = sorted((((y - 1) << 3) | (x - 1)) for x, y in planets)
    if len(set(codes)) != 5:
        raise ValueError("duplicate planet codes")
    v = 0
    for c in codes:
        v = (v << 6) | c
    return v


def unpack_planets(payload: int) -> list[tuple[int, int]]:
    codes = [((payload >> (6 * (4 - i))) & 0x3F) for i in range(5)]
    if codes != sorted(codes) or len(set(codes)) != 5:
        raise ValueError("planet codes not strictly sorted unique")
    return [((c & 7) + 1, ((c >> 3) & 7) + 1) for c in codes]


def encode_serial(name: str, planets: list[tuple[int, int]]) -> str:
    planet_pack = pack_planets(planets)
    payload = name_hash(name) ^ planet_pack
    full = ((payload & 0x3FFFFFFF) << 10) | fnv10_of_u30(payload & 0x3FFFFFFF)
    chars = []
    for i in range(7, -1, -1):
        chars.append(ALPHABET[(full >> (5 * i)) & 31])
    s = "".join(chars)
    return f"{s[:4]}-{s[4:]}"


def decode_serial(serial: str) -> int:
    cleaned = "".join(c for c in serial.upper() if c not in "- ")
    if len(cleaned) != 8:
        raise ValueError("serial must be 8 Crockford chars (XXXX-XXXX)")
    v = 0
    for ch in cleaned:
        idx = ALPHABET.find(ch)
        if idx < 0:
            raise ValueError(f"bad serial char {ch!r}")
        v = (v << 5) | idx
    payload, chk = v >> 10, v & 0x3FF
    if fnv10_of_u30(payload) != chk:
        raise ValueError("serial checksum mismatch")
    return payload


def _dir(x: int, y: int) -> tuple[int, int]:
    dx = 1 if x == 0 else (-1 if x == 9 else 0)
    dy = 1 if y == 0 else (-1 if y == 9 else 0)
    return dx, dy


def simulate(planets: list[tuple[int, int]] | set[tuple[int, int]]) -> list[int]:
    """Replay all 32 edge probes; return survey bytes (0/1/exit+2).

    Matches the Black-Box-style loop in orrery.exe: absorbed on head-on hit,
    reflected on double-shoulder or border+shoulder, else 90° deflection or
    straight exit. Entering from the rim with a clear path *continues* into
    the interior (does not immediately emit an exit code).
    """
    grid = [[0] * 10 for _ in range(10)]
    for x, y in planets:
        grid[y][x] = 1
    out: list[int] = []
    for x0, y0 in EDGES:
        x, y = x0, y0
        dx, dy = _dir(x, y)
        for _ in range(100):
            nx, ny = x + dx, y + dy
            if grid[ny][nx]:
                out.append(0)
                break
            s1 = grid[ny + dx][nx + dy]
            s2 = grid[ny - dx][nx - dy]
            if s1 and s2:
                out.append(1)
                break
            if x in (0, 9) or y in (0, 9):
                if s1 or s2:
                    out.append(1)
                    break
                x, y = nx, ny
                if x in (0, 9) or y in (0, 9):
                    out.append(x + y * 10 + 2)
                    break
                continue
            if s1:
                x, y = x - dy, y - dx
                dx, dy = -dy, -dx
                if x in (0, 9) or y in (0, 9):
                    out.append(x + y * 10 + 2)
                    break
                continue
            if s2:
                x, y = x + dy, y + dx
                dx, dy = dy, dx
                if x in (0, 9) or y in (0, 9):
                    out.append(x + y * 10 + 2)
                    break
                continue
            x, y = nx, ny
            if x in (0, 9) or y in (0, 9):
                out.append(x + y * 10 + 2)
                break
        else:
            raise RuntimeError("ray did not terminate")
    return out


def solve_planets(survey: bytes | list[int]) -> list[tuple[int, int]]:
    """Search planet layouts; prune cells that would spoil a non-absorb on entry."""
    from itertools import combinations

    target = list(survey)
    forbidden: set[tuple[int, int]] = set()
    # Head-on: planet on the first interior cell ⇒ absorbed before shoulders.
    # So any non-absorb forbids that cell.
    for (x0, y0), b in zip(EDGES, target):
        dx, dy = _dir(x0, y0)
        first = (x0 + dx, y0 + dy)
        if b != 0:
            forbidden.add(first)
    cells = [
        (x, y)
        for y in range(1, 9)
        for x in range(1, 9)
        if (x, y) not in forbidden
    ]
    for combo in combinations(cells, 5):
        if simulate(combo) == target:
            return list(combo)
    raise RuntimeError("no planet layout matches survey")


def solve_planets_fast(survey: bytes | list[int]) -> list[tuple[int, int]]:
    """Alias kept for callers; same search as solve_planets."""
    return solve_planets(survey)

def format_survey(survey: bytes | list[int]) -> str:
    lines = []
    for (x, y), b in zip(EDGES, survey):
        if b == 0:
            res = "absorbed"
        elif b == 1:
            res = "reflected"
        else:
            v = b - 2
            res = f"deflected to ({v % 10},{v // 10})"
        lines.append(f"    ({x},{y}) -> {res}")
    return "\n".join(lines)


def run_check(exe: Path, name: str, serial: str, day: int) -> str:
    import subprocess

    env = os.environ.copy()
    env["WINEDEBUG"] = "-all"
    env["ORRERY_DAY"] = str(day)
    p = subprocess.run(
        ["wine", str(exe), name, serial],
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
    )
    return p.stdout.replace(b"\r", b"").decode("latin1", "replace")


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="Orrery keygen (SVz)")
    ap.add_argument("-u", "--user", "--name", default="petik", dest="name", help="name (default petik)")
    ap.add_argument("-d", "--day", default=None, help="Unix day int or YYYY-MM-DD (default: today / ORRERY_DAY)")
    ap.add_argument("-q", action="store_true", help="quiet: print serial only")
    ap.add_argument("--check", action="store_true", help="validate with wine orrery.exe")
    ap.add_argument("--survey", action="store_true", help="print telescope survey for the day")
    ap.add_argument("--exe", type=Path, default=None, help="path to orrery.exe")
    ap.add_argument("--planets", action="store_true", help="also print inferred planet positions")
    args = ap.parse_args(argv)

    table = load_survey_table(args.exe)
    day = resolve_day(args.day)
    survey = survey_for_day(table, day)
    planets = solve_planets_fast(survey)
    serial = encode_serial(args.name, planets)

    if args.q:
        print(serial)
    else:
        day_date = date(1970, 1, 1) + timedelta(days=day)
        print(f"day {day} ({day_date.isoformat()})  name={args.name!r}")
        if args.survey:
            print("telescope survey")
            print(format_survey(survey))
        if args.planets:
            print("planets:", " ".join(f"({x},{y})" for x, y in sorted(planets)))
        print(serial)
        print(f"  verify: ORRERY_DAY={day} wine orrery.exe {args.name} {serial}")

    if args.check:
        exe = args.exe
        if exe is None:
            for c in _exe_candidates():
                if c.is_file():
                    exe = c
                    break
        if exe is None:
            print("no exe for --check", file=sys.stderr)
            return 1
        out = run_check(exe, args.name, serial, day)
        sys.stdout.write(out)
        if "system charted" not in out:
            return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
