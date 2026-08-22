#!/usr/bin/env python3
"""Solveur — OckoTajny netCrack

ELF64 asm : le « password » demandé est en fait une **IP**.
Connexion TCP port **3125**, HTTP GET ; succès si les 6 derniers
octets de la réponse == « Platon » (symbole password @ 0x4031c0).

Usage:
  python3 netcrack-solve.py -q
  python3 netcrack-solve.py --demo   # serveur local + binaire
"""
from __future__ import annotations

import argparse
import socket
import subprocess
import threading
import time
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "netCrack"
PORT = 3125
EXPECTED_SUFFIX = "Platon"
DEMO_IP = "127.0.0.1"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="indice solution")
    ap.add_argument("--demo", action="store_true", help="écoute :3125 + lance netCrack")
    args = ap.parse_args()

    if args.q:
        print(f"input = IP (ex. {DEMO_IP})")
        print(f"server TCP/{PORT} must return body ending with {EXPECTED_SUFFIX!r}")
        return 0

    if args.demo:
        def serve() -> None:
            s = socket.socket()
            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            s.bind(("127.0.0.1", PORT))
            s.listen(1)
            conn, _ = s.accept()
            conn.recv(1024)
            conn.sendall(b"HTTP/1.0 200 OK\r\n\r\nXXXXXX" + EXPECTED_SUFFIX.encode())
            conn.close()
            s.close()

        threading.Thread(target=serve, daemon=True).start()
        time.sleep(0.2)
        proc = subprocess.run(
            [str(_BIN)],
            input=(DEMO_IP + "\n").encode(),
            capture_output=True,
            timeout=5,
        )
        print(proc.stdout.decode("latin-1", errors="replace"))
        return proc.returncode

    print("=== netCrack ===")
    print(f"prompt   : Enter the password:  ← saisir une IP")
    print(f"connect  : inet_addr(input), htons({PORT:#x}) = {PORT}")
    print(f"check    : last 6 bytes of HTTP response == {EXPECTED_SUFFIX!r}")
    print(f"demo     : python3 netcrack-solve.py --demo")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
