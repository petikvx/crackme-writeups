#!/usr/bin/env python3
"""Solveur timotei-crackme-02 — pack ROL8 + jump calculé (di == 0x0F)."""

from __future__ import annotations

import subprocess
from pathlib import Path

BINARY = Path(__file__).resolve().parent / "timotei-crackme-02"

BIAS = 0xAFDC
ANCHOR = 0x40103F  # adresse du movabs rax, 0x40103f
GOOD = 0x40104E  # mov eax, 1 / write("pass accepted")
NEED_DI = GOOD - ANCHOR  # 0x0F
NEED_LOW16 = (NEED_DI - BIAS) & 0xFFFF  # 0x5033 → '3P' little-endian


def pack_rol8(password: bytes) -> int:
    """Même boucle que 0x401028 : mov bl, [rax] ; rol rbx, 8."""
    rbx = 0
    for b in password:
        rbx = (rbx & ~0xFF) | b
        rbx = ((rbx << 8) | (rbx >> 56)) & 0xFFFFFFFFFFFFFFFF
    return rbx


def di_of(password: bytes) -> int:
    return (pack_rol8(password) + BIAS) & 0xFFFF


def pass_ok(password: str | bytes) -> bool:
    raw = password.encode("ascii") if isinstance(password, str) else password
    if len(raw) <= 3:
        return False
    return di_of(raw) == NEED_DI


def pass_ok_shortcut(password: str | bytes) -> bool:
    """Forme fermée après wrap 64 bits : s[-1]=='P' et s[-8]=='3', len>=8."""
    raw = password.encode("ascii") if isinstance(password, str) else password
    return len(raw) >= 8 and raw[-1] == 0x50 and raw[-8] == 0x33


def pack_trace(password: str) -> None:
    raw = password.encode("ascii")
    print(f"\n===== PACK {password!r}  len={len(raw)} =====")
    if len(raw) <= 3:
        print("FAIL: trop court (jle exit)")
        return
    rbx = 0
    for i, b in enumerate(raw):
        rbx = (rbx & ~0xFF) | b
        rbx = ((rbx << 8) | (rbx >> 56)) & 0xFFFFFFFFFFFFFFFF
        ch = chr(b) if 32 <= b < 127 else hex(b)
        print(f"  [{i}] {b:#04x} {ch!r:6}  rbx={rbx:#018x}  low16={rbx & 0xFFFF:#06x}")
    total = (rbx + BIAS) & 0xFFFFFFFFFFFFFFFF
    di = total & 0xFFFF
    target = ANCHOR + di
    print(f"rbx + 0x{BIAS:x} = {total:#018x}")
    print(f"di = {di:#06x}  (besoin {NEED_DI:#06x})")
    print(f"jmp {ANCHOR:#x} + di = {target:#x}  (good={GOOD:#x})")
    print("OK" if di == NEED_DI else "FAIL")
    if len(raw) >= 8:
        print(f"shortcut: s[-8]={raw[-8]:#04x} {chr(raw[-8])!r}  s[-1]={raw[-1]:#04x} {chr(raw[-1])!r}")


def examples(n: int = 8, limit: int = 12) -> list[str]:
    """Quelques mots de passe imprimables de longueur n."""
    if n < 8:
        return []
    found: list[str] = []
    mid = n - 2
    # premier char libre sauf les deux contraintes
    alphabet = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!."
    # on fixe le squelette et on varie le milieu
    body = bytearray(b"A" * n)
    body[-8] = ord("3")
    body[-1] = ord("P")
    found.append(body.decode("ascii"))
    for ch in alphabet:
        body[0 if n > 8 else 1] = ch
        s = body.decode("ascii")
        if s not in found:
            found.append(s)
        if len(found) >= limit:
            break
    return found


def run_binary(password: str) -> None:
    if not BINARY.is_file():
        print(f"(binaire introuvable: {BINARY})")
        return
    try:
        r = subprocess.run(
            [str(BINARY), password],
            capture_output=True,
            timeout=1,
        )
    except subprocess.TimeoutExpired:
        print(f"\n=== live pw={password!r} TIMEOUT (jmp 0x40103f, boucle) ===")
        return
    out = r.stdout
    # SIGSEGV → returncode négatif (-11) selon l'OS / Python
    print(f"\n=== live pw={password!r} rc={r.returncode} ===")
    print(out)


def main() -> None:
    print(f"NEED_DI   = {NEED_DI:#x}")
    print(f"NEED_LOW16= {NEED_LOW16:#x}  bytes le {NEED_LOW16.to_bytes(2, 'little')!r}")
    print(f"shortcut  == pack?  {all(pass_ok(s) == pass_ok_shortcut(s) for s in ['A'*k for k in range(20)] + ['31337!!P', 'A3AAAAAAP', 'NaaaaaaP', '$!@#$%^P'])}")

    featured = ["31337!!P", "3AAAAAAP", "A3AAAAAAP", "AA3AAAAAAP"]
    print("\n=== famille (s[-8]=='3' et s[-1]=='P') ===")
    for s in featured:
        print(f"  {s!r:16} pack_ok={pass_ok(s)} shortcut={pass_ok_shortcut(s)} di={di_of(s.encode()):#06x}")

    print("\n=== contre-exemples ===")
    for s in ("AAAP", "AAAAAAP", "AAAAAAAP", "NaaaaaaP", "$!@#$%^P", "31337!!X"):
        raw = s.encode()
        print(f"  {s!r:16} len={len(raw)} di={di_of(raw):#06x} ok={pass_ok(s)}")

    for s in ("31337!!P", "AAAAAAAP", "NaaaaaaP", "$!@#$%^P"):
        pack_trace(s)

    print("\n=== exemples 8 chars ===")
    print(examples(8, 10))

    run_binary("31337!!P")
    run_binary("3AAAAAAP")
    run_binary("A3AAAAAAP")
    run_binary("AAAAAAAP")
    run_binary("NaaaaaaP")
    run_binary("$!@#$%^P")


if __name__ == "__main__":
    main()
