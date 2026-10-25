# crackmes.de's amktwo by am0k

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c336`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c336) |
| **Auteur (site)** | crackmes.de (am0k / « amk ») |
| **Plateforme** | Windows PE32 GUI (MSVC 6, CRT statique, `MessageBoxA`) |
| **SHA-256 (zip)** | `61ff75f84c14c365a14a6447eae1dd8cb0ed1ff69dcc1b0be93eb4dcb0c8f8f6` |
| **SHA-256 (`amkTwo.exe`)** | `69c6a002bcc0ec9aa4ba12c9af5f4de3e01caa0a2440efc31f13b1df500709a5` |

Origine : [page](https://crackmes.one/crackme/5ab77f5733c5d40ad448c336) · [download](https://crackmes.one/download/crackme/5ab77f5733c5d40ad448c336) (zip password `crackmes.one`) · [`ORIGIN.yml`](ORIGIN.yml).

Objectif du ReadMe de l'auteur : *« Make a valid KeyFile for your name / Make a KeyFile Generator — No Patching »*.
`Src.zip` (sources) est protégé par mot de passe = la clé de « amkTwo » : on **n'y touche pas**, tout est déduit du binaire.

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/amkTwo.zip` | archive d'origine (contient `amkTwo.exe`, `ReadMe.txt`, `Src.zip` chiffré) |
| `analysis/extracted/` | contenu dézippé (copie de travail ; `original/` jamais modifié) |
| `tools/amktwo-solve.py` | keygen : écrit `amkTwo.key` (`--name`, `-o`, `-q`, `--check`) |

## Réponse

Le crackme lit un fichier **`amkTwo.key`** (même dossier que l'exe, même nom avec extension `key`) :
ligne 1 = nom, ligne 2 = serial de **32 caractères**, **sans saut de ligne final**.

| Nom | Serial |
|---|---|
| **`petik`** | **`177L002II833P77LUU8EE433P773QQ4A`** |

```bash
python3 tools/amktwo-solve.py --name petik -o amkTwo.key     # écrit "petik\r\n<serial>"
python3 tools/amktwo-solve.py -q                              # serial seul
python3 tools/amktwo-solve.py --check
```

## Premier regard

```bash
unzip -o original/amkTwo.zip -d analysis/extracted
file analysis/extracted/amkTwo.exe     # PE32 GUI, i386, 4 sections
objdump -p analysis/extracted/amkTwo.exe | grep -i "dll name\|CreateFile"   # KERNEL32 + USER32 (MessageBoxA)
objdump -s -j .data analysis/extracted/amkTwo.exe | sed -n 1,20p
```

Pas de packer. Strings utiles en `.data` : `Good Job, you made a valid KeyFile!` (0x406064),
`Bad Job, you can't even make a simple KeyFile...` (0x406030), `No KeyFile found` (0x406088),
caption `amkTwo` (0x40609c), mode `r` (0x4060a4) et l'alphabet `0123456789ABCDEF` en `.rdata` (0x4050c0).
Le dump `strings` brut est pollué par une longue liste d'ids hex (table de relocs / padding) : sans intérêt.

## Flow (fonction principale @0x401200, WinMain)

1. `GetModuleFileNameA(0, buf, 0x104)` puis les 3 derniers caractères du chemin sont écrasés par `'k'`, `'e'`, `'y'` (`mov byte [..],0x6b/0x65/0x79`) → `...\amkTwo.key`.
2. `fopen(path, "r")` (@0x4013b7) ; échec → « No KeyFile found ».
3. Boucle de lecture : `fgets(name, 0x103)` puis `fgets(serial, 0x103)` (@0x401340 est un `fgets` MSVC), répétée tant que le flag EOF (`[FILE+0xc] & 0x10`) n'est pas levé.
4. `sub_4010c0(name, out)` génère 32 caractères attendus ; `sub_401000(serial)` puis `sub_401060(serial)` transforment le serial lu ; `sub_401180(out, serial)` compare (longueurs égales + octets égaux). OK → « Good Job », sinon « Bad Job ».

## Comment on trouve le prédicat

### Ancrage

`objdump -d -M intel amkTwo.exe` : le `.text` commence directement par les 4 fonctions utilisateur (0x401000, 0x401060, 0x4010c0, 0x401180) puis WinMain (0x401200) ; le reste est le CRT MSVC 6. Les imports `CreateFileA`/`ReadFile` ne servent qu'au CRT ; le code applicatif n'appelle que `GetModuleFileNameA` et `MessageBoxA`.

### `sub_401000` — « swap » de parité (@0x401000)

```asm
movsx ecx, al ; and ecx, 0x80000001      ; ecx = parité du caractère (idiome MSVC de c % 2)
cmp al,'a'-1 / 'z'+1  ...                ; lettres a-z puis A-Z
test ecx,ecx ; je dec                    ; pair  -> c-1
inc al                                   ; impair -> c+1
...chiffres '0'..'9': impair -> dec, pair -> inc   (sens inverse des lettres)
```

Lettres : pair → `c-1`, impair → `c+1` ; chiffres : pair → `c+1`, impair → `c-1`. Autres octets inchangés. C'est une **involution** (on permute les paires `a↔b`, `c↔d`, …, `0↔1`, `2↔3`…).

### `sub_401060` — ROT13 + ROT5 (@0x401060)

`a-m/A-M` → `+0xd`, `n-z/N-Z` → `-0xd`, `0-4` → `+5`, `5-9` → `-5` (cmp `0x61/0x6d/0x6e/0x7a/0x30/0x34/0x35/0x39`). Autre involution.

### `sub_4010c0` — génération des 32 caractères (@0x4010c0)

Pseudo-C reconstruit de l'asm (`HEX = "0123456789ABCDEF"`, `repnz scasb` = `strlen(HEX)=16`) :

```c
k = 0; j = 0;
for (i = 0; i < 32; i++) {
    v = (signed char)name[j] + k + i + 1;      // 4010d9..4010df : movsx / add / lea [ecx+ebx+1]
    if (v < 0) v = -v;
    while (v >= 16) v -= 16;                   // boucle 4010fc..40111c
    out[i] = HEX[v];                           // 40111e..40112d
    j++;
    if (j > strlen(name) - 1) {                // 401135..40113a : on a épuisé le nom
        k++; j = 0;
        swap(out); rot(out);                   // 401148 / 40114e : sur le préfixe déjà écrit
    }
}
out[32] = 0; swap(out); rot(out);              // 401161..40116b : passe finale
```

Piège important : **`name` contient le `\n`** laissé par `fgets` (ligne 1 d'un fichier ouvert en mode texte `"r"`, le `\r\n` devient `\n`). Pour `petik` le nom haché est donc `"petik\n"` (longueur 6). Les passes `swap/rot` intermédiaires s'appliquent jusqu'au premier `\0` de `out` (tampon de pile non initialisé après le préfixe) mais n'altèrent que des octets qui seront réécrits ensuite → le résultat final de `out[0..31]` ne dépend que du préfixe, ce que reproduit le keygen.

### `sub_401180` — comparaison (@0x401180)

Refuse si l'une des chaînes est vide ou si `strlen` diffère, puis compare octet par octet (bornes `ebx <= len`, `\0` inclus). Donc le serial lu doit faire **exactement** 32 caractères : un `\n` final sur la ligne 2 ferait échouer le test de longueur.

### Piège EOF

La boucle de lecture ne fait `fgets` que pour les deux premiers tours (`edi == 1` puis `edi == 2`) ; ensuite elle tourne tant que `FILE._flag & 0x10` (EOF) est nul. Le flag EOF n'est levé que si le 2ᵉ `fgets` **atteint la fin du fichier** sans rencontrer `\n`. Un fichier terminé par un saut de ligne fait donc **boucler le programme indéfiniment** (et le `\n` fausserait de toute façon la longueur). D'où « pas de `\n` final ».

### Inversion → keygen

Le test est `swap_rot(serial_lu) == gen(nom)` avec `T = rot ∘ swap` (deux involutions) :

```
serial = T⁻¹(gen(nom)) = swap(rot(gen(nom)))
```

Exemple `petik` (étape par étape, cf. `tools/amktwo-solve.py`) :

| Étape | Valeur |
|---|---|
| `gen("petik\n")` (sortie de `sub_4010c0`, passe finale incluse) | `511X668WW477B11XII4SS077B117EE0O` |
| `rot(...)` | `622Y557VV388C22YHH3RR988C228DD9N` |
| `swap(...)` = **serial** | `177L002II833P77LUU8EE433P773QQ4A` |

## Vérification

Binaire d'origine (copie de `amkTwo.exe` dans un dossier temporaire, le `.key` à côté) sous Wine ; sur serveur sans écran on lit le texte de la MessageBox via `WINEDEBUG=+msgbox` :

```bash
python3 tools/amktwo-solve.py --name petik -o /tmp/run/amkTwo.key
cd /tmp/run && WINEDEBUG=+msgbox xvfb-run -a wine amkTwo.exe 2>&1 | grep -a MSGBOX_OnInit
```

| Cas | Résultat Wine |
|---|---|
| `petik` + `177L002II833P77LUU8EE433P773QQ4A` | `Good Job, you made a valid KeyFile!` |
| noms `am0k`, `Jean Dupont-1234567890` (nom > 6 car., plusieurs tours de `k`) | `Good Job` (keygen) |
| même fichier, dernier caractère `A`→`B` | `Bad Job, you can't even make a simple KeyFile...` |
| pas de `amkTwo.key` | `No KeyFile found` |

## Notes

- Pas de patch (consigne de l'auteur) : le keygen produit un vrai KeyFile valide pour n'importe quel nom.
- Le nom contient implicitement le `\n` de fin de ligne ; sous Linux/Wine le fichier peut utiliser `\r\n` ou `\n` indifféremment (mode texte), le serial en revanche ne doit pas être suivi d'un saut de ligne.
- Reverse 100 % statique + preuve Wine ; pas de session GDB, donc pas de section « Debug GDB ».
- Le mot de passe de `Src.zip` est la clé de « amkTwo » : volontairement non utilisé.
