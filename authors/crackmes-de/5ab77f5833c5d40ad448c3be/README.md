# crackmes.de's encrypted_find_the_right_word_to_pass (PassMe / Korrect.exe) by servitute

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3be`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3be) |
| **Auteur (site)** | crackmes.de (servitute) |
| **Plateforme** | Windows PE32 console, MinGW, packé **eXPressor 1.4.5.x** |
| **SHA-256 (zip)** | `6e3f4b594ef550e73b74181977c0c599a4d24d724284baf608c8294a271796b8` |

Voir [`ORIGIN.yml`](ORIGIN.yml) · page : https://crackmes.one/crackme/5ab77f5833c5d40ad448c3be · ZIP password : `crackmes.one`

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/PassMe.zip` | archive d'origine (contient `Korrect.exe`) |
| `analysis/extracted/Korrect.exe` | exe extrait (copie de travail) |
| `analysis/korrect-text.bin` / `.asm` | dump mémoire de `0x401000..0x404000` du process dépacké + désassemblage |
| `tools/passme-solve.py` | solveur + `--check` Wine |

## Réponse

**Mot de passe : `esistgut`** (pas de user : `petik` sans objet).

```bash
python3 tools/passme-solve.py -q        # esistgut
python3 tools/passme-solve.py --check   # preuve Wine/xvfb sur l'exe d'origine
```

## Premier regard

```text
$ unzip original/PassMe.zip -d analysis/extracted
$ diec Korrect.exe       → PE32, MinGW, Protector: eXPressor(1.4.5.X)
$ objdump -h Korrect.exe → .data (taille 0), .pdata, .ex_cod ; entry 0x409881
```

`strings` ne donne rien d'utile : seulement des imports du stub (`VirtualAlloc`, `LoadLibraryExA`, `GetProcAddress`…) et du bruit compressé. La section `.data` est vide sur disque (taille raw 0 mais VMA `0x401000`) : le code réel est décompressé en mémoire par le stub `.ex_cod`.

Lancé sous Wine : `What's the right word to enter? >>` puis `Try again...` ou `Yes!`.

## Flow

`main` (`0x4012b0`) : affiche le prompt, lit une ligne (`gets`-like @`0x4018d0`), appelle `strcmp`-like (`0x4018c0`) avec une chaîne constante, `eax==0` → « Yes! », sinon « Try again... », puis `pause`.

## Comment on trouve

1. **Ancrage** : le binaire est packé, donc pas de chaîne en clair sur disque. Plutôt que d'écrire un unpacker eXPressor, on laisse le stub faire le travail et on lit la mémoire du process **une fois arrivé au prompt** (stdin bloqué sur une FIFO pour que le process reste vivant) :

   ```bash
   mkfifo /tmp/fi
   (xvfb-run -a wine Korrect.exe < /tmp/fi > /tmp/out.txt &) ; (sleep 60 > /tmp/fi &)
   sleep 8; pid=$(pgrep -x Korrect.exe)
   # puis scan de /proc/$pid/mem (regions lisibles) à la recherche de "right word" / "Try again"
   ```

   Le scan trouve les chaînes du programme dépacké à `0x40300b`… :

   ```text
   0x403000 "What's the right word to enter?"
   0x403020 "\n>> "
   0x403025 "esistgut"
   0x40302e "\n\nYes!"
   0x403035 "\n\nTry again..."
   0x403044 "\n\n"   0x403047 "pause"
   ```

   Une chaîne isolée entre le prompt et les messages de succès/échec : c'est le mot de passe (« es ist gut » = « c'est bon », en allemand).

2. **Lecture du code** : dump de `0x401000..0x404000` (`analysis/korrect-text.bin`), `objdump -D -b binary -m i386 -M intel --adjust-vma=0x401000`. Dans `main` :

   ```asm
   4012fb: lea  eax,[ebp-0x78]            ; buffer de saisie
   401301: call 0x4018d0                  ; lecture de la ligne (gets)
   401310: lea  eax,[ebp-0x78]
   401313: mov  DWORD PTR [esp+4],0x403025 ; "esistgut"
   40131b: mov  DWORD PTR [esp],eax
   40131e: call 0x4018c0                  ; strcmp(input, "esistgut")
   401329: cmp  DWORD PTR [ebp-0xec],0
   401330: jne  0x401340                  ; ≠0 → "Try again..." (0x403035)
   401332: mov  DWORD PTR [esp],0x40302e  ; == 0 → "Yes!"
   ```

   Comparaison **complète** de la chaîne (pas un test de caractère unique, contrairement à Korrect2).

3. **Pièges** : packer eXPressor (pas de strings, `.data` vide, EP dans `.ex_cod`) ; ne pas confondre l'adresse mémoire (`0x403025`) avec un offset de fichier ; `pkill -f Korrect` tue aussi le shell qui l'invoque — utiliser `pkill -x Korrect.exe`.

## Vérification

`tools/passme-solve.py --check` (exe d'origine extrait du zip, `xvfb-run -a wine`) :

```text
OK  'esistgut'  -> Yes!
OK  'nope'      -> Try again
OK  'esistgu'   -> Try again      (préfixe)
OK  'esistgutX' -> Try again      (suffixe)
OK  'ESISTGUT'  -> Try again      (casse)
```

## Notes

- Aucun GDB utilisé : unpack « live » via lecture de `/proc/<pid>/mem` + analyse statique du dump.
- `original/` n'a pas été modifié ; l'extraction est sous `analysis/extracted/`.
