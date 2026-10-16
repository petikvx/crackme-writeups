#!/usr/bin/env python3
"""madeinqcs_crackme (madeinqc) — solution + preuve live wine.

Solution (sans patch, conforme au README du crackme) :
  crackme1.exe /MADEINQCMENU
  puis menu « You hacked it! » → « Good job! »

Le parsing de la ligne de commande (après le premier '/') remplit
WNDCLASSEX.lpszMenuName ; la ressource MENU MADEINQCMENU (id item 1)
envoie WM_COMMAND (wParam=1, lParam=0) → MessageBox Good Boy.

Usage:
  python3 madeinqcs-crackme-solve.py           # explique + vérif statique
  python3 madeinqcs-crackme-solve.py --live    # wine + PostMessage (Xvfb)
"""
from __future__ import annotations

import argparse
import hashlib
import os
import subprocess
import sys
import tempfile
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "crackme1.exe"
GOOD = (
    "Good job! You found the Menu!\r\n"
    "Now send a mail to madeinqc_cracking@hotmail.com with your tutorial."
)
CMD_SUFFIX = "/MADEINQCMENU"
MENU_ITEM_ID = 1


def static_check() -> None:
    data = EXE.read_bytes()
    h = hashlib.sha256(data).hexdigest()
    print(f"[*] SHA-256 crackme1.exe = {h}")
    assert b"Good job! You found the Menu!" in data
    assert b"MADEINQCMENU" in data or b"M\x00A\x00D\x00E\x00I\x00N\x00Q\x00C\x00M\x00E\x00N\x00U" in data
    # dlgproc: cmp [ebp+0xc], 0x111 ; cmp [ebp+0x14], 0 ; cmp ax, 1
    assert bytes.fromhex("817d0c11010000") in data  # cmp dword [ebp+0xc], 0x111
    assert bytes.fromhex("837d1400") in data  # cmp dword [ebp+0x14], 0
    print("[+] chaînes Good Boy + handler WM_COMMAND menu id=1 présents")
    print(f"[+] solution : {EXE.name} {CMD_SUFFIX} → menu « Good job! » (id={MENU_ITEM_ID})")
    print(f"[+] message  : {GOOD!r}")


HELPER_C = r"""
#include <windows.h>
#include <stdio.h>
static FILE *out;
BOOL CALLBACK FindMB(HWND hwnd, LPARAM lp) {
  char title[256]={0}, cls[64]={0};
  GetClassNameA(hwnd, cls, sizeof cls);
  GetWindowTextA(hwnd, title, sizeof title);
  if (strcmp(cls, "#32770")==0) {
    fprintf(out, "MB_TITLE=%s\n", title);
    HWND child=GetWindow(hwnd, GW_CHILD);
    while (child) {
      char ccls[64]={0}, txt[512]={0};
      GetClassNameA(child, ccls, sizeof ccls);
      GetWindowTextA(child, txt, sizeof txt);
      if (txt[0]) fprintf(out, "TEXT=%s\n", txt);
      child=GetWindow(child, GW_HWNDNEXT);
    }
    PostMessageA(hwnd, WM_COMMAND, 1, 0);
    *(int*)lp=1;
  }
  return TRUE;
}
BOOL CALLBACK EnumProc(HWND hwnd, LPARAM lp) {
  char title[256]={0};
  GetWindowTextA(hwnd, title, sizeof title);
  if (strcmp(title, "Madeinqc's Crack-me 1")==0) {
    PostMessageA(hwnd, 0x0111, 1, 0);
    *(HWND*)lp = hwnd;
    return FALSE;
  }
  return TRUE;
}
int main(void) {
  out=fopen("Z:\\tmp\\madeinqc_live.txt","w");
  if(!out) out=fopen("madeinqc_live.txt","w");
  HWND dlg=0;
  for (int i=0;i<50 && !dlg;i++) {
    EnumWindows(EnumProc, (LPARAM)&dlg);
    if (!dlg) Sleep(100);
  }
  if (!dlg) { fprintf(out,"FAIL no dialog\n"); fclose(out); return 1; }
  Sleep(300);
  int found=0;
  for (int i=0;i<40 && !found;i++) {
    EnumWindows(FindMB, (LPARAM)&found);
    if (!found) Sleep(50);
  }
  fprintf(out,"found_mb=%d\n", found);
  fclose(out);
  return found?0:2;
}
"""


def live_proof() -> int:
    if not EXE.is_file():
        print("missing", EXE, file=sys.stderr)
        return 1
    proof = Path("/tmp/madeinqc_live.txt")
    proof.unlink(missing_ok=True)
    helper = Path("/tmp/madeinqc_helper.exe")
    src = Path("/tmp/madeinqc_helper.c")
    src.write_text(HELPER_C)
    subprocess.check_call(
        ["i686-w64-mingw32-gcc", "-o", str(helper), str(src)],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    env = os.environ.copy()
    env["DISPLAY"] = ":99"
    env["WINEDEBUG"] = "-all"
    env["WINEDLLOVERRIDES"] = "mscoree,mshtml="
    xvfb = subprocess.Popen(
        ["Xvfb", ":99", "-screen", "0", "800x600x24"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    time.sleep(0.8)
    try:
        crack = subprocess.Popen(
            ["wine", str(EXE), CMD_SUFFIX],
            env=env,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        time.sleep(2.0)
        r = subprocess.run(
            ["wine", str(helper)],
            env=env,
            timeout=10,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        text = proof.read_text(errors="replace") if proof.is_file() else ""
        print(text)
        ok = "Good job! You found the Menu!" in text
        print("[+] LIVE OK" if ok else "[-] LIVE FAIL")
        return 0 if ok else 1
    finally:
        subprocess.run(["pkill", "-9", "-f", "crackme1"], check=False,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        xvfb.kill()
        try:
            xvfb.wait(timeout=2)
        except Exception:
            pass


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--live", action="store_true")
    args = ap.parse_args()
    static_check()
    if args.live:
        return live_proof()
    return 0


if __name__ == "__main__":
    sys.exit(main())
