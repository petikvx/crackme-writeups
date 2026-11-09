#!/usr/bin/env python3
"""ZSecure (MAS) — reimplémentation de GameState.cs : boot key + chaîne complète + FLAG.

Usage : zsecure-solve.py [-q] [--check]
  -q       n'affiche que la boot key
  --check  revalide la boot key avec l'algo du binaire (ValidateBootKey)
"""
import argparse, hashlib

A36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def dec(blob, seed):
    return bytes(b ^ ((seed + i * 29) & 0xFF) for i, b in enumerate(blob)).decode()

# --- boot key -------------------------------------------------------------
ARR = [43, 145, 23, 196]
TGT = [120, 185, 62, 239, 51, 36, 134, 223, 145, 18, 111, 216]

def validate_boot(c):
    if len(c) != 15 or any(c[i] != '-' for i in (3, 7, 11)):
        return False
    t = c.replace('-', '').upper()
    num, n2 = 109, 35
    for i, ch in enumerate(t):
        v = A36.find(ch)
        if v < 0: return False
        num = ((num * 29) ^ n2 ^ (i * 17) ^ ARR[i % 4]) & 0xFF
        if (num ^ ((v * 7 + i * 11) & 0xFF) ^ (165 if i % 3 == 0 else 60)) != TGT[i]:
            return False
        n2 = v
    return True

def boot_key():
    num, n2, out = 109, 35, ""
    for i in range(12):
        num = ((num * 29) ^ n2 ^ (i * 17) ^ ARR[i % 4]) & 0xFF
        for v in range(36):
            if (num ^ ((v * 7 + i * 11) & 0xFF) ^ (165 if i % 3 == 0 else 60)) == TGT[i]:
                out += A36[v]; n2 = v; break
        else:
            raise SystemExit("pas de solution")
    return "-".join(out[i:i + 3] for i in range(0, 12, 3))

# --- ReverseChallenge -----------------------------------------------------
SW = [2, 0, 3, 1, 4, 6, 5]
REC = [[64,97,176,108,38,244,56,163,222,15,13],[69,101,170,105],
       [35,30,202,108,37],[6,56,240,2,119,190,105,228]]
def expand():
    a = [125,108,196,45,190,140,45]; r = [0]*7; n = 49
    for i, s in enumerate(SW):
        n = (n ^ (s * 25)) & 0xFF
        r[s] = a[s] ^ (n ^ (i * 13)) & 0xFF
        n = (n + 39) & 0xFF
    return r
def resolve(rec):
    k = expand()
    return bytes(b ^ k[i % 7] ^ ((i * 23 + 43) & 0xFF) for i, b in enumerate(rec)).decode()

def sha(s): return hashlib.sha256(s.encode()).hexdigest()

def chain():
    email = dec(bytes([146,126,86,45,49,244,216,173,134,119,109,89,119,12,227,220,184,153]), 253)
    trig  = dec(bytes([27,227,193,183,136,120]), 121)
    pw    = dec(bytes([206,205,248,212,48,20,8,108]), 143)
    oday  = dec(bytes([12,228,252,195]), 99)
    moha  = dec(bytes([233,206,214,186,149,116,86]), 132)
    ip, port, algo, win = (resolve(REC[i]) for i in (0, 1, 2, 3))
    # RecordPhishing -> Pc1 -> Vpn -> Pc2 -> Overflow
    d = sha("mail\x1f" + email + "\x1f" + trig)           # corps du mail = mot déclencheur
    d = sha(d + "\x1fpc1\x1f" + oday + "\x1f" + pw)
    d = sha(d + "\x1fvpn\x1f" + ip + "\x1f" + port + "\x1f" + algo)
    d = sha(d + "\x1fpc2\x1f" + moha + "\x1f" + pw)
    marker = d[:8]
    flag = bytes(b ^ [167,19,92,209,46][i % 5] for i, b in enumerate(
        [253,56,39,224,90,244,76,22,132,27,211,76,15,152,67,210,127,61,165,71,200,125,33])).decode()
    return dict(email=email, trigger=trig, oday=oday, password=pw, mohamad=moha,
                ip=ip, port=port, algo=algo, win=win, marker=marker, flag=flag)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = boot_key()
    if a.q: print(k); raise SystemExit
    c = chain()
    print("Boot key        :", k, "(valide)" if validate_boot(k) else "(INVALIDE)")
    print("Mail  to / mot  :", c["email"], "/", c["trigger"], "(corps = ce mot seul)")
    print("PC1 user / pass :", c["oday"], "/", c["password"])
    print("VPN             :", c["ip"], c["port"], c["algo"])
    print("PC2 user / pass :", c["mohamad"], "/", c["password"])
    print("Overflow input  :", c["win"] + c["marker"], f"(win_addr='{c['win']}' + marker)")
    print("FLAG            :", c["flag"])
    if a.check: assert validate_boot(k)
