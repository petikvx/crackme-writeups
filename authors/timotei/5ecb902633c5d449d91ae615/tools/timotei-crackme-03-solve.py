#!/usr/bin/env python3
"""Solveur timotei-crackme-03 — add (buf[12]-'0') puis cmps 14 octets."""

from __future__ import annotations

import subprocess
from pathlib import Path

BINARY = Path(__file__).resolve().parent / "timotei-crackme-03"

# 0x402026 — 14 octets, "Defeat COVID!" − 15 puis un 0
TARGET = bytes.fromhex("355657565265113440473a351200")
N = 14  # ecx du repz cmpsb


def key_of(buf: bytes) -> int:
    """dl = buf[12] - 0x30, comme à 0x401123. Pad 0 si trop court (BSS)."""
    b12 = buf[12] if len(buf) > 12 else 0
    return (b12 - 0x30) & 0xFF


def transform(buf: bytes) -> bytes:
    """Même boucle que 0x40112a : add jusqu'au premier '\\n', exclus."""
    out = bytearray(buf)
    k = key_of(buf)
    for i, b in enumerate(out):
        if b == 0x0A:
            break
        out[i] = (b + k) & 0xFF
    return bytes(out)


def cmps_ecx_left(got: bytes, target: bytes = TARGET, n: int = N) -> int:
    """ecx restant après repz cmpsb. 0 = le jne fail n'est pas pris."""
    ecx = n
    for i in range(n):
        g = got[i] if i < len(got) else 0
        t = target[i]
        ecx -= 1
        if g != t:
            break
    return ecx


def pass_ok(password: bytes | str) -> bool:
    raw = password.encode("ascii") if isinstance(password, str) else password
    # le binaire lit stdin ; on simule le '\\n' final s'il manque
    if 0x0A not in raw:
        raw = raw + b"\n"
    # BSS 100 octets, le reste est 0 — on ne le recopie pas : transform
    # s'arrête au '\\n', le compare lit 14 octets (zéros au-delà du lu)
    padded = raw + bytes(max(0, N - len(raw)))
    got = transform(padded)
    return cmps_ecx_left(got) == 0


def invert_first13(key: int) -> bytes:
    """13 premiers octets d'input pour un key donné (le 14e n'est pas exigé)."""
    return bytes((TARGET[i] - key) & 0xFF for i in range(13))


def pack_trace(password: str | bytes) -> None:
    raw = password.encode("latin1") if isinstance(password, str) else password
    shown = raw if 0x0A in raw else raw + b"\n"
    padded = shown + bytes(max(0, N - len(shown)))
    k = key_of(padded)
    got = transform(padded)
    left = cmps_ecx_left(got)
    print(f"\n===== {raw!r}  key={k} (0x{k:02x}) =====")
    print(f"target = {TARGET.hex()}")
    print(f"got    = {got[:N].hex()}")
    for i in range(N):
        g, t = got[i], TARGET[i]
        mark = "  " if g == t else "!="
        print(f"  [{i:2}] got {g:#04x}  tgt {t:#04x} {mark}")
    print(f"ecx restant = {left}  -> {'OK' if left == 0 else 'FAIL'}")
    print(f"(un mismatch sur le dernier octet laisse ecx=0 : c'est voulu)")


def run_binary(password: bytes) -> None:
    if not BINARY.is_file():
        print(f"(binaire introuvable: {BINARY})")
        return
    if not password.endswith(b"\n"):
        password += b"\n"
    try:
        r = subprocess.run(
            [str(BINARY)],
            input=password,
            capture_output=True,
            timeout=1,
        )
    except subprocess.TimeoutExpired:
        print(f"\n=== live {password!r} TIMEOUT (pas de '\\n' → boucle) ===")
        return
    acc = b"accepted" in r.stdout
    print(f"\n=== live {password!r} rc={r.returncode} accepted={acc} ===")
    # le UI ANSI pollue : on ne garde que les lignes utiles
    text = r.stdout.replace(b"\x1b", b"^[" )
    print(text[-120:])


def main() -> None:
    print(f"TARGET = {TARGET!r}")
    print(f"TARGET + 15 = {bytes((b + 15) & 0xFF for b in TARGET[:13])!r}")

    # deux clés qui satisfont 2*buf[12] ≡ 0x42 (mod 256)
    print("\n=== clés possibles pour buf[12] ===")
    for buf12 in (0x21, 0xA1):
        key = (buf12 - 0x30) & 0xFF
        pw = invert_first13(key)
        assert pw[12] == buf12
        print(f"  buf[12]={buf12:#04x} key={key:#04x} input={pw!r} ok={pass_ok(pw)}")

    featured = b"Defeat COVID!"
    print("\n=== prédicat ===")
    for s in (featured, b"Defeat COVID", b"Defeat COVID!\nxxx", b"wrong", b""):
        print(f"  {s!r:24} {pass_ok(s)}")

    pack_trace(featured)
    pack_trace(b"Defeat COVID")
    pack_trace(b"wrong")

    run_binary(featured)
    run_binary(b"Defeat COVID")
    run_binary(b"wrong")


if __name__ == "__main__":
    main()
