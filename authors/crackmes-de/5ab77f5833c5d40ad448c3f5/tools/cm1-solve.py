#!/usr/bin/env python3
"""cm1 (lagalopex) — id 5ab77f5833c5d40ad448c3f5. ELF32, « Get a working key/keygen ; GPL tools only ».

Le binaire ouvre  <pw_dir>/.key_<pw_name>  (getpwuid(getuid())) et lit la clé octet par octet :
  esi = accumulateur (0 au départ), prev = caractère précédent (0x20 au départ), run = longueur de série
  '*' : esi += 5      '+' : esi += 1      '-' : esi -= 1      '/' : esi -= 5
        (une série de caractères identiques ne peut dépasser 5 : sinon échec)
  ',' : lit 1 octet B ; exige B == esi, puis esi == name[k] ; k++ ; si name[k] == 0 le fichier doit
        se terminer là (read == 0) ; ensuite esi = esi / 10
  tout autre octet : échec
  Succès : EOF atteint avec name[] entièrement consommé -> « Seems you've got it ;) ».

Keygen : pour chaque caractère du nom, plus court chemin (BFS) d'opérations de l'accumulateur courant
vers la valeur du caractère, puis « , » + l'octet lui-même.

  cm1-solve.py [user] [-o fichier] [-q] [--check]    (défaut user = petik)
  --check : écrit réellement  <pw_dir>/.key_<user>  de l'utilisateur COURANT, lance le binaire, supprime.
"""
import argparse, getpass, os, pwd, subprocess, sys
from collections import deque
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "cm1"
OPS = {"*": 5, "+": 1, "-": -1, "/": -5}


def path_to(acc: int, target: int):
    """plus court mot sur {*,+,-,/} (séries <= 5) menant de acc à target"""
    if acc == target:
        return ""
    start = (acc, "", 0)
    seen = {start}
    q = deque([(acc, "", 0, "")])
    while q:
        a, last, run, s = q.popleft()
        for o, dlt in OPS.items():
            r = run + 1 if o == last else 1
            if r > 5:
                continue
            na = a + dlt
            if abs(na) > 400:
                continue
            if na == target:
                return s + o
            st = (na, o, r)
            if st not in seen:
                seen.add(st)
                q.append((na, o, r, s + o))
    raise RuntimeError("inatteignable")


def keyfile(name: str) -> bytes:
    out = bytearray()
    acc = 0
    for ch in name.encode():
        out += path_to(acc, ch).encode() + b"," + bytes([ch])
        acc = ch // 10
    return bytes(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik")
    ap.add_argument("-o", "--out")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keyfile(a.user)
    if a.out:
        Path(a.out).write_bytes(k)
    print(k.decode("latin1") if a.q else f"user   : {a.user}\nkeyfile: {k.decode('latin1')}  ({len(k)} octets)")
    if a.check:
        cur = pwd.getpwuid(os.getuid())
        p = Path(cur.pw_dir) / f".key_{cur.pw_name}"
        if p.exists():
            sys.exit(f"{p} existe déjà : on ne l'écrase pas")
        try:
            p.write_bytes(keyfile(cur.pw_name))
            ok = "Seems you've got it" in subprocess.run([str(BIN)], capture_output=True, text=True).stdout
            p.write_bytes(keyfile(cur.pw_name)[:-1] + b"X")
            bad = "Seems you've got it" not in subprocess.run([str(BIN)], capture_output=True, text=True).stdout
        finally:
            p.unlink(missing_ok=True)
        print("check:", "OK" if ok and bad else "KO", f"(utilisateur {cur.pw_name} : ok={ok}, clé altérée rejetée={bad})")
        sys.exit(0 if ok and bad else 1)


if __name__ == "__main__":
    main()
