#!/usr/bin/env python3
"""Déballe les 2 premières couches de obf-test2.py (Dark Magic) SANS l'exécuter.

  couche 1 : ligne 21, a85 -> XOR 64 -> zlib  => analysis/stage1.py (helpers)
  couche 2 : ligne 43, a85 -> lzma            => analysis/stage2.py (loader + shells chiffrés)

Usage : python3 -I tools/darkmagic-unwrap.py [-q]
"""
import base64, lzma, re, sys, zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
src = (ROOT / "original/obf-test2.py").read_text(encoding="utf8").split("\n")

m = re.search(r"a85decode\(b'((?:[^'\\]|\\.)*)'\)", src[20])
s1 = zlib.decompress(bytes(b ^ 64 for b in base64.a85decode(eval("b'" + m.group(1) + "'"))))

l = src[42]
s2 = lzma.decompress(base64.a85decode(eval("b'" + l[l.index("(b'") + 3 : l.rindex("')")] + "'")))

(ROOT / "analysis").mkdir(exist_ok=True)
(ROOT / "analysis/stage1.py").write_bytes(s1)
(ROOT / "analysis/stage2.py").write_bytes(s2)
if "-q" not in sys.argv:
    print(f"stage1: {len(s1)} o, stage2: {len(s2)} o")
