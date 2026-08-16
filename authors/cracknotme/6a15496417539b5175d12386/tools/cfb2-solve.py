#!/usr/bin/env python3
"""Solveur CFB2 (CrackNotMe — Maze Runner).

Labyrinthe 10×10 embarqué dans le PE (.rdata @ VA 0x14002b3c0) :
  0 = libre, 1 = mur, 2 = sortie (9,9)

Départ (0,0). Touches (insensible à la casse, via toupper) :
  W = y-1, S = y+1, A = x-1, D = x+1
Hors [0..9] ou case 1 → ACCESS DENIED.
La dernière touche doit atterrir sur la case 2.

Usage :
  python3 cfb2-solve.py              # chemin BFS + carte
  python3 cfb2-solve.py -q           # chemin seul
  python3 cfb2-solve.py --check KEY  # simule la clé
  python3 cfb2-solve.py --maze       # affiche la carte
"""

from __future__ import annotations

import argparse
import sys
from collections import deque
from pathlib import Path

# Maze extrait de CFB2.exe (100 octets, row-major y*10+x)
# SHA-256 du PE : 20aa2133b4694a036e349a28b2203d729fa3964cde3a07f641e33e1abe26596b
MAZE: list[int] = [
    0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 1,
    1, 1, 0, 1, 0, 1, 1, 1, 0, 1,
    1, 0, 0, 0, 0, 1, 0, 0, 0, 1,
    1, 0, 1, 1, 1, 1, 0, 1, 1, 1,
    1, 0, 0, 0, 1, 0, 0, 0, 0, 1,
    1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 1, 0, 1,
    1, 0, 1, 1, 1, 1, 0, 1, 0, 0,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 2,
]

W, H = 10, 10
MOVES = (("W", 0, -1), ("A", -1, 0), ("S", 0, 1), ("D", 1, 0))
PE_OFFSET = 0x2A1C0  # file offset of maze in original/CFB2.exe


def load_maze_from_pe(pe: Path) -> list[int]:
    data = pe.read_bytes()
    return list(data[PE_OFFSET : PE_OFFSET + W * H])


def cell(maze: list[int], x: int, y: int) -> int:
    return maze[y * W + x]


def render(maze: list[int], path: str | None = None) -> str:
    marks: dict[tuple[int, int], str] = {}
    if path:
        x = y = 0
        marks[(0, 0)] = "S"
        for ch in path.upper():
            for name, dx, dy in MOVES:
                if ch == name:
                    x, y = x + dx, y + dy
                    break
            marks[(x, y)] = "*"
        marks[(0, 0)] = "S"
        marks[(x, y)] = "E"
    lines = []
    for y in range(H):
        row = []
        for x in range(W):
            if (x, y) in marks and cell(maze, x, y) != 1:
                row.append(marks[(x, y)])
            else:
                c = cell(maze, x, y)
                row.append({0: ".", 1: "#", 2: "F"}.get(c, "?"))
        lines.append("".join(row))
    return "\n".join(lines)


def shortest_path(maze: list[int] = MAZE) -> str:
    """BFS, première solution (plus courte en nombre de coups)."""
    start = (0, 0)
    if cell(maze, *start) == 1:
        raise RuntimeError("départ sur un mur")
    q: deque[tuple[int, int, str]] = deque([(0, 0, "")])
    seen = {start}
    while q:
        x, y, path = q.popleft()
        if cell(maze, x, y) == 2 and (x, y) == (W - 1, H - 1):
            if path:  # au moins un move pour « last key on finish »
                return path
        for name, dx, dy in MOVES:
            nx, ny = x + dx, y + dy
            if not (0 <= nx < W and 0 <= ny < H):
                continue
            if cell(maze, nx, ny) == 1:
                continue
            if (nx, ny) in seen:
                continue
            seen.add((nx, ny))
            q.append((nx, ny, path + name))
    raise RuntimeError("aucun chemin vers (9,9)")


def simulate(key: str, maze: list[int] = MAZE) -> tuple[bool, str]:
    """Miroir de la logique binaire (trim + toupper + WASD)."""
    s = key.strip().upper()
    if not s:
        return False, "clé vide"
    x = y = 0
    finish = False
    for i, ch in enumerate(s):
        if ch == "W":
            y -= 1
        elif ch == "S":
            y += 1
        elif ch == "A":
            x -= 1
        elif ch == "D":
            x += 1
        else:
            return False, f"mouvement invalide {ch!r} @ step {i}"
        if not (0 <= x < W and 0 <= y < H):
            return False, f"hors limites ({x},{y}) @ step {i}"
        c = cell(maze, x, y)
        if c == 1:
            return False, f"mur @ ({x},{y}) step {i}"
        if c == 2:
            finish = i == len(s) - 1
    if not finish:
        if (x, y) == (W - 1, H - 1):
            return False, "sur la sortie mais pas avec le dernier caractère"
        return False, f"pas sur la sortie (x={x}, y={y})"
    if (x, y) != (W - 1, H - 1):
        return False, f"finish flag mais pos ({x},{y})"
    return True, f"OK ({x},{y})"


def main() -> int:
    ap = argparse.ArgumentParser(description="CFB2 Maze Runner solver")
    ap.add_argument("-q", action="store_true", help="chemin seul")
    ap.add_argument("--maze", action="store_true", help="affiche la carte")
    ap.add_argument("--check", metavar="KEY", help="vérifie une clé")
    ap.add_argument(
        "--pe",
        type=Path,
        help="recharger le maze depuis un CFB2.exe",
    )
    args = ap.parse_args()

    maze = MAZE
    if args.pe:
        maze = load_maze_from_pe(args.pe)

    if args.check is not None:
        ok, msg = simulate(args.check, maze)
        print("OK" if ok else "FAIL", f"({msg})")
        return 0 if ok else 1

    path = shortest_path(maze)

    if args.q:
        print(path)
        return 0

    print("=== cfb2-solve.py (CFB #2 — Maze Runner) ===")
    print(f"Path ({len(path)} moves): {path}")
    print()
    print(render(maze, path))
    print()
    print("légende: S=start  *=chemin  E/F=finish  #=mur  .=libre")
    if args.maze or True:
        ok, msg = simulate(path, maze)
        print(f"check: {'OK' if ok else 'FAIL'} ({msg})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
