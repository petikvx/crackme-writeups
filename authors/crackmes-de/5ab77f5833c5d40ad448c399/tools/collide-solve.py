#!/usr/bin/env python3
"""Keyfile ``.key`` pour collide (crp, crackmes.de).

Le binaire ne prend pas d'argument : il ``stat``/``open`` le fichier ``.key``
dans le cwd, mode exactement 0400, propriétaire = uid/gid du processus.
Le contenu lie ``pw_uid``, ``pw_gid`` et un pli du ``pw_name``, puis exige
``MD5(moitié_1) == MD5(TEA_decrypt(moitié_2))`` avec les deux moitiés distinctes.

``-q`` : une ligne (user, uid, gid, custom, taille).
``--check`` : écrit un ``.key`` temporaire, lance le binaire, exige
``[ key accepted ]``, puis un refus (mode 0644) et le leurre
``hmpf, i need a hint...``.
``--out PATH`` : écrit le keyfile (mode 0400).

La collision MD5 (préfixe identique, deux blocs) est produite par ``fastcoll``
(Marc Stevens / hashclash ``md5fastcoll``). Cherché dans ``$FASTCOLL`` puis
dans le ``PATH``.
"""

from __future__ import annotations

import argparse
import hashlib
import os
import pwd
import shutil
import stat
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

DELTA = 0x9E3779B9
HINT = b"hmpf, i need a hint..."
WIN = b"[ key accepted ]"
BIN_REL = Path("original/collide/collide")


def u32(x: int) -> int:
    return x & 0xFFFFFFFF


def i32(x: int) -> int:
    x &= 0xFFFFFFFF
    return x - 0x100000000 if x >= 0x80000000 else x


def fold_name(name: str) -> int:
    """Pli de ``pw_name`` (``sub_8048750``) : int32, doublement tant que ``j & 3``."""
    j = 99
    for ch in name.encode("ascii"):
        prod = i32(ch * j)
        j = i32(ch ^ u32(prod >> 3))
        guard = 0
        while j & 3:
            j = i32(j * 2)
            guard += 1
            if guard > 40:
                raise RuntimeError(f"pli divergent sur {name!r}")
    return u32(j)


def identity(name: str, uid: int, gid: int) -> tuple[int, int, int]:
    custom = u32((gid & 1) + 2 * (uid & 1) + fold_name(name))
    return u32(uid), u32(gid), custom


def craft_block(target: int, w0: int, w1: int, w2: int) -> bytes:
    """16 octets dont ``w0 ^ (w3 + w2*w1) == target`` (``sub_804872C``)."""
    w3 = u32((w0 ^ target) - u32(w2 * w1))
    return struct.pack("<IIII", w0, w1, w2, w3)


def mix(block: bytes) -> int:
    w0, w1, w2, w3 = struct.unpack("<IIII", block)
    return u32(w0 ^ u32(w3 + u32(w2 * w1)))


def build_prefix(uid: int, gid: int, custom: int) -> bytes:
    """64 octets : offset u16=2, trois blocs, puis uid/gid/custom aux offsets 50/54/58."""
    off_uid, off_gid, off_custom = 50, 54, 58
    b0 = craft_block(off_uid, 0x11111111, 0x01020304, 0x00000007)
    b1 = craft_block(off_gid, 0x22222222, 0x05060708, 0x00000009)
    b2 = craft_block(off_custom, 0x33333333, 0x0A0B0C0D, 0x0000000B)
    if (mix(b0), mix(b1), mix(b2)) != (off_uid, off_gid, off_custom):
        raise RuntimeError("mix des blocs d'en-tête")
    prefix = bytearray(64)
    struct.pack_into("<H", prefix, 0, 2)
    prefix[2:18] = b0
    prefix[18:34] = b1
    prefix[34:50] = b2
    struct.pack_into("<I", prefix, off_uid, uid)
    struct.pack_into("<I", prefix, off_gid, gid)
    struct.pack_into("<I", prefix, off_custom, custom)
    return bytes(prefix)


def tea_encrypt(data: bytes, key: tuple[int, int, int, int]) -> bytes:
    """TEA 32 tours, delta 0x9E3779B9, clé (k0, k1, k2, k3) — ``sub_8048BF8``."""
    if len(data) % 8:
        raise ValueError("TEA : longueur multiple de 8")
    k0, k1, k2, k3 = key
    out = bytearray()
    for i in range(0, len(data), 8):
        v0, v1 = struct.unpack_from("<II", data, i)
        s = 0
        for _ in range(32):
            s = u32(s + DELTA)
            v0 = u32(v0 + (u32(k0 + (v1 << 4)) ^ u32(v1 + s) ^ u32(k1 + (v1 >> 5))))
            v1 = u32(v1 + (u32(k2 + (v0 << 4)) ^ u32(v0 + s) ^ u32(k3 + (v0 >> 5))))
        out += struct.pack("<II", v0, v1)
    return bytes(out)


def tea_key(uid: int, gid: int, custom: int) -> tuple[int, int, int, int]:
    return (uid, gid, custom, u32(custom ^ u32(gid * uid)))


def find_fastcoll() -> str:
    env = os.environ.get("FASTCOLL")
    if env and os.path.isfile(env) and os.access(env, os.X_OK):
        return env
    found = shutil.which("fastcoll")
    if found:
        return found
    raise SystemExit(
        "fastcoll introuvable. Compiler hashclash md5fastcoll "
        "(préfixe multiple de 64, deux sorties) et l'exposer via PATH ou $FASTCOLL."
    )


def collide(prefix: bytes) -> tuple[bytes, bytes]:
    if len(prefix) % 64:
        raise ValueError("préfixe MD5 : multiple de 64")
    tool = find_fastcoll()
    with tempfile.TemporaryDirectory() as td:
        td_path = Path(td)
        pre = td_path / "prefix.bin"
        a_path = td_path / "a.bin"
        b_path = td_path / "b.bin"
        pre.write_bytes(prefix)
        proc = subprocess.run(
            [tool, str(pre), str(a_path), str(b_path)],
            check=False,
            capture_output=True,
        )
        if proc.returncode != 0:
            sys.stderr.write(proc.stderr.decode("utf-8", "replace"))
            raise SystemExit(f"fastcoll a échoué ({proc.returncode})")
        a = a_path.read_bytes()
        b = b_path.read_bytes()
    if a == b or hashlib.md5(a).digest() != hashlib.md5(b).digest():
        raise SystemExit("fastcoll n'a pas produit une collision MD5")
    if not a.startswith(prefix) or not b.startswith(prefix):
        raise SystemExit("les deux messages ne reprennent pas le préfixe")
    return a, b


def build_key(name: str, uid: int, gid: int) -> bytes:
    uid, gid, custom = identity(name, uid, gid)
    if uid == 0:
        raise SystemExit("uid 0 refusé par le binaire (*src == 0)")
    prefix = build_prefix(uid, gid, custom)
    left, right = collide(prefix)
    blob = left + tea_encrypt(right, tea_key(uid, gid, custom))
    if len(blob) <= 0x77 or len(blob) % 16:
        raise SystemExit(f"taille de clé invalide : {len(blob)}")
    return blob


def current_identity() -> tuple[str, int, int]:
    pw = pwd.getpwuid(os.getuid())
    return pw.pw_name, pw.pw_uid, pw.pw_gid


def challenge_binary() -> Path:
    here = Path(__file__).resolve().parent.parent / BIN_REL
    if not here.is_file():
        raise SystemExit(f"binaire introuvable : {here}")
    return here


def run_bin(key_bytes: bytes, mode: int) -> bytes:
    binary = challenge_binary()
    with tempfile.TemporaryDirectory() as td:
        path = Path(td) / ".key"
        path.write_bytes(key_bytes)
        os.chmod(path, mode)
        proc = subprocess.run([str(binary)], cwd=td, capture_output=True)
    return proc.stdout


def main() -> None:
    ap = argparse.ArgumentParser(description="keyfile .key pour collide (crp)")
    ap.add_argument("--user", default=None, help="pw_name (défaut : utilisateur courant)")
    ap.add_argument("--uid", type=int, default=None)
    ap.add_argument("--gid", type=int, default=None)
    ap.add_argument("-q", action="store_true", help="une ligne, sans écrire de fichier")
    ap.add_argument("--out", type=Path, help="écrire le .key (chmod 0400)")
    ap.add_argument("--check", action="store_true", help="preuve live : OK, mode KO, leurre")
    args = ap.parse_args()

    cur_name, cur_uid, cur_gid = current_identity()
    name = args.user or cur_name
    uid = cur_uid if args.uid is None else args.uid
    gid = cur_gid if args.gid is None else args.gid
    uid_w, gid_w, custom = identity(name, uid, gid)

    if args.check and (name != cur_name or uid != cur_uid or gid != cur_gid):
        raise SystemExit(
            f"--check lance le binaire comme {cur_name} ({cur_uid}/{cur_gid}), "
            f"pas {name} ({uid}/{gid})"
        )

    blob = build_key(name, uid, gid)
    line = (
        f"{name} uid={uid_w} gid={gid_w} custom=0x{custom:08x} "
        f".key {len(blob)} bytes mode 0400"
    )
    if args.q:
        print(line)
    elif not args.check:
        print(line)
        print(f"md5(moitié claire) = {hashlib.md5(blob[: len(blob)//2]).hexdigest()} "
              f"(la moitié disque est chiffrée TEA, son MD5 diffère)")

    if args.out:
        args.out.write_bytes(blob)
        os.chmod(args.out, 0o400)
        if not args.q:
            print(f"écrit {args.out} ({oct(stat.S_IMODE(args.out.stat().st_mode))})")

    if args.check:
        ok = run_bin(blob, 0o400)
        if WIN not in ok or b"FAILED" in ok:
            sys.stdout.buffer.write(ok)
            raise SystemExit("check OK : le binaire n'a pas accepté la clé")
        bad_mode = run_bin(blob, 0o644)
        if b"stage0: OK" in bad_mode or WIN in bad_mode:
            sys.stdout.buffer.write(bad_mode)
            raise SystemExit("check mode : 0644 aurait dû échouer au stage0")
        lure = run_bin(HINT + b"\n", 0o400)
        if b"-- re..... --" not in lure or WIN in lure:
            sys.stdout.buffer.write(lure)
            raise SystemExit("check leurre : le hint n'a pas pris le chemin re.....")
        if args.q:
            print("check ok")
        else:
            sys.stdout.buffer.write(ok)
            print("check ok (accepté, mode 0644 refusé, hint → re.....)")


if __name__ == "__main__":
    main()
