#!/usr/bin/env python3
"""Solveur — RodrigoTeixeira's Loggin (PE32 MinGW)

Username : next(hash(user)) == 0x713FD2A6
  hash = Java String.hashCode (h = 31*h + c, u32)
  next = xorshift32 (13, 17, 5) — bijection, donc hash(user) est unique :
      H = 0xCF1B4D38
Password : hash(password || username) == 0x439CF161
  i.e. hash(user, seed=hash(pass)) == 0x439CF161

petik ne peut pas être le username (hash ≠ H) ni le password
(aucun L < 100 tel que hash('petik')*31^L + H == cible).

Usage :
  python tools/loggin-solve.py
  python tools/loggin-solve.py -q
  python tools/loggin-solve.py --user vefxne
  python tools/loggin-solve.py --check
"""
from __future__ import annotations

import argparse
import shutil
import struct
import subprocess
import sys
import tempfile
from itertools import product
from pathlib import Path

MASK = 0xFFFFFFFF
NEXT_TARGET = 0x713FD2A6
COMBO_TARGET = 0x439CF161  # 1134358881
USER_HASH = 0xCF1B4D38  # inv_xorshift32(NEXT_TARGET)

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "main.exe"
ALNUM = b"abcdefghijklmnopqrstuvwxyz0123456789"


def hash32(data: bytes, seed: int = 0) -> int:
    h = seed & MASK
    for c in data:
        h = (h * 31 + c) & MASK
    return h


def xorshift32(x: int) -> int:
    x &= MASK
    x ^= (x << 13) & MASK
    x ^= (x >> 17) & MASK
    x ^= (x << 5) & MASK
    return x & MASK


def _inv_xor_lshift(y: int, s: int, bits: int = 32) -> int:
    x = 0
    for i in range(bits):
        bit = (y >> i) & 1
        if i >= s:
            bit ^= (x >> (i - s)) & 1
        x |= bit << i
    return x & ((1 << bits) - 1)


def _inv_xor_rshift(y: int, s: int, bits: int = 32) -> int:
    x = 0
    for i in range(bits - 1, -1, -1):
        bit = (y >> i) & 1
        if i + s < bits:
            bit ^= (x >> (i + s)) & 1
        x |= bit << i
    return x & ((1 << bits) - 1)


def inv_xorshift32(y: int) -> int:
    x = _inv_xor_lshift(y, 5)
    x = _inv_xor_rshift(x, 17)
    x = _inv_xor_lshift(x, 13)
    return x


def preimage(target: int, n: int, charset: bytes, limit: int = 1) -> list[bytes]:
    """Meet-in-the-middle : chaînes de longueur n de hash32 == target."""
    a, b = n // 2, n - n // 2
    right: dict[int, list[bytes]] = {}
    for tup in product(charset, repeat=b):
        hb = hash32(bytes(tup))
        right.setdefault(hb, []).append(bytes(tup))
    found: list[bytes] = []
    pow31b = pow(31, b, 1 << 32)
    for tup in product(charset, repeat=a):
        left = bytes(tup)
        need = (target - hash32(left) * pow31b) & MASK
        for rt in right.get(need, ()):
            found.append(left + rt)
            if len(found) >= limit:
                return found
    return found


def find_string(target: int, charset: bytes = ALNUM, min_n: int = 1, max_n: int = 8) -> bytes:
    for n in range(min_n, max_n + 1):
        hits = preimage(target, n, charset, limit=1)
        if hits:
            return hits[0]
    raise RuntimeError(f"pas de préimage hash32={target:#x} pour n={min_n}..{max_n}")


def password_hash_for_user_len(user_len: int) -> int:
    """hash(pass) * 31^len(user) + H == COMBO_TARGET."""
    pow_l = pow(31, user_len, 1 << 32)
    return ((COMBO_TARGET - USER_HASH) * pow(pow_l, -1, 1 << 32)) & MASK


def pair_for_user(user: bytes) -> bytes:
    if hash32(user) != USER_HASH:
        raise ValueError(
            f"username {user!r} hash={hash32(user):#x} ≠ {USER_HASH:#x} "
            f"(next={xorshift32(hash32(user)):#x})"
        )
    need = password_hash_for_user_len(len(user))
    return find_string(need, ALNUM, min_n=1, max_n=8)


def default_pair() -> tuple[bytes, bytes]:
    user = find_string(USER_HASH, ALNUM, min_n=6, max_n=6)
    pwd = pair_for_user(user)
    return user, pwd


def _stub_libmingwex() -> bytes:
    """PE32 DLL minimale : fesetenv / __mingw_glob → xor eax,eax ; ret.

    main.exe (MinGW.org GCC 6.3.0) importe ces deux symboles depuis
    libmingwex-0.dll. Sans la DLL, le loader rend STATUS_DLL_NOT_FOUND
    (0xC0000135). Le stub suffit au CRT ; le prédicat est dans msvcrt.
    EntryPoint = 0 (pas de DllMain).
    """
    image_base = 0x10000000
    sec_rva = 0x1000

    def rva(off: int) -> int:
        return sec_rva + off

    names = sorted([b"__mingw_glob", b"fesetenv"])
    sec = bytearray(0x200)
    sec[0:3] = b"\x31\xc0\xc3"
    exp_dir_off = 0x10
    p = 0x10 + 40
    addr_off = p
    struct.pack_into("<II", sec, addr_off, rva(0), rva(0))
    p += 8
    nameptr_off = p
    p += 8
    ord_off = p
    struct.pack_into("<HH", sec, ord_off, 0, 1)
    p += 4
    dll_name = b"libmingwex-0.dll\0"
    dll_off = p
    sec[dll_off : dll_off + len(dll_name)] = dll_name
    p += len(dll_name)
    name_rvas = []
    for n in names:
        ns = n + b"\0"
        name_rvas.append(rva(p))
        sec[p : p + len(ns)] = ns
        p += len(ns)
    struct.pack_into("<II", sec, nameptr_off, name_rvas[0], name_rvas[1])
    struct.pack_into(
        "<IIHHIIIIIII",
        sec,
        exp_dir_off,
        0,
        0,
        0,
        0,
        rva(dll_off),
        1,
        2,
        2,
        rva(addr_off),
        rva(nameptr_off),
        rva(ord_off),
    )

    dos = bytearray(0x80)
    dos[0:2] = b"MZ"
    struct.pack_into("<I", dos, 0x3C, 0x80)
    pe = bytearray()
    pe += b"PE\0\0"
    pe += struct.pack("<HHIIIHH", 0x14C, 1, 0, 0, 0, 0xE0, 0x210E)
    opt = bytearray(0xE0)
    struct.pack_into("<HBB", opt, 0, 0x10B, 0, 0)
    struct.pack_into("<III", opt, 4, 0x200, 0, 0)
    struct.pack_into("<II", opt, 16, 0, sec_rva)  # no DllMain
    struct.pack_into("<I", opt, 24, 0)
    struct.pack_into("<I", opt, 28, image_base)
    struct.pack_into("<II", opt, 32, 0x1000, 0x200)
    struct.pack_into("<HHHHHH", opt, 40, 4, 0, 0, 0, 4, 0)
    struct.pack_into("<II", opt, 56, 0x2000, 0x200)
    struct.pack_into("<IHH", opt, 64, 0, 3, 0)
    struct.pack_into("<IIII", opt, 72, 0x100000, 0x1000, 0x100000, 0x1000)
    struct.pack_into("<II", opt, 88, 0, 16)
    struct.pack_into("<II", opt, 96, rva(exp_dir_off), 40)
    pe += opt
    sh = bytearray(40)
    sh[0:5] = b".text"
    struct.pack_into("<IIIIIIHHI", sh, 8, 0x200, sec_rva, 0x200, 0x200, 0, 0, 0, 0, 0x60000020)
    headers = bytes(dos) + bytes(pe) + bytes(sh)
    hdr = bytearray(0x200)
    hdr[: len(headers)] = headers
    return bytes(hdr) + bytes(sec)


def check_live(user: bytes, pwd: bytes) -> int:
    if not BIN.is_file():
        print(f"binaire introuvable: {BIN}", file=sys.stderr)
        return 1
    payload = user + b"\n" + pwd + b"\n"
    with tempfile.TemporaryDirectory(prefix="loggin-") as td:
        tdir = Path(td)
        exe = tdir / "main.exe"
        shutil.copy(BIN, exe)
        (tdir / "libmingwex-0.dll").write_bytes(_stub_libmingwex())
        r = subprocess.run(
            [str(exe)],
            input=payload,
            capture_output=True,
            timeout=10,
            cwd=str(tdir),
        )
    out = (r.stdout or b"") + (r.stderr or b"")
    text = out.decode("latin1", "replace")
    print(text.strip())
    ok = "Logged in successfully" in text
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="user\\npass seulement")
    ap.add_argument("--user", default="", help="username déjà valide (génère un password)")
    ap.add_argument("--check", action="store_true", help="lance original/main.exe")
    args = ap.parse_args()

    assert inv_xorshift32(NEXT_TARGET) == USER_HASH
    assert xorshift32(USER_HASH) == NEXT_TARGET

    if args.user:
        try:
            user = args.user.encode("ascii")
        except UnicodeEncodeError:
            print(f"error: username non-ASCII : {args.user!r}", file=sys.stderr)
            return 1
        hu = hash32(user)
        if hu != USER_HASH:
            print(
                f"error: username {user.decode('ascii')!r} refusé "
                f"(hash={hu:#010x}, next={xorshift32(hu):#010x})",
                file=sys.stderr,
            )
            print(
                f"       le binaire exige next(hash(user)) == {NEXT_TARGET:#010x} "
                f"soit hash(user) == {USER_HASH:#010x} (xorshift32 bijectif).",
                file=sys.stderr,
            )
            if user == b"petik":
                print(
                    "       petik est la convention du dépôt, mais ici le hash username "
                    "est unique : pas de login libre.",
                    file=sys.stderr,
                )
            print("       exemple valide : vefxne  (py loggin-solve.py --user vefxne)", file=sys.stderr)
            return 1
        pwd = pair_for_user(user)
    else:
        user, pwd = default_pair()

    assert xorshift32(hash32(user)) == NEXT_TARGET
    assert hash32(pwd + user) == COMBO_TARGET

    if args.check:
        return check_live(user, pwd)
    if args.q:
        print(user.decode(), pwd.decode(), sep="\n")
        return 0
    print(f"user  {user.decode()}")
    print(f"pass  {pwd.decode()}")
    print(f"# hash(user)={hash32(user):#x}  next={xorshift32(hash32(user)):#x}")
    print(f"# hash(pass||user)={hash32(pwd + user):#x}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
