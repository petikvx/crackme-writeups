# hybridkenrel — yum :P

| | |
|---|---|
| **ID** | [`6754620160fa67152406b53c`](https://crackmes.one/crackme/6754620160fa67152406b53c) |
| **Auteur** | hybridkenrel |
| **Plateforme** | Linux ELF64 **statique**, C++, **strippé** (2 Mo, libstdc++ embarquée) |
| **SHA-256 (zip)** | `2face62d00ffcfedac21c09f6ac0bcca1f6ba77e58577c8187ae1148c52b5968` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/yum.zip` | archive d'origine : `yum` (binaire) + `libyum.so` (100 octets) |
| `analysis/x/` | contenu extrait |
| `tools/yum-solve.py` | extrait la clé de `libyum.so` (`-q`, `--check`) |

## Réponse

**Mot de passe : `gidasevkiujshgynluehiajedikudhe`**

```bash
cd analysis/x                    # le binaire lit ./libyum.so
echo gidasevkiujshgynluehiajedikudhe | ./yum      # Success!
python3 ../../tools/yum-solve.py --check
```

## Premier regard

- `yum` : ELF statique strippé (`nm` : no symbols), message d'accueil « Welcome mate, enter the password :D ».
- `libyum.so` n'est **pas** une bibliothèque (`file` : data, 100 octets) : un blob de bruit contenant en clair `gidasevkiujshgynluehiajedikudhe` (visible dans `xxd`, offset `0x24`).
- Sans `libyum.so` dans le répertoire courant : « Failed to open file libyum.so ».

## Flow

`main` @ `0x256aa3` : `std::cout << "Welcome mate, enter the password :D"`, `std::cin >> input`, `key = get_key()` (@ `0x2567e5`), `input == key` (@ `0x256e30`) → « Success! » sinon « try again ».

## Comment on trouve

**Ancrage** : pas de symboles. On calcule l'adresse virtuelle de la chaîne `Welcome mate` (offset fichier `0x650` → VMA `0x200650`, segment unique), puis on cherche sa référence dans le désassemblage :
`objdump -d -M intel --no-show-raw-insn yum | grep -n 200650` → `256abb`, dans la fonction qui commence à `0x256aa3` (le vrai `main`).

`get_key` (@ `0x2567e5`) :

```asm
256841: calloc(0x64,1)               ; buffer
25689a: fopen("libyum.so","r")       ; chaînes @0x2005ed / 0x2005ea
256903: fread(buf,1,0x64,f)          ; 100 octets
25699b: found=0 ; n=0 ; i=0
2569b0: if found && n <= 0x1e : key[n++] = buf[i] ; si n == 0x1f -> fin   ; copie des 31 octets SUIVANT le 0xde
2569f2: cmp al,0xde ; jne ... ; mov found,1                                ; le premier 0xde déclenche la copie
256a0e: key[n] = 0
```

Donc : `key = libyum.so[i+1 : i+32]` où `i` est l'index du premier octet `0xde`. Ici `i = 0x23` : les 31 octets suivants sont
`g i d a s e v k i u j s h g y n l u e h i a j e d i k u d h e` → **`gidasevkiujshgynluehiajedikudhe`**.

La fonction de comparaison @ `0x256e30` est l'égalité `std::string` (longueurs égales, puis `memcmp` via `0x256c0f`) : aucune transformation de la saisie.

Pièges :
- statique + strippé = 2 Mo de libstdc++ ; ne pas chercher `main` par symbole, partir de la chaîne ;
- le premier octet de la clé n'est **pas** le `0xde` : la copie commence à l'octet suivant ;
- le fichier fait 100 octets mais seuls 31 comptent ; le reste est du leurre.

## Vérification

```text
$ cd analysis/x && echo gidasevkiujshgynluehiajedikudhe | ./yum
Welcome mate, enter the password :D
Success!
$ echo test | ./yum
Welcome mate, enter the password :D
try again
```

## Notes

- Reverse statique (objdump + adresses calculées) + essais live ; pas de GDB.
- La clé dépend du fichier `libyum.so` fourni : un autre fichier donnerait une autre clé.
