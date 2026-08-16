#!/usr/bin/env python3
"""Solveur / keygen timotei-crackme-10 — Name + Serial (sub_401144).

Usage :
  python3 timotei-crackme-10-solve.py <name>
  python3 timotei-crackme-10-solve.py timotei
  python3 timotei-crackme-10-solve.py petik
  python3 timotei-crackme-10-solve.py --check NAME SERIAL

Prédicat (après tri croissant du name en place) :
  name_d = uint32_LE(sorted_name[0:4])
  serial[0:4] == sorted_name[0:4]
  atoi(serial[4:]) == (name_d * name_d) >> 32
"""

from __future__ import annotations

import re
import struct
import sys


def bubble_sort_bytes(data: bytes) -> bytes:
    """Tri à bulles 8 bits, comme loc_401187 / loop dans sub_401144."""
    b = bytearray(data)
    n = len(b)
    if n < 2:
        return bytes(b)
    outer = n - 1
    while outer != 0:
        i = 0
        for _ in range(outer):
            if b[i] > b[i + 1]:
                b[i], b[i + 1] = b[i + 1], b[i]
            i += 1
        outer -= 1
    return bytes(b)


def c_atoi(s: str) -> int:
    m = re.match(r"^[+-]?\d+", s)
    if not m:
        return 0
    return int(m.group())


def serial_for_name(name: str) -> tuple[str, dict]:
    """Génère le serial pour un name (login). Len(name) >= 4."""
    raw = name.encode("latin-1", errors="replace")
    info: dict = {"name": name, "len": len(raw)}
    if len(raw) < 4:
        raise ValueError("name trop court (minimum 4 caractères)")
    if len(raw) > 49:
        raw = raw[:49]
        info["truncated"] = True

    sorted_n = bubble_sort_bytes(raw)
    prefix = sorted_n[:4]
    name_d = struct.unpack("<I", prefix)[0]
    # name_d == ser_d → product = name_d² (64 bits), high dans EDX après mul
    prod = name_d * name_d
    high = (prod >> 32) & 0xFFFFFFFF
    serial = prefix.decode("latin-1") + str(high)

    info.update(
        sorted=sorted_n.decode("latin-1"),
        prefix=prefix.decode("latin-1"),
        name_d=name_d,
        name_d_hex=f"0x{name_d:08x}",
        high=high,
        prod=prod,
        serial=serial,
    )
    return serial, info


def check_pair(name: str, serial: str) -> tuple[bool, dict]:
    """Rejoue le prédicat sub_401144 (sans I/O GUI)."""
    nb = name.encode("latin-1", errors="replace")
    sb = serial.encode("latin-1", errors="replace")
    info: dict = {"name": name, "serial": serial}
    if len(sb) == 0:
        return False, {**info, "reason": "serial vide"}
    if len(nb) < 4:
        return False, {**info, "reason": "name len < 4"}

    sorted_n = bubble_sort_bytes(nb)
    if len(sb) < 4:
        return False, {**info, "reason": "serial < 4 octets", "sorted": sorted_n}
    name_d = struct.unpack("<I", sorted_n[:4])[0]
    ser_d = struct.unpack("<I", sb[:4])[0]
    info.update(sorted=sorted_n.decode("latin-1"), name_d=name_d, ser_d=ser_d)
    if name_d != ser_d:
        return False, {**info, "reason": "prefix != sorted[0:4]"}
    high = ((name_d * ser_d) >> 32) & 0xFFFFFFFF
    n = c_atoi(sb[4:].decode("latin-1", errors="replace"))
    info.update(high=high, atoi=n)
    if n != high:
        return False, {**info, "reason": f"atoi(serial+4)={n} != high={high}"}
    return True, info


def usage() -> None:
    print(
        "usage:\n"
        "  python3 timotei-crackme-10-solve.py <name>\n"
        "  python3 timotei-crackme-10-solve.py --check <name> <serial>\n"
        "exemples:\n"
        "  python3 timotei-crackme-10-solve.py timotei\n"
        "  python3 timotei-crackme-10-solve.py petik",
        file=sys.stderr,
    )


def main() -> int:
    args = sys.argv[1:]
    if not args:
        usage()
        # démo défaut UI
        name = "timotei"
        serial, info = serial_for_name(name)
        print("=== timotei-crackme-10-solve.py ===")
        print("(aucun arg → démo name par défaut de l'UI)\n")
        print(f"  Name   : {name}")
        print(f"  sorted : {info['sorted']}")
        print(f"  dword  : {info['name_d_hex']} ({info['name_d']})")
        print(f"  high32 : {info['high']}")
        print(f"  Serial : {serial}")
        ok, _ = check_pair(name, serial)
        print(f"  check  : {ok}")
        print("\nusage: python3 timotei-crackme-10-solve.py <name>")
        return 0

    if args[0] in ("-h", "--help"):
        usage()
        return 0

    if args[0] == "--check":
        if len(args) != 3:
            usage()
            return 2
        ok, info = check_pair(args[1], args[2])
        print("OK" if ok else "FAIL", info)
        return 0 if ok else 1

    name = args[0]
    try:
        serial, info = serial_for_name(name)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    # sortie simple : serial seul si on pipe ; détail sur stderr optionnel
    if len(args) > 1 and args[1] == "-q":
        print(serial)
        return 0

    print(f"Name   : {name}")
    print(f"sorted : {info['sorted']!r}")
    print(f"prefix : {info['prefix']!r}  (dword LE {info['name_d_hex']})")
    print(f"high32 : {info['high']}  (= (d*d)>>32)")
    print(f"Serial : {serial}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
