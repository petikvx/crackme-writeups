# gustavsofa's password esasy

| | |
|---|---|
| **ID** | [`6a07d24a3fba64e45dceaaa7`](https://crackmes.one/crackme/6a07d24a3fba64e45dceaaa7) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | gustavsofa |
| **Plateforme** | Windows x86-64, console, C++ (MinGW-w64 / libstdc++, statique) |
| **SHA-256** `download.bin` | `f6ce2139286440db79de31a914c83923353cc4491c6c57afa9212e6b39cb68af` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | **en réalité un ZIP** chiffré (mdp `crackmes.one`) contenant `senha.exe` — non modifié |
| `analysis/extracted/senha.exe` | exécutable extrait (2 973 159 o) |
| `analysis/senha.asm` | `objdump -d -M intel` complet |
| `tools/senha-solve.py` | solveur + `--check` (émulation Unicorn) |

## Réponse

**Mot de passe : `1234`**

```bash
python3 tools/senha-solve.py          # lit la chaîne dans senha.exe
python3 tools/senha-solve.py -q       # 1234
python3 tools/senha-solve.py --check  # preuve par émulation
```

Pas de login : l'exemple `petik` ne s'applique pas (il est testé comme entrée **fausse** dans `--check`).

## Premier regard

- `original/download.bin` commence par `PK\x03\x04` : c'est un ZIP (flag chiffré), l'extension `.bin` trompe. `7z x -pcrackmes.one -oanalysis/extracted original/download.bin` → `senha.exe`.
- `senha.exe` : `MZ`, PE32+ (`objdump -h` : `pei-x86-64`), symboles et DWARF conservés (`senha.cpp` dans les strings) → `main` est nommé.
- `strings` : `Digite a senha: ` (« Entrez le mot de passe »), `Acesso Liberado`, `Acesso Negado`, `pause`.
- Le reste du « bruit » (`d_make_comp`, `d_number`…) est le démangleur libstdc++ lié statiquement : hors sujet.

## Flow

1. affiche `Digite a senha: ` ;
2. `std::cin >> std::string` ;
3. `if (s == "<littéral>") "Acesso Liberado\n" else "Acesso Negado\n"` ;
4. `system("pause")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel senha.exe > analysis/senha.asm`, puis recherche de `main` (symbole présent, VA `0x140001490`).

```asm
140001490 <main>:
  1400014ac: lea rdx,[rip+0xd4b4d]   # 1400d6000 "Digite a senha: "
  1400014bd: call operator<<(cout, const char*)
  1400014d0: call operator>>(cin, string&)      ; string en [rbp-0x20]
  1400014d5: lea rdx,[rip+0xd4b35]   # 1400d6011  <- littéral comparé
  1400014e3: call operator==(const string&, const char*)   ; 1400ccb40
  1400014e8: test al,al
  1400014ea: je 140001504            ; faux -> "Acesso Negado" (1400d6027)
  1400014ec: lea rdx,[rip+0xd4b23]   # 1400d6016 "Acesso Liberado\n"
```

**Décodage** : `.rdata` commence à l'offset fichier `0xd3a00` (VA `0x1400d6000`). Dump :

```
d3a00: "Digite a senha: \0"   (0x00..0x10)
       "1234\0"              (0x11..0x15)  <- argument de l'operator==
       "Acesso Liberado\n\0" (0x16)
       "Acesso Negado\n\0"   (0x27)
```

`.rdata+0x11` = `1234`, juste après le prompt (strings contiguës dans la section). `operator==` (`0x1400ccb40`) compare `size()` à `traits::length(rhs)` puis `traits::compare` (memcmp) : comparaison exacte, sensible à la casse, pas de transformation de l'entrée.

**Pièges** : (1) le fichier `.bin` est un ZIP ; (2) `strings` en tête affiche du bruit (données du ZIP compressé) tant qu'on n'a pas extrait ; (3) `1234` est facile à rater dans `strings -n 6` (seuil trop haut) — passer par l'xref du `lea`.

## Vérification

Environnement d'analyse **sans Wine ni gdb** (donc pas de section « Debug GDB », pas de run console live). La preuve est une exécution réelle du code du binaire sous Unicorn : `--check` charge les sections de `senha.exe`, construit un `std::string` SSO en mémoire et exécute le vrai `operator==` (`0x1400ccb40`) contre le littéral `0x1400d6011` ; seuls `strlen`/`memcmp` (thunks IAT) sont émulés par hook.

```text
$ python3 tools/senha-solve.py --check
Mot de passe : 1234
operator==('1234') -> True ; operator==('petik') -> False
```

OK (`1234` → vrai → branche « Acesso Liberado ») et KO (`petik` → faux → « Acesso Negado »). Une vérification sous Wine (`xvfb-run -a wineconsole senha.exe`, saisir `1234`) reste à faire sur une machine qui en dispose. Note : exécuter le solveur sans `-I` si `unicorn` est installé dans le site-packages utilisateur.

## Notes

- Aucun anti-debug, aucune transformation : crackme d'initiation, mot de passe en clair dans `.rdata`.
- Le binaire d'origine n'a pas été patché.
