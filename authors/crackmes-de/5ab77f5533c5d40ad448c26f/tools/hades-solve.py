#!/usr/bin/env python3
"""Keygen pour « hades » (j, crackmes.de) — crackmes.one 5ab77f5533c5d40ad448c26f.

Schéma (cf. README) :
  snafu()/fubar() dérivent du nom (sommes de pow() en x87 + 3-Way + GOST) :
    - T  = 4 dwords (0x408480..0x40848c) -> cible "%08lx-%08lx-%08lx-%08lx"
    - K1..K4 = 4 clés ASCII "%08lx" (0x408940, 0x4086a0, 0x4086b0, 0x408820)
  fugazi() : sscanf(serial) en 4 dwords, puis RC5-32/10/8 *déchiffrement*
  ECB (2 blocs) successivement avec K1, K2, K3, K4 ; résultat comparé à T.
  Donc serial = E_K1(E_K2(E_K3(E_K4(T)))).

Le nom passe par du flottant x87 (pow, fistp) : pour reproduire bit à bit,
on émule snafu()/fubar() du binaire (dépaqueté UPX) avec Unicorn, puis on
chiffre en RC5 en Python. --check : (1) émule SundaysRuin() du binaire avec
le serial (doit retourner 1), (2) facultatif --wine : pilote la GUI sous
wine/xvfb et attend « That serial is correct! Well done. ».
"""
import argparse, math, os, re, struct, subprocess, sys, shutil, tempfile, time
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
PACKED = os.path.join(ROOT, "original", "hades_keygenme.exe")
UNPACKED = os.path.join(ROOT, "analysis", "hades_unpacked.exe")

NAME, SERIAL = 0x4086C0, 0x4085A0
T_ADDR, TARGET_STR, RESULT_STR = 0x408480, 0x408830, 0x4084A0
KEYS = [0x408940, 0x4086A0, 0x4086B0, 0x408820]
THUNKS = {0x405800: "strlen", 0x405810: "sscanf", 0x405820: "sprintf",
          0x405830: "free", 0x405850: "malloc", 0x405860: "pow", 0x405900: "wsprintfA"}
STUB, POWRES, HEAP, STACK, END = 0x500000, 0x500100, 0x600000, 0x700000, 0x500800


def unpacked():
    if not os.path.exists(UNPACKED):
        upx = shutil.which("upx") or os.path.expanduser("~/.local/bin/upx")
        subprocess.run([upx, "-d", "-q", "-o", UNPACKED, PACKED], check=True)
    return open(UNPACKED, "rb").read()


class Emu:
    def __init__(self):
        pe = unpacked()
        mu = Uc(UC_ARCH_X86, UC_MODE_32)
        mu.mem_map(0x400000, 0x10000)
        off = struct.unpack_from("<I", pe, 0x3C)[0]
        nsec = struct.unpack_from("<H", pe, off + 6)[0]
        sopt = struct.unpack_from("<H", pe, off + 20)[0]
        sec = off + 24 + sopt
        for i in range(nsec):
            _, vs, va, rs, ro = struct.unpack_from("<8sIIII", pe, sec + 40 * i)
            if rs:
                mu.mem_write(0x400000 + va, pe[ro:ro + min(rs, vs or rs)])
        mu.mem_map(STUB, 0x1000)
        mu.mem_map(HEAP, 0x10000)
        mu.mem_map(STACK, 0x10000)
        # stub pow : fld qword [POWRES] ; ret   (le hook calcule POWRES avant)
        mu.mem_write(STUB, b"\xdd\x05" + struct.pack("<I", POWRES) + b"\xc3")
        mu.mem_write(END, b"\xf4")
        self.mu, self.heap = mu, HEAP
        mu.hook_add(UC_HOOK_CODE, self._hook, begin=0x405800, end=0x405910)

    def cstr(self, a):
        b = bytes(self.mu.mem_read(a, 0x200))
        return b.split(b"\0")[0]

    def _ret(self, val=None, pop=0):
        mu = self.mu
        esp = mu.reg_read(UC_X86_REG_ESP)
        ra = struct.unpack("<I", mu.mem_read(esp, 4))[0]
        if val is not None:
            mu.reg_write(UC_X86_REG_EAX, val & 0xFFFFFFFF)
        mu.reg_write(UC_X86_REG_ESP, esp + 4 + pop)
        mu.reg_write(UC_X86_REG_EIP, ra)

    def _fmt(self, fmt, args):
        out, i = b"", 0
        for part in re.split(rb"(%08lx)", fmt):
            if part == b"%08lx":
                out += b"%08lx" % args[i]; i += 1
            else:
                out += part
        return out

    def _hook(self, mu, addr, size, _):
        name = THUNKS.get(addr)
        if not name:
            return
        esp = mu.reg_read(UC_X86_REG_ESP)
        arg = lambda n: struct.unpack("<I", mu.mem_read(esp + 4 + 4 * n, 4))[0]
        if name == "strlen":
            self._ret(len(self.cstr(arg(0))))
        elif name in ("sprintf", "wsprintfA"):
            s = self._fmt(self.cstr(arg(1)), [arg(2 + k) for k in range(4)])
            mu.mem_write(arg(0), s + b"\0")
            self._ret(len(s))
        elif name == "sscanf":
            src = self.cstr(arg(0)).decode("latin1")
            m = re.match(r"\s*([0-9a-fA-F]+)-([0-9a-fA-F]+)-([0-9a-fA-F]+)-([0-9a-fA-F]+)", src)
            n = 0
            if m:
                for k in range(4):
                    mu.mem_write(arg(2 + k), struct.pack("<I", int(m.group(k + 1), 16) & 0xFFFFFFFF))
                n = 4
            self._ret(n)
        elif name == "free":
            self._ret(0)
        elif name == "malloc":
            p = self.heap; self.heap += (arg(0) + 15) & ~15
            self._ret(p)
        elif name == "pow":
            x, y = struct.unpack("<dd", mu.mem_read(esp + 4, 16))
            mu.mem_write(POWRES, struct.pack("<d", math.pow(x, y)))
            mu.reg_write(UC_X86_REG_EIP, STUB)  # fld + ret

    def call(self, fn):
        mu = self.mu
        mu.reg_write(UC_X86_REG_ESP, STACK + 0x8000)
        mu.mem_write(STACK + 0x8000, struct.pack("<I", END))
        mu.emu_start(fn, END)
        return mu.reg_read(UC_X86_REG_EAX)

    def setup(self, name, serial=""):
        mu = self.mu
        mu.mem_write(0x408000, b"\0" * 0x9A0)
        mu.mem_write(NAME, name.encode("latin1") + b"\0")
        mu.mem_write(SERIAL, serial.encode("latin1") + b"\0")
        # FPU dans l'état fninit (mingw _fpreset) : CW=0x37F
        mu.reg_write(UC_X86_REG_FPCW, 0x37F)


def derive(name):
    e = Emu(); e.setup(name)
    e.call(0x403940)  # snafu
    e.call(0x4042A0)  # fubar
    t = struct.unpack("<4I", e.mu.mem_read(T_ADDR, 16))
    keys = [e.cstr(k) for k in KEYS]
    return t, keys


# ---- RC5-32/10/b (doa_key / boucle de fugazi) ----
M = 0xFFFFFFFF
rol = lambda v, s: ((v << (s & 31)) | (v >> (32 - (s & 31)))) & M


def rc5_schedule(key, r=10):
    c = max(1, (len(key) + 3) // 4)
    L = list(struct.unpack("<%dI" % c, key.ljust(4 * c, b"\0")))
    t = 2 * r + 2
    S = [(0xB7E15163 + i * 0x9E3779B9) & M for i in range(t)]
    A = B = i = j = 0
    for _ in range(3 * max(t, c)):
        A = S[i] = rol((S[i] + A + B) & M, 3)
        B = L[j] = rol((L[j] + A + B) & M, A + B)
        i, j = (i + 1) % t, (j + 1) % c
    return S


def rc5_enc(S, A, B, r=10):
    A = (A + S[0]) & M; B = (B + S[1]) & M
    for i in range(1, r + 1):
        A = (rol(A ^ B, B) + S[2 * i]) & M
        B = (rol(B ^ A, A) + S[2 * i + 1]) & M
    return A, B


def keygen(name):
    if not 4 <= len(name) <= 32:
        raise SystemExit("le nom doit faire 4..32 caractères")
    t, keys = derive(name)
    blk = list(t)
    for k in reversed(keys):  # fugazi déchiffre K1,K2,K3,K4 -> on chiffre K4..K1
        S = rc5_schedule(k)
        blk[0], blk[1] = rc5_enc(S, blk[0], blk[1])
        blk[2], blk[3] = rc5_enc(S, blk[2], blk[3])
    return "%08lx-%08lx-%08lx-%08lx" % tuple(blk), t, keys


def check_emu(name, serial):
    e = Emu(); e.setup(name, serial)
    ok = e.call(0x404ED0) & 0xFF  # SundaysRuin = snafu+fubar+fugazi+compare
    return ok == 1, e.cstr(TARGET_STR).decode(), e.cstr(RESULT_STR).decode()


def check_wine(name, serial, timeout=60):
    """Pilote la vraie GUI (exe packé d'origine) sous wine dans un Xvfb ;
    succès = MessageBox titrée « Solved! » (échec : « Nope... »)."""
    script = r'''
export WINEDEBUG=-all
wine "$1" >/dev/null 2>&1 &
for i in $(seq 1 40); do W=$(xdotool search --onlyvisible --name "HADES" 2>/dev/null|head -1); [ -n "$W" ] && break; sleep 0.3; done
[ -z "$W" ] && { echo NOWIN; wineserver -k; exit 1; }
sleep 1
eval $(xdotool getwindowgeometry --shell $W)
xdotool mousemove $((X+165)) $((Y+10)) click 1; xdotool type --delay 20 "$2"
xdotool mousemove $((X+165)) $((Y+32)) click 1; xdotool type --delay 20 "$3"
xdotool mousemove $((X+77)) $((Y+57)) click 1
sleep 2
for w in $(xdotool search --onlyvisible --name "."); do xdotool getwindowname $w; done
wineserver -k
'''
    with tempfile.NamedTemporaryFile("w", suffix=".sh", delete=False) as f:
        f.write(script)
    try:
        out = subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 800x600x24", "bash", f.name,
                              PACKED, name, serial], capture_output=True, text=True,
                             timeout=timeout).stdout
    finally:
        os.unlink(f.name)
    return "Solved!" in out, out.strip().replace("\n", " | ")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--serial")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--wine", action="store_true", help="avec --check : vérifie aussi la vraie GUI sous wine")
    ap.add_argument("-v", action="store_true")
    a = ap.parse_args()
    serial, t, keys = keygen(a.name)
    if a.serial:
        serial = a.serial
    if a.v:
        print("cible T :", "%08lx-%08lx-%08lx-%08lx" % t)
        print("clés    :", [k.decode() for k in keys])
    print("Name  :", a.name)
    print("Serial:", serial)
    if a.check:
        ok, tgt, res = check_emu(a.name, serial)
        print("[emu] SundaysRuin ->", "OK" if ok else "FAIL", "| cible", tgt, "| déchiffré", res)
        if a.wine:
            okw, out = check_wine(a.name, serial)
            print("[wine] fenêtres :", out, "->", "OK (Solved!)" if okw else "FAIL")
            ok = ok and okw
        sys.exit(0 if ok else 1)
