#!/usr/bin/env python3
"""gregland CrackMe 4 — keygen name+mail → serial XXXX-XXXX-XXXX-XXXX.

VDS script (:Keygen via @VDSReg):
  enc  = @_J(nom, 7806)          # Delphi Random XOR (byte ^ (Random(0x80)|0x80))
  senc = @_J(enc, 215)
  buf  = STRINS(mail, LEN(mail)/2, senc)   # 1-based insert (= 0-based len//2-1)
  hex  = @_J(buf, md5)           # MD5 → uppercase hex
  serial = UPPER(substr(hex,7,22) split as A-B-C-D)

Verified: petik / petik@x.test → D532-7E11-D9A2-D2AF (x32dbg REGISTERED !!!)
Also matches site comment HN1 / hackpower1@mail.ru → F5B5-6FE3-7208-7F00.
"""
from __future__ import annotations

import argparse
import hashlib
import sys


def delphi_numberhash(data: bytes, seed: int) -> bytes:
    """VDS @_J(str, int) — RandSeed=seed, out[i]=in[i]^(Random(0x80)|0x80)."""
    out = bytearray()
    s = seed & 0xFFFFFFFF
    for b in data:
        s = (s * 0x08088405 + 1) & 0xFFFFFFFF
        r = ((s * 0x80) >> 32) & 0xFFFFFFFF
        out.append(b ^ (r | 0x80))
    return bytes(out)


def keygen(name: str, mail: str) -> str:
    name_b = name.encode("latin-1", errors="replace")
    mail_b = mail.encode("latin-1", errors="replace")
    enc = delphi_numberhash(name_b, 7806)
    senc = delphi_numberhash(enc, 215)
    # VDS STRINS 1-based pos = LEN/2 → 0-based index len//2 - 1
    inspos = len(mail_b) // 2 - 1
    if inspos < 0:
        combined = mail_b
    else:
        combined = mail_b[:inspos] + senc + mail_b[inspos:]
    md5hex = hashlib.md5(combined).hexdigest().upper()
    mid = md5hex[6:22]  # 1-based SUBSTR(7,22)
    return "-".join(mid[i : i + 4] for i in range(0, 16, 4))


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="gregland CrackMe 4 keygen")
    p.add_argument("--name", "--user", default="petik", dest="name", help="Name (default petik)")
    p.add_argument("--mail", default="petik@x.test", help="Mail (default petik@x.test)")
    p.add_argument("-q", action="store_true", help="serial only")
    p.add_argument("--check", metavar="SERIAL", help="verify a serial for --name/--mail")
    args = p.parse_args(argv)

    serial = keygen(args.name, args.mail)

    if args.check is not None:
        got = args.check.strip().upper().replace(" ", "")
        exp = serial.upper()
        ok = got == exp or got.replace("-", "") == exp.replace("-", "")
        print("OK" if ok else "NOK")
        return 0 if ok else 1

    if args.q:
        print(serial)
    else:
        print(f"name   : {args.name}")
        print(f"mail   : {args.mail}")
        print(f"serial : {serial}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
