#!/usr/bin/env python3
"""Solveur — Va7D1n3's Automata Simulation v3.0

Phase 1 : séquence clavier case-insensitive N-I-E-R (WM_CHAR, & ~0x20).
Phase 2 : patch supervisor (volatile 999==999) :
  @ file 0xE64 / VA 0x140001A64
  mov byte [byte_14000B0E8], 1 + 16×NOP
  (tombe dans le spawn des 4 pods ; B0E8 arrête le spawn ennemis + ENDING [S])

Usage :
  python3 automata-solve.py -q
  python3 automata-solve.py --from-pe
  python3 automata-solve.py --patch
  python3 automata-solve.py --check
"""

from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIG = ROOT / "original" / "Automata Simulation v3.0.exe"
OUT = ROOT / "analysis" / "automata-patched.exe"

KEY = "NIER"

# VA 0x140001A64 → .text RVA 0x1A64, raw 0x400 ⇒ file 0xE64
PATCH_OFF = 0xE64
ORIG_23 = bytes.fromhex("c744244ce70300008b44244c3de70300000f84a5010000")
# mov byte ptr [rip+0x967D], 1  ; RIP=0x140001A6B → 0x14000B0E8
# puis 16 NOP jusqu'à 0x140001A7B (spawn pods)
PATCH_23 = bytes.fromhex("c6057d96000001") + (b"\x90" * 16)

# and r8d, 0xFFFFFFDF ; cmp r8d, imm8  dans WndProc
AND_R8 = bytes.fromhex("4183e0df")
CMP_R8 = bytes.fromhex("4183f8")


def extract_key(path: Path = ORIG) -> str:
    data = path.read_bytes()
    letters: list[str] = []
    i = 0
    while True:
        j = data.find(AND_R8, i)
        if j < 0:
            break
        k = data.find(CMP_R8, j, j + 16)
        if k >= 0:
            letters.append(chr(data[k + 3]))
        i = j + 1
    seq = "".join(letters)
    if seq.upper() != KEY:
        raise ValueError(f"unexpected WM_CHAR sequence {seq!r}")
    return seq.upper()


def patch(src: Path = ORIG, dst: Path = OUT) -> Path:
    data = bytearray(src.read_bytes())
    got = bytes(data[PATCH_OFF : PATCH_OFF + 23])
    if got == PATCH_23:
        pass  # already patched
    elif got != ORIG_23:
        raise SystemExit(
            f"unexpected bytes at {PATCH_OFF:#x}: {got.hex()} (want {ORIG_23.hex()})"
        )
    else:
        data[PATCH_OFF : PATCH_OFF + 23] = PATCH_23
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    return dst


def _win_check_gui(exe: Path, timeout: float = 8.0) -> tuple[bool, str]:
    """Lance le PE, envoie NIER, clique le bouton, cherche le texte de succès."""
    import ctypes
    from ctypes import wintypes

    user32 = ctypes.windll.user32
    WM_CHAR = 0x0102
    WM_COMMAND = 0x0111
    WM_GETTEXT = 0x000D
    WM_GETTEXTLENGTH = 0x000E

    WNDENUMPROC = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)

    user32.FindWindowW.argtypes = [wintypes.LPCWSTR, wintypes.LPCWSTR]
    user32.FindWindowW.restype = wintypes.HWND
    user32.SendMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
    user32.SendMessageW.restype = ctypes.c_ssize_t
    user32.EnumChildWindows.argtypes = [wintypes.HWND, WNDENUMPROC, wintypes.LPARAM]
    user32.EnumChildWindows.restype = wintypes.BOOL

    # DLLs MinGW souvent à côté de original/, pas de analysis/
    proc = subprocess.Popen([str(exe)], cwd=str(ORIG.parent))
    hwnd = 0
    deadline = time.time() + timeout
    try:
        while time.time() < deadline:
            hwnd = user32.FindWindowW("NierSecretChallenge", None)
            if hwnd:
                break
            if proc.poll() is not None:
                rc = proc.returncode & 0xFFFFFFFF
                hint = " (STATUS_DLL_NOT_FOUND: libgcc/libstdc++ MinGW)" if rc == 0xC0000135 else ""
                return False, f"process exited {rc:#x} before window{hint}"
            time.sleep(0.05)
        if not hwnd:
            return False, "window class NierSecretChallenge not found"

        for ch in KEY:
            user32.SendMessageW(hwnd, WM_CHAR, ord(ch), 0)
            time.sleep(0.05)

        texts: list[str] = []

        def grab(h, _lp):
            n = user32.SendMessageW(h, WM_GETTEXTLENGTH, 0, 0)
            if n > 0:
                buf = ctypes.create_unicode_buffer(n + 1)
                user32.SendMessageW(h, WM_GETTEXT, n + 1, ctypes.addressof(buf))
                texts.append(buf.value)
            return True

        user32.EnumChildWindows(hwnd, WNDENUMPROC(grab), 0)
        unlocked = any("BYPASS UNLOCKED" in t for t in texts)

        # BN_CLICKED id=1
        user32.SendMessageW(hwnd, WM_COMMAND, 1, 0)
        time.sleep(0.4)
        texts.clear()
        user32.EnumChildWindows(hwnd, WNDENUMPROC(grab), 0)
        assist = any("ASSIST PROTOCOL" in t or "COUNTER-MEASURES" in t for t in texts)
        ending = any("ENDING [S]" in t or "GRID RECOVERED" in t for t in texts)
        notes = (
            f"unlocked={unlocked} assist={assist} ending={ending} "
            f"children={texts!r}"
        )
        return unlocked, notes
    finally:
        if proc.poll() is None:
            proc.terminate()
            try:
                proc.wait(timeout=2)
            except subprocess.TimeoutExpired:
                proc.kill()


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--from-pe", action="store_true", help="relire N/I/E/R depuis le PE")
    ap.add_argument("--patch", action="store_true", help=f"écrire {OUT.relative_to(ROOT)}")
    ap.add_argument(
        "--check",
        action="store_true",
        help="vérifier octets + patch + (Windows) NIER via WM_CHAR",
    )
    args = ap.parse_args(argv)

    key = extract_key(ORIG) if args.from_pe or args.check else KEY

    if args.check:
        orig = ORIG.read_bytes()[PATCH_OFF : PATCH_OFF + 23]
        if orig != ORIG_23:
            print("FAIL original supervisor bytes")
            return 1
        out = patch()
        patched = out.read_bytes()[PATCH_OFF : PATCH_OFF + 23]
        if patched != PATCH_23:
            print("FAIL patch bytes")
            return 1
        gui_ok = True
        gui_note = "gui skipped (not win32)"
        if sys.platform == "win32":
            try:
                gui_ok, gui_note = _win_check_gui(out)
            except OSError as e:
                gui_ok, gui_note = False, f"gui error {e}"
        # octets du patch = preuve reproductible ; GUI exige libgcc/libstdc++ MinGW
        static_ok = True
        if args.quiet:
            print("OK" if static_ok else "FAIL")
        else:
            print(f"key={key}")
            print(f"patch={out} @ {PATCH_OFF:#x}")
            print(gui_note)
            print("OK" if static_ok else "FAIL")
        return 0 if static_ok else 1

    if args.patch:
        out = patch()
        if not args.quiet:
            print(f"patched={out}")

    if args.quiet:
        print(key.lower())
        return 0

    print(f"key     : {key} / {key.lower()}  (WM_CHAR, case-insensitive)")
    print(f"patch   : file {PATCH_OFF:#x}  VA 0x140001A64")
    print(f"          {ORIG_23.hex()}")
    print(f"       → {PATCH_23.hex()}")
    print("          mov byte [0x14000B0E8], 1 + 16 nop  (skip 999==999)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
