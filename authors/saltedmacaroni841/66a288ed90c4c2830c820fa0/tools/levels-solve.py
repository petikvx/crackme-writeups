#!/usr/bin/env python3
"""saltedMacaroni841 — Levels Keygen! (LevelsByMacaroni841).

main @0x11c9 :
  key1 = fgets(0x28) ; strlen(key1) == 6 (le '\\n' compte -> 5 caractères saisis) ; key1[1] == '4' ; key1[0] == '3'
  key2 = fgets(0x28) ; strlen(key2) == strlen(key1) ; pour i in 0..4 : key2[i]-'0' == 2*(key1[i]-'0')
  -> SUCCESS-LVL-3.   (un echec de boucle affiche FAILURE-LVL-2 mais n'interrompt pas : SUCCESS-LVL-3 s'affiche quand même)
  bonus : scanf("%c") puis cmp strlen(key1), 0x1b39 : impossible sans patch -> jne @0x1374 (75 3e) remplacé par 90 90.
Usage : levels-solve.py [KEY1] [-q] [--patch] [--check]     (KEY1 par défaut : 34123)
"""
import argparse, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE, PATCHED = ROOT / "original" / "LevelsByMacaroni841", ROOT / "analysis" / "levels-bonus-patched"


def key2(k1: str) -> str:
    assert len(k1) == 5 and k1[0] == "3" and k1[1] == "4", "key1 : 5 caractères, commence par '34'"
    out = [chr(0x30 + 2 * (ord(c) - 0x30)) for c in k1]
    assert all(0x20 <= ord(c) < 0x7F for c in out), "doublement hors ASCII imprimable : choisir des chiffres 0-4"
    return "".join(out)


def patch():
    d = bytearray(EXE.read_bytes())
    assert d[0x1374:0x1376] == bytes.fromhex("753e")
    d[0x1374:0x1376] = b"\x90\x90"
    PATCHED.write_bytes(d); PATCHED.chmod(0o755)


ap = argparse.ArgumentParser()
ap.add_argument("key1", nargs="?", default="34123")
ap.add_argument("-q", action="store_true")
ap.add_argument("--patch", action="store_true", help="écrit analysis/levels-bonus-patched (original intact)")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
k2 = key2(a.key1)
if a.q:
    print(a.key1, k2); sys.exit(0)
if a.patch or a.check:
    patch()
print(f"key1 = {a.key1}\nkey2 = {k2}")
if a.check:
    run = lambda exe, k1, k2_: subprocess.run([str(exe)], input=f"{k1}\n{k2_}\nx\n", capture_output=True, text=True, timeout=10).stdout
    o = run(EXE, a.key1, k2)
    ko = run(EXE, a.key1, "11111")
    po = run(PATCHED, a.key1, k2)
    ok = ("SUCCESS-LVL-3" in o and "FAILURE-LVL-2" not in o and "FAILURE-LVL-BONUS" in o
          and "FAILURE-LVL-2" in ko and "SUCCESS-LVL-BONUS" in po)
    print("original: LVL-3 sans FAILURE-LVL-2, bonus FAIL | mauvaise key2: FAILURE-LVL-2 | patché: SUCCESS-LVL-BONUS ->", "OK" if ok else "KO")
    sys.exit(0 if ok else 1)
