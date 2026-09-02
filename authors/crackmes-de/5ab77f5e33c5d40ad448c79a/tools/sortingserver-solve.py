#!/usr/bin/env python3
"""warsaw sorting_server_ctf — recover 32-bit flag seed via sort oracle.

The server quicksort picks pivot index with a glibc-style LCG seeded by
``flag % 2**32``. Choosing the current *maximum* as pivot (when not all
equal) re-partitions into the same multiset → infinite recursion → error
string. With a single ``1`` and the rest ``0``:

  error  ⟺  (first_rand % n) == index_of_1

Recover ``first_rand`` (30-bit) by CRT, lift to 4 candidate seeds, then
disambiguate with a second LCG output inside one request.

  ./sortingserver-solve.py --serve-check   # local flag.txt + server + solve
  ./sortingserver-solve.py --url http://127.0.0.1:8000 -q --check
"""
from __future__ import annotations

import argparse
import sys
import time
import urllib.parse
import urllib.request
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path
from urllib.parse import parse_qs, urlparse

ROOT = Path(__file__).resolve().parents[1]
ORIG_PY = ROOT / "original" / "_u" / "sortingserver.py"

A = 1103515245
C = 12345
M = 1 << 32
MASK = (1 << 30) - 1
INV_A = pow(A, -1, M)

# moduli with product > 2^30, pairwise enough for unique r30
MODULI = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]


class GlibcRandom:
    def __init__(self, seed: int) -> None:
        self.x = seed & (M - 1)

    def next(self) -> int:
        self.x = (self.x * A + C) % M
        return self.x & MASK


def would_error(vals: list[int], seed: int, limit: int = 10_000) -> bool:
    """True if quicksort_sub would infinite-loop (pivot == max)."""
    rand = GlibcRandom(seed)
    steps = 0

    def rec(cur: list[int]) -> bool:
        nonlocal steps
        steps += 1
        if steps > limit:
            return True
        if len(cur) <= 1 or min(cur) == max(cur):
            return False
        i = rand.next() % len(cur)
        pivot = cur[i]
        if pivot == max(cur):
            return True
        left = [x for x in cur if x <= pivot]
        right = [x for x in cur if x > pivot]
        return rec(left) or rec(right)

    return rec(list(vals))


def crt(remainders: list[int], moduli: list[int]) -> int:
    x, mod = 0, 1
    for a, n in zip(remainders, moduli):
        g = 1  # moduli here are pairwise coprime primes
        # x + k*mod ≡ a (mod n)
        k = ((a - x) * pow(mod, -1, n)) % n
        x = x + k * mod
        mod *= n
        x %= mod
    return x


def lift_seeds(r30: int) -> list[int]:
    out = []
    for t in range(4):
        x1 = r30 + t * (1 << 30)
        x0 = ((x1 - C) * INV_A) % M
        out.append(x0)
    return out


class Client:
    def __init__(self, base: str) -> None:
        self.base = base.rstrip("/")

    def sort(self, data: str) -> str:
        q = urllib.parse.urlencode({"action": "sort", "data": data})
        url = f"{self.base}/?{q}"
        with urllib.request.urlopen(url, timeout=10) as r:
            return r.read().decode("utf-8", errors="replace")

    def check_flag(self, value: int) -> str:
        q = urllib.parse.urlencode({"action": "checkFlag", "data": str(value)})
        url = f"{self.base}/?{q}"
        with urllib.request.urlopen(url, timeout=10) as r:
            return r.read().decode("utf-8", errors="replace")


def residue_mod_n(client: Client, n: int) -> int:
    """Find k where single 1 at index k causes sort error."""
    for k in range(n):
        arr = ["0"] * n
        arr[k] = "1"
        resp = client.sort(",".join(arr))
        if "error" in resp.lower():
            return k
    raise RuntimeError(f"no error for any k (n={n}) — unexpected")


def recover_flag(client: Client) -> int:
    rems = [residue_mod_n(client, n) for n in MODULI]
    r30 = crt(rems, MODULI)
    if not (0 <= r30 < (1 << 30)):
        # CRT modulus >> 2^30; reduce
        r30 %= 1 << 30
    # verify residues
    for n, a in zip(MODULI, rems):
        if r30 % n != a:
            raise RuntimeError("CRT inconsistency")

    cands = lift_seeds(r30)
    # disambiguate with an array that consumes ≥2 RNG draws
    # [0,1,2]: force first pivot to middle value using known r30
    j = r30 % 3
    # place 1 at j, 2 at (j+1)%3, 0 at (j+2)%3
    vals = [0, 0, 0]
    vals[j] = 1
    vals[(j + 1) % 3] = 2
    vals[(j + 2) % 3] = 0
    resp = client.sort(",".join(map(str, vals)))
    err = "error" in resp.lower()

    matched = [s for s in cands if would_error(vals, s) == err]
    if len(matched) == 1:
        return matched[0]

    # fall back: try checkFlag on remaining (≤4, server allows 5)
    for s in matched or cands:
        if client.check_flag(s).strip().startswith("Correct"):
            return s
    raise RuntimeError(f"could not disambiguate seeds: {list(map(hex, cands))}")


# ----- local py3 server (parity with original) -----

def make_handler(flag: int):
    class Handler(BaseHTTPRequestHandler):
        def do_GET(self):
            self.send_response(200)
            self.send_header("Content-type", "text/plain")
            self.end_headers()
            params = {k: v[0] for k, v in parse_qs(urlparse(self.path).query).items()}
            action = params.get("action")
            data = params.get("data", "")
            if action == "sort":
                try:
                    arr = [int(x) for x in data.split(",") if x != ""]
                except ValueError:
                    body = "Unable to parse input data"
                else:
                    body = str(self._quick(arr, flag))
            elif action == "checkFlag":
                try:
                    val = int(data, 16) if data.startswith("0x") else int(data)
                except ValueError:
                    body = "Unable to parse input data"
                else:
                    body = "Correct!" if val == flag else "Incorrect!"
            elif action == "displaySource":
                body = ORIG_PY.read_text(encoding="utf-8", errors="replace")
            else:
                body = "Welcome"
            self.wfile.write(body.encode())

        def log_message(self, *args):
            pass

        @staticmethod
        def _quick(vals, seed):
            try:
                return Handler._qsub(vals, GlibcRandom(seed))
            except Exception:
                return "An error occured while sorting your data"

        @staticmethod
        def _qsub(vals, rand):
            if len(vals) <= 1 or min(vals) == max(vals):
                return vals
            i = rand.next() % len(vals)
            pivot = vals[i]
            if pivot == max(vals):
                # mirror infinite recursion as error for the solver server
                raise RuntimeError("pivot max")
            left = [x for x in vals if x <= pivot]
            right = [x for x in vals if x > pivot]
            return Handler._qsub(left, rand) + Handler._qsub(right, rand)

    return Handler


def serve_check(port: int = 8765) -> int:
    flag = 0xC0FFEE42
    handler = make_handler(flag)
    httpd = HTTPServer(("127.0.0.1", port), handler)
    import threading

    t = threading.Thread(target=httpd.serve_forever, daemon=True)
    t.start()
    time.sleep(0.05)
    url = f"http://127.0.0.1:{port}"
    client = Client(url)
    got = recover_flag(client)
    ok = client.check_flag(got)
    httpd.shutdown()
    print(f"flag_in  = {flag} ({flag:#x})")
    print(f"flag_out = {got} ({got:#x})")
    print(f"check    = {ok}")
    return 0 if got == flag and ok.startswith("Correct") else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--url", default="http://127.0.0.1:8000")
    ap.add_argument("-q", action="store_true", help="print flag int only")
    ap.add_argument("--check", action="store_true", help="submit checkFlag")
    ap.add_argument(
        "--serve-check",
        action="store_true",
        help="spin local py3 oracle with known flag and self-test",
    )
    ap.add_argument("--port", type=int, default=8765, help="port for --serve-check")
    args = ap.parse_args()

    if args.serve_check:
        return serve_check(args.port)

    client = Client(args.url)
    flag = recover_flag(client)
    if args.q:
        print(flag)
    else:
        print(f"flag = {flag} ({flag:#x})")
    if args.check:
        resp = client.check_flag(flag)
        print(resp if not args.q else "")
        if not resp.strip().startswith("Correct"):
            print("CHECK FAIL", resp, file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
