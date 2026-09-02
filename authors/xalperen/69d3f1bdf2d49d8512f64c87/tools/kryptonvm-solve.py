#!/usr/bin/env python3
"""xalperen KryptonVM — password + flag (pyencrypt-style outer pack + bug).

Outer loader (crackmefinal.py): b85 chunks → XOR → flip/shift/blake2 layers
→ zlib → marshal code object ``<kryptonobf>``.

Inner ``check_password`` (after VM bootstrap):
  len(password)==10 and xor_each(password, 66) should match target ``7f7f7f7f7f``
  → password ``u$u$u$u$u$``.

Bug: bytecode stores ``target='7f7f7f7f7f'`` then compares against ``'krypton2024'``
(len 11) — no 10-char password can succeed on the stock binary. Flag is still
hardcoded in ``main``:
  KCTF{5up3r_s3cr3t_krypt0n}

  ./kryptonvm-solve.py -q
  ./kryptonvm-solve.py --check
  ./kryptonvm-solve.py --run-patched   # needs Python 3.13+ + pycryptodomex
"""
from __future__ import annotations

import argparse
import ast
import base64
import hashlib
import marshal
import sys
import types
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIGINAL = ROOT / "original" / "crackmefinal.py"
PAYLOAD_CACHE = ROOT / "analysis" / "payload.marshal"

XOR_KEY = 66
TARGET = "7f7f7f7f7f"
PASSWORD = "".join(chr(ord(c) ^ XOR_KEY) for c in TARGET)  # u$u$u$u$u$
FLAG = "KCTF{5up3r_s3cr3t_krypt0n}"
EXPECT_SHA = "eecd6ed7b2cb2c31e8e0d65f4210937665070a7f09ec5160a4504341b08fe61f"


def xor66(s: str) -> str:
    return "".join(chr(ord(c) ^ XOR_KEY) for c in s)


def unpack_marshal(src_path: Path = ORIGINAL) -> bytes:
    """Return zlib-decompressed marshal blob (code object bytes)."""
    src = src_path.read_text(encoding="utf-8")
    mod = ast.parse(src)
    keep: list[ast.AST] = []
    for node in mod.body:
        if isinstance(node, ast.Assign):
            targets = [t.id for t in node.targets if isinstance(t, ast.Name)]
            if targets == ["_okhrDUhWMf"]:
                continue
            keep.append(node)
        elif isinstance(node, ast.FunctionDef):
            keep.append(node)
    ns: dict = {}
    exec(compile(ast.Module(body=keep, type_ignores=[]), "loader", "exec"), ns, ns)

    pkgs = ns["_PHsJiBkRkr"]
    lem = ns["_lemPQZyVmq"]
    meta = ns["_UgKiHVByrg"]
    layers = ns["_thEzCZcOAH"]
    xor_stream = ns["_VQMQggdxJc"]
    expect_len = ns["_AuDovHhyqX"]
    expect_sha = ns["_pECEHlBjME"]
    ns["_zYilQYyQWn"]()

    slots = [b""] * len(lem)
    for chunk, (slot, head, tail, xkey, clen) in zip(lem, meta):
        body = chunk[head : len(chunk) - tail]
        raw = pkgs[0].b85decode(body.encode("ascii"))
        if len(raw) != clen:
            raise RuntimeError("chunk length mismatch")
        slots[slot] = bytes(b ^ xkey for b in raw)
    blob = b"".join(slots)
    if len(blob) != expect_len:
        raise RuntimeError("packed size mismatch")
    for layer in reversed(layers):
        if layer["flip"]:
            blob = blob[::-1]
        blob = bytes((b - layer["shift"]) & 0xFF for b in blob)
        blob = xor_stream(blob, int(layer["salt"]).to_bytes(16, "big"))
    blob = pkgs[3].decompress(blob)
    if hashlib.sha256(blob).hexdigest() != expect_sha:
        raise RuntimeError("integrity failed")
    return blob


def load_payload(*, refresh: bool = False) -> types.CodeType:
    if PAYLOAD_CACHE.is_file() and not refresh:
        raw = PAYLOAD_CACHE.read_bytes()
    else:
        raw = unpack_marshal()
        PAYLOAD_CACHE.parent.mkdir(parents=True, exist_ok=True)
        PAYLOAD_CACHE.write_bytes(raw)
    code = marshal.loads(raw)
    if not isinstance(code, types.CodeType):
        raise TypeError("payload is not a code object")
    return code


def extract_flag_from_main(code: types.CodeType) -> str:
    """Bootstrap as ``__main__`` (module entry), read ``main`` consts."""
    import builtins

    builtins.input = lambda prompt="": "X" * 10
    silent = lambda *a, **k: None  # noqa: E731 — hush first wrong-password main()
    builtins.print = silent
    g: dict = {"__name__": "__main__", "__builtins__": builtins}
    exec(code, g, g)
    main = g.get("main")
    if main is None:
        raise RuntimeError("main not defined after payload exec")
    for c in main.__code__.co_consts:
        if isinstance(c, str) and "KCTF{" in c:
            i = c.index("KCTF{")
            return c[i:].strip()
    raise RuntimeError("flag string not found in main")


def patch_check_password(g: dict) -> None:
    """Fix compare target: use stored ``7f7f7f7f7f`` instead of ``krypton2024``."""
    co = g["check_password"].__code__
    consts = list(co.co_consts)
    # indices from live dis: [5]=target honeypot store, [6]=broken compare
    consts[6] = consts[5]
    g["check_password"] = types.FunctionType(
        co.replace(co_consts=tuple(consts)), g, "check_password"
    )


def run_patched(password: str = PASSWORD) -> str:
    import builtins

    builtins.input = lambda prompt="": password
    code = load_payload()
    g: dict = {"__name__": "__main__", "__builtins__": builtins}
    exec(code, g, g)
    patch_check_password(g)
    # capture print
    lines: list[str] = []
    real_print = builtins.print

    def capture(*a, **k):
        lines.append(" ".join(str(x) for x in a))
        real_print(*a, **k)

    builtins.print = capture
    g["main"]()
    builtins.print = real_print
    for line in lines:
        if "KCTF{" in line:
            i = line.index("KCTF{")
            return line[i:].strip()
    raise RuntimeError("patched run did not print flag")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--flag", action="store_true", help="print flag only")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--refresh-payload", action="store_true")
    ap.add_argument(
        "--run-patched",
        action="store_true",
        help="Python 3.13+ live: patch check_password then main()",
    )
    args = ap.parse_args()

    if xor66(PASSWORD) != TARGET or len(PASSWORD) != 10:
        print("internal password derivation broken", file=sys.stderr)
        return 1

    if args.run_patched:
        got = run_patched(PASSWORD)
        print(got if args.q or args.flag else f"live = {got}")
        if args.check and got != FLAG:
            print("CHECK FAIL", got, file=sys.stderr)
            return 1
        if args.check:
            print("check: OK")
        return 0

    flag = FLAG
    if args.flag or (args.check and not args.q):
        try:
            flag = extract_flag_from_main(load_payload(refresh=args.refresh_payload))
        except Exception as e:
            if args.flag and not args.check:
                print("payload extract failed:", e, file=sys.stderr)
                return 1
            # --check can still validate derived password + known flag
            flag = FLAG

    if args.flag:
        print(flag)
    elif args.q:
        print(PASSWORD)
    else:
        print(f"password = {PASSWORD!r}  (len=10, xor66 → {TARGET!r})")
        print(f"flag     = {flag}")
        print(
            "note     = stock binary compares xor-result to 'krypton2024' (bug); "
            "use --run-patched for live DOĞRU"
        )

    if args.check:
        if PASSWORD != "u$u$u$u$u$" or xor66(PASSWORD) != TARGET or flag != FLAG:
            print("CHECK FAIL", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
