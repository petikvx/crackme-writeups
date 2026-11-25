#!/usr/bin/env python3
"""stefa9 "Memory Me" : le crackme demande de passer à vrai un bool en mémoire.

Le binaire affiche l'adresse (0x14000B0B8) puis boucle tant que
    [0x14000B0B8] != 1  ||  [0x14000B0BC] != 0xFFFFFFFE
Le « solveur » lance l'exe d'origine sous Wine, écrit ces 8 octets dans le
processus vivant (/proc/<pid>/mem) et vérifie « Good job! » sur stdout.
Aucun octet du fichier n'est modifié (le crackme hash son propre exe).

  python3 -I stefa9-solve.py [--check] [-q] [chemin/test.exe]
"""
import argparse, os, struct, subprocess, sys, tempfile, time

ADDR = 0x14000B0B8
VALUE = struct.pack('<II', 1, 0xFFFFFFFE)  # bool = 1 ; canari int = -2
HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT = os.path.join(HERE, '..', 'original', 'test.exe')


def find_pid(exe):
    for d in os.listdir('/proc'):
        if d.isdigit():
            try:
                c = open(f'/proc/{d}/cmdline', 'rb').read().rstrip(b'\0')
            except OSError:
                continue
            if c.startswith(b'Z:') and c.endswith(os.path.basename(exe).encode()):
                return int(d)


def run(exe, quiet=False):
    exe = os.path.abspath(exe)
    with tempfile.TemporaryFile() as out:
        p = subprocess.Popen(['wine', exe], stdin=subprocess.PIPE, stdout=out,
                             stderr=subprocess.DEVNULL,
                             env=dict(os.environ, WINEDEBUG='-all'))
        pid = None
        for _ in range(30):
            time.sleep(0.5)
            pid = find_pid(exe)
            if pid:
                break
        time.sleep(2)
        with open(f'/proc/{pid}/mem', 'r+b', buffering=0) as m:
            m.seek(ADDR)
            before = m.read(8)
            m.seek(ADDR)
            m.write(VALUE)
        time.sleep(3)
        p.stdin.close()  # le « PAUSE » final se termine sur EOF -> flush stdout
        try:
            p.wait(timeout=10)
        except subprocess.TimeoutExpired:
            p.kill()
            os.kill(pid, 9)
        out.seek(0)
        text = out.read().decode(errors='replace')
    if not quiet:
        print(f'avant : {before.hex()}  après : {VALUE.hex()}')
        print(text)
    return 'Good job!' in text


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('exe', nargs='?', default=DEFAULT)
    ap.add_argument('--check', action='store_true')
    ap.add_argument('-q', action='store_true')
    a = ap.parse_args()
    ok = run(a.exe, a.q)
    print('OK' if ok else 'KO')
    sys.exit(0 if ok else 1)
