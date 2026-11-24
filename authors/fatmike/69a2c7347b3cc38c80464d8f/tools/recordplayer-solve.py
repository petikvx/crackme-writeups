#!/usr/bin/env python3
"""Fatmike Crackme #10 (RecordPlayer.exe) : flag + patch "les deux switches".

Le binaire joue la ressource SOUND/141 (WAV 8 bits mono 44100 Hz) avec deux
réglages cassés codés en dur dans le handler PLAY (VA 0x14000392d / 0x140003938,
`mov dl,1`) : lecture à l'envers + pitch instable. Pendant la lecture il garde
une fenêtre glissante des 23 derniers octets joués, XOR une clé de 23 octets,
FNV-1a(32) == 0x18940a3d  =>  la fenêtre XORée est le flag.

Usage :
  recordplayer-solve.py [exe]              # flag (-q : flag seul)
  recordplayer-solve.py exe --check        # recalcule le hash sur le flag trouvé
  recordplayer-solve.py exe --patch OUT    # écrit une copie patchée (jamais l'original)
"""
import argparse, sys

KEY = bytes.fromhex("302b3dfcf6b6063b0eb1edc0e148070c0bbbf4f9480119")
TARGET = 0x18940A3D
PATCH_VAS = (0x14000392D, 0x140003938)  # b2 01 (mov dl,1) -> b2 00
IMAGE_BASE, TEXT_RVA, TEXT_RAW = 0x140000000, 0x1000, 0x400


def fnv1a(b):
    h = 0x811C9DC5
    for c in b:
        h = ((h ^ c) * 0x1000193) & 0xFFFFFFFF
    return h


def wav_data(exe):
    i = exe.find(b"RIFF")
    j = exe.find(b"data", i)
    n = int.from_bytes(exe[j + 4:j + 8], "little")
    return exe[j + 8:j + 8 + n]


def solve(exe):
    d = wav_data(exe)
    for p in range(len(d) - len(KEY) + 1):
        m = bytes(a ^ b for a, b in zip(d[p:p + len(KEY)], KEY))
        if fnv1a(m) == TARGET:
            return m.decode(), p
    raise SystemExit("flag introuvable")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?", default="original/RecordPlayer.exe")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--patch", metavar="OUT")
    a = ap.parse_args()
    exe = bytearray(open(a.exe, "rb").read())
    flag, off = solve(bytes(exe))
    if a.patch:
        for va in PATCH_VAS:
            o = va - IMAGE_BASE - TEXT_RVA + TEXT_RAW
            assert exe[o:o + 2] == b"\xb2\x01", hex(o)
            exe[o + 1] = 0
        open(a.patch, "wb").write(exe)
        print(f"patch écrit : {a.patch}", file=sys.stderr)
    if a.q:
        print(flag)
        return
    print(f"flag   : {flag}")
    print(f"offset : {off} octets dans le WAV ({off / 44100:.3f} s)")
    if a.check:
        win = bytes(x ^ y for x, y in zip(flag.encode(), KEY))  # octets attendus dans le flux joué
        ok = fnv1a(flag.encode()) == TARGET and wav_data(bytes(exe))[off:off + len(KEY)] == win
        print("check  :", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
