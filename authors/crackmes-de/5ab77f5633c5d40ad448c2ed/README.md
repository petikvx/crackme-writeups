# crackmes.de's crackme2_by_mabaker by mabaker

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2ed`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ed) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows x86 (Visual Basic 6 natif, UPX) |
| **Difficulté** | 1.0 |
| **SHA-256 (exe)** | `edb666dfa18db16ea02f64bb88a6be9e92e6381fd7d56036a90fe546afd7375a` |
| **Type** | serial fixe (saisie au pavé numérique) |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ed
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2ed
- ZIP password : `crackmes.one` (ZIP interne `crack_me2.zip` sans mot de passe)

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack_me2.zip` | archive d'origine (`crack-me2.exe`, 35 840 o, 2004) |
| `tools/crackmes-de-crackme2_by_mabaker-solve.py` | calcule le serial (`-q`, `--check SERIAL`) |
| `tools/wine-xdotool-check.sh` | vérification sous wine dans un Xvfb isolé (clics sur le pavé) |
| `analysis/ok-serial-bon.png` / `analysis/ko-56336980.png` | captures OK / KO |

## Réponse

**Serial : `56336981`** (constant, pas de nom : rien à générer pour `petik`).

```bash
python3 tools/crackmes-de-crackme2_by_mabaker-solve.py      # serial = 56336981
```

Les chiffres se tapent avec les boutons du pavé (`1`…`9`, `0`, `C` pour effacer, `«` pour reculer), puis **Vérifier**.

## Premier regard

```text
$ file crack-me2.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, UPX compressed, 3 sections
$ upx -d crack-me2.exe -o d.exe        # 35 840 → 57 344 o
$ strings d.exe | grep -i -e vb -e serial -e good
C:\Program Files\Microsoft Visual Studio\VB98\crack-me2\Projet1.vbp
/!\  Le serial est bon  /!\
GOOD
NOT GOOD
```

Import unique `MSVBVM60.DLL` + `VB5!` dans l'en-tête de projet → VB6 compilé en **natif** (pas de P-code) : on lit directement l'asm x86. Imports utiles : `__vbaStrCmp`, `__vbaLenBstr`, `__vbaR8Str` (= `Val()` d'une chaîne en double), `__vbaFpR8`.

Aucune constante numérique en clair dans les chaînes : le serial est **calculé** en flottant.

## Flow

La forme (`Form1`) contient un `TextBox` `Text1` (non éditable au clavier en pratique), un pavé `Command1`…`Command11` (chiffres), `Command123` (`C`), `Command12` (`«`) et `Command5` (**Vérifier**, grisé tant que `Text1` est vide). Chaque touche concatène sa `Caption` à `Text1.Text` (`__vbaStrCat`).

## Comment on trouve le serial

### 1. Retrouver les contrôles

Dans la description de forme (offset fichier `0x7b30`+) chaque contrôle a un index ; dans le code natif, VB accède au contrôle n° *i* via `[Me + 0x2f8 + 4·i]` (vtable de la forme) :

| Index | Contrôle | Caption | Accès |
|---|---|---|---|
| 0x02 | Command5 | `Vérifier` | — |
| 0x03 | **Command11** | **`0`** | `call [edx+0x304]` |
| 0x0e | **Text1** | (vide) | `call [edx+0x330]` |

### 2. Le handler de « Vérifier » (`0x40a150`)

`objdump -d -M intel d.exe` puis recherche des appels à `__vbaR8Str` (IAT `0x401084`) : deux appels collés à `0x40a22c` / `0x40a23c`.

```asm
40a1a9: call [edx+0x304]          ; Command11
40a1c9: call [ecx+0x50]           ; .Caption  -> [ebp-0x2c] = "0"
40a1ea: call [edx+0x330]          ; Text1
40a204: call [ecx+0xa0]           ; .Text     -> [ebp-0x28] = saisie
40a22c: call __vbaR8Str([ebp-0x28]) ; Val(Text1.Text)
40a235: fstp qword [ebp-0xd8]
40a23c: call __vbaR8Str([ebp-0x2c]) ; Val(Command11.Caption) = 0.0
40a242: fadd qword [0x401150]     ; + 56336980.0
40a248: fadd qword [0x401148]     ; + 1.0
40a25e: fcomp qword [ebp-0xd8]    ; égalité ?
40a266: test ah,0x40 ; je ...     ; C3=1 -> égal
40a2fc: push 0x408514             ; "/!\  Le serial est bon  /!\" -> Text1.Text
```

Lecture des deux doubles dans `.text` :

```bash
python3 -c "import struct;d=open('d.exe','rb').read();print([struct.unpack('<d',d[o:o+8])[0] for o in (0x1150,0x1148)])"
# [56336980.0, 1.0]
```

### 3. Prédicat

```vb
If Val(Text1.Text) = Val(Command11.Caption) + 56336980 + 1 Then
    Text1.Text = "/!\  Le serial est bon  /!\"
```

La « variable » `Command11.Caption` est en fait la touche `0` du pavé, jamais modifiée : `0 + 56336980 + 1 = 56336981`.

Le handler à `0x4098b0` (`__vbaStrCmp(Text1.Text, "")` + `__vbaLenBstr`) gère l'effacement/recul ; il ne touche pas au prédicat.

## Vérification

Sous wine, dans un Xvfb isolé (le TextBox ne prend que les clics du pavé) :

```bash
xvfb-run -a -s "-screen 0 800x600x24" tools/wine-xdotool-check.sh crack-me2.exe 56336981 ok.png
xvfb-run -a -s "-screen 0 800x600x24" tools/wine-xdotool-check.sh crack-me2.exe 56336980 ko.png
```

| `56336981` (OK) | `56336980` (KO) |
|---|---|
| ![OK](analysis/ok-serial-bon.png) | ![KO](analysis/ko-56336980.png) |

Avec le bon serial, `Text1` affiche « /!\  Le serial est bon  /!\ » ; avec un mauvais, rien ne change.

## Notes

- Comparaison en **double** (`Val`) : des zéros de tête (`056336981`) passeraient aussi.
- Les chaînes `GOOD` / `NOT GOOD` ne sont pas le chemin observé : c'est le texte de `Text1` qui change.
- Analyse statique (objdump) + vérification wine ; pas de debugger nécessaire.
