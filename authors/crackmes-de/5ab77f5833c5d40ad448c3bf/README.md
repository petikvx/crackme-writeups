# crackmes.de's keygenme_3 (KeygenMe.exe) by issogoo

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3bf`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3bf) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | iSSoGoo (site : crackmes.de) |
| **Plateforme** | Windows PE32 GUI (dialogue), MSVC 2013 C++ |
| **SHA-256 (zip)** | `50361c6d0133db5b17e4678f291e857f0c0de5eae2ed09b6085de7a947cb4cc8` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/issogoo_keygenme_3_fixed.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/extracted/KeygenMe.exe`, `readme.txt` | contenu dézippé pour l'analyse |
| `analysis/KeygenMe.asm` | `objdump -d -M intel` complet |
| `tools/keygenme3-solve.py` | keygen (+ `--check`) |
| `tools/keygenme3-emu.py` | preuve dynamique : exécute la vraie routine `0x401063` sous Unicorn |

## Réponse

Pas de champ user : le serial (10 caractères `[A-Za-z0-9]`) est global. Il y en a beaucoup ; le keygen en sort autant que voulu (graine par défaut `petik`).

| Seed | Serial valide |
|---|---|
| `petik` | **`9dexQHxf1Z`** (aussi `bhcw90y2ov`, `ewueyNDV8H`, `EQhuj9yImj`, `3ku7akhAzT`) |

```bash
python3 tools/keygenme3-solve.py -q            # 9dexQHxf1Z
python3 tools/keygenme3-solve.py -n 5 --seed petik
python3 tools/keygenme3-solve.py --check 9dexQHxf1Z   # OK
```

## Premier regard

```bash
unzip -P crackmes.one original/*.zip -d analysis/extracted
diec analysis/extracted/KeygenMe.exe    # PE32, MSVC 18.00 (VS2013), LTCG
strings -n 6 analysis/extracted/KeygenMe.exe
objdump -d -M intel --no-show-raw-insn analysis/extracted/KeygenMe.exe > analysis/KeygenMe.asm
```

Les messages sont en `.rdata` : « Serial must have a length of 10 chars! », « You entered some disallowed chars! », « Nope! Try again! », « Well done, now code a Keygen! ». Le readme de l'auteur dit que le but est un keygen (« un peu de bruteforce est nécessaire »).

## Flow

La DialogProc `0x401138` traite `WM_COMMAND` ; le bouton « check » appelle `0x401063` (`ecx` = HWND) :

1. `HeapAlloc(0x64)` puis `GetDlgItemTextA(hDlg, 0x3ec, buf, 0xc)` (le « fix » de l'auteur : nMaxCount=12).
2. `strlen(buf) != 10` → message longueur (`0x401110`).
3. `0x401000(buf)` : chaque caractère doit appartenir au charset `.data:0x4130c0` = `A-Za-z0-9` → sinon « disallowed chars ».
4. Deux tours de transformation + somme de contrôle (ci-dessous), puis test final `buf[8]==0x42 && buf[9]==0xDE`.
5. Le texte résultat est réécrit dans le même champ via `SetDlgItemTextA`.

## Comment on trouve le prédicat

Ancrage : le seul import `GetDlgItemTextA` (IAT `0x40d114`) est appelé en `0x401085` ; le message de succès `0x410db4` est poussé en `0x4010fb`, juste après les deux `cmp` du prédicat. Pas d'IDA disponible sur cette machine → `objdump` suffit (fonction courte).

```asm
4010a9  xor eax,eax
4010ab  xor DWORD PTR [esi+eax*4],0x1234567   ; dword i ^= K1   (i = 0,1 : octets 0-3 puis 4-7)
4010b2  and BYTE PTR [esi+eax*4],0xe          ; ... puis octet bas du dword &= 0x0e (octets 0 et 4 seulement)
4010b6  inc eax / cmp eax,2 / jb              ; 2 tours
4010bc  mov cl,[esi+8]
4010c1  add cl,[eax+esi]                      ; cl += buf[k], k=0..9
4010c5  mov [esi+8],cl                        ; ECRIT à chaque itération (buf[8] bouge pendant la somme !)
...  idem avec K2 = 0x89abcde et accumulateur buf[9]
4010f1  cmp BYTE PTR [esi+8],0x42
4010f7  cmp al,0xde                            ; al = buf[9]
```

Points à décoder :

- Le `xor dword` avec `0x01234567` touche 4 octets (LE : `67 45 23 01`), mais le `and 0xe` ne touche que l'octet de poids faible de chaque dword → `buf[0]` et `buf[4]` sont réduits à 4 bits (`&0x0e`) ; `buf[1..3]`, `buf[5..7]` ne sont que XORés.
- **Piège** : l'accumulateur est stocké en mémoire (`buf[8]`/`buf[9]`) à chaque tour, et la boucle relit aussi cet octet quand `k` atteint 8 (resp. 9) → il est compté « doublé » ; reproduire exactement (voir `valid()` du solveur) et non « somme + octet ».
- Le tour 2 (K2) travaille sur le buffer déjà modifié par le tour 1, y compris `buf[8]` désormais égal à `0x42`… qui est ensuite lu dans la somme de `buf[9]`.
- Le test final est donc 16 bits de contrainte sur 62 × 62 choix pour `buf[8]`, `buf[9]` : pour 8 octets aléatoires fixés, ~62² / 65536 ≈ 6 % de chances qu'une paire convienne.

### Keygen (bruteforce « stupide » mais instantané)

Tirer `buf[0..7]` au hasard dans le charset, énumérer les 3844 paires `(buf[8], buf[9])`, garder la première qui passe `valid()`. Quelques dizaines d'essais suffisent (< 1 s). Exemple avec seed `petik` → `9dexQHxf1Z`. Une version « smart » (résolution algébrique de `buf[8]` puis `buf[9]`) est possible, mais non nécessaire ici.

## Debug GDB / x64dbg

Non utilisés (pas de session GDB ; MCP debugger non consulté/actif sur ce binaire). Preuve dynamique par émulation, voir ci-dessous.

## Vérification

`tools/keygenme3-emu.py` charge le PE, hooke les 4 imports utilisés et **exécute le vrai code** de `0x401063` jusqu'à son `ret`, en lisant le message passé à la copie vers le champ :

```text
$ python3 tools/keygenme3-emu.py analysis/extracted/KeygenMe.exe 9dexQHxf1Z bhcw90y2ov ewueyNDV8H Nope123456 short 'abc!ef1234'
'9dexQHxf1Z'     -> Well done, now code a Keygen!
'bhcw90y2ov'     -> Well done, now code a Keygen!
'ewueyNDV8H'     -> Well done, now code a Keygen!
'Nope123456'     -> Nope! Try again!
'short'          -> Serial must have a length of 10 chars!
'abc!ef1234'     -> You entered some disallowed chars!
```

Les 3 cas KO (mauvais serial, mauvaise longueur, charset) retombent sur les bons messages.

**Limite honnête** : sous `xvfb-run -a wine` la fenêtre « iSSoGoo's KeyGenMe #3 » s'ouvre (vue par `xdotool`, 240×98), mais la capture `ffmpeg x11grab` est restée noire ; la preuve live Wine n'a donc **pas** pu être lue visuellement. La vérification repose sur l'émulation Unicorn du code d'origine (pas sur une réimplémentation) + `--check` du solveur, cohérents entre eux.

## Notes

- Aucun lien avec le nom : pas de `petik` à utiliser, seulement comme graine du keygen.
- Le zip « fixed » corrige `nMaxCount` de `GetDlgItemText` (sinon la saisie de 10 caractères était tronquée).
- Le binaire `original/` n'a pas été touché (zip intact, extraction sous `analysis/`).
