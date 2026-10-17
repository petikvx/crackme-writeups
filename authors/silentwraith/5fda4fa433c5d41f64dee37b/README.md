# SilentWraith — lockcode

| | |
|---|---|
| **ID** | [`5fda4fa433c5d41f64dee37b`](https://crackmes.one/crackme/5fda4fa433c5d41f64dee37b) |
| **Auteur** | SilentWraith |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`val`, `res`) |
| **SHA-256** | `29289d5a9bcf2999a8360cf4f0b5100eef8c70fb8f8f585d2907dd44df97b25a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/lockcode` | binaire d'origine |
| `tools/lockcode-solve.py` | fournit un code valide (`-q`, `--check`) |

## Réponse

Gabarit : `argv[1]` doit avoir la **même somme de codes ASCII** (2977) que la constante interne. La constante elle-même fonctionne :

**`wzJCPjBHBsHAkHbazmhYdflzLdhapPUE`**

```bash
./lockcode wzJCPjBHBsHAkHbazmhYdflzLdhapPUE   # you have unlocked the code: boom boom mathafuka
python3 tools/lockcode-solve.py --check
```

## Premier regard

`strings` : `you have unlocked the code: boom boom mathafuka`, `you failed dumb mf`, `not enough args`, et des fragments `wzJCPjBHH`, `BsHAkHbaH`… (chaîne codée en dur, visible par morceaux). Symboles `val`, `res`.

## Flow

`main` @ `0x1216` : exige `argc == 2` ; calcule `val(strlen(constante), constante)` et `val(strlen(argv[1]), argv[1])` ; `res(a, b)` compare les deux.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/lockcode | awk '/<val>:/,/ret/'`.

```asm
; val(len, s)
11b8: movsx eax,al ; add [rbp-0x8],eax   ; somme += (signed char) s[i], pour i = 0..len-1

; res(a, b)
11e1: add eax,0x1 ; sub eax,[esi] ; cmp eax,1 ; jne fail   ; a + 1 - b == 1  <=>  a == b
```

Donc le prédicat est `sum(argv[1]) == sum(constante)`. La constante (4 `movabs`, 32 octets) : `wzJCPjBHBsHAkHbazmhYdflzLdhapPUE`, somme = **2977**.

## Vérification

```text
$ ./lockcode wzJCPjBHBsHAkHbazmhYdflzLdhapPUE   -> you have unlocked the code: boom boom mathafuka
$ ./lockcode wrong                                -> you failed dumb mf
$ ./lockcode                                       -> not enough args
```

## Notes

- Reverse statique + essais live ; pas de GDB.
