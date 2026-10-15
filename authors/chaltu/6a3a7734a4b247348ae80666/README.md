# chaltu's Accsess me please :)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a3a7734a4b247348ae80666) · id `6a3a7734a4b247348ae80666`

Crackme **ELF64 x86-64 PIE**, C, **non strippé**. Comparaison directe d'un entier lu par `scanf("%d")`.
Auteur : [chaltu](https://crackmes.one/user/chaltu).

Dossier : `authors/chaltu/6a3a7734a4b247348ae80666/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`main`](original/main) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`accsess-solve.py`](tools/accsess-solve.py) | affiche/vérifie le mot de passe |

## Réponse

| | |
|---|---|
| **Mot de passe** | `47029` (`0xb7b5`) |

```bash
python3 tools/accsess-solve.py --check
python3 tools/accsess-solve.py -q
```

---

## 1. Premier regard

```text
file original/main
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped

sha256: 8e2e87e5c83b748089a3d78c2fc30e02144ec7b5d6c7f8384e4ec67cf184f9fd
```

Binaire **non strippé** : symboles `canaccess`, `printaccess`, `main` directement visibles dans `objdump -d`. `strings` révèle les deux issues (`Access Granted` / `Access Denied!!!!`) et le format `%d` : l'entrée attendue est un entier, pas une chaîne.

---

## 2. Flow

```text
main  (0x118a)
  printf("Enter password: ")
  scanf("%d", &n)
  if n == 0xb7b5 :
      ok = canaccess()       ; retourne toujours 1
      if ok : printaccess()  ; affiche "Access Granted"
  else :
      puts("Access Denied!!!!")
```

---

## 3. Comment on trouve le mot de passe

### Ancrage

`objdump -d -M intel original/main` sur `main` (non strippé, symbole direct) :

```asm
11b5: lea    rax,[rbp-0xc]
11b9: lea    rdx,[rip+0xe64]        # 0x2024 -- "%d"
11c3: mov    rdi,rdx
11cb: call   1060 <__isoc23_scanf@plt>   ; scanf("%d", &n)
11d0: mov    eax,DWORD PTR [rbp-0xc]     ; eax = n
11d3: cmp    eax,0xb7b5                  ; n == 0xb7b5 ?
11d8: jne    11ea                         ; sinon "Access Denied!!!!"
11da: call   1169 <canaccess>             ; retourne toujours 1 (mov eax,1)
11df: test   al,al
11e1: je     11f9
11e3: call   1174 <printaccess>           ; "Access Granted"
```

`canaccess()` est une fonction factice (`mov eax,1; ret`) — pas de logique supplémentaire, juste un habillage. Le seul vrai contrôle est l'unique `cmp` sur l'immédiat `0xb7b5`.

### Décodage

Aucune transformation, pas de table, pas de hash : conversion directe hexadécimal → décimal.

```python
0xb7b5 = 11*4096 + 7*256 + 11*16 + 5 = 47029
```

Vérifié directement sur le binaire (`printf "47029\n" | ./original/main` → `Access Granted`).

### Piège

Le seul vrai piège est **arithmétique** : une erreur de calcul hexadécimal→décimal (ex. confondre `0xb7b5` avec `46965`) donne un mot de passe refusé malgré un raisonnement correct — vérifier le calcul avec `python3 -c "print(0xb7b5)"` plutôt qu'à la main.

---

## 4. Vérification

```bash
$ python3 tools/accsess-solve.py --check
CHECK: OK
[+] mot de passe : 47029 (0xb7b5)
----- sortie du programme -----
Enter password: Access Granted
--------------------------------
```

Cas KO :

```bash
$ printf "46965\n" | ./original/main
Enter password: Access Denied!!!!
```

---

## 5. Notes

- Pas de GDB nécessaire : binaire non strippé, un seul `objdump -d` suffit à voir le `cmp` et son immédiat ; vérifié directement par exécution.
- Pas de contrainte de username/login ici (entrée purement numérique) — convention `petik` non applicable.
