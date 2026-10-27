# crackmes.de's crackmertdsc (`CrackmeRTDSC.exe`) by sas0

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3a7`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3a7) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | sas0 (site : crackmes.de) |
| **Plateforme** | MS-DOS 16 bits (EXE MZ, 824 octets, écrit en asm), instruction `rdtsc` |
| **Type** | serial / code (dépend du timing) |
| **ZIP** | `crackmeRTDSC.zip` (SHA-256 `6b6313a8…c3773`) → `CrackmeRTDSC.exe` (SHA-256 `1c75e745…e7e6`) + `readThis.txt` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackmeRTDSC.zip` | archive d'origine (non modifiée) |
| `tools/crackmertdsc-solve.py` | donne le code, `--all` liste tous les codes, `--check` émule (unicorn) |
| `analysis/crackmertdsc-ndisasm.txt` | `ndisasm -b16` du code |
| `analysis/readme-auteur.txt` | `readThis.txt` de l'auteur |

## Réponse

Le code attendu (8 caractères) n'est **pas constant** : c'est une tranche de 8 octets d'une table de 88 octets, à l'offset `delta` = nombre de cycles entre deux `rdtsc` consécutifs. Sur cette machine (mesure native) `delta = 0x1c` :

| Entrée | Résultat |
|---|---|
| **`347457z2`** (delta 28) | `Hehe it isn't so hard eh :)` |
| autre délai (ex. delta 29) | `Nop try again it's not hard :)` |

```bash
python3 tools/crackmertdsc-solve.py          # mesure delta (gcc) puis affiche le code
python3 tools/crackmertdsc-solve.py -q       # 347457z2
python3 tools/crackmertdsc-solve.py --all    # les 81 codes possibles (delta 0..0x50)
python3 tools/crackmertdsc-solve.py --check  # émulation de l'original : OK / KO
```

Mesures natives de `rdtsc; mov ebx,eax; rdtsc; sub eax,ebx` : 26–50 cycles, mode 28 (0x1c). Les codes plausibles sont donc `delta` ∈ 0x1a…0x32. Le crackme n'a pas de login : `petik` non applicable.

## Premier regard

```bash
unzip -P crackmes.one original/crackmeRTDSC.zip -d /tmp/rt   # dossier vierge
file /tmp/rt/CrackmeRTDSC.exe      # MS-DOS executable, MZ for MS-DOS
cat /tmp/rt/readThis.txt           # « crackme have RTDSC instruction that's all I have to say »
tail -c +513 CrackmeRTDSC.exe > img.bin && ndisasm -b16 img.bin
```

- En-tête MZ : 0x20 paragraphes d'en-tête (image en `0x200`), `CS:IP = 0:0`, une seule relocation à l'offset image `1` (l'`imm16` du premier `mov ax,6`).
- `strings` : les messages `Hehe it isn't so hard eh :)`, `Nop try again it's not hard :)`, `first CRACKME by |sas0|`, `Enter code:` et une chaîne louche de 88 octets : `A43589734022345KSFGNRRRZ6346347457z234576782bniDF4366236888335t945635285826PASDFN6345539…`. Ce n'est pas un code en clair : voir plus bas.
- Pas de DOSBox ici (et `wine` refuse les EXE DOS) : on lit le code avec `ndisasm` et on valide par émulation Unicorn.

## Flow

```asm
0000  mov ax,6 ; mov ds,ax ; mov es,ax    ; (6 + reloc) => DS:0 = image+0x60 = la chaîne de 88 octets
0007  mov ah,9 ; mov dx,0xa9 ; int 21h    ; bannière + « Enter code: »
000E  mov ah,0xa ; mov dx,0x5e ; int 21h  ; saisie tamponnée => DS:5E=max, DS:5F=len, DS:60.. = texte
0015  cli
0016  rdtsc ; mov ebx,eax                 ; t1
001B  rdtsc ; sti                         ; t2
001E  sub eax,ebx                         ; eax = delta = t2 - t1
0021  mov ebx,0
0027  mov ecx,[0x60]                      ; 4 premiers caractères saisis
002C  cmp [ebx+eax],ecx                   ; == DS:[delta] ?   (adresse 32 bits : prefixes 66 67)
0031  jnz bad
0033  mov ecx,[0x64]                      ; 4 caractères suivants
0038  cmp [ebx+eax+4],ecx                 ; == DS:[delta+4] ?
003E  jnz bad
0040  mov dx,0x6a ; int 21h               ; « Hehe it isn't so hard eh :) »
```

## Comment on trouve

**Ancrage** : `ndisasm -b16` de l'image (voir `analysis/crackmertdsc-ndisasm.txt`). Le point clé est en `0x2c` :

1. `66 67 39 0c 03` = `cmp [ebx+eax], ecx` avec préfixes operand-size (`66`) et address-size (`67`). L'adresse effective est donc `eax + ebx`, avec `ebx = 0`.
2. Et `eax`, juste avant, vaut `rdtsc₂ - rdtsc₁` (`sub eax,ebx` en `0x1e`). Le code saisi est donc comparé à **DS:[delta]**, c.-à-d. à une fenêtre glissante dans la chaîne de 88 octets qui se trouve à `DS:0`.
3. `DS` : `mov ax,6` est relogé (+ segment de chargement) ⇒ `DS:0` = image `+0x60` = fichier `0x260`, soit exactement `A43589734022345KSFGN…` (les messages `$`-terminés viennent après, à partir de `DS:0x6a`).
4. La saisie `INT 21h/0Ah` écrit à `DS:5E` (max, len) puis le texte à `DS:60` : les deux `mov ecx,[0x60]` / `[0x64]` lisent les 8 premiers caractères tapés.

Donc code valide = `table[delta : delta+8]`. Exemple : delta = 0x1c ⇒ `table[28:36]` = `347457z2`.

**Pièges** :
- Le `cli`/`sti` n'est là que pour réduire le bruit de mesure ; sans `delta` stable on ne peut pas "trouver LE code". Sous un debugger / en pas à pas, `delta` serait énorme (hors table) ⇒ échec : c'est l'effet anti-debug voulu (non testé ici, pas de debugger DOS).
- Il faut compter les **offsets de la table** : seulement 0x00…0x50 donnent 8 octets lisibles avant le tampon (qui commence à `DS:5E`).
- `strings` ne délimite pas la table : on la borne en regardant que le tampon de saisie démarre à `DS:5E` ; au-delà de `delta = 0x50` la fenêtre chevauche `DS:5E…` (le texte saisi lui-même), d'où la limite 0..0x50 retenue (dans la pratique `delta` ≈ 26–50).

## Vérification

Pas de DOS réel : on émule le binaire d'**origine** (extrait du ZIP, non modifié) avec Unicorn (mode 16 bits, relocation appliquée, `INT 21h/09h,0Ah,4Ch` simulés, `rdtsc` forcé à `(t, t+delta)` par hook de code).

```text
$ python3 tools/crackmertdsc-solve.py --check
delta = 0x1c (28) -> code : 347457z2
bon delta   : Hehe it isn't so hard eh :)
mauvais delta: Nop try again it's not hard :)
OK
```

`--check` teste aussi, pour **chacun des 81 deltas** (0…0x50), que `table[delta:delta+8]` affiche « Hehe… ». La partie "valeur de `delta` sur une vraie machine" est une mesure native (`gcc` + `rdtsc`), pas une émulation : sur un autre CPU / une VM le mode peut différer — utiliser `--delta N` ou `--all`.

## Notes

- Le crackme est non déterministe : la "bonne" réponse dépend du CPU. Plusieurs codes (tous ceux de `--all`) sont acceptés selon le `delta` qui sortira.
- Sur un DOS dans une VM qui piège `rdtsc`, `delta` est énorme et le crackme est insoluble tel quel.
- Aucun patch n'a été fait (l'auteur demande « no patching »).
