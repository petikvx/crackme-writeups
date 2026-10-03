#!/usr/bin/env python3
"""recoded_keygenme_1 — name → serial AAAAAAAA-BBBBBBBB-CCCCCCCC-DDDDDDDD.

Quatre rounds : D = fold(seed, name) puis C = fold(D), B = fold(C), A = fold(B)
avec fold(mul, name) = Σ ROR32(mul * c, 19) sur les octets ≠ espace.

Le seed du round 3 est le pointeur off_403087 (anti-debug PEB.BeingDebugged) :
  0x401284  après le 1er WM_TIMER, process non débogué  (défaut GUI)
  0x4012A2  avant le 1er tick (valeur .data initiale)
  0x4012BE  si BeingDebugged a déjà été vu
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import threading
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "KeygenMe.exe"

SEED_AFTER_TIMER = 0x401284
SEED_INIT = 0x4012A2
SEED_DEBUG = 0x4012BE

MASK32 = 0xFFFFFFFF


def ror32(x: int, n: int) -> int:
    x &= MASK32
    n &= 31
    return ((x >> n) | ((x << (32 - n)) & MASK32)) & MASK32


def fold(mul: int, name: str) -> int:
    acc = 0
    for ch in name.encode("latin1"):
        if ch == 0x20:
            continue
        acc = (acc + ror32((mul * ch) & MASK32, 19)) & MASK32
    return acc


def keygen(name: str = "petik", seed: int = SEED_AFTER_TIMER) -> str:
    if not (4 <= len(name) <= 19):
        raise SystemExit("name: longueur 4..19 (GetDlgItemTextA cchMax=20)")
    g3 = fold(seed, name)
    g2 = fold(g3, name)
    g1 = fold(g2, name)
    g0 = fold(g1, name)
    return f"{g0:08X}-{g1:08X}-{g2:08X}-{g3:08X}"


def parse_serial(serial: str) -> tuple[int, int, int, int]:
    parts = serial.strip().split("-")
    if len(parts) != 4 or any(len(p) != 8 for p in parts):
        raise SystemExit("serial: attendu AAAAAAAA-BBBBBBBB-CCCCCCCC-DDDDDDDD")
    try:
        return tuple(int(p, 16) for p in parts)  # type: ignore[return-value]
    except ValueError as exc:
        raise SystemExit(f"serial hex: {exc}") from exc


def verify(name: str, serial: str, seed: int = SEED_AFTER_TIMER) -> bool:
    g0, g1, g2, g3 = parse_serial(serial)
    return (
        g3 == fold(seed, name)
        and g2 == fold(g3, name)
        and g1 == fold(g2, name)
        and g0 == fold(g1, name)
    )


def gui_check(name: str, serial: str, timeout: float = 8.0) -> str:
    """Lance KeygenMe.exe, remplit le dialog, lit le MessageBox (Windows).

    SetDlgItemTextA/W depuis un Python 64-bit ne met pas à jour le buffer ANSI
    vu par GetDlgItemTextA dans le PE32 : on envoie WM_CHAR.
    """
    import ctypes
    from ctypes import wintypes

    user32 = ctypes.WinDLL("user32", use_last_error=True)

    FindWindowW = user32.FindWindowW
    FindWindowW.argtypes = [wintypes.LPCWSTR, wintypes.LPCWSTR]
    FindWindowW.restype = wintypes.HWND
    SendMessageW = user32.SendMessageW
    SendMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
    SendMessageW.restype = wintypes.LPARAM
    PostMessageW = user32.PostMessageW
    PostMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
    PostMessageW.restype = wintypes.BOOL
    GetDlgItem = user32.GetDlgItem
    GetDlgItem.argtypes = [wintypes.HWND, ctypes.c_int]
    GetDlgItem.restype = wintypes.HWND
    SetForegroundWindow = user32.SetForegroundWindow
    SetForegroundWindow.argtypes = [wintypes.HWND]
    SetForegroundWindow.restype = wintypes.BOOL

    WM_CHAR = 0x0102
    WM_CLEAR = 0x0303
    WM_CLOSE = 0x0010
    WM_COMMAND = 0x0111
    EM_SETSEL = 0x00B1
    BM_CLICK = 0x00F5
    IDOK = 1
    IDC_NAME = 1001
    IDC_SERIAL = 1002
    IDC_REGISTER = 1003

    def fill_edit(hwnd_edit: int, text: str) -> None:
        SendMessageW(hwnd_edit, EM_SETSEL, 0, -1)
        SendMessageW(hwnd_edit, WM_CLEAR, 0, 0)
        for ch in text.encode("latin1"):
            SendMessageW(hwnd_edit, WM_CHAR, ch, 0)

    result: dict[str, str] = {"caption": ""}

    def dismisser() -> None:
        deadline = time.time() + timeout
        while time.time() < deadline:
            for title in ("Congratulations!", "Error!"):
                box = FindWindowW("#32770", title)
                if box:
                    result["caption"] = title
                    SendMessageW(box, WM_COMMAND, IDOK, 0)
                    return
            time.sleep(0.05)

    if not EXE.is_file():
        raise SystemExit(f"exe introuvable: {EXE}")

    proc = subprocess.Popen([str(EXE)], cwd=str(EXE.parent))
    try:
        hwnd = 0
        deadline = time.time() + timeout
        while time.time() < deadline:
            hwnd = FindWindowW(None, "REcodeD KeygenMe #1")
            if hwnd:
                break
            time.sleep(0.05)
        if not hwnd:
            raise SystemExit("fenêtre REcodeD KeygenMe #1 introuvable")

        # 1er WM_TIMER (100 ms) → off_403087 = 0x401284
        time.sleep(0.25)
        SetForegroundWindow(hwnd)
        fill_edit(GetDlgItem(hwnd, IDC_NAME), name)
        fill_edit(GetDlgItem(hwnd, IDC_SERIAL), serial)

        t = threading.Thread(target=dismisser, daemon=True)
        t.start()
        PostMessageW(GetDlgItem(hwnd, IDC_REGISTER), BM_CLICK, 0, 0)
        t.join(timeout=timeout)
        PostMessageW(hwnd, WM_CLOSE, 0, 0)
        return result["caption"]
    finally:
        try:
            proc.wait(timeout=2)
        except Exception:
            proc.kill()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument(
        "--seed",
        default=f"{SEED_AFTER_TIMER:08x}",
        help="mul round 3 (hex). défaut 401284 = après timer, pas de debugger",
    )
    ap.add_argument("--check", action="store_true", help="rejoue le prédicat + GUI Windows")
    ap.add_argument("--no-gui", action="store_true", help="avec --check : skip le dialog live")
    args = ap.parse_args()
    seed = int(args.seed, 16)
    serial = keygen(args.user, seed=seed)
    ok_pred = verify(args.user, serial, seed=seed)
    if args.check:
        if not ok_pred:
            print("check: FAIL predicte")
            return 1
        print(f"predicat: OK  {args.user} → {serial}  seed={seed:08X}")
        if args.no_gui:
            print("check: OK")
            return 0
        if sys.platform != "win32":
            print("gui: skip (pas Windows)")
            print("check: OK")
            return 0
        caption = gui_check(args.user, serial)
        print(f"gui: {caption or '(pas de MessageBox)'}")
        ok = caption == "Congratulations!"
        print("check:", "OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(serial)
    else:
        print(f"{args.user} → {serial}  (seed={seed:08X})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
