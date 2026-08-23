#!/usr/bin/env python3
"""Reconstruit depuis treasure.pyc (PyInstaller / CPython 3.13)."""
import base64
import hashlib


def decode_message():
    encoded = "YmJ7ZWFzeV9yM3ZfY2hhbGxlbmdlX3MwbHYzZH0="
    key = hashlib.md5(b"s3cr3t_k3y").hexdigest()[:8]
    data = base64.b64decode(encoded).decode("utf-8")
    result = ""
    for i, char in enumerate(data):
        result += chr(ord(char) ^ ord(key[i % len(key)]))
    return result


def main():
    # Leurres : message masqué ; decode_message() est calculé mais jamais affiché.
    print("The secret treasure is hidden in: **********")
    hidden = decode_message()
    # Le « trésor » attendu = plaintext base64 (data), pas le XOR :
    #   bb{easy_r3v_challenge_s0lv3d}


if __name__ == "__main__":
    main()
