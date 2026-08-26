# soulreaper — Death Trap *(PARKED)*

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a7d0ce1184836c0dbe7d77e) · id `6a7d0ce1184836c0dbe7d77e`

ELF64 `sysupdate` (PIE, stripped, GCC 15). Prompt serial console.  
**Status : parked** (2026-08-26) — scaffoldé seulement ; reverse / solveur / write-up **non** livrés.

Dossier : `authors/soulreaper/6a7d0ce1184836c0dbe7d77e/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`sysupdate`](original/sysupdate) | binaire d’origine |

## Bloquant / reprise

Piste notée (non prouvée ici) : **double-fork** + vérif type **hash MITM** (IPC parent/enfant).

Strings utiles :

```text
Enter serial:
Valid serial / Invalid serial
Join us : https://t.me/+blTRfHi8oKJiN2E0
You Soul Has Been Taken By The Souls Reaper
```

## Reprendre

1. Reverse `sysupdate` (fork/waitpid, prédicat serial).
2. Solveur + preuve native.
3. Write-up → `status: solved` + index.
