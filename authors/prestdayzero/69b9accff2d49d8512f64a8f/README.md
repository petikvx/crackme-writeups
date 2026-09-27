# prestdayzero's Bobs gambling

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69b9accff2d49d8512f64a8f) · id `69b9accff2d49d8512f64a8f`

PE64 console, MSVC 19.50 (Visual Studio 2026), image base `0x140000000`.
Bob doit 100000000 Groschen. Le menu « -1 : Admin Terminal » est un leurre : le test est un octet, pas le choix signé.
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme_bobgambling.exe`](original/crackme_bobgambling.exe) | binaire |
| [`tools/bobgambling-solve.py`](tools/bobgambling-solve.py) | flag / `--check` Wine |

## Réponse

| | |
|---|---|
| **Choix menu** | `255` (tout `n >= 0` avec `n & 0xFF == 0xFF`, ex. `2147483647`) |
| **Admin** | `1` (remet la dette à 0) |
| **Flag** | `dzctf(bob_is_free_1337)` |

```bash
python3 tools/bobgambling-solve.py -q
printf '255\n\n1\n\n' | wine original/crackme_bobgambling.exe
python3 tools/bobgambling-solve.py --check
```

Le `\n` en trop après `255` nourrit le `istream::get()` qui suit `ignore(1)`. Sans lui, le `1` de l'admin est avalé et `cin` attend encore un entier.

---

## 1. Premier regard

```text
crackme_bobgambling.exe  PE32+ console, x86-64, 13312 octets
sha256  a713410fa1a7be24fa6c16ec36cdb4919ffa96e6eda65309e95cf3c247f35d56
pdb     crackme_intoverflow.pdb
```

```bash
file original/crackme_bobgambling.exe
strings -n 5 original/crackme_bobgambling.exe | head
```

Les chaînes disent déjà le scénario : `ADMIN TERMINAL`, `Set users debt to zero`, `Negative values are not allowed`, `Hidden admin access unlocked`, et le flag `dzctf(bob_is_free_1337)`. Le nom du PDB, `crackme_intoverflow`, oriente vers une troncature d'entier.

La dette initiale est le dword `.data` à `0x140005074` : `100000000`.

## 2. Flow

`main` (`0x140001000`) boucle tant que cette dette est non nulle.

1. Affiche le menu (`-1` admin, `1` paiement, `2` représentant) et lit un `int` (`cin >>`, IAT `0x140003050`) dans `[rsp+0x20]`.
2. Si l'int est négatif : `Negative values are not allowed.` et retour au menu. `-1` ne débloque donc rien.
3. Sinon stocke **l'octet bas** en `0x1400050fc` et le compare à `0xFF`.
4. `0xFF` : terminal admin. Choix `1` écrit `0` dans la dette et imprime le flag. La boucle s'arrête.
5. Octet `1` : `Payment system is currently down...`
6. Octet `2` : `All representatives are busy...`
7. Autre octet positif : `Please choose a valid choice`

## 3. Comment on trouve le choix

Ancrage : `objdump -d -M intel --start-address=0x1400010d4 --stop-address=0x140001110 original/crackme_bobgambling.exe`.

```nasm
; cin >> choice
call   [rip+...]          ; 0x140003050
mov    eax, [rsp+0x20]
test   eax, eax
jns    store             ; négatif → message, pas d'admin
mov    [rip+...], al     ; 0x1400050fc = choice & 0xFF
cmp    al, 0xff
jne    menu_normal       ; 1 paiement, 2 représentant, sinon invalide
; bannière ADMIN TERMINAL, puis cin >> selection
```

`255` vaut `0x000000FF` : non négatif, octet bas `0xFF`. `2147483647` (`0x7FFFFFFF`) aussi. `511` (`0x1FF`) aussi. `-1` est écarté par `jns` avant le `mov al`.

Le menu qui affiche `-1: Admin Terminal` décrit l'entrée admin, pas la valeur à taper.

## 4. Vérification

```text
printf '255\n\n1\n\n' | wine original/crackme_bobgambling.exe
→ [+] Hidden admin access unlocked
→ [+] Debt cleared.
→ dzctf(bob_is_free_1337)
→ exit 0

printf '2147483647\n\n1\n\n' | wine ...
→ même flag

printf '1\n\n' | wine ...
→ Payment system is currently down...
→ la dette reste 100000000, la boucle recommence

printf -- '-1\n' | wine ...
→ Negative values are not allowed.
```

```bash
python3 tools/bobgambling-solve.py --check
```

## 5. Notes

- Le flag est en clair dans le binaire. Le crackme est le chemin pour l'afficher, pas un secret caché.
- Tant que la dette n'est pas remise à 0, `main` ne retourne pas. Un essai « paiement » sous Wine tourne jusqu'à fermeture de l'entrée ou timeout.
