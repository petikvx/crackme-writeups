# BadEngineer's PlsCrackMe

| | |
|---|---|
| **ID** | [`697f67fe977274421cc111ef`](https://crackmes.one/crackme/697f67fe977274421cc111ef) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | BadEngineer |
| **Plateforme** | Windows PE64, MinGW, console |
| **SHA-256 `download.bin`** | `4c0611bdb00b3c91d00d8fb3f8e67ebe304f5e0698ab44c9cadc31c0e13b35c7` (c'est un **ZIP**) |
| **SHA-256 `NormalCrackme.exe`** | `7bb6b820296eaf4a1db786934bbbaf09f35b62c561b5291c5081282662959da1` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | archive d'origine, non modifiée (ZIP, mot de passe `crackmes.one`) |
| `analysis/extracted/NormalCrackme.exe` | exe extrait de l'archive (`unzip -P crackmes.one`) |
| `tools/pls-crack-me-solve.py` | générateur / vérificateur (`--check`, `--random`, `--wine`) |

## Réponse

Pas de nom d'utilisateur (donc pas de `petik` ici) : un mot de passe qui ne dépend de rien.

**`Pe7!Tk9@Ik#2x`**

```bash
python3 -I tools/pls-crack-me-solve.py -q          # mot de passe fixe
python3 -I tools/pls-crack-me-solve.py --random    # un autre mot de passe valide
python3 -I tools/pls-crack-me-solve.py --wine analysis/extracted/NormalCrackme.exe
```

## Premier regard

- `original/download.bin` est un ZIP, pas un exe : `unzip -P crackmes.one -o original/download.bin -d analysis/extracted`.
- `diec` : PE64, MinGW. Symboles et DWARF présents (`main`, `Checker`), donc `objdump -d -M intel` suffit.
- Strings utiles (`.rdata` 0x140012000) : `Please enter the password : `, `%s`, `Way 2 Big!`, `Please Try again : `, `Good job, You Really Cracked it!`.

## Flow

`main` (0x14000158d) : `printf` du prompt, `scanf("%s", rbp-0xd)`, puis boucle tant que `Checker(buf) == 0` :
si `strlen > 13` → `puts("Way 2 Big!")`, puis « Please Try again » et nouveau `scanf`. Quand `Checker` renvoie 1 → `puts("Good job…")`, `Sleep(1000)`.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn NormalCrackme.exe`, fonction `Checker` à 0x140001490.

Elle boucle sur `strlen(s)` caractères et incrémente quatre compteurs locaux selon la classe du caractère :

```asm
cmp [rbp-0x1c],0x2f ; jle … ; cmp [rbp-0x1c],0x39 ; jg …   ; '0'..'9'  -> [rbp-0x4]++
; 0x21..0x2f, 0x3a..0x40, 0x5b..0x60, 0x7b..0x7e            -> [rbp-0x8]++  (spéciaux)
cmp [rbp-0x1c],0x40 ; jle … ; cmp …,0x5b ; jg …            ; 'A'..'Z'  -> [rbp-0xc]++
cmp [rbp-0x1c],0x60 ; jle … ; cmp …,0x7a ; jg …            ; 'a'..'z'  -> [rbp-0x10]++
```

Fin de boucle (0x140001563) :

```asm
cmp [rbp-0x4],3 ; jne ko   ; 3 chiffres
cmp [rbp-0x8],3 ; jne ko   ; 3 spéciaux
cmp [rbp-0xc],3 ; jne ko   ; 3 majuscules
cmp [rbp-0x10],4 ; jne ko  ; 4 minuscules
mov eax,1
```

Prédicat : exactement (3 chiffres, 3 spéciaux, 3 majuscules, 4 minuscules), l'ordre est libre. Total 13, ce qui colle avec le buffer de 13 octets et le test `strlen > 13`.

Assemblage : `P e 7 ! T k 9 @ I k # 2 x` → maj `P,T,I` (3), min `e,k,k,x` (4), chiffres `7,9,2` (3), spéciaux `!,@,#` (3).

Pièges :
- le `.bin` est un ZIP ;
- la borne `0x5b` pour les majuscules est à 0x5b mais `[` (0x5b) est déjà rattrapé plus haut comme spécial, donc sans effet ;
- `scanf("%s")` s'arrête aux espaces : tout caractère ≤ 0x20 est inutilisable (ignoré par les compteurs de toute façon) ;
- avec exactement 13 caractères le NUL final écrase l'octet de poids faible du `rbp` sauvegardé de `main` : sans conséquence ici (le `ret` reste correct).

## Vérification (Wine, binaire d'origine extrait)

```text
$ python3 -I tools/pls-crack-me-solve.py --wine analysis/extracted/NormalCrackme.exe
Please enter the password : Good job, You Really Cracked it!

$ python3 -I tools/pls-crack-me-solve.py --wine analysis/extracted/NormalCrackme.exe --random   # ex. <[~LSbba2j1W4
Please enter the password : Good job, You Really Cracked it!

$ printf 'abc\nPe7!Tk9@Ik#2x\n' | xvfb-run -a wine analysis/extracted/NormalCrackme.exe
Please enter the password : Please Try again : Good job, You Really Cracked it!
```

Cas KO : `abc` est refusé (re-prompt « Please Try again ») avant d'accepter le bon mot de passe.

## Notes

- Reverse 100 % statique + Wine : ni GDB, ni IDA, ni debugger live.
- Ce n'est pas un hash/serial : n'importe quelle chaîne de 13 caractères avec la bonne répartition passe.
