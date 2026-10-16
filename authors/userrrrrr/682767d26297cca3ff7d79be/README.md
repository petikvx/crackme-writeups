# userrrrrr — EasyCrackme

| | |
|---|---|
| **ID** | [`682767d26297cca3ff7d79be`](https://crackmes.one/crackme/682767d26297cca3ff7d79be) |
| **Auteur** | userrrrrr |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (symbole `storedPassword`) |
| **SHA-256** | `9443783b916bae529c66a3d07e5a900fabb4eadf58a918b1140d612e1a037168` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/easycrackme-solve.py` | lit le secret dans l'ELF (`-q`, `--check`) |

## Réponse

**Mot de passe : `.rdata`**

```bash
python3 tools/easycrackme-solve.py --check
echo .rdata | ./original/crackme     # Access granted
```

## Premier regard

`strings -n 4` : `Enter password: `, `Error reading input.`, `Access granted`, `Access denied`, et une chaîne **`.rdata`** juste après `_IO_stdin_used`. Le symbole `storedPassword` (`nm`) pointe sur `0x2004`. `.rdata` est un nom de section PE : on pourrait le prendre pour un artefact de compilation, c'est en fait le mot de passe.

## Flow

`main` @ `0x11e9` : `printf("Enter password: ")`, `fgets(buf, 0x64, stdin)` (NULL → « Error reading input. »), le `\n` est retiré par `strcspn(buf, "\n")`, puis `strcmp(buf, storedPassword)`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<main>:/,/ret/'`.

```asm
1223: lea rax,[rbp-0x70] ; mov esi,0x64 ; call fgets
125c: call strcspn          ; buf[strcspn(buf,"\n")] = 0
126a: lea rdx,[rip+0xd93]   # 0x2004 <storedPassword>
127c: call strcmp ; test eax,eax ; jne 1291   ; 0 -> "Access granted" (0x2034)
```

`nm original/crackme | grep storedPassword` donne `0x2004` ; `objdump -s -j .rodata` : `2e 72 64 61 74 61 00` = `.rdata`. Aucune transformation.
Piège : le mot de passe ressemble à un nom de section, pas à un mot de passe ; le point initial fait partie de la chaîne.

## Vérification

```text
$ echo .rdata | ./original/crackme
Enter password: Access granted
$ echo nope | ./original/crackme
Enter password: Access denied
```

## Notes

- Reverse statique + essais live, pas de GDB.
