#!/usr/bin/env python3
"""crack_me_or_keygen_me (dragonpxx / crackmes.de) : le serial attendu est une constante
chiffrée AES-128-ECB (Rijndael .NET) dans RunTime.dll, clé = MD5(ASCII(Key de Crypto.dll))."""
import base64, hashlib
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
KEY = b"!@#$%^&*(){}?/>.<,\"':;][/*-+~`"
CT = "0JcT5U3uSlmaNmEJnzPg+/OL2z5RngZt0UJGUiyvF/HHz7wbKlKp+cUFzLrQOLgi"
d = Cipher(algorithms.AES(hashlib.md5(KEY).digest()), modes.ECB()).decryptor()
pt = d.update(base64.b64decode(CT)) + d.finalize()
serial = pt[:-pt[-1]].decode()  # retrait du padding PKCS7
print("serial :", serial)
print("champs t1..t5 :", " | ".join(serial.split("-")))
