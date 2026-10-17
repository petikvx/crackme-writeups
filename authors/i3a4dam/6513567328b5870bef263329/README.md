# I3a4dam — Plain sight

| | |
|---|---|
| **ID** | [`6513567328b5870bef263329`](https://crackmes.one/crackme/6513567328b5870bef263329) |
| **Auteur** | I3a4dam |
| **Plateforme** | Linux ELF64 PIE, **C++** (libstdc++), non strippé |
| **SHA-256 (zip)** | `68a61e557210878054841547ff73ef1b83421ca02bc50a3e4c9d9518d7fc0369` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/plain_sight.zip` | archive d'origine, **chiffrée AES** (mot de passe `crackmes.one`, `7z` requis) |
| `analysis/x/plain_sight` | binaire extrait (`7z x -pcrackmes.one -oanalysis/x original/plain_sight.zip`) |
| `tools/plain-sight-solve.py` | lit le mot de passe dans l'ELF (`-q`, `--check`) |

## Réponse

**Mot de passe : `do_not_hardcode`**

```bash
echo do_not_hardcode | ./analysis/x/plain_sight      # Welcome!
python3 tools/plain-sight-solve.py --check
```

## Premier regard

`strings` montre `Enter the password: `, **`do_not_hardcode`**, `Welcome!`, `Wrong password!`. Le nom du challenge (« en pleine vue ») est l'indice : le mot de passe est en clair dans `.rodata`.

## Flow

`main` @ `0x129d` → `Login()` @ `0x11b9` : `std::string s` ; `std::cout << "Enter the password: "` ; `std::cin >> s` ; `s == "do_not_hardcode"` → « Welcome! » sinon « Wrong password! ».

## Comment on trouve

**Ancrage** : `nm -C analysis/x/plain_sight | grep Login` puis `objdump -d -M intel --no-show-raw-insn --start-address=0x11b9 --stop-address=0x129d analysis/x/plain_sight`.

```asm
11e7: lea rax,[rbp-0x30] ... call operator>>(istream&, string&)     ; cin >> s
1201: lea rdx,[rip+0xe11]   # 0x2019                                ; const char* secret
120e: call operator==(std::string const&, char const*)               ; s == secret
1213: test al,al ; je 1244                                           ; faux -> "Wrong password!" (0x2032)
1217: lea rax,[rip+0xe0b]   # 0x2029 "Welcome!"
```

`objdump -s -j .rodata` : à `0x2019`, `64 6f 5f 6e 6f 74 5f 68 61 72 64 63 6f 64 65 00` = `do_not_hardcode`. Aucune transformation.
Piège : `cin >> s` s'arrête au premier espace ; le mot de passe n'en contient pas.

## Vérification

```text
$ echo do_not_hardcode | ./plain_sight   -> Welcome!
$ echo Do_not_hardcode | ./plain_sight   -> Wrong password!   (casse)
$ echo wrong           | ./plain_sight   -> Wrong password!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
