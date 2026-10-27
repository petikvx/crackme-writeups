#!/bin/sh
# Exécute obf-test2.py dans bwrap (sans réseau, /home masqué, cwd jetable) — le script est tiers/non fiable.
set -e
D=$(mktemp -d); cp "$(dirname "$0")/../original/obf-test2.py" "$D/"
bwrap --ro-bind / / --tmpfs /home --tmpfs /root --dev /dev --proc /proc \
  --unshare-net --unshare-pid --bind "$D" "$D" --chdir "$D" \
  python3 -I obf-test2.py </dev/null
