# Mazzotti's Back To The beginning Keygen

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a37cbc65f26f108ba18b982) · id `6a37cbc65f26f108ba18b982`

Crackme **ELF64 x86-64 PIE**, C++ (libstdc++), **strippé**. Un seul champ de mot de passe, trois positions fixes testées, le reste libre.
Auteur : [Mazzotti](https://crackmes.one/user/Mazzotti). 4ᵉ épisode résolu de la famille [mazzotti](../README.md).

Dossier : `authors/mazzotti/6a37cbc65f26f108ba18b982/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`crackme_easy`](original/crackme_easy) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`backtothebeginning-solve.py`](tools/backtothebeginning-solve.py) | générateur de mot de passe valide |

## Réponse

| | |
|---|---|
| **Mot de passe minimal** | `:3pkM` |
| Variante avec `petik` intégré | `:3peMtik` |

Pas de champ « nom » distinct ici (une seule entrée texte) : la convention `petik` est appliquée en construisant un mot de passe qui **contient** `petik` (`pe` + `M` imposé + `tik`) plutôt qu'en paramètre `--user`.

```bash
python3 tools/backtothebeginning-solve.py --check
python3 tools/backtothebeginning-solve.py --free pe --suffix tik --check
```

---

## 1. Premier regard

```text
file original/crackme_easy
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped

sha256: 70e6be7d2b73964855339c7afd72ba4ef7677ccdc4449e2d824cb3c8a1b6ae4f
```

```text
$ echo "test" | ./original/crackme_easy
Bro, what is your skill level?
$ echo | ./original/crackme_easy
Not so fast, what is this?
Bro, what is your skill level?
```

Trois messages distincts (vide/trop long → `Not so fast...`, mauvais contenu → `Bro, what is your skill level?`, succès → `WOW! Congratulations...`) : deux contrôles successifs, taille puis contenu.

---

## 2. Flow

```text
main  (0x11b0)
  cin >> s
  if s.size()-1 > 9 : "Not so fast, what is this?"; (continue malgré tout, pas d'exit ici)
  ok = check(s)                 ; @ 0x1420
  if ok  : "WOW! Congratulations on completing so hard keygen [sarcasm] :3"
  else   : "Bro, what is your skill level?"
```

---

## 3. Comment on trouve le prédicat

### Ancrage

Pas de symboles. `objdump -d -M intel` : le contrôle de taille (`size()-1 <= 9`, donc longueur dans `[1,10]`) précède l'appel à la fonction métier à `0x1420` :

```asm
; check(string& s) @ 0x1420
1424: mov    rax,QWORD PTR [rdi]      ; rax = s.data()
1429: cmp    BYTE PTR [rax+0x1],0x33  ; s[1] == '3' ?
142d: jne    143b                     ; sinon -> faux
142f: cmp    BYTE PTR [rax],0x3a      ; s[0] == ':' ?
1432: jne    143b                     ; sinon -> faux
1434: cmp    BYTE PTR [rax+0x4],0x4d  ; s[4] == 'M' ?
1438: sete   dl                       ; dl = (s[4] == 'M')
143b: mov    eax,edx
143d: ret
```

### Décodage

Trois comparaisons de caractères uniquement, aucune boucle, aucun hash :

| Index | Octet attendu | Caractère |
|---|---|---|
| `s[0]` | `0x3a` | `:` |
| `s[1]` | `0x33` | `3` |
| `s[4]` | `0x4d` | `M` |

`s[2]` et `s[3]` (et tout ce qui suit `s[4]`) ne sont **jamais lus** : totalement libres. La fonction n'exige pas explicitement `size() >= 5` — c'est le contrôle de taille du `main` (`[1,10]`) qui borne implicitement, et il faut au moins 5 octets alloués pour que `s[4]` soit valide (le SSO buffer de `std::string` fait 16 octets, donc même une chaîne plus courte ne crashe pas, elle lit juste un octet non pertinent du buffer — mais le test échoue alors presque toujours).

### Assemblage de la réponse

```text
":3" + 2 caractères libres + "M" + suffixe libre (total ≤ 10)
ex. minimal   : ":3pkM"      (5 car.)
ex. avec petik: ":3peMtik"   (8 car. — "pe" + M imposé + "tik" = petik "éclaté")
```

### Piège

Le titre (« si dur » entre guillemets sarcastiques, confirmé par le message de victoire lui-même) et le message d'erreur générique (`"Bro, what is your skill level?"`, identique à un autre challenge de la série) peuvent faire croire à un calcul complexe — en réalité seulement **3 octets fixes** sur une dizaine, aucune boucle ni table.

---

## 4. Vérification

```bash
$ python3 tools/backtothebeginning-solve.py --check
CHECK: OK
[+] mot de passe : :3pkM
----- sortie du programme -----
WOW! Congratulations on completing so hard keygen [sarcasm] :3
--------------------------------
```

Cas KO (`s[4]` faux, le reste correct) :

```bash
$ echo ":3pkik" | ./original/crackme_easy
# s[4] = 'i' != 'M'
Bro, what is your skill level?
```

Cas KO (`s[0]`/`s[1]` faux) :

```bash
$ echo "abcde" | ./original/crackme_easy
Bro, what is your skill level?
```

---

## 5. Notes

- Pas de GDB nécessaire : 3 `cmp` statiques suffisent, confirmés en relançant directement le binaire.
- Pas de contrainte stricte de longueur au-delà de `[1,10]` côté `check()` — seul le `main` filtre, et seulement par un message d'avertissement (`Not so fast...`), pas un `exit` : une chaîne trop longue affiche quand même le second message selon le contenu.
