#!/bin/sh
# Rejoue le binaire original avec rand() figé à 45 (seed lue dans cifred[1] = 'J').
set -e
cd "$(dirname "$0")/.."
gcc -m32 -shared -fPIC -nostdlib -o /tmp/fixrand.so tools/fixrand.c
P="Esto no es una contrasena cifrada cualquiera, sino una especial"
LD_PRELOAD=/tmp/fixrand.so NCN_SEED=45 ./original/ncn "$P"
echo "attendu : 0J3N2rElwSr1KrOPiJW0Th6ZjxQ06poPnwCfybk3ZtARCXWEId8YuBiyMr9JkCZl"
