#!/usr/bin/env python3
"""Reconstruit (approx.) — XOR constant sur chaque octet du fichier."""
import os
import sys


def xor_file(path: str, key: int = 7) -> str:
    with open(path, "rb") as f:
        data = f.read()
    out = bytes(b ^ key for b in data)
    out_path = path + ".enc"
    with open(out_path, "wb") as f:
        f.write(out)
    return out_path


def main() -> None:
    if len(sys.argv) != 2:
        print(f"Usage: python {os.path.basename(sys.argv[0])} <filename>")
        sys.exit(1)
    out = xor_file(sys.argv[1])
    print(f"Encrypted file saved as: {out}")


if __name__ == "__main__":
    main()
