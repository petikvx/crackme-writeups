# patchme_1 (oxygen)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6133c5d40ad448c93f) · PatchMe MASM32 — nag + nom dans le MessageBox.

| Fichier | Rôle |
|---|---|
| [`original/_u/InjectMe.exe`](original/_u/InjectMe.exe) | challenge |
| [`original/_u/ReadMe.txt`](original/_u/ReadMe.txt) | consignes |
| [`analysis/InjectMe.patched.exe`](analysis/InjectMe.patched.exe) | patché |
| [`tools/oxygen-patchme1-solve.py`](tools/oxygen-patchme1-solve.py) | patcher |

## Réponse

Deux MessageBox (nag puis main), nom d’exemple **`petik`** :

| Étape | Caption | Text |
|---|---|---|
| Nag | `Patched ?` | `Nag: crackme patched by petik` |
| Main | `Patched ?` | **`Good Boy [petik         ]!`** |

```bash
python3 tools/oxygen-patchme1-solve.py --check
WINEDEBUG=-all wine analysis/InjectMe.patched.exe
```

## Premier regard

```text
PE32 GUI · MASM32 · MessageBoxA + ExitProcess
.data : « Add a nag… » + « Good Boy [XXXXXXXXXXXXXX]! » (inutilisée)
```

## Flow d’origine

```asm
MessageBoxA(0, "Add a nag screen…", "Patched ?", 0)
ExitProcess(0)
```

## Patch

1. Remplir les 14 `X` → `petik` + espaces.
2. Réutiliser l’ancienne string comme texte de **nag**.
3. Réécrire `.text` : nag MB → main MB (`Good Boy…`) → `ExitProcess` (stubs IAT en cave `@0x401050`).

## Vérification

Wine :

```text
caption='Patched ?'  text='Nag: crackme patched by petik'
caption='Patched ?'  text='Good Boy [petik         ]!'
```

## Notes

- Pas de serial : objectif pédagogique « patch / inject ».
- Le titre site dit `patchme_1` ; le PE s’appelle `InjectMe.exe`.
