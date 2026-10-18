"""Cherche une suite de cellules c1..cn telle que F^n(init)=0, avec F(b,c)=mix(b+(2c+1)*G). MITM numpy.
usage: mitm.py <fmax> <bmax>"""
import sys, time
import numpy as np
M = (1 << 64) - 1
C1 = np.uint64(0xbf58476d1ce4e5b9); C2 = np.uint64(0x94d049bb133111eb); G = np.uint64(0x9e3779b97f4a7c15)
IC1 = np.uint64(pow(0xbf58476d1ce4e5b9, -1, 1 << 64)); IC2 = np.uint64(pow(0x94d049bb133111eb, -1, 1 << 64))
INIT = 0x946683638e186420
K = (np.uint64(2) * np.arange(64, dtype=np.uint64) + np.uint64(1)) * G   # K[c] = (2c+1)*G mod 2^64


def mix(z):
    z = z ^ (z >> np.uint64(31)); z = z * C1; z = z ^ (z >> np.uint64(29)); z = z * C2; z = z ^ (z >> np.uint64(32)); return z


def xsinv(x, sh):
    r = x.copy()
    for _ in range(64 // sh + 1): r = x ^ (r >> np.uint64(sh))
    return r


def mixinv(z):
    z = xsinv(z, 32); z = z * IC2; z = xsinv(z, 29); z = z * IC1; z = xsinv(z, 31); return z


def expand_fwd(states):  # -> (len*64,) index = parent*64 + c
    return mix(states[:, None] + K[None, :]).reshape(-1)


def expand_bwd(states):
    return (mixinv(states)[:, None] - K[None, :]).reshape(-1)


def digits_msb(i, n): return [(i >> (6 * (n - 1 - j))) & 63 for j in range(n)]
def digits_lsb(i, n): return [(i >> (6 * j)) & 63 for j in range(n)]


def main(fmax, bmax):
    back = []; cur = np.array([0], dtype=np.uint64)
    for d in range(bmax + 1):
        order = np.argsort(cur, kind='stable'); back.append((cur, order, cur[order]))
        if d < bmax: cur = expand_bwd(cur)
    print('arrière prêt (profondeurs 0..%d)' % bmax, flush=True)
    found = []
    t0 = time.time()
    for f in range(fmax + 1):
        pre = max(0, f - 4)               # niveaux énumérés en Python, le reste est vectorisé
        for pidx in range(64 ** pre):
            st = np.array([INIT], dtype=np.uint64)
            for lv in range(pre):
                st = mix(st + K[(pidx >> (6 * (pre - 1 - lv))) & 63])
            for lv in range(f - pre): st = expand_fwd(st)
            for d, (vals, order, sv) in enumerate(back):
                pos = np.searchsorted(sv, st); pos[pos >= len(sv)] = len(sv) - 1
                hit = np.nonzero(sv[pos] == st)[0]
                for h in hit:
                    bi = int(order[pos[h]])
                    fwd = digits_msb(pidx, pre) + digits_msb(int(h), f - pre)
                    bwd = digits_lsb(bi, d)
                    found.append((f + d, fwd + bwd))
        print('profondeur avant %d terminée (%.1fs), solutions: %d' % (f, time.time() - t0, len(found)), flush=True)
        if found:
            best = min(x[0] for x in found)
            for n, path in sorted(found)[:10]:
                print('n=%d chemin(indices 0..63)=%s' % (n, path))
            if best <= f + bmax: break
    return found


if __name__ == '__main__':
    main(int(sys.argv[1]), int(sys.argv[2]))
