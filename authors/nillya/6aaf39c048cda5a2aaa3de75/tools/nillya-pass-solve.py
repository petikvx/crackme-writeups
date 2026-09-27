#!/usr/bin/env python3
"""Nillya's Pass CrackMe — ArmDot helpers (strings + VM dump).

Password not recovered yet (U_AZ was a false lead from VM immediates).

Usage:
  ./nillya-pass-solve.py --dump-strings
  ./nillya-pass-solve.py --dump-vm
  ./nillya-pass-solve.py -q          # empty + exit 2 until PASSWORD is set
"""

from __future__ import annotations

import argparse
import hashlib
import hmac as hm
import re
import struct
import sys
from pathlib import Path

try:
    from Crypto.Cipher import AES
    from Crypto.Hash import HMAC, SHA256
except ImportError:
    sys.stderr.write("need pycryptodome: pip install pycryptodome\n")
    sys.exit(1)

ROOT = Path(__file__).resolve().parents[1]
SRC_STRINGS = ROOT / "original" / "crackme-src" / "_---------" / "----_-----.cs"
SRC_KF = ROOT / "original" / "crackme-src" / "_---------" / "----.cs"
EXE = ROOT / "original" / "crackme.exe"

PASSWORD: str | None = None  # TBD — U_AZ rejected live (Wrong!)

DISPATCHER = {
    0: "_002E_0021_003C_003F__003C_0024_003E_002F_",
    1: "_002A_0026_005E_0023_007D_0040_0029_003F_0021_0026",
    2: "_0024_003A_0040_003E_002E_0028_002E_0028_002B_005E",
    3: "_0028_003B_003B_007D_002B_0024_007C_002F_005B_0023",
    4: "_003A_0023_003A_005B_007B_0026_0026_0028_002D_003A",
    5: "_003B_002D_0040_0021_0040_002F_003C_0028_0028_0021",
    6: "_002B_003B_0024__0025_007B_002B_0024_0024_005D",
    7: "_003B_0025_002E_005D_003C_007B_002A_003A_0026_0040",
    8: "_0021_0028_002B_007D_003B_0026_0026_0040_0023_0029",
    9: "_003D_0029__003D_0040_0028_0021_003C_003A_002E",
    10: "@_003B_0021_003B_003D_0023_005D_002B_0028_007C",
    11: "_003F_002D_003D_007D_003F_005E__0029_007C_0024",
    12: "_0021_002F_0026_0025_0029_0040_007E_007D_007B_002B",
    13: "_0023_002C_002E_0025_002A_005B_002E_0040_003C_0023",
    14: "_0026__003A_002E_003B_002B_002C_002B_0029_",
    15: "_003E_0040_003B_007C_003E_002C_0023_003B_007D_0029",
    16: "_0024_002A_007E_007B_003D_002B_003D_005B_003A_0025",
    17: "_007D_002A_007D_0029_005E_003B_0029_0021_007B_005D",
    18: "_002D_003D_002F_007C_003D_002A_005B_0026__005B",
    19: "_003F_003A_005D_0029_002C_0025_007B_003F_007C_003F",
    20: "_005D_003B_007C_002E_002C_003F__005E_0029_002D",
    21: "_0029_005D_002C_005D_0024_007D_003E_002E_003E_005B",
    22: "_0023_005E_0028_003E_005B_0028__0028_0029_0026",
    23: "_002F_007E_002C_003C_003B_007D_0021_005E_002E_0026",
    24: "_003A_005D_002E_002C_007D_0025_003F_005B_007E_002D",
    25: "_0021_0024_003F_007E_003B_005B_002A_005B_0025_003C",
    26: "_005D_002E_0040__007C_003F_002F_003D_007C_002C",
    27: "_0028_0029_005B_007B_003C_0023_002A_003E_007C_0028",
    28: "_005E_003B_003A_002B_002F_002A_002A_0024_003C_007C",
    29: "_002D_0040_007C_002B_007C_003E_002A_003B_007B_002A",
    30: "_003E_003D_002B_003C_002B_002E_003B_0025_002A_002F",
    31: "_005B_005B_007C_005E_0028_0024_003D_005E_0029_003A",
    32: "_005E_003F_0024_003F_0025_0025_007C_0029_005E_002F",
    33: "_0024_0021_007E_007D_0021_0023_003F_005B_003D_0024",
    34: "_0023_003B_003E_005E_0024_002A_0025_0026_003B_002B",
    35: "_0021_002C_003A_002F_002B_002D_007D_003B_0029_005B",
    36: "_003F_003F_007C_002F___002D_003F_0040_007D",
    37: "_007C_007D_0025_003B_007D_002F_003D_0025_0021_003B",
    38: "_007D_003B_0029_002C_005B_005E_002A_007E_003D_007E",
    39: "_002E_005B_002F_002B_007D_003C_003D_007E_0021_002E",
    40: "_003D_002A_0025_002F_002E_005D_0025_003F_002E_",
    41: "_005E_005D_003F_007E__003A_0024_003D_007B_005D",
    42: "_002B_003C_003A_0040_003F_003B_003B_005E_0023_002D",
    43: "_0025_003D_0040_005B_0026_007D_0023_003B_003A_0029",
    44: "_002D_005E_0021_007D_003F_0040_0021_0025_0040_0025",
    45: "_003D_0023_002C_005E__002A_0028_005E_007C_003D",
    46: "_003E_005B_003E_002A_005E_007B_007E_007B_0023_",
    47: "_005D_0021_0029_002C_0025_0024_005B_0021_007B_002C",
    48: "_003D_007B_003F_005D_003A_003A_007C_002B_007B_002A",
    49: "_0024_003E_002E_005E_005D_0024_0023_002F_005E_0021",
    50: "@_003A_0025_0024_003E_005D_0021_007D_0023_0029",
    51: "_007B_005D_002F_0028_003A_002C_002A_003C_0023_",
    52: "_002C__003A_003C_0029_007C_007E_002D_003E_002A",
}

K0, K1, K2, K3 = 1633270215, 709198942, -1318071627, -1437982615
N_STRINGS = 227
TAG0 = 7173178226208939462
TAG1 = -5455545852567938957

WHITELIST = {1568416511, 1374365350, 1734831579}
CONST_SEED = 1819082106


def _parse_int(tok: str) -> int:
    tok = tok.strip()
    return int(tok, 16) if tok.lower().startswith("0x") else int(tok)


def _eval_expr(expr: str) -> int:
    expr = expr.strip().rstrip(",")
    m = re.fullmatch(r"\((.+?)\s*\^\s*(.+?)\)\s*-\s*(.+)", expr)
    if not m:
        if expr == "0":
            return 0
        raise ValueError(expr)
    a, b, c = map(_parse_int, m.groups())
    return ((a ^ b) - c) & 0xFFFFFFFF


def _rol(x: int, n: int) -> int:
    x &= 0xFFFFFFFF
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF


def _derive(k0: int, k1: int, k2: int, k3: int, tag: int, out_len: int) -> bytes:
    key_mat = struct.pack(
        "<4I", k0 & 0xFFFFFFFF, k1 & 0xFFFFFFFF, k2 & 0xFFFFFFFF, k3 & 0xFFFFFFFF
    )
    t1 = (tag * (-1640531527)) & 0xFFFFFFFF
    t2 = ((tag + 1) * (-2048144789)) & 0xFFFFFFFF
    msg = struct.pack(
        "<2I",
        (k0 ^ _rol(k2, 7) ^ t1) & 0xFFFFFFFF,
        (k1 ^ _rol(k3, 17) ^ t2) & 0xFFFFFFFF,
    )
    return HMAC.new(key_mat, msg, digestmod=SHA256).digest()[:out_len]


def load_dword_blob(cs_path: Path = SRC_STRINGS) -> bytes:
    text = cs_path.read_text(encoding="utf-8", errors="ignore")
    method_pat = re.compile(
        r"private static int (@?_?[0-9A-Fa-fx_]+)\(int [^)]+\)\s*\{\s*return [^\n]*switch\s*\{(.*?)\};\s*\}",
        re.S,
    )
    methods: dict[str, dict[int, int]] = {}
    for name, body in method_pat.findall(text):
        table: dict[int, int] = {}
        for cm in re.finditer(r"(\d+)\s*=>\s*([^,\n]+)", body):
            expr = cm.group(2).rstrip().rstrip(",")
            if expr.strip().startswith("_"):
                continue
            try:
                table[int(cm.group(1))] = _eval_expr(expr)
            except ValueError:
                pass
        methods[name] = table

    arr = bytearray(20176)
    for i in range(5044):
        name = DISPATCHER[i // 96]
        val = methods[name].get(i % 96, 0)
        struct.pack_into("<I", arr, i * 4, val)
    return bytes(arr)


def decrypt_strings(cs_path: Path = SRC_STRINGS) -> list[str]:
    arr = load_dword_blob(cs_path)
    aes_key = _derive(K0, K1, K2, K3, 69, 16)
    mac_key = _derive(K0, K1, K2, K3, 65, 32)
    hdr_iv = _derive(K0, K1, K2, K3, 72, 16)

    digest = HMAC.new(mac_key, arr, digestmod=SHA256).digest()
    num = int.from_bytes(digest[0:8], "little")
    num2 = int.from_bytes(digest[8:16], "little")
    if ((num ^ TAG0) | (num2 ^ (TAG1 & 0xFFFFFFFFFFFFFFFF))) != 0:
        raise RuntimeError("ArmDot string blob MAC mismatch")

    hdr_len = N_STRINGS * 48
    hdr = AES.new(aes_key, AES.MODE_CBC, hdr_iv).decrypt(arr[:hdr_len])
    entries: list[tuple[int, int, int, bytes, bytes] | None] = [None] * N_STRINGS
    off = 0
    for _ in range(N_STRINGS):
        idx, offset, size, strlen = struct.unpack_from("<4i", hdr, off)
        off += 16
        iv = hdr[off : off + 16]
        off += 16
        mac = hdr[off : off + 16]
        off += 16
        entries[idx] = (offset, size, strlen, iv, mac)

    out: list[str] = []
    for i in range(N_STRINGS):
        offset, size, strlen, iv, mac = entries[i]  # type: ignore[misc]
        ct = arr[offset : offset + size]
        msg = struct.pack("<3I", i & 0xFFFFFFFF, offset & 0xFFFFFFFF, strlen & 0xFFFFFFFF) + iv + ct
        got = HMAC.new(mac_key, msg, digestmod=SHA256).digest()[:16]
        if got != mac:
            raise RuntimeError(f"string[{i}] MAC fail")
        pt = AES.new(aes_key, AES.MODE_CBC, iv).decrypt(ct)
        out.append(pt[:strlen].decode("utf-8"))
    return out


def _cxor(a: int, b: int) -> int:
    return (a ^ b) & 0xFFFFFFFF


def _to_i32(x: int) -> int:
    x &= 0xFFFFFFFF
    return x - 0x100000000 if x >= 0x80000000 else x


def _ints_to_bytes(arr: list[int]) -> bytes:
    out = bytearray(32)
    for i in range(32):
        out[i] = ((arr[i >> 2] & 0xFFFFFFFF) >> ((i & 3) * 8)) & 0xFF
    return bytes(out)


def _put_i32(buf: bytearray, off: int, v: int) -> None:
    struct.pack_into("<i", buf, off, _to_i32(v))


def _u64_mul(a: int, b: int) -> int:
    return (a * b) & 0xFFFFFFFFFFFFFFFF


def _mix64(x: int) -> int:
    x &= 0xFFFFFFFFFFFFFFFF
    x ^= x >> 30
    x = _u64_mul(x, 13787848793156543929)
    x ^= x >> 27
    x = _u64_mul(x, 10723151780598845931)
    return x ^ (x >> 31)


def _global_mask() -> int:
    num = CONST_SEED & 0xFFFFFFFF
    return _mix64(((num << 32) | (num ^ 0xA511E9B3)) ^ 0xD6E8FEB86659FD93)


def _mut_byte(mask: int, pid: int, block: int, i: int) -> int:
    c1 = (-7046029254386353131) & 0xFFFFFFFFFFFFFFFF
    c2 = (-2960836687051489901) & 0xFFFFFFFFFFFFFFFF
    c3 = (-6884282663029611473) & 0xFFFFFFFFFFFFFFFF
    v = (
        mask
        ^ _u64_mul(pid & 0xFFFFFFFF, c1)
        ^ _u64_mul((block + 1) & 0xFFFFFFFF, c2)
        ^ _u64_mul((i + 11) & 0xFFFFFFFF, c3)
    )
    v = _mix64(v)
    return (v >> ((i & 7) * 8)) & 0xFF


def _apply_mutation(kf: bytes, pid: int, block: int, mask: int) -> bytes:
    if pid in WHITELIST or mask == 0:
        return kf
    out = bytearray(kf)
    for i in range(32):
        out[i] ^= _mut_byte(mask, pid, block, i)
    return bytes(out)


def _extract_method(src: str, name: str) -> str | None:
    for prefix in (f"private static byte[] {name}(", f"private static byte[] @{name}("):
        idx = src.find(prefix)
        if idx >= 0:
            break
    else:
        return None
    brace = src.find("{", idx)
    depth = 0
    for i, ch in enumerate(src[brace:], brace):
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return src[brace + 1 : i]
    return None


def _get_share(src: str, name: str) -> bytes:
    body = _extract_method(src, name)
    if body is None:
        raise KeyError(name)
    parts = list(
        re.finditer(
            r"int\[\] array = new int\[8\];(.*?)return _007B_002D_0024_003A_003B_002D_0028__003F_002F\(array, 32\);",
            body,
            re.S,
        )
    )
    if not parts:
        raise ValueError(f"no int[8] in {name}")
    chunk = parts[-1].group(1)
    arr = [0] * 8
    for am in re.finditer(r"array\[(\d+)\] = ([^;]+);", chunk):
        idx = int(am.group(1))
        a, b = [int(p.strip(), 0) & 0xFFFFFFFF for p in am.group(2).split("^")]
        arr[idx] = _cxor(a, b)
    return _ints_to_bytes(arr)


def dump_vm_programs(out_dir: Path | None = None) -> dict[int, bytes]:
    """Decrypt all 20 PE-section VM programs (AES-GCM + antitamper keyFactory mask)."""
    src = SRC_KF.read_text(encoding="utf-8", errors="ignore")
    exe = EXE.read_bytes()
    e_lfanew = struct.unpack_from("<I", exe, 0x3C)[0]
    num_sections = struct.unpack_from("<H", exe, e_lfanew + 6)[0]
    opt_size = struct.unpack_from("<H", exe, e_lfanew + 20)[0]
    sec_off = e_lfanew + 24 + opt_size
    sec = None
    for i in range(num_sections):
        off = sec_off + i * 40
        name = exe[off : off + 8].split(b"\0")[0]
        vsize, _va, _rsize, rptr = struct.unpack_from("<IIII", exe, off + 8)
        if name == b"~-=&":
            sec = bytearray(exe[rptr : rptr + vsize])
            break
    if sec is None:
        raise RuntimeError("PE section ~-=& not found")

    factories: dict[tuple[int, int], tuple[str, str, str, str]] = {}
    for m in re.finditer(r"return _002D_002F_003F_0024_007B_0028_0029_003F_0021_007C\(", src):
        i = m.end()
        depth = 1
        start = i
        while i < len(src) and depth:
            if src[i] == "(":
                depth += 1
            elif src[i] == ")":
                depth -= 1
            i += 1
        args = src[start : i - 1]
        mm = re.search(r",\s*(-?\d+)\s*,\s*(\d+)\s*$", args)
        if not mm:
            continue
        pid, blk = int(mm.group(1)), int(mm.group(2))
        names = re.findall(r"(@?\w+)\s*\(", args)
        shares = [n.lstrip("@") for n in names if n.startswith("_") or n.startswith("@")][:4]
        if len(shares) == 4:
            factories[(pid, blk)] = tuple(shares)  # type: ignore[assignment]

    def fnv(data: bytes) -> int:
        h = 2166136261
        for x in data:
            h = ((h ^ x) * 16777619) & 0xFFFFFFFF
        return h

    def u32(buf: bytes, o: int) -> int:
        return struct.unpack_from("<I", buf, o)[0]

    def rotl(x: int, n: int) -> int:
        x &= 0xFFFFFFFF
        return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF

    name = b"~-=&"
    h = fnv(name)
    seed_off = (h % 13) * 4
    seed = bytes(sec[seed_off : seed_off + 16])
    schema_off = 64 + ((h ^ u32(seed, 0)) % 12) * 4
    blob = bytearray(sec[schema_off : schema_off + 100])
    num = (
        h ^ u32(seed, 0) ^ rotl(u32(seed, 4), 7) ^ rotl(u32(seed, 8), 13) ^ rotl(u32(seed, 12), 21)
    ) & 0xFFFFFFFF
    for i in range(len(blob)):
        if (i & 3) == 0:
            num ^= (num << 13) & 0xFFFFFFFF
            num &= 0xFFFFFFFF
            num ^= num >> 17
            num &= 0xFFFFFFFF
            num ^= (num << 5) & 0xFFFFFFFF
            num &= 0xFFFFFFFF
            num = (num + (((i + 1) * -1640531527) & 0xFFFFFFFF)) & 0xFFFFFFFF
        blob[i] ^= (num >> ((i & 3) * 8)) & 0xFF
    F = [struct.unpack_from("<i", blob, i * 4)[0] for i in range(25)]
    marker, key_xor, schema_size = F[0], F[1], F[2]

    def xor_read(off: int) -> int:
        raw = struct.unpack_from("<i", sec, off)[0]
        return _to_i32(raw ^ key_xor ^ _to_i32(off * -1640531527))

    base = schema_size
    prog_count = xor_read(base + F[7])
    dir_start = xor_read(base + F[8])
    key16 = bytes(sec[base + F[9] : base + F[9] + 16])
    seed8 = bytes(sec[base + F[4] : base + F[4] + 8])
    prog_rec, cipher_rec = F[10], F[18]
    mask = _global_mask()

    if out_dir is None:
        out_dir = ROOT / "analysis" / "vm-programs"
    out_dir.mkdir(parents=True, exist_ok=True)

    result: dict[int, bytes] = {}
    for i in range(prog_count):
        off = dir_start + i * prog_rec
        p = dict(
            pid=xor_read(off + F[11]),
            key_share=xor_read(off + F[12]),
            total_len=xor_read(off + F[13]),
            nblocks=xor_read(off + F[14]),
            cipher_off=xor_read(off + F[15]),
            plain_auth=xor_read(off + F[16]),
            enc_flag=xor_read(off + F[17]),
        )
        pid = p["pid"]
        plain = bytearray(p["total_len"])
        for j in range(p["nblocks"]):
            boff = p["cipher_off"] + j * cipher_rec
            po, pl = xor_read(boff + F[19]), xor_read(boff + F[20])
            co, cl = xor_read(boff + F[21]), xor_read(boff + F[22])
            nonce = bytes(sec[boff + F[23] : boff + F[23] + 12])
            tag = bytes(sec[boff + F[24] : boff + F[24] + 16])
            ct = bytes(sec[co : co + cl])
            aad = bytearray(60)
            aad[0:8] = seed8
            aad[8:24] = key16
            _put_i32(aad, 24, marker)
            _put_i32(aad, 28, pid)
            _put_i32(aad, 32, j)
            _put_i32(aad, 36, po)
            _put_i32(aad, 40, pl)
            _put_i32(aad, 44, p["key_share"])
            _put_i32(aad, 48, p["enc_flag"])
            _put_i32(aad, 52, p["plain_auth"])
            _put_i32(aad, 56, p["total_len"])
            shares = [_get_share(src, n) for n in factories[(pid, j)]]
            kf = bytes(a ^ b ^ c ^ d for a, b, c, d in zip(*shares))
            kf = _apply_mutation(kf, pid, j, mask)
            inner = hm.new(key16, kf, hashlib.sha256).digest()
            msg = bytearray(9)
            _put_i32(msg, 0, pid)
            _put_i32(msg, 4, j)
            msg[8] = 1
            key = hm.new(inner, bytes(msg), hashlib.sha256).digest()
            cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
            cipher.update(bytes(aad))
            pt = cipher.decrypt_and_verify(ct, tag)
            plain[po : po + pl] = pt
        result[pid] = bytes(plain)
        (out_dir / f"{pid}.bin").write_bytes(plain)
    return result


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="print password only (exit 2 if unknown)")
    ap.add_argument("--check", action="store_true", help="exit 0 if PASSWORD is set (not yet)")
    ap.add_argument("--dump-strings", action="store_true", help="decrypt ArmDot string table")
    ap.add_argument("--dump-vm", action="store_true", help="decrypt all VM programs")
    args = ap.parse_args()

    if args.dump_strings:
        for i, s in enumerate(decrypt_strings()):
            print(f"{i}: {s!r}")
        return 0

    if args.dump_vm:
        progs = dump_vm_programs()
        print(f"decrypted {len(progs)} programs → analysis/vm-programs/")
        return 0

    if args.q:
        if not PASSWORD:
            return 2
        print(PASSWORD)
        return 0
    if args.check:
        if not PASSWORD:
            print("FAIL (password unknown)")
            return 1
        print("OK")
        return 0
    print(f"password: {PASSWORD!r}")
    print("status: pending — ArmDot VM dumped; predicate not recovered")
    return 0 if PASSWORD else 2


if __name__ == "__main__":
    sys.exit(main())
