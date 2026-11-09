#!/usr/bin/env python3
"""Solveur acheylate "Patch It, Cli Game" (guessnumber, ELF64 Rust).

Le nombre secret (1..1000) est tiré au hasard à chaque lancement (aucune
seed fixe) : il n'y a pas de "serial". Le solveur lance le binaire d'origine
(copie exécutable dans un dossier temporaire, original/ intact) sous gdb,
lit le secret dans la frame de main au moment du premier read(0) puis
le renvoie sur stdin => victoire à la 1re tentative.

    python3 tools/guessnumber-solve.py            # joue et affiche la sortie
    python3 tools/guessnumber-solve.py -q         # n'affiche que le secret
    python3 tools/guessnumber-solve.py --check    # 5 parties, exit 0 si toutes gagnées
"""
import argparse, os, re, shutil, subprocess, sys, tempfile, threading

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "guessnumber")
SECRET_OFF = 0xAC   # secret = *(u32*)(rsp + 0xac) à l'entrée du read(0) (main frame)

GDB = """set pagination off
set confirm off
catch syscall read
commands 1
  silent
  if $rdi != 0
    continue
  else
    printf "SECRET=%d\\n", *(int*)($rsp+{off})
    detach
  end
end
run < {fifo} > {out}
"""

def play():
    d = tempfile.mkdtemp(prefix="gn-")
    try:
        exe = os.path.join(d, "g")
        shutil.copy(BIN, exe); os.chmod(exe, 0o755)
        fifo = os.path.join(d, "in"); os.mkfifo(fifo)
        out = os.path.join(d, "out")
        script = os.path.join(d, "cmds.gdb")
        open(script, "w").write(GDB.format(off=SECRET_OFF, fifo=fifo, out=out))
        p = subprocess.Popen(["gdb", "-q", "-batch", "-x", script, exe],
                             stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        holder = {}
        def feeder():
            f = open(fifo, "w")          # débloque le open() de l'inférieur
            holder["f"] = f
        t = threading.Thread(target=feeder); t.start()
        secret = None
        for line in p.stdout:
            m = re.search(r"SECRET=(\d+)", line)
            if m:
                secret = int(m.group(1)); break
        t.join()
        f = holder["f"]
        f.write(f"{secret}\n"); f.flush()
        # detach => l'inférieur continue seul, lit le secret et finit
        import time
        for _ in range(100):
            if p.poll() is not None: break
            time.sleep(0.1)
        f.close()
        time.sleep(1.5)
        p.kill()
        txt = open(out, errors="replace").read()
        return secret, txt
    finally:
        shutil.rmtree(d, ignore_errors=True)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    n = 5 if a.check else 1
    ok = 0
    for _ in range(n):
        s, txt = play()
        win = "You guessed the random number" in txt
        ok += win
        if a.q: print(s)
        elif a.check: print(f"secret={s} win={win}")
        else: print(txt, f"\n[secret = {s}]")
    if a.check:
        print(f"{ok}/{n} victoires"); sys.exit(0 if ok == n else 1)

if __name__ == "__main__":
    main()
