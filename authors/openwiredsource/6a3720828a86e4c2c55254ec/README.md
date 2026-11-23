# OpenWiredSource's The Wired

| | |
|---|---|
| **ID** | [`6a3720828a86e4c2c55254ec`](https://crackmes.one/crackme/6a3720828a86e4c2c55254ec) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | OpenWiredSource (local : `openwiredsource`) |
| **Plateforme** | ELF 64-bit PIE, x86-64, stripped, dynamique (libc) |
| **SHA-256** | `a88e98bdcc899a25b5d6a65ab339eb842c1c5f2efe4b592a35f2bbde3c3108a1` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/thewired` | binaire d'origine (non modifié, **pas** exécutable dans le dépôt : `chmod +x` sur une copie) |
| `tools/thewired-solve.py` | extrait le mot de passe du binaire ; `--check` le teste sur une copie |

## Réponse

Le mot de passe se passe **en argument** (pas de prompt, pas de username) :

```
./thewired we_all_love_serial_experiments_lain
```

**`we_all_love_serial_experiments_lain`**

```bash
python3 -I tools/thewired-solve.py [-q] [--check]
```

## Premier regard

```
$ file original/thewired
ELF 64-bit LSB pie executable, x86-64, ... dynamically linked, stripped
$ strings -n 5 original/thewired
fopen fwrite strcmp printf puts ... lain_is_here.png  KXONTRS ...
```

Imports : `fopen/fwrite/fclose` (le binaire dépose un `lain_is_here.png` dans le cwd à chaque lancement — fond d'écran, sans rapport avec le check), `strcmp`, `puts/printf`. Aucun message lisible dans `strings` : tous les textes sont chiffrés. Sans argument : `[-] The Wired is just a higher field of reality`.

## Flow

1. `main` (`0x10c0`) copie 12 octets de « clé » depuis `.data` vers un buffer (`0x2f758`), appelle `0x1600` (écrit le PNG).
2. Anti-debug **statique/naïf** : parcourt une table de 9 offsets (`0x45`, …) et regarde si `byte[0x1380 + off] == 0xcc` (breakpoint logiciel posé dans la fonction de check). Si oui → affiche « denies debugging » (`0x2f6d0` déchiffré).
3. Sinon `0x1380(argc, argv)` :
   - `argc != 2` → message « just a higher field of reality » ;
   - sinon déchiffre 36 octets (`0x4120`) avec la clé, `strcmp(argv[1], déchiffré)` ;
   - égal → déchiffre 0xad octets (`0x4060`) et `printf` le banner `ACCESS GRANTED` ; sinon `[-] Incorrect Password`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/thewired`, check dans la fonction `0x1380` ; l'unique `strcmp` est en `0x14b6`.

Boucle de déchiffrement (identique 5 fois pour chaque message, seuls la source et la longueur changent) :

```asm
1480: mov rax,rcx ; mul rdi(0xaaaaaaaaaaaaaaab) ; shr rdx,3 ; lea rax,[rdx+rdx*2] ; shl rax,2
      ; rcx % 12  (division par 12 via multiplication magique)
1498: movzx eax,BYTE [rbx+rdx]   ; key[i % 12]   (rbx = 0x2f758)
149c: xor   al,BYTE [r8+rcx]     ; ^ blob[i]     (r8 = 0x4120)
14a0: mov   [rsi+rcx],al
14a7: cmp rcx,0x24               ; 36 octets
14b6: call strcmp(argv[1], buf)
```

Donc `plain[i] = blob[i] ^ key[i % 12]`.

**La clé** : `0x1600`/`main` copient 4+2+4+2 octets depuis `0x2f6ca`, `0x2f6ce`, `0x2f6c4`, `0x2f6c8` vers `0x2f758..0x2f763`. Ces adresses pointent dans la table de noms de sections (`.shstrtab`) du fichier, qui contient `…ersion.gnu.v…` : la clé reconstruite est `b'.gnu.version'` (12 octets, d'où le `% 12`). C'est le piège : aucune chaîne « clé » évidente, il faut suivre les lectures.

Offset fichier = vaddr − 0x1000 pour le segment RW (`readelf -lW`).

**Assemblage** (blob `0x4120`, 36 octets, dernier = `\0` écrit en `[rsp+0x24]`) :

```python
key = d[0x2f6ca-0x1000:+4] + d[0x2f6ce-0x1000:+2] + d[0x2f6c4-0x1000:+4] + d[0x2f6c8-0x1000:+2]  # b'.gnu.version'
pw  = bytes(key[i%12] ^ blob[i] for i in range(36))   # b'we_all_love_serial_experiments_lain'
```

Les autres blobs avec la même clé donnent les messages : `0x2f720` (0x30) « just a higher field of reality », `0x2f6d0` (0x1f) « denies debugging », `0x2f6f0` (0x17) « Incorrect Password », `0x4060` (0xad) le banner de succès.

**Pièges** : pas de `strings` utile ; clé cachée dans les noms de sections ; la détection de `0xcc` ne se déclenche que si on pose un breakpoint logiciel dans `0x1380` (utiliser un hw breakpoint ou ne pas debugger). Reverse 100 % statique + exécution : pas de session GDB.

## Vérification

Sur une copie exécutable (le binaire écrit `lain_is_here.png` dans le cwd) :

```
$ ./thewired we_all_love_serial_experiments_lain
================================
          THE WIRED
================================

ACCESS GRANTED

Welcome to The Wired.

Everyone is connected.

[ONLINE]

$ ./thewired wrong
[-] Incorrect Password

$ ./thewired
[-] The Wired is just a higher field of reality
```

`python3 -I tools/thewired-solve.py --check` → `check '…': OK` pour le bon mot de passe et pour `wrong`.

## Notes

- Pas de username : l'exemple `petik` ne s'applique pas.
- Le code de retour est toujours 0, succès ou échec : se fier au texte.
