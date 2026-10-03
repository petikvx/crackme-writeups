# Product Activation — résolu le 2026-10-03

Clé : `289F95CF-47FA06D3`. Write-up : [`../README.md`](../README.md). Solveur : [`../tools/activate-solve.py`](../tools/activate-solve.py).

L'opcode est le **premier** octet de `libcerberus.so` (halfword MMIO déjà gros-boutiste). Le PC de reset est `0xFFFF000000010000`. La première instruction est `34 55` (XOR R5, R5). Une faute hors RAM (code 2) reprend le qword big-endian stocké en RAM `0x18`.

La note de pause qui lisait l'opcode `0x55` est fausse. Ne pas s'en servir.

Base IDA : `analysis/activate.i64` (gitignorée), fermée après le write-up. Binaires d'origine intacts. `original/activate` a reçu `chmod +x` en local.

`crackme-puzzle` (0x78102) reste en pause.
