#!/usr/bin/env python3
"""mirunaf "Floating password" — solveur / vérificateur.

Prédicat (main -> ko -> kol) :
    a = uniform_int(4, 0xe17)(mt19937(random_device()))   # imprévisible (rand_s)
    srand(time(0)); b = rand()                            # LCG msvcrt, graine = heure
    h = K + (sqrt(a) * b / K) * a ,  K = 67745.0f
    OK  <=>  float(entrée) == h

Astuce : si b == 0, h = K exactement, quel que soit `a`  =>  réponse 67745.
Il faut donc que le crackme tire srand(t) avec t tel que rand() == 0 :
on attend cette seconde `t`, puis on envoie "67745".

Usage :
  floating-solve.py            # affiche la réponse + prochaine seconde « b==0 »
  floating-solve.py -q         # juste la réponse (67745)
  floating-solve.py --check    # émule le vrai code du .exe sous unicorn (a, b variés)
  floating-solve.py --run EXE  # lance EXE (via wine si dispo), attend t*, envoie 67745
"""
import argparse, math, os, shutil, struct, subprocess, sys, time, zipfile, io

K = 67745.0
HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")


def msvcrt_first_rand(seed):
    s = (seed * 214013 + 2531011) & 0xFFFFFFFF
    return (s >> 16) & 0x7FFF


def next_zero_seed(t0):
    t = t0
    while msvcrt_first_rand(t) != 0:
        t += 1
    return t


def load_exe():
    z = zipfile.ZipFile(ORIG)
    return z.read("crackme.exe", pwd=b"crackmes.one")


def check():
    import numpy as np
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_PROT_ALL
    from unicorn.x86_const import (UC_X86_REG_RAX, UC_X86_REG_RSP, UC_X86_REG_RBP,
                                   UC_X86_REG_RIP, UC_X86_REG_XMM0)
    d = load_exe()
    peo = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, peo + 6)[0]
    optsz = struct.unpack_from("<H", d, peo + 20)[0]
    secs = []
    for i in range(nsec):
        o = peo + 24 + optsz + 40 * i
        vs, va, rs, ro = struct.unpack_from("<IIII", d, o + 8)
        secs.append((va, vs, ro, rs))
    BASE = 0x140000000
    HE, H = 0x140101080, 0x140101084
    KOL, KOJ, KON = 0x140001773, 0x140001710, 0x140001735
    ok_all = True
    cases = [(4, 0), (1234, 0), (3607, 0), (50, 777), (3607, 32767)]
    for a, b in cases:
        for guess_mode in ("K", "formula"):
            mu = Uc(UC_ARCH_X86, UC_MODE_64)
            mu.mem_map(BASE, 0x110000, UC_PROT_ALL)
            for va, vs, ro, rs in secs:
                if rs and va < 0x107000:
                    mu.mem_write(BASE + va, d[ro:ro + min(rs, vs)])
            mu.mem_map(0x7ff00000, 0x400000, UC_PROT_ALL)
            rsp = 0x7ff00000 + 0x100000
            mu.reg_write(UC_X86_REG_RSP, rsp)
            mu.reg_write(UC_X86_REG_RBP, rsp + 0x80)
            mu.reg_write(UC_X86_REG_RAX, a)  # retour de uniform_int_distribution
            hit = {"koj": False, "kon": False}

            def hook(uc, addr, size, _):
                if addr == 0x14001a150:   # _time64
                    ret(uc, 1700000000)
                elif addr == 0x14001a140:  # srand
                    ret(uc, 0)
                elif addr == 0x14001a130:  # rand -> b
                    ret(uc, b)
                elif addr == KOJ:
                    hit["koj"] = True
                elif addr == KON:
                    hit["kon"] = True

            def ret(uc, v):
                uc.reg_write(UC_X86_REG_RAX, v)
                sp = uc.reg_read(UC_X86_REG_RSP)
                r = struct.unpack("<Q", uc.mem_read(sp, 8))[0]
                uc.reg_write(UC_X86_REG_RSP, sp + 8)
                uc.reg_write(UC_X86_REG_RIP, r)

            def hook2(uc, addr, size, _):
                if addr in (0x1400c5140, 0x1400c4eb0, 0x140088690):  # cout << ...
                    ret(uc, 0)
                elif addr == 0x14001a390:  # thunk msvcrt sqrtf (IAT non résolue)
                    x = uc.reg_read(UC_X86_REG_XMM0)
                    fl = struct.unpack("<f", struct.pack("<I", x & 0xFFFFFFFF))[0]
                    r = struct.unpack("<I", struct.pack("<f", math.sqrt(fl)))[0]
                    uc.reg_write(UC_X86_REG_XMM0, r)
                    ret(uc, 0)

            mu.hook_add(UC_HOOK_CODE, hook, begin=BASE, end=BASE + 0x110000)
            mu.hook_add(UC_HOOK_CODE, hook2, begin=BASE, end=BASE + 0x110000)
            # Même ordre d'opérations float32 que le binaire (0x140001849..0x1400018a0)
            f = np.float32
            if guess_mode == "K":
                g = K
            else:
                x = f(np.sqrt(f(a)))
                x = f(x * f(b))
                x = f(x / f(K))
                x = f(x * f(a))
                g = float(f(f(K) + x))
            mu.mem_write(HE, struct.pack("<f", g))
            mu.mem_write(rsp, struct.pack("<Q", 0x1400018ad))
            # émule le vrai code binaire de 0x140001828 (cvtsi2ss a) jusqu'à la fin de kol
            mu.emu_start(0x140001828, 0x1400018ad, count=100000)
            res = "OK" if hit["koj"] else "KO"
            exp = "OK" if (guess_mode == "formula" or b == 0) else "KO"
            good = res == exp
            ok_all &= good
            print(f"a={a:5d} b={b:5d} entrée={g!r:>14} ({guess_mode:7s}) -> {res}  {'✓' if good else '✗ INATTENDU'}")
    print("CHECK", "OK" if ok_all else "ÉCHEC")
    return 0 if ok_all else 1


def run(exe):
    cmd = [exe]
    if not exe.lower().endswith(".exe") or os.name != "nt":
        w = shutil.which("wine64") or shutil.which("wine")
        if os.name != "nt":
            if not w:
                sys.exit("wine introuvable")
            cmd = ["xvfb-run", "-a", w, exe] if shutil.which("xvfb-run") else [w, exe]
    now = int(time.time())
    t = next_zero_seed(now + 3)
    print(f"[+] attente de t*={t} (dans {t-now}s) pour envoyer 67745", flush=True)
    p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
    while time.time() < t - 0.0:
        time.sleep(0.05)
    p.stdin.write("67745\n"); p.stdin.flush(); p.stdin.close()
    print(p.communicate(timeout=30)[0])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--run", metavar="EXE")
    a = ap.parse_args()
    if a.q:
        print("67745"); return
    if a.check:
        sys.exit(check())
    if a.run:
        return run(a.run)
    now = int(time.time())
    t = next_zero_seed(now)
    print("Réponse : 67745 (h = K quand rand() == 0)")
    print(f"Prochaine seconde t* avec rand()==0 : {t} (dans {t-now}s) -> {time.strftime('%F %T', time.localtime(t))}")


main()
