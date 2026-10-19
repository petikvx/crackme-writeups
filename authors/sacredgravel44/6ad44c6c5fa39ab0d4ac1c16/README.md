# sacredgravel44 — matryoshka9 *(PARKED)*

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ad44c6c5fa39ab0d4ac1c16) · id `6ad44c6c5fa39ab0d4ac1c16`

PE64 natif (MSVC 2026, pas packé). Serial de 76 caractères `A-Za-z0-9`.
**Status : parked** (2026-10-19) — chiffrement décodé, check final localisé
(hash 64 bits comparé à une constante) ; manque l'**inversion du hash**
(code flatten + MBA massif, Z3 n'a pas convergé).

Dossier : `authors/sacredgravel44/6ad44c6c5fa39ab0d4ac1c16/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/matryoshka9_cmo.exe`](original/matryoshka9_cmo.exe) | binaire d'origine |
| [`tools/matryoshka9-solve.py`](tools/matryoshka9-solve.py) | déchiffre la couche 1 (ARX) — pas un solveur complet |
| [`analysis/NOTES.md`](analysis/NOTES.md) | reverse détaillé + sessions Unicorn/z3/angr |
| [`analysis/emu.py`](analysis/emu.py) | harnais Unicorn : exécute le binaire réel sans Wine (oracle correct/incorrect) |
| [`analysis/symreplay.py`](analysis/symreplay.py) | tentative de résolution symbolique (z3) — n'a pas convergé |

## Bloquant

```text
sub_140001030 déchiffre ~1.1 Mo de code (ARX maison, 31 rounds) en RWX,
l'exécute sur le serial assaini (76 octets) -> hash 64 bits -> comparé à :

0x23030D333EA5FEC6
```

Le code déchiffré est **flatten + obfusqué MBA** (mixed boolean-arithmetic :
`xor/and/or/add/sub/neg/shl` redisant des opérations simples de façon
disguisée). Un seul chemin d'exécution de ~7800 instructions est
réellement emprunté (vérifié : **indépendant de la valeur du serial**,
donc pas de side-channel exploitable), mais l'expression finale du hash
est trop lourde pour que Z3 la résolve telle quelle (plusieurs minutes
sans convergence, interrompu — voir `analysis/NOTES.md`).

## Ce qui est clair

1. **Prompt** : `enter serial (76 chars, A-Z a-z 0-9): `. Pas de
   username, juste le serial.
2. Le serial saisi est **assaini** (coupé au premier NUL/\n/\r, sans
   effet sur un vrai serial alphanumérique), puis `VirtualAlloc` RWX
   ~1.1 Mo, puis **déchiffrement** d'un blob `.rdata` (`byte_140017530`)
   avec un cipher ARX maison (31 rounds, clé/tweak par bloc de 16 octets)
   — reproduit en Python, `tools/matryoshka9-solve.py` (vérifié : le
   déchiffré commence par un prologue x64 valide à l'offset `+0x33`).
3. Le code déchiffré est **appelé directement** (pas un bytecode
   interprété par un VM externe — c'est le flatten/MBA qui donne
   l'illusion d'une VM) avec `(rcx=chaîne "NOTICE:...", rdx=&contexte
   {alloc_fn, result_flag, next_key, sbox_ptr}, r8=self_ptr, r9=&serial)`.
4. Comparaison finale localisée par trace Unicorn concrète :
   `movabs rax, 0x23030D333EA5FEC6 ; cmp rdx,rax ; cmove ecx,r8d` — `rdx`
   = hash du serial après ~7800 instructions de MBA.
5. **`analysis/emu.py`** : harnais Unicorn qui exécute le binaire réel
   (mappé à son adresse préférée `0x140000000`, pas de relocation
   nécessaire) en stubant seulement `cin.getline`/`cout.flush`/`printf`/
   `VirtualAlloc`/le pointeur de fonction interne — reproduit fidèlement
   `correct`/`incorrect` sans Wine, ~0.1-0.2 s/essai (donc utile comme
   **oracle rapide** si une stratégie de résolution est trouvée).
6. **`analysis/symreplay.py`** : rejoue la trace concrète unique avec un
   interpréteur x86-64 symbolique maison (z3), 76 octets du serial comme
   inconnues. Construit la contrainte en quelques secondes ; `z3.Solver
   ().check()` final **n'a pas convergé**.

## À faire pour reprendre

Voir `analysis/NOTES.md` § "À faire pour reprendre" : simplification MBA
de l'expression avant `z3.check()` (identités connues type
`(a|b)-(a&b)=a^b`), budget Z3 de plusieurs heures en vrai arrière-plan,
ou un solveur MBA dédié (MBA-Blast/SiMBA) pour réduire l'expression avant
résolution.
