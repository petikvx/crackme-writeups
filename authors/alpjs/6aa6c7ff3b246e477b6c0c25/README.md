# alpjs's alpmira

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa6c7ff3b246e477b6c0c25) · id `6aa6c7ff3b246e477b6c0c25`

Crackme **PE64 console**, VMP custom + sponge + anti-debug lourd.  
Auteur : [alpjs](https://crackmes.one/user/alpjs) · difficulté site **4.0**.  
Consignes : *static recovery not intended — dynamic path only*.

Dossier : `authors/alpjs/6aa6c7ff3b246e477b6c0c25/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme.exe`](original/crackme.exe) | binaire |
| [`analysis/crackme.exe.i64.c`](analysis/crackme.exe.i64.c) | Hex-Rays |
| [`analysis/NOTES.md`](analysis/NOTES.md) | reprise / cartographie |
| [`tools/alpmira-solve.py`](tools/alpmira-solve.py) | stub (pending) |

## Status

**Pending** — architecture cartographiée ; **password / flag non trouvés**.

Même famille que [custom vmp](../6aa4b6d3585e8875bcbebf80/) (également pending).  
Commentaire public : sponge 16 B, ~3.6M ops VM / tentative, tag 8 B après 2× ARX ; clé flag = état intermédiaire (patch du cmp ≠ flag).

```bash
# Wine : prompt UTF-16 « password : » (anti-debug souvent fatal ensuite)
wine original/crackme.exe
```

## Premier regard

```text
crackme.exe: PE32+ console x86-64, ~51 KiB, MSVC 19.50
sha256  57ca627695c131aeb01c265004b8627cf80bcd54b12811b4262ebe1da5e362b4
```

Pas d’IAT classique (kernel32 via PEB). Marqueurs `KS_D0M_v6_dom_se…`.

## Flow (abrégé)

```text
init API / VEH / thread intégrité
password :  (UTF-16 → ASCII, len 1..39)
sub_140007E50 absorb + sub_14000B640 VM
  OK → print flag UTF-16 @ ctx+384…
  KO → ExitProcess(1)
```

## Notes

- Forcer le compare final sans le bon état sponge **corrompt** le flag.
- Reprise : [`analysis/NOTES.md`](analysis/NOTES.md).
