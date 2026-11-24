#!/usr/bin/env python3
"""Solveur du "Roullete Simulator" (RodrigoTeixeira) — main.class.

Le seed est (int)nanoTime & 0xFFFF : seulement 65536 états possibles.
Les issues (gagné/perdu) sont visibles via "Money:", donc on mise 1 pour
observer, on retrouve l'état du xorshift, puis on mise tout (money) sur les
tirs gagnants prédits jusqu'à ce que 2*money dépasse 2^31-1 -> money < 0.

  roulette-solve.py --check [--java /chemin/java]   # preuve live (JVM)
  roulette-solve.py --predict 0xBEEF                # plan pour un seed donné
(pas de login dans ce crackme ; utilisateur d'exemple petik : sans objet)
"""
import argparse, os, re, shutil, subprocess, sys, tempfile

M = 0xFFFF
CLASS = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "main.class")


def step(s):
    s ^= (s << 7) & M
    s ^= s >> 9
    s ^= (s << 8) & M
    return s


def outcomes(s, n):
    """n premières issues (True = gain) depuis l'état initial s."""
    out = []
    for _ in range(n):
        s = step(s)
        out.append(s % 37 < 18)
    return out


def candidates(obs):
    return [s for s in range(M + 1) if outcomes(s, len(obs)) == obs]


def advance(s, n):
    for _ in range(n):
        s = step(s)
    return s


def plan_bet(state, money):
    """Mise suivante selon l'état courant (avant tirage)."""
    return money if step(state) % 37 < 18 else 1


def predict(seed):
    s, money, n = seed, 100, 0
    while money > 0 and n < 100000:
        bet = plan_bet(s, money)
        s = step(s)
        money = money + bet if s % 37 < 18 else money - bet
        n += 1
        if money > 0x7FFFFFFF:      # overflow int32 -> négatif
            return n, money - (1 << 32)
    return n, money


def live(java):
    d = tempfile.mkdtemp()
    shutil.copy(CLASS, os.path.join(d, "Main.class"))   # copie, original/ intact
    p = subprocess.Popen([java, "-cp", d, "Main"], stdin=subprocess.PIPE,
                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    buf = b""

    def until(tag):
        nonlocal buf
        while tag not in buf:
            c = os.read(p.stdout.fileno(), 4096)
            if not c:
                break
            buf += c
        t, buf = buf, b""
        return t.decode()

    def send(x):
        p.stdin.write((str(x) + "\n").encode()); p.stdin.flush()

    until(b"[N]o: "); send("n")
    txt = until(b"Enter bet: ")
    money = int(re.findall(r"Money: (-?\d+)", txt)[-1])
    obs, n = [], 0
    cur = None
    # phase 1 : sonde avec des mises de 1 jusqu'à ce que le futur soit unique
    while True:
        cs = candidates(obs)
        futures = {tuple(outcomes(c, len(obs) + 64)[len(obs):]) for c in cs}
        if len(futures) <= 1 and cs:
            break
        send(1); txt = until(b"Enter bet: ")
        new = int(re.findall(r"Money: (-?\d+)", txt)[-1])
        obs.append(new > money); money = new
    cur = advance(cs[0], len(obs))
    print(f"[+] {len(obs)} sondes, seed candidats={len(cs)} ex. 0x{cs[0]:04x}", file=sys.stderr)
    # phase 2 : tout sur les gains prédits
    while money > 0:
        bet = plan_bet(cur, money)
        cur = step(cur)
        send(bet); txt = until(b"Enter bet: ")
        ms = re.findall(r"Money: (-?\d+)", txt)
        if "Congratulations" in txt:
            print(txt.strip().splitlines()[-3:], file=sys.stderr)
            try:
                send("")
            except BrokenPipeError:
                pass
            break
        money = int(ms[-1])
    ok = "Congratulations" in txt
    print("[+] SOLVED (Congratulations affiché)" if ok else "[-] échec", file=sys.stderr)
    p.kill()
    return ok


if __name__ == "__main__":
    a = argparse.ArgumentParser()
    a.add_argument("--check", action="store_true")
    a.add_argument("--java", default=shutil.which("java") or "java")
    a.add_argument("--predict", type=lambda x: int(x, 0))
    a.add_argument("-q", action="store_true")
    a = a.parse_args()
    if a.predict is not None:
        print(predict(a.predict & M))
    elif a.check:
        sys.exit(0 if live(a.java) else 1)
    else:
        print("Mise 1 jusqu'à identification du seed, puis tout sur les gains prédits (voir README).")
