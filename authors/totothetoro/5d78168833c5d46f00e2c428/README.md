# totothetoro — alien_bin

| | |
|---|---|
| **ID** | [`5d78168833c5d46f00e2c428`](https://crackmes.one/crackme/5d78168833c5d46f00e2c428) |
| **Auteur** | totothetoro |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `a713efd3286db47186fa95f595adbcd7ab236b36e381daa0da81ddafeb2d0d2f` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/alien_bin` | binaire d'origine |
| `tools/alienbin-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `bd23cf3f56baa86bc` |

```bash
echo bd23cf3f56baa86bc | ./original/alien_bin
python3 tools/alienbin-solve.py --check
```

## Premier regard

```bash
file original/alien_bin     # ELF64 PIE, not stripped
strings -n 5 original/alien_bin | grep -E "^[0-9a-f]{64,65}$" | wc -l   # -> 100
```

**100 chaînes hexadécimales** de 64-65 caractères (allure de hash SHA-256) noient le binaire. Chaîne de succès : `blip blop :)`. Chaîne d'échec : `ERROR`.

## Flow

`main` recopie une **table de 100 pointeurs** (vers ces 100 chaînes) sur la pile, lit la saisie via `scanf("%[^.]%*c")`, construit un buffer de 17 octets en lisant les octets `0..16` d'**une seule** de ces chaînes (toujours la même, choisie statiquement par le code — pas une entrée utilisateur), puis `strcmp()`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/alien_bin | awk '/<main>:/,/^$/'`.

```asm
21a6: lea rdx,[rip+0x4e73]   # -> 0x7020 : base de la table de 100 pointeurs (.data)
21b8: rep movs                ; copie les 100 qwords sur la pile (rbp-0x330 .. rbp-0x10)
...
2215: mov rdx,[rbp-0x2e0]     ; <- offset FIXE dans la table copiee, pas indexe par la boucle !
223a: movzx eax,[rax]         ; byte = chaine_choisie[i]  (i = boucle 0..16)
2246: cmp [rbp-0x344],0x10 ; jle  ; boucle sur 17 octets (i <= 16)
2279: call strcmp
```

Le piège : `[rbp-0x2e0]` est un **offset constant** dans la copie de la table (pas un indice de boucle), donc une seule des 100 chaînes est réellement utilisée — toujours la même à chaque exécution. Calcul de l'index : la table copiée commence à `rbp-0x330` ; `(0x330-0x2e0)/8 = 0x50/8 = 10` → c'est la **11ᵉ chaîne** (index 10, zéro-indexé) de la table de pointeurs en `.data` (base `0x7020`, pas de `0x48` = 72 octets entre chaque pointeur).

### Extraction de la chaîne

```bash
# pointeur n°10 : 0x7020 + 10*8 = 0x7070
readelf -x .data original/alien_bin | grep " 00007070 "
# -> 0x3308 (adresse de la chaine en .rodata)
python3 -c "print(open('original/alien_bin','rb').read()[0x3308:0x3308+70])"
# -> b'bd23cf3f56baa86bc11b3256f22ac1a573113d639833a119f02357e3fb705266\x00...'
```

Le mot de passe est les **17 premiers octets** de cette chaîne (boucle `i <= 16`) : `bd23cf3f56baa86bc`.

Détail amusant : cette même sous-chaîne apparaît **littéralement comme nom de symbole** dans le désassemblage (`<bd23cf3f56baa86bc>` à l'adresse de la fonction de succès) — le compilateur/linker a généré un symbole local dont le nom collisionne visuellement avec le début de la chaîne-mot de passe, pur hasard de toolchain qui sert ici d'indice involontaire.

## Vérification

```bash
$ echo bd23cf3f56baa86bc | ./original/alien_bin
Feed me the right password: blip blop :)

$ echo wrong | ./original/alien_bin
Feed me the right password: ERROR
```

## Notes

- Les 99 autres chaînes hexadécimales ne sont jamais lues par le programme : pur bruit pour dissuader un `strings | grep` naïf ou un brute-force sur toute la liste.
- Pas de GDB nécessaire : l'offset fixe dans la table copiée est directement calculable depuis l'asm statique.
