# MAS's Find The Key

| | |
|---|---|
| **ID** | [`69de9b7a471059af19ad091e`](https://crackmes.one/crackme/69de9b7a471059af19ad091e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | MAS (`mas`) |
| **Plateforme** | Windows PE64 console (MSVC C++, `std::regex`) |
| **SHA-256** | `20a6cc028302e45fc7c82fd6d4d449b49cf3f93174b1ab9318131781ea455b86` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/ActivateMe.exe` | binaire d'origine |
| `tools/mas-activateme-solve.py` | solveur / vérif Wine (`--check`) |

## Réponse

| Étape | Valeur |
|---|---|
| Magic number | **`4`** |
| Activation key | **`AA-DA`** (famille : `XY-ZW` majuscules avec `Z - Y = 3`) |

Le programme affiche alors `Z+{Act1va7i0n}` et se termine. Pas de username (donc pas de `petik`).

```bash
python3 -I tools/mas-activateme-solve.py -q        # AA-DA
python3 -I tools/mas-activateme-solve.py --check AA-DA
```

## Premier regard

- `file` : PE32+ console x86-64, MSVC 19.50, LTCG, non packé.
- `strings` : `Enter the magic number :`, `First You need to fix this !`, `Enter Activation Key:`, `Try Again:`, et la regex `^[A-Z]{2}-[A-Z]{2}$` ; deux petits blobs `TM3N[YkM1htam3>` et des DWORD `T j w 4 R`.
- Lancé à vide : « First You need to fix this ! » si le magic number est faux.

## Flow

1. `main` (0x140002eb0) lit un `short` (magic number) ; mauvais → message + exit -1.
2. Boucle : lit la clé, appelle `check` (0x140001f60) ; tant que faux → `Try Again: <sortie>`.

## Comment on trouve

Pas de MCP IDA ni `decc` dispo : `objdump -d -M intel`, ancrage par les xrefs des chaînes `.rdata` (0x140010a40 etc.), plus essais sous Wine.

**Magic number** (0x140002ef8) :

```asm
movsx ecx, WORD PTR [rsp+0x48]   ; n
mov   eax, 0x14 ; cdq ; idiv ecx ; q = 20 / n
movzx ecx, ax ; shl cx,2         ; 4q
add   ax,cx ; add ax,ax          ; (q+4q)*2 = 10q
cmp   ax,0x32 ; je ok            ; 10q == 50 -> q == 5
```

`20 / n == 5` en division entière ⇒ **n = 4** (n=3 donne 6, n=5 donne 4).

**Clé** (`check`, 0x140001f60) : la longueur est testée (`cmp [rdi+0x10],5` → code 0x0a, sinon 0x28) puis un `std::regex_match` avec `^[A-Z]{2}-[A-Z]{2}$` (0x140010a28) ; si la regex colle, le code devient 0x59. Seule la branche 0x59 (0x140002169) renvoie vrai. Elle :

1. construit une chaîne à partir de fragments (DWORD `T`, `j`, `w`, `4`, `R`, `TM3N[YkM1htam3>`…) ;
2. XOR chaque octet avec `key[3] - key[1]` (`sub r8b,[rax+1]` avec `r8b = key[3]`, 0x1400022a2-0x1400022c8) ;
3. imprime le résultat et renvoie `result[0] == 'Z'` (`cmp BYTE PTR [rax],0x5a`, 0x140002539).

Je n'ai pas reconstruit les fragments à la main : l'octet XOR n'a que 25 valeurs utiles (lettres A-Z), donc j'ai testé `AA-?A` sous Wine pour chaque lettre et lu la sortie. Seul **`d = 3`** (`AA-DA`) donne un résultat commençant par `Z` : `Z+{Act1va7i0n}`. Les autres `d` donnent du bruit ; hors regex (`AAAAAA`, `ABCDE`) la sortie est du bruit aussi (branches 0x28 / 0x0a).

Piège : la sortie est du texte binaire sur la console, d'où l'intérêt d'un `xxd`/`cat -v` pour lire les essais.

## Vérification (Wine, `WINEDEBUG=-all`, stdin redirigé)

| Entrée | Résultat |
|---|---|
| `4` / `AA-DA` | `Z+{Act1va7i0n}` puis fin (OK) |
| `4` / `QB-EZ` | `Z+{Act1va7i0n}` (OK, autre clé de la famille) |
| `4` / `AA-CA` | `Try Again:` en boucle (KO, d=2) |
| `4` / `AAAAAA`, `ABCDE` | `Try Again:` en boucle (KO) |
| `5` | `First You need to fix this !` |

Wine signale un page fault *après* l'affichage du succès (sortie du programme) : sans incidence sur la vérification.

## Notes

- Pas de GDB ni de debug live : reverse statique + essais Wine.
- Le seul contrôle réel sur la clé est `key[3] - key[1] == 3` plus le format de la regex : 15548 clés valides.
