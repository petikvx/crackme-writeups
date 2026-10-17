# saltedMacaroni841 — Levels Keygen!

| | |
|---|---|
| **ID** | [`66a288ed90c4c2830c820fa0`](https://crackmes.one/crackme/66a288ed90c4c2830c820fa0) |
| **Auteur** | saltedMacaroni841 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `1e7bbb42c3a5c8bb831366efa5b121d264b68af6104825eaa831cdc8b43eac56` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/LevelsByMacaroni841` | binaire d'origine (non modifié) |
| `analysis/levels-bonus-patched` | copie patchée pour le niveau bonus (2 octets) |
| `tools/levels-solve.py` | calcule les deux clés, génère le patch (`KEY1`, `-q`, `--patch`, `--check`) |

## Réponse

| Saisie | Valeur (exemple) | Règle |
|---|---|---|
| Key 1 (5 caractères) | `34123` | commence par `34` |
| Key 2 (5 caractères) | `68246` | chaque chiffre **doublé** : `(k2[i]-'0') == 2·(k1[i]-'0')` |
| Bonus | patch `75 3e` → `90 90` @ `0x1374` | le test `strlen == 0x1b39` est impossible |

```bash
printf '34123\n68246\nx\n' | ./original/LevelsByMacaroni841        # SUCCESS-LVL-3
python3 tools/levels-solve.py --patch                               # écrit analysis/levels-bonus-patched
printf '34123\n68246\nx\n' | ./analysis/levels-bonus-patched        # SUCCESS-LVL-BONUS
python3 tools/levels-solve.py --check
```

## Premier regard

Les chaînes décrivent les niveaux : `Level 1 Pass: String length is correct`, `Level 2 Pass…`, `Level 2.5`, `Enter string #2`, `SUCCESS-LVL-3`, puis un « bonus section for binary patching ».
L'auteur donne même un lien vers un tutoriel de patch avec Cutter.

## Flow

`main` @ `0x11c9` : lecture de key1 (`fgets`, 0x28), puis une cascade de tests : longueur, `key1[1]`, `key1[0]`, lecture de key2, longueur, boucle de relation, puis le niveau bonus.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/LevelsByMacaroni841 | awk '/<main>:/,/ret/'`.

```asm
1208: call strlen ; mov [rbp-0x8],eax
1210: cmp DWORD PTR [rbp-0x8],0x6   ; niveau 1 : strlen(key1) == 6   (fgets garde le '\n' -> 5 caractères saisis)
1229: movzx eax,[rbp-0x3f] ; cmp al,0x34 ; jne  ; niveau 2   : key1[1] == '4'
1244: movzx eax,[rbp-0x40] ; cmp al,0x33 ; jne  ; niveau 2.5 : key1[0] == '3'
12b0: call strlen(key2) ; cmp eax,[rbp-0x8] ; jne ; même longueur que key1
12d2..12ef:  edx = key2[i]-0x30 ;  eax = (key1[i]-0x30)*2 ; cmp edx,eax    ; i = 0..4
136d: cmp DWORD PTR [rbp-0x8],0x1b39 ; jne FAILURE-BONUS                   ; bonus : strlen(key1) == 6969 (impossible)
```

Piège 1 — `fgets` : le `\n` fait partie de la chaîne, donc `strlen == 6` signifie **5** caractères saisis.

Piège 2 — la boucle de key2 ne bloque pas : au premier chiffre faux elle affiche `FAILURE-LVL-2…` puis fait `jmp 130e` (sortie de boucle) et **le programme continue** : `SUCCESS-LVL-3` s'affiche même avec une mauvaise key2
(vérifié : `34123` / `11111` donne les deux messages). Seule une key2 correcte évite le `FAILURE-LVL-2`.

Bonus : `strlen(key1)` vaut 6 (borné par `fgets(…, 0x28)` de toute façon) et ne peut pas valoir `0x1b39`. L'énoncé le dit : il faut patcher. À `0x1374`, `jne` court (`75 3e`) → deux `nop` (`90 90`), fichier à l'offset `0x1374` (le segment est mappé à l'identique). La copie patchée est dans `analysis/`, **l'original reste intact**.

## Vérification

```text
$ printf '34123\n68246\nx\n' | ./original/LevelsByMacaroni841   -> Level 1/2/2.5 Pass, SUCCESS-LVL-3, FAILURE-LVL-BONUS
$ printf '34123\n11111\nx\n' | ./original/LevelsByMacaroni841   -> FAILURE-LVL-2 + SUCCESS-LVL-3 (défaut de la boucle)
$ printf '34123\n68246\nx\n' | ./analysis/levels-bonus-patched  -> SUCCESS-LVL-BONUS: Well damn you did it
```

## Notes

- Reverse statique + essais live ; pas de GDB.
- Pas de nom d'utilisateur : les clés sont de simples chaînes de 5 caractères.
