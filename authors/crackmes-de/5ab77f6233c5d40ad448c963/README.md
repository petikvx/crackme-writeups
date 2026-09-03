# leevions_first_crackme_with_assemby (LeeviON)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c963) · Patchme FASM 1.68 — pas de serial.

| Fichier | Rôle |
|---|---|
| [`original/_u/crackme1.EXE`](original/_u/crackme1.EXE) | challenge (1536 o) |
| [`original/_u/ReadMeFirst.txt`](original/_u/ReadMeFirst.txt) | notes auteur |
| [`analysis/crackme1.cracked.exe`](analysis/crackme1.cracked.exe) | binaire patché |
| [`tools/leevion-crackme1-solve.py`](tools/leevion-crackme1-solve.py) | applique le patch |

## Réponse

**Patch** (pas de password) → MessageBox **`Crackme cracked!!`**.

```bash
python3 tools/leevion-crackme1-solve.py --check
WINEDEBUG=-all wine analysis/crackme1.cracked.exe
```

## Premier regard

```text
PE32 GUI · FASM 1.68 · imports: MessageBoxA, ExitProcess
```

Idiome FASM `call` + string inline pour les arguments MessageBox.

## Flow

1. Nag : caption `Unregistered Crackme…` / text `You have to register…`
2. **`call [ExitProcess]`** @`0x401082` — fin.
3. Juste après (code mort) : chemin succès `Crackme cracked!!` + long thank-you.
4. Ensuite un « gag » CD (`open cdaudio`…) **incomplet** (pas d’import MCI) — crash si on y tombe.

## Patch

| VA | Remplace | Par |
|---|---|---|
| `0x401082` | `call [ExitProcess]` (6 o) | `jmp 0x401088` + NOP |
| `0x401116` | début du gag CD | `jmp 0x4011A1` (`push 0` / `ExitProcess`) |

## Vérification

Wine :

```text
caption='Unregistered Crackme, visit crackmes.de to register'
caption='Crackme cracked!!'
  text='Now you have registered version of this crackme! …'
```

(puis exit propre).

## Notes

- L’auteur suggère aussi un **loader** qui patche en mémoire avant démarrage ; ici on livre une copie patchée sous `analysis/` (original intact).
- Typo auteur : « Wich of course means… ».
