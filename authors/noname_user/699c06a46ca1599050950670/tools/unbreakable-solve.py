#!/usr/bin/env python3
"""noname_User Unbreakable Python — extrait le texte RGB « noname ».

Contourne le binding HWID en simulant la branche succès (acc += 0.222222),
puis dérive la clé master, déchiffre le blob base85+XOR+zlib+marshal.

  ./unbreakable-solve.py -q
  ./unbreakable-solve.py --check
  ./unbreakable-solve.py --dump analysis/out.py
"""
from __future__ import annotations

import argparse
import base64
import hashlib
import marshal
import re
import sys
import types
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LAYER1 = ROOT / "analysis" / "deobfuscated_layer1.py"
ORIGINAL = ROOT / "original" / "test.py"

TEXT = "noname"

# Constantes du CFF / RSA-like (layer1)
BIG = 4689031021470696049447830379163653620406219895180123373521925405766868731970914889337143577480164633674049428894129868601364069737825667566284861468685941
BASE = 5093724193453095160297586161256644105374044039609395970880709464048759868351495604371139904213379047448783116661982785233980233296382451102886807117029285
MOD = 6278065456988396228577957865518159049634567269411423022544003459064399192775942005449641688336747034719974333477845264694015078996604847431688139197482923
BLOB_SHA = "9de1a7e0b2d79d9be0d1f5b71bee50ce2656856c4b78f05c60d4ad242b0eaf0c"
MASTER_KEY = 64322080736143896125652295414509504119508758357723799657495947910577489034260


def chaos(val: float) -> float:
    for _ in range(50):
        val = 3.99 * val * (1.0 - val)
    return val


def derive_master_key(*, success: bool = True) -> int:
    """Rejoue le Chaos VM. success=True ≈ HWID OK / Termux (acc += 0.222222)."""
    acc = 0.123456789
    acc += 0.222222 if success else 0.777
    b_val = b"burn"
    for _ in range(500000):
        b_val = hashlib.md5(b_val).digest()
    acc += b_val[0] / 255000000.0
    acc = chaos(acc)
    return int(hashlib.sha256(str(acc).encode()).hexdigest(), 16)


def outer_to_layer1(src: str | None = None) -> str:
    if src is None:
        if LAYER1.is_file():
            return LAYER1.read_text(encoding="utf-8", errors="replace")
        src = ORIGINAL.read_text(encoding="utf-8", errors="replace")
    # zlib+b64 payload after IOIllll... =
    m = re.search(r'=\s*"([A-Za-z0-9+/=]{80,})"', src)
    if not m:
        raise RuntimeError("outer b64 blob not found")
    return zlib.decompress(base64.b64decode(m.group(1))).decode()


def extract_blob(layer1: str) -> str:
    m = re.search(r"imqgoraabijq\s*=\s*'([^']+)'", layer1)
    if not m:
        raise RuntimeError("base85 blob not found in layer1")
    return m.group(1)


def decrypt_code(blob: str, master_key: int | None = None) -> types.CodeType:
    if master_key is None:
        master_key = derive_master_key(success=True)
    if hashlib.sha256(blob.encode()).hexdigest() != BLOB_SHA:
        raise RuntimeError("integrity SHA-256 mismatch on base85 blob")
    key = pow(BASE, BIG ^ master_key, MOD).to_bytes(32, "big")
    raw = base64.b85decode(blob)
    dec = bytes(b ^ key[i % 32] for i, b in enumerate(raw))
    return marshal.loads(zlib.decompress(dec))


def find_text(code: types.CodeType) -> str | None:
    for c in code.co_consts:
        if isinstance(c, types.CodeType) and c.co_name == "smooth_rgb_normal_text":
            for x in c.co_consts:
                if isinstance(x, str) and x and x.isascii() and x.isalpha():
                    return x
    return None


def check() -> bool:
    layer1 = outer_to_layer1()
    blob = extract_blob(layer1)
    key = derive_master_key(success=True)
    if key != MASTER_KEY:
        return False
    code = decrypt_code(blob, key)
    return find_text(code) == TEXT


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="print text only")
    ap.add_argument("--check", action="store_true", help="verify decrypt + text")
    ap.add_argument("--dump", type=Path, help="write reconstructed clear source")
    args = ap.parse_args()

    if args.check and not check():
        print("CHECK FAIL", file=sys.stderr)
        return 1

    if args.dump:
        clear = (
            'import sys, os, time, math\n\n'
            'def smooth_rgb_normal_text():\n'
            f'    text = "{TEXT}"\n'
            '    spacing = 1\n'
            '    speed = 0.1\n'
            '    wave_width = 0.5\n'
            '    sys.stdout.write("\\x1b[?25l")\n'
            '    t = 0.0\n'
            '    try:\n'
            '        while True:\n'
            '            output = ""\n'
            '            for i, char in enumerate(text):\n'
            '                freq = t + i * wave_width\n'
            '                r = int(math.sin(freq) * 127 + 128)\n'
            '                g = int(math.sin(freq + 2) * 127 + 128)\n'
            '                b = int(math.sin(freq + 4) * 127 + 128)\n'
            '                output += f"\\x1b[38;2;{r};{g};{b}m{char}"\n'
            '                output += " " * int(spacing)\n'
            '            sys.stdout.write(f"\\r{output}\\x1b[0m   ")\n'
            '            sys.stdout.flush()\n'
            '            t += speed\n'
            '            time.sleep(0.016)\n'
            '    except KeyboardInterrupt:\n'
            '        sys.stdout.write("\\n\\x1b[?25h")\n\n'
            'if __name__ == "__main__":\n'
            '    os.system("cls" if os.name == "nt" else "clear")\n'
            '    smooth_rgb_normal_text()\n'
        )
        args.dump.parent.mkdir(parents=True, exist_ok=True)
        args.dump.write_text(clear, encoding="utf-8")

    if args.q:
        print(TEXT)
    else:
        print(f"text={TEXT!r} master_key={MASTER_KEY}")
        if args.check:
            print("check: OK (decrypt + smooth_rgb_normal_text)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
