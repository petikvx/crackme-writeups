# crackmes.de's crackme_1 (crackme1.exe) — cosh

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3af`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3af) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (cosh) |
| **Plateforme** | Windows PE32 GUI, MSVC 6 + MFC 4.2 (`MFC42.DLL`), x86 |
| **SHA-256 (zip)** | `c464c0e3623b7c22dce00b8973d23c4c084a8c08e26cabf374176e9f957460f3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/cosh1.zip` | archive d'origine (`crackme1.exe` + `HarvestR.nfo`), non modifiée |
| `analysis/ex/` | contenu extrait du zip (non patché) |
| `analysis/crackme1-patched.exe` | copie patchée par le solveur (preuve) |
| `tools/cosh1-solve.py` | solveur : applique le patch de 2 octets (`--check`, `-q`, `-o`) |

## Réponse

Ce n'est pas un serial : le crackme demande un « CD » (fichier `CD_CHECK.DAT`) et le test est **inatteignable tel quel** (voir plus bas). La solution est un **patch de 2 octets** :

| Offset fichier / VA | Avant | Après |
|---|---|---|
| `0x138C` / `0x40138C` | `0F 84` (`je near`) | `90 E9` (`nop` ; `jmp near`) |

```bash
python3 -I tools/cosh1-solve.py            # écrit analysis/crackme1-patched.exe
python3 -I tools/cosh1-solve.py --check    # vérifie que les octets d'origine sont bien là
```

(Pas de login dans ce challenge ; `petik` n'est pas utilisé.)

## Premier regard

```bash
file analysis/ex/crackme1.exe      # PE32 executable (GUI), Intel i386, 4 sections
diec analysis/ex/crackme1.exe      # MSVC 6.0 / MFC 4.2
strings -n 4 analysis/ex/crackme1.exe
```

Strings utiles (section `.data`, VA `0x403000`) : `Well done, Cracker`, `You did it`, `You lost`, `Try again`, `CD_CHECK.DAT`, puis les racines `P:\` … `C:\`. Ressources : fenêtre « Crackme1 - By CoSH », boutons « Check for CD » et « Exit ». `HarvestR.nfo` n'est qu'une page de présentation.

## Flow

Fenêtre MFC avec deux boutons. Le handler de « Check for CD » est en `0x401207`.

## Comment on trouve

Ancrage : `objdump -d -M intel --start-address=0x401000 --stop-address=0x401b30 crackme1.exe`, en suivant les xrefs vers les strings `0x403020…0x403058`.

1. Le handler construit 13 `CString` (`C:\`…`P:\`, adresses `0x40309c` en descendant jusqu'à `0x403068`) puis boucle sur **7 entrées seulement** (`cmp [ebp-0x14],7`) : `C:\`, `D:\`, … `I:\`.
2. Pour chaque lecteur :

```asm
401346  push [ebp-0x18]            ; "X:\"
401349  call GetDriveTypeA
40134f  cmp  eax,3                 ; DRIVE_FIXED -> on saute ce lecteur
401352  je   0x401392
401361  call CString::operator+    ; "X:\" + "CD_CHECK.DAT"
401368  push ebx ; push ebx ; push ebx ; push ebx   ; template, flags, DISPOSITION=0, secattr=0
40136c  push 1                    ; FILE_SHARE_READ
40136e  push 0x80000000            ; GENERIC_READ
401374  call CreateFileA
40137a  cmp  eax,-1
401380  sete [ebp-0xd]
401389  cmp  [ebp-0xd],bl
40138c  je   0x401485              ; handle valide -> "Well done, Cracker" / "You did it"
```

3. Succès (`0x401485`) : `MessageBox("Well done, Cracker", "You did it")`. Échec après les 7 lecteurs : `MessageBox("You lost", "Try again")` (l'ordre des `push` est `type, caption, text`).

Le prédicat est donc : « un lecteur non fixe contient `CD_CHECK.DAT` ouvrable ». **Piège** : l'appel passe `dwCreationDisposition = 0` (le 3ᵉ `push ebx`), valeur invalide (`OPEN_EXISTING` = 3) → `CreateFileA` renvoie `INVALID_HANDLE_VALUE`. Sur NT/Wine : `ERROR_INVALID_PARAMETER` (87). Le crackme ne peut donc jamais réussir sur un système moderne, même avec un vrai CD ; sous Win9x le comportement dépendait de l'implémentation. Le chemin réaliste est le **patch du saut** : `0F 84 rel32` → `90 E9 rel32` (le `rel32` reste identique car la longueur est conservée, 6 octets) rend la branche « succès » inconditionnelle dès qu'un lecteur non fixe est testé (sous Wine, `D:`…`I:` non montés = type 1).

## Vérification

Preuve live sous Wine (prefix vierge, `xvfb-run`), en lançant l'exe puis `xdotool key Tab` + `Return` pour activer « Check for CD » et en lisant le titre de la MessageBox :

| Binaire | Résultat |
|---|---|
| `analysis/ex/crackme1.exe` (original) | MessageBox **`Try again`** (« You lost ») |
| `analysis/crackme1-patched.exe` | MessageBox **`You did it`** (« Well done, Cracker ») |

Même avec un lecteur `E:` déclaré comme cdrom contenant `CD_CHECK.DAT`, une sonde `CreateFileA(..., disposition=0)` donne `err=87` : le comportement confirme le piège. Pas de screenshot : aucun outil de capture n'est installé ; les titres de fenêtres ont été lus via `xdotool`. Pas de GDB ni de debugger live utilisés (reverse statique + Wine).

## Notes

- Ce n'est **pas** un keygen : aucune saisie utilisateur.
- `original/` n'est pas modifié ; le patch vit dans `analysis/`.
