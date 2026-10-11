#!/usr/bin/env python3
"""korbut_keyfile_1 — écrit skor.reg avec le contenu attendu."""
from pathlib import Path
import sys

CONTENT = b"[ R I F 2 k 2 ] "  # 16 octets, 4 dwords magiques
NAME = "skor.reg"

def main():
    out = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(NAME)
    out.write_bytes(CONTENT)
    print(f"wrote {out} ({len(CONTENT)} bytes): {CONTENT!r}")

if __name__ == "__main__":
    main()
