#!/usr/bin/env python3
"""Keygen CryxeNet 0.01a (tfb) — crackmes.one 5ab77f5633c5d40ad448c2a8.

Couche 1 (loader unpackme.EXE) : cryxed.dll[i] -> ((b - 1) & 0xFF) ^ 0x25  => assembly .NET interne.
Couche 2 (keygenme interne)    : correct si  Nom == Decrypt_AES(Serial, CustomerID)
    clé  = CustomerID tronqué / complété avec 'X' à 32 octets (AES-256)
    IV   = 79 F1 0A 01 84 4A 0B 27 FF 5B 2D 4E 0E D3 16 3E, CBC, PKCS7, serial en Base64
=> Serial = Base64(AES-256-CBC(Nom, clé, IV)).

  ./cryxenet_0.01a-solve.py petik 1337
  ./cryxenet_0.01a-solve.py --unpack cryxed.dll out.exe
"""
import base64, sys
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

IV = bytes([121, 241, 10, 1, 132, 74, 11, 39, 255, 91, 45, 78, 14, 211, 22, 62])

def key_of(cid: str) -> bytes:
    return (cid[:32] + "X" * (32 - len(cid))).encode("ascii") if len(cid) < 32 else cid[:32].encode("ascii")

def keygen(name: str, cid: str) -> str:
    p = padding.PKCS7(128).padder(); data = p.update(name.encode("ascii")) + p.finalize()
    e = Cipher(algorithms.AES(key_of(cid)), modes.CBC(IV)).encryptor()
    return base64.b64encode(e.update(data) + e.finalize()).decode()

def check(name: str, cid: str, serial: str) -> bool:
    d = Cipher(algorithms.AES(key_of(cid)), modes.CBC(IV)).decryptor()
    raw = d.update(base64.b64decode(serial)) + d.finalize()
    u = padding.PKCS7(128).unpadder(); raw = u.update(raw) + u.finalize()
    return raw.replace(b"\0", b"").decode("ascii") == name

def unpack(src: str, dst: str) -> None:
    data = open(src, "rb").read()
    open(dst, "wb").write(bytes(((b - 1) & 0xFF) ^ 0x25 for b in data))

if __name__ == "__main__":
    if len(sys.argv) == 4 and sys.argv[1] == "--unpack":
        unpack(sys.argv[2], sys.argv[3]); print("unpacked ->", sys.argv[3]); sys.exit()
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    cid = sys.argv[2] if len(sys.argv) > 2 else "1337"
    s = keygen(name, cid)
    print(f"Nom         : {name}\nCustomer ID : {cid}\nSerial      : {s}\ncheck       : {check(name, cid, s)}")
