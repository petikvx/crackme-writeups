#!/usr/bin/env python3
"""
Klip29mat1's Rev1 (crackmes.one 6970da549bf7b8997653a66f) -- solveur.

Source fournie (`original/rev1.tar.gz` -> `analysis/rev1/`) :

    int verify(char *s) {
        char buf[32];
        strcpy(buf, s);                 // <-- pas de borne : overflow !
        if (strlen(buf) != 8) return 0;
        if (buf[0] != 'R') return 0;
        if (buf[3] != '4') return 0;
        if (buf[7] != 'Z') return 0;
        if (strcmp(buf + 1, "3V4") == 0) return 1;
        return 0;
    }

Piège : `strcmp(buf+1, "3V4")` ne peut JAMAIS être vrai si `strlen(buf)==8`
(il faudrait `buf[4] == '\\0'`, ce qui romprait `strlen(buf)==8`). Pas de
"bon mot de 8 caractères" possible par la voie normale -- la piste "format
de clé à deviner" est un leurre.

Compilé avec `-fno-stack-protector -no-pie` (Makefile) : ni canari ni PIE,
c'est le signal que l'exploit attendu est un **débordement de pile**
classique. `strcpy` dans `buf[32]` (à `rbp-0x20`) écrase, dans l'ordre :
32 octets de `buf`, 8 octets de RBP sauvegardé (sans importance), puis
l'adresse de retour -- qu'on fixe aux 3 premiers octets non nuls de
l'adresse (binaire non-PIE : `0x004011b7`, soit l'instruction juste après
le `test eax,eax; je ...` dans `main`, qui saute directement à la branche
"ACCESS GRANTED" sans jamais appeler `verify` normalement).

Le `main()` plante ensuite (RBP écrasé, utilisé par le `leave;ret` final
de `main`) -- **après** avoir affiché le message. `stdout` doit donc être
une vraie ligne (pty), pas un pipe plein-tamponné (sinon le message, mis
en tampon par la libc, est perdu quand le process reçoit SIGSEGV avant de
flush).

Usage:
    ./rev1-solve.py                 # exploite via un pty, affiche la sortie
    ./rev1-solve.py --check         # 0 si "ACCESS GRANTED" apparaît, 1 sinon
    ./rev1-solve.py --payload       # affiche juste le payload (hex)
"""
import argparse
import os
import pty
import sys
import time

DEFAULT_BIN = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    "..", "analysis", "rev1", "rev1",
)
RET_ADDR_LOW3 = bytes([0xB7, 0x11, 0x40])  # 0x004011b7 ("ACCESS GRANTED" branch in main), les octets hauts sont déjà à 0
WIN_TEXT = b"ACCESS GRANTED"


def build_payload():
    return b"A" * 32 + b"B" * 8 + RET_ADDR_LOW3


def run_via_pty(binary, payload, timeout=2.0):
    pid, fd = pty.fork()
    if pid == 0:
        os.execv(binary, [binary, payload])
        os._exit(127)  # pragma: no cover
    end = time.time() + timeout
    data = b""
    while time.time() < end:
        try:
            chunk = os.read(fd, 65536)
        except OSError:
            break
        if not chunk:
            break
        data += chunk
        if WIN_TEXT in data:
            break
    try:
        os.waitpid(pid, os.WNOHANG)
    except ChildProcessError:
        pass
    return data


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du binaire rev1")
    ap.add_argument("--check", action="store_true", help="code de sortie 0/1, pas de sortie texte")
    ap.add_argument("--payload", action="store_true", help="affiche juste le payload (hex)")
    args = ap.parse_args()

    payload = build_payload()
    if args.payload:
        print(payload.hex())
        return

    out = run_via_pty(args.binary, payload)
    ok = WIN_TEXT in out
    if args.check:
        sys.exit(0 if ok else 1)
    print(out.decode(errors="replace").strip())
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
