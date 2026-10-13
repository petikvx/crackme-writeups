# crackmes.de's old_keygenme_2010 by zaas

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c267`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c267) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : zaas) |
| **Plateforme** | Windows PE32 GUI, MSVC 6 (C/C++), x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `d6e1b0d6af47235ed972e93fcf03746fd7e0b8138dde4f7c12c10d6bf5fa40fa` |
| **SHA-256 (exe)** | `69f5a0842354faa86183657564a56effcb45da9137a56d8ba4bf348beb697e7b` |

KeygenMe nom/serial (fenêtre « zaas KeygenMe2014 »). Le piège : la condition de réussite est une **division par zéro** rattrapée par un handler SEH, et une constante cachée n’est armée que si l’on tape **Shift+3** (`#`) au clavier dans le champ serial.

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/Old_KeygenMe.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/Old_KeygenMe.exe` | PE32 GUI MSVC 6 |
| `analysis/check-401639.asm` | handler du bouton (lecture des champs, boucle alnum, div piégée, SEH) |
| `analysis/sub_401960-4019a0.asm` | calcul de l’accumulateur + test alphanumérique |
| `tools/old-keygenme-2010-solve.py` | keygen + `--check` |
| `tools/verify-live.c` / `.exe` | pilote Wine : remplit les champs, frappe Shift+3 dans le serial, clique |

## Réponse (exemple)

| Nom | Serial à saisir |
|---|---|
| `petik` | `QQRR` puis taper `#` au clavier (Shift+3) → champ = `QQRR#` |

Résultat (texte écrit dans le champ serial après le clic) : **`Well done!`** — sans la frappe Shift+3, `QQRR` donne `...Try again~~`.

## Reverse

### 1. Premier regard

`diec` : MSVC 6 (linker 5.12), pas de packer. Imports USER32 classiques : `CreateWindowExA`, `GetDlgItemTextA`, `SetDlgItemTextA`, `SetWindowLongA`/`CallWindowProcA` (sous-classement), `GetKeyState`. Peu de chaînes en clair : `zaas KeygenMe2014`, `Name Plz:`, `Well done!` (0x406080) et `...Try again~~` (0x406070). Le code contient des sauts opaques (`xor eax,eax / test / je` suivis d’octets poubelle) qui cassent le désassemblage linéaire par endroits.

Contrôles créés dans `WM_CREATE` : edit **id 1** (nom), edit **id 2** (serial), bouton **id 3**. Juste après, l’edit serial est sous-classé : `SetWindowLongA(hEditSerial, GWL_WNDPROC, 0x401080)`.

### 2. La procédure sous-classée (0x401080)

Désassemblée à partir du bon offset (0x4010f9) :

```asm
cmp  dword [ebp+0xc], 0x100      ; WM_KEYDOWN
jne  pass
cmp  dword [0x408574], 0          ; une seule fois
jne  pass
cmp  dword [ebp+0x10], 0x33       ; touche '3'
jne  pass
push 0x10 / call GetKeyState      ; VK_SHIFT enfoncé ?
jge  pass
mov  dword [0x408574], 1
sub  dword [0x408570], 0x586      ; G = -1414
pass: ... CallWindowProcA(ancienne proc)
```

Donc la globale `G` (en `.bss`, 0 au départ) vaut **−0x586** dès qu’on a tapé un vrai `Shift+3` dans le champ serial. Un collage (`WM_PASTE`) ou un `SetWindowText` ne l’arme pas : il faut un `WM_KEYDOWN` avec Shift réellement enfoncé.

### 3. Le handler du bouton (0x401639)

```c
flag = 1;
ln = GetDlgItemTextA(hwnd, 1, name, 50);
ls = GetDlgItemTextA(hwnd, 2, serial, 50);
if (!ln || !ls) return;
if (ln < 4 || ls < 4) flag = !flag;              // -> 0
for (i = 0; i < ln; i++) flag &= isalnum(name[i]);  // sub_4019a0 : [0-9A-Za-z]
__try {
    if (flag) q = sub_401960(&acc, name, serial); // acc initialisé à 0
    q = q / acc;                                  // div dword [ebp-0x28]
    flag = 0;                                     // pas d'exception -> échec
} __except (1) {
    flag &= 1;                                    // division par zéro -> on garde flag
}
SetDlgItemTextA(hwnd, 2, flag ? "Well done!" : "...Try again~~");
```

La seule voie vers `Well done!` est que la division **lève une exception**, c’est-à-dire `acc == 0`.

### 4. L’accumulateur (sub_401960)

```c
int sub_401960(int *acc, char *name, char *serial) {
    int run = 0;
    for (i = 0; i < 4; i++) {
        run  += (signed char)name[i];         // préfixe du nom
        *acc += (signed char)serial[i] + run;
    }
    *acc += G;                                // [0x408570]
    return run;
}
```

Soit, avec `n` = nom et `s` = serial (4 premiers caractères seulement) :

$$
\text{acc} = 4n_0 + 3n_1 + 2n_2 + n_3 + s_0 + s_1 + s_2 + s_3 + G
$$

Avec `G = 0`, des caractères ASCII positifs ne peuvent jamais donner 0 : c’est la frappe Shift+3 qui rend le crackme soluble. Avec `G = −0x586` :

$$
s_0 + s_1 + s_2 + s_3 = 1414 - (4n_0 + 3n_1 + 2n_2 + n_3)
$$

Pour `petik` : `4·112 + 3·101 + 2·116 + 105 = 1088`, donc il faut `Σs = 326`, par exemple `QQRR` (81+81+82+82). Le `#` tapé est un 5ᵉ caractère, ignoré par la somme. On peut aussi le taper en premier : `#aaa` (35+97·3 = 326) marche aussi, puisqu’il compte alors comme `s0`.

## Solveur

```bash
python3 tools/old-keygenme-2010-solve.py petik
# nom    : petik
# serial : QQRR puis taper '#' (Shift+3) au clavier dans le champ -> QQRR#
python3 tools/old-keygenme-2010-solve.py petik --check QQRR
```

Le keygen répartit la somme cible sur 4 caractères (alphanumériques si possible, sinon ASCII imprimables). Les noms dont `4n0+3n1+2n2+n3` dépasse environ 1280 (par ex. `Abcd`) n’ont pas de serial imprimable.

## Vérification live (Wine)

```bash
cd original
xvfb-run -a bash -c 'wine Old_KeygenMe.exe & sleep 2; wine ../tools/verify-live.exe petik QQRR 1; cat result.txt; wineserver -k'
# avant clic : name=petik serial=[QQRR#]
# apres clic : [Well done!]
# ... même chose avec 0 en dernier argument (pas de Shift+3) :
# apres clic : [...Try again~~]
```

`verify-live.exe` met le focus sur l’edit serial (`AttachThreadInput` + `SetFocus`), simule `Shift` + `3` avec `keybd_event` (pour que `GetKeyState(VK_SHIFT)` soit vrai), puis envoie `BM_CLICK` au bouton id 3. Vérifié aussi avec le nom `zaas` → `QQRR#` → `Well done!`.
