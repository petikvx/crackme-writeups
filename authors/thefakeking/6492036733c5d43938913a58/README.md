# TheFakeKing's Basic Crackme ConsoleBased

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6492036733c5d43938913a58) · id `6492036733c5d43938913a58`

Crackme **PE64 console** MinGW/C++ (`Main.cpp`).  
Auteur site : **[TheFakeKing](https://crackmes.one/user/TheFakeKing)**.  
Description : *very easy crack* (diff. 1.0).

| Fichier | Rôle |
|---|---|
| [`original/Main.exe`](original/Main.exe) | binaire (~3.1 Mo, stdlib C++ statique) |
| [`tools/basic-console-solve.py`](tools/basic-console-solve.py) | password + `--check` |

## Réponse

| Champ | Valeur |
|---|---|
| Password | **`ErhwHwrhrwWhrwwHwhr`** |

```bash
python3 tools/basic-console-solve.py -q --check
# ErhwHwrhrwWhrwwHwhr
printf 'ErhwHwrhrwWhrwwHwhr\n.\n' | xvfb-run -a wine original/Main.exe
# (pas de « Invaild Password » — boucle sur un nouveau prompt)
```

---

## Premier regard

```text
$ file original/Main.exe
PE32+ executable (console) x86-64 … MinGW

$ nm original/Main.exe | grep GetPassword
401550 T GetPassword()
401633 T main
```

Symboles + DWARF présents (`Main.cpp`).

---

## Flow

```text
main:
  loop:
    GetPassword()
      system("cls")
      cout << "Input a password\n>"
      cin >> s
      if (s != "ErhwHwrhrwWhrwwHwhr")
          cout << "Invaild Password\n<Enter anything to Retry>"
      cin >> s   # attendre une touche / token
```

Comparaison C++ : `operator!=` / `operator==` sur `std::string` vs littéral `.rdata` `@ 0x4e7018`.

---

## Notes

- Typos auteur : **Vaild** / **Invaild**.
- La branche qui affiche « Vaild Password » compare la string **vide** (avant le `cin`) au mot de passe → **morte**. En cas de succès on ne voit donc que l’absence d’« Invaild » puis un nouveau prompt (`main` reboucle).
- Binaire très gros pour un `strcmp` : linkage C++ libstdc++ / runtime MinGW.
