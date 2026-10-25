# crackmes.de's key_check_crackme (CrackMe2) by kcom

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c33c`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c33c) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | kcom (site : crackmes.de) |
| **Plateforme** | Windows PE32 GUI (dialogue), MSVC 6, 3072 octets |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme2.zip` | archive d'origine (mot de passe `crackmes.one`) |
| `analysis/x/CrackMe2.exe` | exe extrait (non patché) |
| `tools/key-check-crackme-solve.py` | keygen name → serial (`--check EXE HARNESS` lance Wine) |
| `tools/harness.c` | harnais Win32 (mingw) : injecte name/serial en octets bruts, clique OK, lit le titre de la MessageBox |

## Réponse

Name + serial. **Le serial contient des octets non imprimables / hauts (≥ 0x80)** : on ne le tape pas
au clavier, on l'injecte (`WM_SETTEXT`) ou on le colle. Le nom doit faire **≥ 10 caractères**
(≥ 8 pour le crackme, ≥ 10 à cause de `wsprintfA` en place, voir plus bas) — `petik` seul est trop court.

| Name | Serial (hex, octets bruts) |
|---|---|
| `petikpetik` | `81ecb488b72deb9799b0f2faede3a6edebc3f4ce309591e6c5f0f5` |

```bash
python3 -I tools/key-check-crackme-solve.py --name petikpetik
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme2.zip
file CrackMe2.exe          # PE32 GUI, 4 sections
strings -n 4 CrackMe2.exe
```

Strings : `AKCOM-L434%s022LACD` (format), `w00t`/`good job!`, `sigh...`/`you looser!`.
`.data` 0x403000 commence par 15 octets hauts illisibles `bf a6 f6 c6 f9 ff a6 a2 a9 83 b2 b0 ad ab ea 00`.
Imports : `GetDlgItemTextA`, `wsprintfA`, `strlen`, `strcmp`, `MessageBoxA`, `DialogBoxParamA`.

## Flow

Tout le code est dans une DlgProc à 0x401000 (entry 0x4011ca → `DialogBoxParamA`, dialogue 0x65).

1. `WM_INITDIALOG` (0x110) : `SetDlgItemTextA(0x3ea, key)` – affiche la clé (illisible) dans un label.
2. `WM_COMMAND` bouton 0x3eb : `GetDlgItemTextA` de 0x3e8 (name) et 0x3e9 (serial), chacun doit faire ≥ 8 car., sinon `ExitProcess`.
3. `wsprintfA(name, "AKCOM-L434%s022LACD", name)`.
4. Pour chaque `i` : `name[i] ^= (signed char)KEY[i % strlen(KEY)] + 1`.
5. `strcmp(name, serial) == 0` → `MessageBoxA("good job!", "w00t")` + exit ; sinon « you looser! / sigh... ».

## Comment on trouve

Ancrage : `objdump -d -M intel CrackMe2.exe` (une seule fonction, 0x401000–0x4011c7, et deux thunks
`strcmp` 0x4011ea / `strlen` 0x4011f0).

Copie de la clé sur la pile (0x401009–0x4010fc) : 4 dwords de 0x403000 → `[ebp-0x10..-0x1]`. Les 16 octets
se terminent par `00`, donc `strlen(key) = 15`.

Boucle de chiffrement (0x401104–0x401166) :

```asm
40111a: call strlen            ; (name) borne de boucle
40112e: call strlen            ; ecx = strlen(key) = 15
401140: div  ecx               ; edx = i % 15
401142: movsx edx, byte [ebp+edx-0x10]   ; KEY[i%15] signé
401147: add  edx, 1
401157: xor  cl, dl            ; name[i] ^= (KEY[i%15]+1) & 0xff
```

Comparaison (0x401176) : `strcmp(name_chiffré, serial)` ; `eax==0` → branche « w00t / good job! ».
(Attention à l'ordre des `push` : `MessageBoxA(0, 0x40302c "good job!", 0x403024 "w00t", 0)`.)

**Piège principal : `wsprintfA(buf, fmt, buf)`** (0x4010e2–0x4010ef) : destination et argument `%s` sont
le *même* buffer. `wsprintf` écrit d'abord le préfixe `AKCOM-L434` (10 octets) par-dessus `name[0:10]`,
puis lit `%s` → l'argument vaut déjà `AKCOM-L434` + `name[10:]`. Le texte à chiffrer est donc :

```text
"AKCOM-L434" + "AKCOM-L434" + name[10:] + "022LACD"
```

Les 10 premiers caractères du nom n'ont aucune influence ; pour `name` de 8–9 car. le `NUL`
d'origine est écrasé et `%s` lit des restes de pile (non déterministe) — d'où ≥ 10. (Mon premier essai,
qui supposait « prefix + name + suffix », échouait sous Wine : c'est ce qui a révélé le recouvrement.)

Calcul pour `petikpetik` (10 car.) : texte `AKCOM-L434AKCOM-L434022LACD` (27 octets), puis
`serial[i] = texte[i] ^ ((int8)KEY[i%15]+1)` :

```text
'A'^(0xbf-256+1 = 0xc0) = 0x81 ; 'K'^(0xa6+1=0xa7) = 0xec ; 'C'^(0xf6+1=0xf7) = 0xb4 ; … 
→ 81 ec b4 88 b7 2d eb 97 99 b0 f2 fa ed e3 a6 ed eb c3 f4 ce 30 95 91 e6 c5 f0 f5
```

Le XOR étant involutif et le serial devant égaler le résultat, il n'y a rien à inverser : le keygen
applique simplement le chiffrement.

Analyse 100 % statique (pas de session GDB, pas de MCP debugger actif).

## Vérification

```bash
i686-w64-mingw32-gcc -o analysis/harness.exe tools/harness.c -luser32
python3 -I tools/key-check-crackme-solve.py --check analysis/x/CrackMe2.exe analysis/harness.exe
```

- OK `petikpetik` : `readback len=27:81ecb488…c5f0f5` → `MSGBOX title=w00t`
- OK `petikpetikXYZ` (serial …`58fef99ab681fdefefaf`) → `MSGBOX title=w00t`
- KO (premier essai, modèle « sans recouvrement ») et serial `AAAAAAAAAA` → `MSGBOX title=sigh...`

Le titre de la MessageBox (`w00t` vs `sigh...`) est lu sur la vraie fenêtre créée par le binaire d'origine sous `xvfb-run wine`.

## Notes

- Pas de patch, `original/` intact.
- Dans l'UI réelle, il faut coller le serial en cp1252 (certains octets, p. ex. 0x81, sont des « trous » de la page) : le harnais passe par `WM_SETTEXT` en octets bruts.
- Les serials sont indépendants des 10 premiers caractères du nom.
