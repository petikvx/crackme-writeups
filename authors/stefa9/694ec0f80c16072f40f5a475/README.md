# stefa9's Memory Me

| | |
|---|---|
| **ID** | [`694ec0f80c16072f40f5a475`](https://crackmes.one/crackme/694ec0f80c16072f40f5a475) (voir [`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | stefa9 |
| **Plateforme** | Windows PE64, MSVC, console |
| **SHA-256** | `0d250e26582003df908be6ed61face3df7d5d995ec1b42a52613b8e0ef9133c4` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/test.exe` | binaire d'origine (intact) |
| `tools/stefa9-solve.py` | solveur : lance l'exe sous Wine, écrit la valeur dans le processus vivant, vérifie `Good job!` |

## Réponse

Pas de serial : le programme dit *« Your task: make the bool at address 000000014000B0B8 true »*. Il faut, **dans le processus en cours**, écrire :

| Adresse | Valeur |
|---|---|
| `0x14000B0B8` (bool) | `01` |
| `0x14000B0BC` (dword, canari) | `0xFFFFFFFE` |

soit les 8 octets `01 00 00 00 FE FF FF FF` à `0x14000B0B8`.

```bash
python3 -I tools/stefa9-solve.py --check
```

Le flag affiché (`flag{this_is_not_the_correct_flag}`) est un leurre voulu : la « victoire » est le message `Good job!`.

## Premier regard

- `file` : PE32+ x86-64 console, 7 sections dont une section `.hash` contenant `EEC2E37F…09DA` (hash attendu, en hex).
- Imports : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `QueryPerformanceCounter`, `GetModuleFileNameA`, `system` (→ `PAUSE`).
- `strings` : `Your task: make the bool at address `, `Good job! flag{this_is_not_the_correct_flag}`, et une chaîne obfusquée `W]PVJEYXBnXBnEYT…` (non utilisée pour la réponse).
- Sous Wine, stdout est tamponné : rien ne s'affiche tant que le programme boucle.

## Flow

`main` (`0x140002730`) :

1. affiche le texte + l'adresse du bool (`0x14000B0B8`, `lea rdx,[rip+0x892d]` à `0x140002784`) ;
2. boucle `0x1400027c0` :
   ```asm
   1400027c0: mov eax,[rip+0x88f2]   ; [0x14000B0B8]
   1400027c6: cmp eax,1
   1400027c9: jne 1400027da          ; pas vrai -> on continue de boucler
   1400027cb: mov eax,[rip+0x88eb]   ; [0x14000B0BC]
   1400027d1: cmp eax,0xfffffffe
   1400027d4: je  140002bf2          ; sortie : affiche la chaîne puis PAUSE
   ```
3. le corps de boucle fait du bruit : anti-debug (`IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, test de durée par `QueryPerformanceCounter`, `cmp rcx,0x4c4f28`), SHA-256 de son propre exe (`GetModuleFileNameA` → comparé à `.hash`), modification d'un état global `0x14000B588`. Si debugger/hash KO, la chaîne de sortie reste le leurre.
4. sortie (`0x140002bf2`) : écrit la chaîne `Good job! …` puis `system("PAUSE")`.

## Comment on trouve

- **Ancrage** : `strings` → « Your task: make the bool at address » (offset fichier `0x61c0`, VA `0x1400075c0`) ; `objdump -d -M intel` → xref `lea rdx,[rip+0x4e48]` à `0x140002771` dans `main`.
- **Prédicat** : la seule condition de sortie de la boucle externe est le `cmp` de `0x1400027c6` / `0x1400027d1`. Le bool est donc `[0x14000B0B8] == 1`, et un second champ adjacent (`0x14000B0BC`, initialement `0xFFFFFFFF`) doit valoir `0xFFFFFFFE`. Les valeurs initiales se lisent dans `.data` : `objdump -s -j .data` → `00000000 ffffffff` à `0x14000b0b8`.
- **Piège 1** : patcher le fichier est une fausse piste (auto-hash SHA-256 contre `.hash`) ; l'énoncé impose de modifier la mémoire.
- **Piège 2** : ne mettre que le bool à 1 ne suffit pas, il faut aussi le dword à `-2`.
- **Piège 3** : le flag affiché est factice.
- **Sous Wine** : l'image est chargée à sa base préférée `0x140000000` (pas de relocation, vérifié dans `/proc/<pid>/maps`), donc l'adresse affichée est valide telle quelle ; on écrit via `/proc/<pid>/mem` (aucun debugger attaché, donc `IsDebuggerPresent` reste faux). Sous Windows natif : `WriteProcessMemory` / Cheat Engine / x64dbg (sans être détecté).

## Vérification

```text
$ python3 -I tools/stefa9-solve.py --check
avant : 00000000ffffffff  après : 01000000feffffff
Press any key to continue... Your task: make the bool at address 000000014000B0B8 true
Good job! flag{this_is_not_the_correct_flag}
OK
```

Cas KO : même run sans l'écriture mémoire (le programme boucle indéfiniment, aucune sortie, `rc None` après 13 s). Le SHA-256 de `original/test.exe` reste inchangé après les tests.

## Notes

- Pas de nom d'utilisateur (donc pas de `petik`).
- Pas de session GDB ni de MCP debugger : reverse statique (`objdump`) + test live Wine ; IDA indisponible sur cette machine.
- Le corps exact des contrôles anti-debug / hash (fonctions `0x140002140`, `0x140002570`, `0x140002e40`) n'a pas été entièrement reversé : il n'est pas nécessaire à la solution, qui passe sans debugger ni modification du fichier.
