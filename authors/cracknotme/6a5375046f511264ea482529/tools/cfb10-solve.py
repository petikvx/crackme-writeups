#!/usr/bin/env python3
"""Solveur CFB10 (CrackNotMe — The Keymaster's Sigil / RSA-1024 key replacement).

CFB10 vérifie une signature RSA-1024 PKCS#1 v1.5 (SHA-256 du username) via CNG
(BCrypt*) contre un PUBLICKEYBLOB CAPI (148 octets) @ VA 0x140022420.

Factoriser n est hors scope : on remplace la clé publique dans une *copie*
du PE, on signe avec notre privée.

Wine 6 ne gère pas L"CAPIPUBLICBLOB" → le patch convertit en RSAPUBLICBLOB
(BCRYPT_RSAKEY_BLOB, 0x9b octets) planté @ VA 0x14002723d, retarget LEA +
cbInput, et renomme le type (même approche que les write-ups spoiler site).

Usage :
  python3 cfb10-solve.py -q
  python3 cfb10-solve.py --check
  python3 cfb10-solve.py --run
  python3 cfb10-solve.py --user alice --run
"""

from __future__ import annotations

import argparse
import os
import shutil
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
EXE = ROOT / "original" / "CFB10.exe"

DEMO_USER = "keymaster"

IMAGE_BASE = 0x140000000
TEXT_VA, TEXT_RAW = 0x1000, 0x400
RDATA_VA, RDATA_RAW = 0x22000, 0x20600

ORIG_BLOB_VA = 0x140022420
ORIG_BLOB_LEN = 0x94
LEA_VA = 0x14000290a
CB_VA = 0x14000291a
CAPI_TYPE_VA = 0x140022718
PLANT_VA = 0x14002723d
RSA_BLOB_LEN = 0x9b

# Clé RSA-1024 dédiée au write-up (exponent 65537) — PAS la clé auteur.
PRIVATE_PEM = b"""-----BEGIN RSA PRIVATE KEY-----
MIICWQIBAAKBgQC478w4dD5n7ml8EMlwyuphj02qoURNQ7q1aG0GsMI2IO979YTL
2H0JNmeiEHudiEsbXcFDQQwgHNUYQMQ2NAGVPAA0DIPGB7H807Dp4Jn1uW42niww
YGz/LNtGZsQ9T3eYW2JIQPBV8847m24USMLcyLnE623jBDWPpYcX3PycxwIDAQAB
An80Az1so0Tp9iO0wQPmtSs2RReS5chP8ryQSM5hE1WL47d3JZYzvq9r5+E9s2UQ
6UQ2bifswl6mqXVFXPHSTM4ksFFgTmBUa6g9Rr2dJXQYuK3a6gsXZkmIXnW1hFqe
y0lWYCO+CWfuac4vKSwSHJeLuIjQOUU/WwlmQ7AOGplBAkEA3bnhkwamhhHfecQc
JAx5Lk40bAj9eN9E+3quFQcw7uux2MQen6WBFELDjytsV0aN+bhj6wP/zqaHDjY6
C8dwxQJBANWGF13so8jIb12NMbGlgwhd9WtjLcY1FE3ZNNigHaDgxCgIaQDD1YQJ
WCr+Ru8hFM64Xk5WbzSMWUxW13JwWBsCQEm7AyDiCEPy845JQVZXc4CLbvEx+B/W
ltjNTdAeSQ5aABTl+oz5+zdikCcuuGM5SgLtZwSCmvD7/VMjgx/hnUUCQFZ+vzB5
D8/iAdrvu1WvKmlVRnl976j/D36JonKuSdJFurBM19xLeE7ISkMARlPQHtGuteUd
9mZfBD18YEInaEkCQALtys0lbQAqNtHeN2XhCu8HwEXxFa1HlG1BGCEwuqHhOy84
db7eMI77QyhMD+WL7m39D78aSt7295hf+nuuLzE=
-----END RSA PRIVATE KEY-----
"""


def va_to_off_text(va: int) -> int:
    return TEXT_RAW + (va - IMAGE_BASE - TEXT_VA)


def va_to_off_rdata(va: int) -> int:
    return RDATA_RAW + (va - IMAGE_BASE - RDATA_VA)


def load_key():
    return serialization.load_pem_private_key(PRIVATE_PEM, password=None)


def make_rsapublicblob(n: int, e: int = 65537) -> bytes:
    """BCRYPT_RSAKEY_BLOB public (Magic RSA1) + exp BE + modulus BE."""
    exp = e.to_bytes((e.bit_length() + 7) // 8, "big")
    if len(exp) != 3:
        # 65537 → toujours 3 octets
        exp = e.to_bytes(3, "big")
    mod = n.to_bytes(1024 // 8, "big")
    hdr = struct.pack(
        "<IIIIII",
        0x31415352,  # BCRYPT_RSAPUBLIC_MAGIC 'RSA1'
        1024,
        len(exp),
        len(mod),
        0,
        0,
    )
    blob = hdr + exp + mod
    if len(blob) != RSA_BLOB_LEN:
        raise RuntimeError(f"unexpected RSAPUBLICBLOB len {len(blob):#x}")
    return blob


def make_capipublicblob(n: int, e: int = 65537) -> bytes:
    """Legacy PUBLICKEYBLOB (CALG_RSA_SIGN) — format d’origine @ 0x140022420."""
    mod = n.to_bytes(1024 // 8, "little")
    blob = bytearray()
    blob += struct.pack("<BBHI", 0x06, 0x02, 0, 0x2400)  # PUBLICKEYBLOB / CALG_RSA_SIGN
    blob += struct.pack("<III", 0x31415352, 1024, e)  # RSA1
    blob += mod
    if len(blob) != ORIG_BLOB_LEN:
        raise RuntimeError(f"unexpected CAPIPUBLICBLOB len {len(blob):#x}")
    return bytes(blob)


def sign_username(key, username: str) -> str:
    sig = key.sign(username.encode("utf-8"), padding.PKCS1v15(), hashes.SHA256())
    if len(sig) != 128:
        raise RuntimeError(f"sig len {len(sig)}")
    return sig.hex()


def patch_exe_for_wine(data: bytes, key) -> bytes:
    """CAPI→RSAPUBLICBLOB + plant + LEA/cbInput (compatible Wine bcrypt)."""
    pub = key.public_key().public_numbers()
    blob = make_rsapublicblob(pub.n, pub.e)
    out = bytearray(data)

    plant_off = va_to_off_rdata(PLANT_VA)
    if any(out[plant_off : plant_off + RSA_BLOB_LEN]):
        # padding attendu à zéro dans le PE d’origine
        raise RuntimeError(f"plant site {PLANT_VA:#x} not zero-filled")
    out[plant_off : plant_off + RSA_BLOB_LEN] = blob

    lea_off = va_to_off_text(LEA_VA)
    if out[lea_off : lea_off + 3] != b"\x48\x8d\x05":
        raise RuntimeError("LEA pubkey not found")
    struct.pack_into("<i", out, lea_off + 3, PLANT_VA - (LEA_VA + 7))

    cb_off = va_to_off_text(CB_VA)
    if out[cb_off : cb_off + 8] != bytes.fromhex("c744242894000000"):
        raise RuntimeError("cbInput site not found")
    out[cb_off + 4] = RSA_BLOB_LEN

    type_off = va_to_off_rdata(CAPI_TYPE_VA)
    old = "CAPIPUBLICBLOB\0".encode("utf-16le")
    new = "RSAPUBLICBLOB\0".encode("utf-16le")
    if out[type_off : type_off + len(old)] != old:
        raise RuntimeError("CAPIPUBLICBLOB string not found")
    out[type_off : type_off + len(new)] = new
    return bytes(out)


def patch_exe_capi_inplace(data: bytes, key) -> bytes:
    """Remplacement in-place du blob CAPI (solution « textbook » Windows)."""
    pub = key.public_key().public_numbers()
    blob = make_capipublicblob(pub.n, pub.e)
    out = bytearray(data)
    off = va_to_off_rdata(ORIG_BLOB_VA)
    if out[off : off + 8] != bytes.fromhex("0602000000240000"):
        raise RuntimeError("original PUBLICKEYBLOB header mismatch")
    out[off : off + ORIG_BLOB_LEN] = blob
    return bytes(out)


def check_original(data: bytes) -> list[str]:
    errs: list[str] = []
    off = va_to_off_rdata(ORIG_BLOB_VA)
    hdr = data[off : off + 20]
    if hdr[:8] != bytes.fromhex("0602000000240000"):
        errs.append(f"PUBLICKEYBLOB header @ {ORIG_BLOB_VA:#x}: {hdr[:8].hex()}")
    magic, bitlen, exp = struct.unpack_from("<III", data, off + 8)
    if magic != 0x31415352 or bitlen != 1024 or exp != 65537:
        errs.append(f"RSAPUBKEY magic/bitlen/exp: {magic:#x}/{bitlen}/{exp}")
    if b"BCryptVerifySignature" not in data:
        errs.append("BCryptVerifySignature import missing")
    type_off = va_to_off_rdata(CAPI_TYPE_VA)
    if data[type_off : type_off + 28] != "CAPIPUBLICBLOB".encode("utf-16le"):
        errs.append("CAPIPUBLICBLOB wide string missing")
    # cmp / test after verify in main
    jz_off = va_to_off_text(0x140003E5C)
    if data[jz_off : jz_off + 2] != b"\x74\x1f":
        errs.append(f"JZ after verify @ 0x140003e5c: {data[jz_off:jz_off+2].hex()}")
    return errs


def wine_bin() -> str | None:
    for name in ("wine64", "wine"):
        p = shutil.which(name)
        if p:
            return p
    return None


def run_live(username: str, mode: str = "wine", quiet: bool = False) -> tuple[str, str]:
    wine = wine_bin()
    if not wine:
        raise RuntimeError("wine not available")
    if not EXE.is_file():
        raise RuntimeError(f"missing {EXE}")

    key = load_key()
    data = EXE.read_bytes()
    if mode == "capi":
        patched = patch_exe_capi_inplace(data, key)
    else:
        patched = patch_exe_for_wine(data, key)
    sig_hex = sign_username(key, username)

    with tempfile.TemporaryDirectory(prefix="cfb10-") as td:
        tdir = Path(td)
        exe = tdir / "CFB10.exe"
        exe.write_bytes(patched)
        env = os.environ.copy()
        env["WINEDEBUG"] = "-all"
        proc = subprocess.Popen(
            [wine, str(exe)],
            cwd=str(tdir),
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            env=env,
        )
        payload = f"{username}\n{sig_hex}\n\n".encode()
        try:
            out, _ = proc.communicate(payload, timeout=45)
        except subprocess.TimeoutExpired:
            proc.kill()
            out, _ = proc.communicate(timeout=5)
        text = out.decode("utf-8", "replace").replace("\r", "")
    if not quiet:
        print(text)
    return sig_hex, text


def main() -> int:
    ap = argparse.ArgumentParser(description="CFB10 Keymaster — RSA key-replacement solver")
    ap.add_argument("-q", "--quiet", action="store_true", help="username + sig hex only")
    ap.add_argument("--user", default=DEMO_USER, help=f"username to sign (default: {DEMO_USER})")
    ap.add_argument(
        "--check",
        action="store_true",
        help="verify embedded PUBLICKEYBLOB / CAPIPUBLICBLOB markers in original EXE",
    )
    ap.add_argument(
        "--run",
        action="store_true",
        help="patch temp EXE + wine live (expects ACCESS GRANTED)",
    )
    ap.add_argument(
        "--mode",
        choices=("wine", "capi"),
        default="wine",
        help="wine=RSAPUBLICBLOB plant (default, Wine-OK); capi=in-place PUBLICKEYBLOB",
    )
    ap.add_argument(
        "--write-patched",
        type=Path,
        help="write patched PE to this path (does not run)",
    )
    args = ap.parse_args()

    key = load_key()

    if args.check:
        if not EXE.is_file():
            print(f"missing {EXE}", file=sys.stderr)
            return 1
        errs = check_original(EXE.read_bytes())
        if errs:
            for e in errs:
                print(f"FAIL: {e}", file=sys.stderr)
            return 1
        if args.quiet:
            print("ok")
        else:
            pub = key.public_key().public_numbers()
            print(
                f"check: OK  blob@ {ORIG_BLOB_VA:#x}  "
                f"RSA-1024 e={pub.e}  demo_user={DEMO_USER}"
            )
        if not args.run and args.write_patched is None:
            return 0

    if args.write_patched is not None:
        data = EXE.read_bytes()
        patched = (
            patch_exe_capi_inplace(data, key)
            if args.mode == "capi"
            else patch_exe_for_wine(data, key)
        )
        args.write_patched.write_bytes(patched)
        sig = sign_username(key, args.user)
        if args.quiet:
            print(f"{args.user} {sig}")
        else:
            print(f"wrote {args.write_patched} ({len(patched)} bytes, mode={args.mode})")
            print(f"user={args.user}")
            print(f"sig={sig}")
        if not args.run:
            return 0

    if args.run:
        try:
            sig, text = run_live(args.user, mode=args.mode, quiet=args.quiet)
        except Exception as exc:  # noqa: BLE001
            print(str(exc), file=sys.stderr)
            return 1
        if "ACCESS GRANTED" not in text:
            if args.quiet:
                print(text, file=sys.stderr)
            print("live FAIL: no ACCESS GRANTED", file=sys.stderr)
            return 1
        if args.quiet:
            print(f"{args.user} {sig}")
        else:
            print(f"live: OK (user={args.user!r}, mode={args.mode})")
        return 0

    # default: print demo credentials
    sig = sign_username(key, args.user)
    if args.quiet:
        print(f"{args.user} {sig}")
        return 0

    print("CFB10 — The Keymaster's Sigil (RSA-1024 key replacement)")
    print(f"  user : {args.user}")
    print(f"  sig  : {sig}")
    print("  python3 tools/cfb10-solve.py --check")
    print("  python3 tools/cfb10-solve.py --run")
    print("  python3 tools/cfb10-solve.py --mode capi --write-patched /tmp/CFB10-capi.exe")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
