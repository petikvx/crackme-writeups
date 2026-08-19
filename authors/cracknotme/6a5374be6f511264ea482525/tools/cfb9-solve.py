#!/usr/bin/env python3
"""Solveur CFB9 (CrackNotMe — The Impostor / DLL side-loading).

CFB9.exe ne valide PAS la license key en interne. Il :

  1. GetModuleFileNameA → répertoire de l'EXE
  2. append « validator.dll »
  3. LoadLibraryExA(path, NULL, LOAD_WITH_ALTERED_SEARCH_PATH=0x8)
  4. GetProcAddress(h, "VerifyLicense")
  5. challenge = sprintf("CHAL-%u", GetTickCount())
  6. prompt license key
  7. eax = VerifyLicense(challenge, key_cstr)
  8. ACCESS GRANTED ssi eax == 0x1337C0DE

Solution : fournir un impostor `validator.dll` qui exporte VerifyLicense
et renvoie toujours 0x1337C0DE (n'importe quelle clé suffit — démo : impostor).

Usage :
  python3 cfb9-solve.py -q
  python3 cfb9-solve.py --check
  python3 cfb9-solve.py --run
  python3 cfb9-solve.py --build   # rebuild tools/validator.dll (mingw)
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

MAGIC = 0x1337C0DE
DEMO_KEY = "impostor"
DLL_NAME = "validator.dll"
EXPORT_NAME = "VerifyLicense"

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
EXE = ROOT / "original" / "CFB9.exe"
DLL_SRC = HERE / "validator.c"
DLL_BIN = HERE / DLL_NAME

# Constantes PE (CFB9.exe) pour --check
IMAGE_BASE = 0x140000000
# cmp eax, 0x1337c0de @ 0x140003ad2
CMP_MAGIC_VA = 0x140003AD2
TEXT_VA = 0x1000
TEXT_RAW = 0x400


def va_to_fo_text(va: int) -> int:
    return TEXT_RAW + (va - IMAGE_BASE - TEXT_VA)


def wine_bin() -> str | None:
    for name in ("wine64", "wine"):
        path = shutil.which(name)
        if path:
            return path
    return None


def mingw_gcc() -> str | None:
    return shutil.which("x86_64-w64-mingw32-gcc")


def build_dll(out: Path = DLL_BIN) -> None:
    gcc = mingw_gcc()
    if not gcc:
        raise RuntimeError("x86_64-w64-mingw32-gcc not found")
    if not DLL_SRC.is_file():
        raise RuntimeError(f"missing {DLL_SRC}")
    cmd = [
        gcc,
        "-shared",
        "-Os",
        "-s",
        "-nostdlib",
        "-e",
        "DllMain",
        "-o",
        str(out),
        str(DLL_SRC),
        "-lkernel32",
    ]
    subprocess.check_call(cmd)


def check_exe(data: bytes) -> list[str]:
    errs: list[str] = []
    if b"validator.dll" not in data:
        errs.append("string 'validator.dll' missing")
    if b"VerifyLicense" not in data:
        errs.append("string 'VerifyLicense' missing")
    if b"CHAL-%u" not in data:
        errs.append("string 'CHAL-%u' missing")
    fo = va_to_fo_text(CMP_MAGIC_VA)
    # 3d de c0 37 13  = cmp eax, 0x1337c0de
    insn = data[fo : fo + 5]
    expect = b"\x3d\xde\xc0\x37\x13"
    if insn != expect:
        errs.append(
            f"cmp magic @ {CMP_MAGIC_VA:#x}: got {insn.hex()} expected {expect.hex()}"
        )
    return errs


def pe_exports_verifylicense(dll: Path) -> bool:
    """Heuristique légère : le nom d'export est présent + PE DLL."""
    data = dll.read_bytes()
    if data[:2] != b"MZ":
        return False
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    if data[e_lfanew : e_lfanew + 4] != b"PE\0\0":
        return False
    # Characteristics DLL bit 0x2000
    chars = struct.unpack_from("<H", data, e_lfanew + 22)[0]
    if not (chars & 0x2000):
        return False
    return EXPORT_NAME.encode() in data


def run_live(key: str = DEMO_KEY, quiet: bool = False) -> str:
    wine = wine_bin()
    if not wine:
        raise RuntimeError("wine not available")
    if not EXE.is_file():
        raise RuntimeError(f"missing {EXE}")
    if not DLL_BIN.is_file():
        build_dll()
    if not pe_exports_verifylicense(DLL_BIN):
        raise RuntimeError(f"{DLL_BIN} does not look like a PE DLL exporting VerifyLicense")

    with tempfile.TemporaryDirectory(prefix="cfb9-") as td:
        tdir = Path(td)
        shutil.copy2(EXE, tdir / "CFB9.exe")
        shutil.copy2(DLL_BIN, tdir / DLL_NAME)
        env = os.environ.copy()
        env["WINEDEBUG"] = "-all"
        proc = subprocess.Popen(
            [wine, str(tdir / "CFB9.exe")],
            cwd=str(tdir),
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            env=env,
        )
        assert proc.stdin is not None and proc.stdout is not None
        # license key + Enter to dismiss « Press Enter to exit »
        try:
            out, _ = proc.communicate((key + "\n\n").encode(), timeout=30)
        except subprocess.TimeoutExpired:
            proc.kill()
            out, _ = proc.communicate(timeout=5)
        text = out.decode("utf-8", "replace").replace("\r", "")
    if not quiet:
        print(text)
    return text


def main() -> int:
    ap = argparse.ArgumentParser(description="CFB9 The Impostor — DLL side-load solver")
    ap.add_argument("-q", "--quiet", action="store_true", help="minimal output")
    ap.add_argument(
        "--check",
        action="store_true",
        help="verify side-load markers + magic in original/CFB9.exe (+ DLL export)",
    )
    ap.add_argument(
        "--run",
        action="store_true",
        help="wine live: drop impostor validator.dll next to EXE, expect ACCESS GRANTED",
    )
    ap.add_argument(
        "--build",
        action="store_true",
        help="rebuild tools/validator.dll with mingw-w64",
    )
    ap.add_argument(
        "--key",
        default=DEMO_KEY,
        help=f"license key sent to VerifyLicense (default: {DEMO_KEY})",
    )
    args = ap.parse_args()

    if args.build:
        build_dll()
        if args.quiet:
            print(DLL_BIN)
        else:
            print(f"built {DLL_BIN} ({DLL_BIN.stat().st_size} bytes)")
        if not args.check and not args.run:
            return 0

    if args.check:
        if not EXE.is_file():
            print(f"missing {EXE}", file=sys.stderr)
            return 1
        errs = check_exe(EXE.read_bytes())
        dll_ok = DLL_BIN.is_file() and pe_exports_verifylicense(DLL_BIN)
        if not dll_ok:
            errs.append(f"{DLL_BIN.name}: missing or no export {EXPORT_NAME}")
        if errs:
            for e in errs:
                print(f"FAIL: {e}", file=sys.stderr)
            return 1
        if args.quiet:
            print(f"{MAGIC:#x}")
        else:
            print(f"check: OK  magic={MAGIC:#x}  export={EXPORT_NAME}  demo_key={DEMO_KEY}")
        if not args.run:
            return 0

    if args.run:
        try:
            text = run_live(key=args.key, quiet=args.quiet)
        except Exception as exc:  # noqa: BLE001 — surface wine/mingw errors
            print(str(exc), file=sys.stderr)
            return 1
        if "ACCESS GRANTED" not in text:
            if args.quiet:
                print(text, file=sys.stderr)
            print("live FAIL: no ACCESS GRANTED", file=sys.stderr)
            return 1
        if args.quiet:
            print(DEMO_KEY if args.key == DEMO_KEY else args.key)
        else:
            print(f"live: OK (key={args.key!r}, magic={MAGIC:#x})")
        return 0

    # default: print solution summary
    if args.quiet:
        print(DEMO_KEY)
        return 0

    print("CFB9 — The Impostor (DLL side-loading)")
    print(f"  export     : {EXPORT_NAME}(challenge, key) -> {MAGIC:#x}")
    print(f"  impostor   : {DLL_BIN.relative_to(ROOT) if DLL_BIN.is_file() else 'tools/validator.dll (build me)'}")
    print(f"  demo key   : {DEMO_KEY}  (any string works once the DLL is loaded)")
    print("  python3 tools/cfb9-solve.py --check")
    print("  python3 tools/cfb9-solve.py --run")
    print("  python3 tools/cfb9-solve.py --build")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
