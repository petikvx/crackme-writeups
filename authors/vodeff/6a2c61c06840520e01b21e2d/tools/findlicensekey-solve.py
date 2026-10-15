#!/usr/bin/env python3
"""FindLicenseKey (vodeff) — keygen.

key[i] = T[(s8(name[i]) + i) % 62] pour i = 0..23, T = "QAZPLWSXOKMEYDCIJNRFVUHBTGqpalzmwoeirutyskdjfhgxncbv1750284369"

Le binaire lit TOUJOURS 24 octets depuis argv[1], sans s'arrêter au NUL :
  - name >= 24 caractères -> clé déterministe (mode par défaut conseillé) ;
  - name court -> les octets suivants sont ceux de la mémoire pile après argv[1]
    (execfn / env...). `--check` lance donc le binaire sous `env -i` avec un
    chemin exec connu pour reproduire exactement ce layout.

Usage : findlicensekey-solve.py [name] [-q] [--check BINAIRE]
"""
import argparse, os, subprocess, sys

T = "QAZPLWSXOKMEYDCIJNRFVUHBTGqpalzmwoeirutyskdjfhgxncbv1750284369"

def s8(b):
    return b - 256 if b > 127 else b

def keygen(tail: bytes) -> str:
    assert len(tail) >= 24
    return "".join(T[(s8(tail[i]) + i) % 62] for i in range(24))

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    name = a.name.encode()
    if a.check:
        path = a.check  # execfn = chemin tel que passé à execve
        # layout pile (env vide) : argv[0]\0 argv[1]\0 execfn\0
        mem = path.encode() + b"\0" + name + b"\0" + path.encode() + b"\0"
        tail = mem[len(path) + 1:]
        # name >= 24 : indépendant ; sinon argv[1]\0 + execfn\0
        key = keygen(tail.ljust(24, b"\0"))
        r = subprocess.run(["env", "-i", a.check, a.name], input=key + "\n",
                           capture_output=True, text=True)
        print(key if a.q else f"{key}\n{r.stdout.strip()}")
        sys.exit(0 if "Key validated" in r.stdout else 1)
    key = keygen(name.ljust(24, b"\0"))
    print(key if a.q else f"name={a.name} (>=24 car. conseillé)\nkey ={key}")

if __name__ == "__main__":
    main()
