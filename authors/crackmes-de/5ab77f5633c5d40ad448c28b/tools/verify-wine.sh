#!/usr/bin/env bash
# Vérif réelle sous wine : lance conflux1.1.exe sur une FIFO, attend le prompt (srand(time) déjà fait),
# calcule la lettre pour la seconde courante et l'envoie. Si la seconde a changé entre time() et
# le calcul (course), on relance (max 5 essais).   usage : tools/verify-wine.sh
set -u
T="$(cd "$(dirname "$0")" && pwd)"; cd "$T/../original"
for try in 1 2 3 4 5; do
  F=$(mktemp -u); mkfifo "$F"; OUT=$(mktemp)
  wine conflux1.1.exe < "$F" > "$OUT" 2>/dev/null & P=$!
  exec 3>"$F"
  for i in $(seq 100); do grep -q "Hello" "$OUT" && break; sleep 0.02; done
  S=$(python3 "$T/conflux1-solve.py")
  echo "$S" >&3; sleep 1; echo >&3; exec 3>&-; wait $P; rm -f "$F"
  R=$(tr -d '\r' < "$OUT"); rm -f "$OUT"
  echo "essai $try : $S → ${R#*!}"
  case "$R" in *"Good job!"*) exit 0;; esac
done
exit 1
