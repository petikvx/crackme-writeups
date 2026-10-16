"""CrackMe #2 By BuLLeT - [TOL'98] -- preuve live : lit le vrai mot de passe
directement dans la Variant comparee par le programme, juste avant l'appel a
__vbaVarTstEq (VB5), sans avoir a reconstruire a la main l'ordre des Mid$()
sur les deux chaines leurres (ambigu depuis le seul desassemblage x86, voir
README § Comment on trouve).

Prerequis (binaire Windows 1998, PE32, runtime VB5 -- rien de tout ca n'est
preinstalle par defaut) :

  # 1. Xvfb sans sudo (paquet .deb extrait localement, pas d'installation
  #    systeme) :
  apt-get download xvfb
  dpkg-deb -x xvfb_*.deb /tmp/xvfb-local
  /tmp/xvfb-local/usr/bin/Xvfb :99 -screen 0 1024x768x24 &

  # 2. Runtime MSVBVM50.DLL (Microsoft, officiel, via winetricks -- nom de
  #    verbe reconnu mais marque "broken" sur wine recent : l'installeur
  #    /q plante sous wow64, on extrait donc les DLL du .exe directement) :
  winetricks -q --force vb5run   # telecharge msvbvm50.exe (echoue a l'install, normal)
  cd ~/.cache/winetricks/vb5run
  7z x msvbvm50.exe MSVBVM50.DLL OLEAUT32.DLL OLEPRO32.DLL ASYCFILT.DLL COMCAT.DLL
  cp MSVBVM50.DLL OLEAUT32.DLL OLEPRO32.DLL ASYCFILT.DLL COMCAT.DLL \
     "$WINEPREFIX/drive_c/windows/syswow64/"

  # 3. GDB ne peut PTRACE_ATTACH un process deja lance (yama ptrace_scope=1,
  #    pas de sudo pour le baisser) -> lancer le binaire COMME enfant direct
  #    de gdb des le depart (--args), pas via `wine` (script shell, gdb ne
  #    sait pas l'executer comme "file") mais via le VRAI binaire ELF sous-
  #    jacent, typiquement /usr/lib/x86_64-linux-gnu/wine/wine.

Ce script : lance gdb+wine+le crackme sous Xvfb :99, interrompt l'execution
(SIGINT au process gdb lui-meme, pas au programme) une fois la fenetre VB
affichee, pose un breakpoint sur l'appel a __vbaVarTstEq (0x40208d, trouve en
remontant les xrefs d'import -- voir README), relance, puis pilote le VRAI
GUI via Xlib/XTest (pas de sudo/X11 requis au-dela de Xvfb) pour taper un mot
de passe quelconque et cliquer "Verify" -- ce qui declenche le breakpoint.
A l'arret, les deux pointeurs de Variant compares sont sur la pile
([esp], [esp+4]) ; on dereference chacun comme {vt:WORD, ...; BSTR a l'offset
+8} et on lit le BSTR (prefixe de longueur 4 octets, puis UTF-16LE) : l'un
est l'entree utilisateur, l'autre EST le mot de passe attendu, construit par
le programme lui-meme.

Usage (depuis authors/crackmes-de/5ab77f5633c5d40ad448c2d0/original/extracted) :
    DISPLAY=:99 python3 ../../tools/gdb-live-password.py
(ajuster WINEPREFIX dans le script si besoin)
"""
import os
import pty
import select
import time

from Xlib import X, display
from Xlib.ext import xtest
import Xlib.XK

WINEPREFIX = os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine-crkme275"))
TARGET_EXE = "B-CRKME2.EXE"
BREAK_ADDR = "0x40208d"  # call __vbaVarTstEq, trouve via objdump + xref de l'import


def main():
    D = display.Display(os.environ.get("DISPLAY", ":99"))

    def click(x, y):
        xtest.fake_input(D, X.MotionNotify, x=x, y=y)
        D.sync()
        time.sleep(0.1)
        xtest.fake_input(D, X.ButtonPress, 1)
        D.sync()
        xtest.fake_input(D, X.ButtonRelease, 1)
        D.sync()
        time.sleep(0.2)

    def select_all_delete():
        ctrl_kc = D.keysym_to_keycode(Xlib.XK.XK_Control_L)
        a_kc = D.keysym_to_keycode(Xlib.XK.XK_a)
        xtest.fake_input(D, X.KeyPress, ctrl_kc); D.sync()
        xtest.fake_input(D, X.KeyPress, a_kc); D.sync()
        xtest.fake_input(D, X.KeyRelease, a_kc); D.sync()
        xtest.fake_input(D, X.KeyRelease, ctrl_kc); D.sync()

    def type_text(text):
        for ch in text:
            keysym = Xlib.XK.string_to_keysym(ch) or ord(ch)
            keycode = D.keysym_to_keycode(keysym)
            xtest.fake_input(D, X.KeyPress, keycode); D.sync()
            xtest.fake_input(D, X.KeyRelease, keycode); D.sync()
            time.sleep(0.02)

    env = os.environ.copy()
    env["WINEPREFIX"] = WINEPREFIX
    env["WINEDLLOVERRIDES"] = "msvbvm50=n"

    master, slave = pty.openpty()
    cmd = ["gdb", "-q", "--args", "/usr/lib/x86_64-linux-gnu/wine/wine", TARGET_EXE]
    pid = os.fork()
    if pid == 0:
        os.setsid()
        os.dup2(slave, 0); os.dup2(slave, 1); os.dup2(slave, 2)
        os.close(master)
        os.execvpe(cmd[0], cmd, env)
        os._exit(1)
    os.close(slave)

    def send(s):
        os.write(master, (s + "\n").encode())

    def read_avail(timeout=1.0):
        out = b""
        end = time.time() + timeout
        while time.time() < end:
            r, _, _ = select.select([master], [], [], 0.3)
            if master in r:
                chunk = os.read(master, 65536)
                if not chunk:
                    break
                out += chunk
            elif out:
                break
        return out.decode(errors="replace")

    read_avail(2)
    send("n")  # refuse le prompt debuginfod
    time.sleep(0.5); read_avail(1)
    send("run")
    time.sleep(5); read_avail(2)
    os.kill(pid, 2)  # SIGINT -> interrompt l'inferieur, rend la main a gdb
    time.sleep(1); read_avail(2)
    send(f"break *{BREAK_ADDR}")
    read_avail(1)
    send("continue")
    time.sleep(2); read_avail(1)

    time.sleep(1)
    click(470, 396)
    select_all_delete()
    type_text("PROBE")
    click(618, 396)
    time.sleep(1)
    print(read_avail(3))

    send("set $v1 = *(int*)$esp")
    send("set $v2 = *(int*)($esp+4)")
    send("set $b1 = *(int*)($v1+8)")
    send("set $b2 = *(int*)($v2+8)")
    send("x/1xw $b1-4")
    print(read_avail(1))
    send("x/40bx $b1")
    print(read_avail(1))
    send("x/1xw $b2-4")
    print(read_avail(1))
    send("x/40bx $b2")
    print(read_avail(1))


if __name__ == "__main__":
    main()
