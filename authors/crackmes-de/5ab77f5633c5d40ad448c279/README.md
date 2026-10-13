# zi___crakme_v2 by zionz (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c279)
- Auteur : zionz (archive crackmes.de) · plateforme : Windows PE32 GUI, **Blitz3D** (BlitzBasic) · difficulté 2.0
- Suite de [zi___crakme](../5ab77f5633c5d40ad448c278/) (serial fixe `AX943`)

| Fichier | Rôle |
|---|---|
| `original/zi_crackme_v2.zip` | archive site (mdp `crackmes.one`) → `Zi-Crackme V2.rar` + `README.txt` |
| `original/Zi-Crackme V2.exe` | binaire extrait du RAR (`unar` ; 7z « Unsupported Method ») — 1 298 432 o, sha256 `76b82098…ca21d00` |
| `original/crackmes.one/README.txt` | « second crakme… much harder » |
| `tools/zi_crakme_v2-solve.py` | keygen + vérif signature bytecode (`-q`, `--check USER SERIAL`) |
| `analysis/run.sh` | preuve Wine/Xvfb + xdotool |
| `analysis/good.png`, `analysis/bad.png` | captures OK / KO |

## Réponse

Username **exactement 5 caractères**, puis serial décimal dérivé des codes ASCII :

```text
a..e = Asc(Mid(user$, 1..5, 1))
key  = ((((a + b + d) * c) + e) + a + e) * e + d
serial$ = Str(key)          ; comparaison exacte (__bbStrCompare)
```

Exemple (username d’exemple du dépôt) :

```bash
python3 tools/zi_crakme_v2-solve.py petik
# user   : petik
# serial : 3982003

python3 tools/zi_crakme_v2-solve.py --check petik 3982003   # OK
```

Sous Wine : `SERIAL CORRECT!` (voir `analysis/good.png`). Le serial figé **`AC341`** est un **leurre** (branche « THIS IS NOT THE WAY » / labels `_l_2bogus` / `_l_2extra`) — mauvais serial pour `petik` (`analysis/bad.png`).

## Premier regard

```text
$ file "Zi-Crackme V2.exe"
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
$ diec "Zi-Crackme V2.exe"
MSVC6 C++ ; Library: Direct3D, DirectDraw, DirectInput, D3DXOF
```

Même schéma que v1 : runtime Blitz3D (~1,3 Mo) + **programme utilisateur en ressource**. Ici `RT_RCDATA` id **1111** (file `0x12bb58`, taille `0x14fe`) contient le x86 compilé + pool de chaînes + table de relocs (`__bbStrConst`, `_fmid`, `_fasc`, `__bbStrFromInt`, `__bbStrCompare`, …).

Fenêtre Blitz : `Graphics 640, 100, 32, 2` — titre X11 souvent un simple espace (chercher la classe `zi-crackme` avec xdotool, pas le nom « Zi »).

## Comment on trouve la formule

1. Parser `.rsrc` → dump de `RT_RCDATA #1111`.
2. `objdump -D -b binary -m i386 -M intel` sur le blob : après `Input` username + `Len == 5`, cinq blocs `Mid(user, i, 1)` / `Asc` stockés en `[ebp-0xc]…[ebp-0x1c]`, puis :

```asm
mov  ebx, a          ; [ebp-0xc]
add  ebx, b          ; [ebp-0x10]
add  ebx, d          ; [ebp-0x18]
imul ebx, c          ; [ebp-0x14]
add  ebx, e          ; [ebp-0x1c]
; … + a + e …
imul ebx, e
add  ebx, d          ; key dans [ebp-0x20]
```

3. Plusieurs `__bbStrCompare(serial$, Str(key))` AND-és (redondants, même `key`). Succès → `Print "SERIAL CORRECT!"`.
4. Les constantes `AC341` / messages « WELL DONE » / « THIS IS NOT THE WAY » servent de faux chemins / anti-string-search — le prédicat réel est purement numérique.

Signature bytecode vérifiée par le solveur (suite `8b5df4 035df0 035de8 0faf5dec 035de4`).

## Preuve Wine

```bash
cd analysis
xvfb-run -a -s "-screen 0 1024x768x24" \
  ./run.sh 'xdotool type --delay 100 petik; sleep 0.4; xdotool key Return; sleep 1; xdotool type --delay 100 3982003' \
  good.png
# → SERIAL CORRECT!
```

## Notes

- Extraction RAR : `unar` (méthode non supportée par 7z sur cette archive 2005).
- Pas de patch : keygen suffit.
- v1 = serial constant ; v2 = keygen sur le nom (d’où « much harder »).
