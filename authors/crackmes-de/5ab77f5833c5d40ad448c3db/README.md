# crackmes.de's keygenme_v2 by pxor (`kgme2.exe`)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3db`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3db) |
| **Auteur (site / local)** | crackmes.de / `crackmes-de` (auteur d'origine : pxor) |
| **Plateforme** | Windows PE32 GUI (MASM32, ~6,5 Ko, dialogue + 2 edit-box) |
| **SHA-256 (ZIP)** | `ac58f11dcdcfc2b9d00dfe6049b82e0597a35c1c00a8697b059b0201997563d0` |
| **Infos** | [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3db) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/keygenme_v2.zip` | archive d'origine (mot de passe `crackmes.one`) : `kgme2.exe` + `Readme.txt` |
| `analysis/ex/` | extraction du ZIP (exe + readme), non commitée dans `original/` |
| `tools/kgme2-solve.py` | keygen name → serial ; `--check` émule le vrai code de `kgme2.exe` (unicorn) |

## Réponse

Nom de 3 à 32 caractères, serial de **79 caractères exactement** : 12 caractères libres « magiques » + `-` + 66 chiffres hexa (majuscules).

| Nom | Serial |
|---|---|
| `petik` | `Kocham Gosie-6BC7309EF96DC72ADDB40119E4F5885375133434A2AD0F230B3C0D270489C3B39A` |

```bash
python3 tools/kgme2-solve.py                 # petik par défaut
python3 tools/kgme2-solve.py --name petik -q # serial seul
python3 tools/kgme2-solve.py --check         # + preuve : émulation du vrai binaire
```

Le début `Kocham Gosie-` (« je t'aime Gosia » en polonais) est fixe : seuls les 66 hexa dépendent du nom.

## Premier regard

```text
$ file kgme2.exe      -> PE32 executable (GUI) Intel 80386, 4 sections
$ diec kgme2.exe      -> MASM32, Linker 5.12, pas de packer
```

`strings` ne montre presque rien (imports `DialogBoxParamA`, `SendDlgItemMessageA`, `MessageBoxA`…) : les messages de succès/échec sont **stockés obfusqués** (`.data` + routine `ror` en `0x401418`) puis décodés dans le buffer juste avant le `MessageBox`. Le `Readme.txt` demande un keygen + sources.

## Flow

Dialog proc à `0x40101d`. `WM_COMMAND` (0x111), bouton `0x3ea` → check à **`0x4010d5`** :

1. edit `0x3e8` = nom (`WM_GETTEXTLENGTH` 3..0x20, sinon échec) ;
2. edit `0x3e9` = serial (longueur ≤ 0xff) ;
3. succès → décode le texte (« Good job craxor send your solution to px… ») et `MessageBoxA` ; tout échec saute en `0x401407` qui efface `0x122` octets de `.data` (donc un nouvel essai repart d'un état propre).

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/ex/kgme2.exe` (tout le check tient dans `0x4010d5–0x401407`, pas de pseudo-code nécessaire). Les S-boxes sont dans `.data` (VA `0x403000` ↔ offset fichier `VA − 0x402400`), 5 tables de 256 octets, **non bijectives** (255 valeurs distinctes) :

| VA | Rôle | Nom dans le solveur |
|---|---|---|
| `0x403388` | substitution du hash du nom | `T1` |
| `0x403487` | table de la longueur du serial | `T0` |
| `0x403586` | caractères des 12 premiers | `S4` |
| `0x403685` | paires d'octets hexa du serial | `S2` |
| `0x403784` | paires finales (comparaison) | `S3` |

### 1. Côté nom : 8 octets cibles (`0x4010fb–0x401198`)

```asm
; padding cyclique à 32 octets (rep movs avec esi qui avance → buf[i]=buf[i-n])
mov ecx,8 / mov ebx,0x2345
 eax=[esi]; eax^=ebx; ebx+=eax; [esi]=eax      ; chaîne xor/add sur 8 dwords
lods/xlat/stos × 32  (ebx=0x403388)            ; T1[octet]
; 3 rondes :   ebx=[esi+4]; edx=[esi+5]  chargés UNE fois par ronde (jne 0x401183 !)
 ebx+=eax; edx+=ebx; edx^=eax; eax+=edx; [esi]=eax
```

Piège : la boucle revient en `0x401183` (pas `0x40117d`) → `ebx`/`edx` **s'accumulent** d'un dword à l'autre dans une ronde. Ma première version les rechargeait à chaque dword → hash faux ; c'est l'émulation unicorn qui l'a révélé. Seuls les **8 premiers octets** du résultat servent : c'est la cible `T` (`cmpxchg8b [0x403266]` en `0x4013bd`).

### 2. Côté serial

Longueur `L` : `T0[L]` passé dans une suite rol/add/not/neg/xor doit donner `0x17dfd` puis `(0xd + T0[0xd]) & 0xff == 0xdc` ; brute-force sur 0..255 → **L = 79** unique (donc 12 + 1 + 66).

Les 12 premiers caractères, par groupes de 4, passent par `S4` (`xlat`) puis `rol edx,8` :

| Octets 0-3 | `edx = rol(edx|S4[c], 8)` ×4 ; `edx ^ 0x12345678 == 0x331ff083` (les S4 tombent sur des octets distincts, un par caractère) |
|---|---|
| Octets 4-7 | `dl ^= S4[c]`, `rol 8` ×4 ; `edx ^ 0x87654321 == 0x0462105f` |
| Octets 8-11 | `dl += -S4[c]`, `rol 8` ×4 ; `edx − 0xbab00000 == 0xaad0863e` |

Chaque caractère modifie un octet distinct de `edx` → on résout caractère par caractère (octet visé via `S4^-1`, en préférant l'ASCII imprimable). Le 13e caractère passe par une suite `xor 0x33/neg/rol ax,4/neg/xchg/xor 0x1234/sub 0x12/…/xor 0x87678767 == 0xb84bb84a` : un seul `c` convient (`-`).

Le reste (66 caractères) est lu en hexa **majuscule** (`0-9`, `A-F`) → 33 octets `h[0..32]` décodés sur place :

1. `R[i] = S2[h[2i]] ^ S2[h[2i+1]]` pour `i = 0..15` ;
2. contrôle `sum(R) mod 256 == h[32]` (le 33e octet est la checksum, `cmp bl,[edi]` en `0x401340`) ;
3. mélange xor des 4 dwords `R` (`0x401352–0x401386`) : `d1' = a^b^c^d`, `d0' = a^c^d`, `d2' = a^b`, `d3' = b^d` — inversible : `b = d0'^d1'`, `a = d2'^b`, `d = d3'^b`, `c = d0'^a^d` ;
4. `M[2i]` ⊕ paires via `S3` : `T[i] = S3[M[2i]] ^ S3[M[2i+1]]`, `i = 0..7`, doit égaler les 8 octets du hash du nom.

### 3. Construction du keygen (`petik`)

1. `T = hash("petik") = 0a5c3b0ff6676731` ;
2. on tire `M[2i]` au hasard et on prend `M[2i+1]` tel que `S3[M[2i]]^S3[M[2i+1]] = T[i]` (recherche dans la table) ;
3. on inverse le mélange pour retrouver `R` (ici `3bdffa7ec63f1c3e480004613751de96`) ;
4. pour chaque `R[i]`, idem avec `S2` → 32 octets ; `h[32] = sum(R) & 0xff = 0x9a` ;
5. hexa majuscule → `6BC7309E…C3B3` + `9A`, préfixés par `Kocham Gosie-`.

Beaucoup de serials valides par nom (choix aléatoires `--seed`) ; le solveur est déterministe (`seed=1`).

## Vérification

- **Preuve sur le vrai code** : `--check` charge `kgme2.exe` (lu dans le ZIP d'origine) dans **unicorn** (x86-32) et exécute **le check réel** `0x4010d5` avec deux `SendDlgItemMessageA` simulés (nom / serial) ; succès = appel de `MessageBoxA` avec le texte décodé :

```text
$ python3 tools/kgme2-solve.py --check
name   = petik
serial = Kocham Gosie-6BC7309EF96DC72ADDB40119E4F5885375133434A2AD0F230B3C0D270489C3B39A
check: OK (MessageBox de succès : 'Good job craxor send your solution to px')
check (checksum altéré): KO attendu -> KO ✔
```

- Autre nom (`--name "Jean Dupont" --check`) : OK également ; dernier hexa modifié → KO (échec en `0x401340`).
- **Wine** : `xvfb-run -a wine kgme2.exe` ne fait apparaître aucune fenêtre sur cette machine (Wine 10, aucun top-level visible via `xdotool`), donc pas de capture GUI. La preuve repose sur l'émulation du binaire d'origine (bytes non modifiés).
- GDB / x64dbg non utilisés (reverse statique + émulation).

## Notes

- Piège d'émulation : `.data` fait `0x883` octets → mapper au moins jusqu'à l'offset `0x1483` sinon `S3[0xfd..0xff]` manquent (un octet du hash est faux, le mismatch sautait aux yeux sur l'octet 4).
- `A-F` seulement : le contrôle de charset accepte aussi `G` (`cmp al,0x47` / `ja`), qui donnerait la valeur 16 et casserait le `or` — à éviter.
- Les 12 caractères de tête sont indépendants du nom ; seule la partie hexa varie.
