#!/usr/bin/env python3
"""Solveur jeffli6789's Maze (ELF64 static stripped).

Le labyrinthe est une grille de stubs machine (pas une carte data) :
  - cellule corridor : lit un chiffre 1..4 et saute de ±1 / ±width cellules
  - mur             : xor eax,eax ; ret  → échec immédiat
  - sortie          : mov eax,1 ; ret    → succès

Départ = entrée de sub_4716D0 (VA 0x4716d0).
Largeur = 0x65 (101), taille cellule = 0x6a (106).
Moves : 1=haut (−width), 2=gauche (−1), 3=droite (+1), 4=bas (+width).

Piège : sys_read sur **fd 2** (stderr), pas stdin. En TTY ça marche au clavier
(les 3 fds pointent sur le même terminal) ; en pipe il faut alimenter fd 2.

Usage :
  python3 maze-solve.py           # chemin BFS + résumé
  python3 maze-solve.py -q        # chemin seul
  python3 maze-solve.py --check   # lance original/maze (input sur fd 2)
"""

from __future__ import annotations

import argparse
import os
import sys
from collections import deque
from pathlib import Path

HERE = Path(__file__).resolve().parent
CHALLENGE = HERE.parent
DEFAULT_BIN = CHALLENGE / "original" / "maze"

# VA / layout (ELF ET_EXEC, load bias 0 ; file_off = VA - 0x400000)
START_VA = 0x4716D0
CELL = 0x6A  # 106
WIDTH = 0x65  # 101
TEXT_VA = 0x4000B0
TEXT_SIZE = 0x108062
MOVER_PREFIX = bytes.fromhex("8a0748ffc73c0a")
EXIT_PREFIX = b"\xb8\x01\x00\x00\x00\xc3"  # mov eax,1 ; ret
WALL_PREFIX = b"\x31\xc0\xc3"  # xor eax,eax ; ret
MOVES = (("1", -WIDTH), ("2", -1), ("3", 1), ("4", WIDTH))


def fo(va: int) -> int:
    return va - 0x400000


def load_grid(blob: bytes) -> dict[int, str]:
    text_end = TEXT_VA + TEXT_SIZE
    va = TEXT_VA
    while (va - START_VA) % CELL != 0:
        va += 1
    grid: dict[int, str] = {}
    while va + CELL <= text_end:
        b = blob[fo(va) : fo(va) + CELL]
        if b.startswith(MOVER_PREFIX):
            t = "."
        elif b.startswith(WALL_PREFIX):
            t = "#"
        elif b.startswith(EXIT_PREFIX):
            t = "E"
        else:
            t = "?"
        grid[va] = t
        va += CELL
    return grid


def shortest_path(grid: dict[int, str], start: int = START_VA) -> str:
    if grid.get(start) not in (".", "E"):
        raise RuntimeError(f"départ invalide @ {start:#x}: {grid.get(start)!r}")
    walk = {va for va, t in grid.items() if t in ".E"}
    q: deque[tuple[int, str]] = deque([(start, "")])
    seen = {start}
    while q:
        cur, path = q.popleft()
        if grid[cur] == "E":
            return path
        for ch, d in MOVES:
            nxt = cur + d * CELL
            if nxt in walk and nxt not in seen:
                seen.add(nxt)
                q.append((nxt, path + ch))
    raise RuntimeError("aucun chemin vers la sortie")


def simulate(path: str, grid: dict[int, str], start: int = START_VA) -> tuple[bool, str]:
    """Miroir du dispatch : 1..4 déplacent ; mur/sortie = ret immédiat."""
    cur = start
    for i, ch in enumerate(path):
        if ch == "\n" or ch == "\r":
            return False, f"newline @[{i}] sur cellule {grid.get(cur)} ({cur:#x})"
        if ch not in "1234":
            return False, f"char invalide {ch!r} @[{i}]"
        if grid.get(cur) != ".":
            return False, f"pas un corridor @ {cur:#x} avant move[{i}]={ch}"
        d = dict(MOVES)[ch]
        cur = cur + d * CELL
        t = grid.get(cur)
        if t == "E":
            if i != len(path.rstrip("\r\n")) - 1:
                # extra moves after exit never run — exit rets immediately
                return True, f"sortie atteinte @[{i}], reste ignoré par le binaire"
            return True, f"sortie @ {cur:#x}"
        if t != ".":
            return False, f"mur/hors-grille @ {cur:#x} après move[{i}]={ch} (cell={t!r})"
    return False, f"fin de chemin sur corridor {cur:#x} (pas de sortie)"


def run_binary(binary: Path, payload: bytes) -> bytes:
    """Exécute le crackme en écrivant l'input sur **fd 2** (comme sys_read)."""
    binary = binary.resolve()
    in_r, in_w = os.pipe()
    out_r, out_w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(in_w)
        os.close(out_r)
        dn = os.open(os.devnull, os.O_RDONLY)
        os.dup2(dn, 0)
        os.close(dn)
        os.dup2(out_w, 1)
        os.close(out_w)
        os.dup2(in_r, 2)
        os.close(in_r)
        os.chdir(binary.parent)
        os.execv(str(binary), [binary.name])
        os._exit(127)
    os.close(in_r)
    os.close(out_w)
    try:
        os.write(in_w, payload)
    finally:
        os.close(in_w)
    chunks: list[bytes] = []
    while True:
        b = os.read(out_r, 4096)
        if not b:
            break
        chunks.append(b)
    os.close(out_r)
    os.waitpid(pid, 0)
    return b"".join(chunks)


def main() -> int:
    ap = argparse.ArgumentParser(description="Solveur jeffli6789 Maze")
    ap.add_argument("-q", "--quiet", action="store_true", help="affiche seulement le chemin")
    ap.add_argument(
        "--check",
        nargs="?",
        const=True,
        default=False,
        help="lance original/maze avec le chemin (ou PATH fourni) sur fd 2",
    )
    ap.add_argument(
        "--bin",
        type=Path,
        default=DEFAULT_BIN,
        help=f"binaire (défaut: {DEFAULT_BIN})",
    )
    args = ap.parse_args()

    blob = args.bin.read_bytes()
    grid = load_grid(blob)
    n_path = sum(1 for t in grid.values() if t == ".")
    n_wall = sum(1 for t in grid.values() if t == "#")
    exits = [va for va, t in grid.items() if t == "E"]
    if len(exits) != 1:
        print(f"attendu 1 sortie, trouvé {len(exits)}: {[hex(x) for x in exits]}", file=sys.stderr)
        return 1

    path = shortest_path(grid)

    if args.check is not False:
        payload_path = path if args.check is True else str(args.check)
        out = run_binary(args.bin, payload_path.encode() + b"\n")
        text = out.decode("latin-1", errors="replace")
        ok = "Well done!" in text
        if args.quiet:
            print(payload_path if ok else "")
            return 0 if ok else 1
        print(text.replace("\x00", ""))
        print(f"[--check] {'OK' if ok else 'FAIL'} (len={len(payload_path)})")
        return 0 if ok else 1

    if args.quiet:
        print(path)
        return 0

    ok_sim, msg = simulate(path, grid)
    print(f"start={START_VA:#x} exit={exits[0]:#x}")
    print(f"grid: corridors={n_path} walls={n_wall} exit=1  cell={CELL} width={WIDTH}")
    print(f"path_len={len(path)}  simulate: {ok_sim} ({msg})")
    print(path)
    print()
    print("Rappel: le binaire lit sur fd 2 — ex. :")
    print(f"  python3 {Path(__file__).name} --check")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
