# vestige46's GetToKnow

| | |
|---|---|
| **ID** | [`698c7dbfa15272fa37a80c73`](https://crackmes.one/crackme/698c7dbfa15272fa37a80c73) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | vestige46 |
| **Plateforme** | Windows x86-64, console (MinGW-w64 / GCC 15.2, non packé) |
| **SHA-256** (`original/download.bin`) | `18b86e832cc89cebdd894fdf629d898ba2e422e025282f24787b9b0d55691b83` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive d'origine (en réalité un **ZIP chiffré**, voir pièges) — jamais modifiée |
| `analysis/extracted/GTK-v0.1.exe` | l'exe extrait (mot de passe ZIP `crackmes.one`) |
| `analysis/GTK.asm` | `objdump -d -M intel` complet |
| `tools/gettoknow-solve.py` | solveur + `--check` (émulation unicorn du vrai `main`) |

## Réponse

**Mot de passe : `1mN0TTh3PwTru5tM3`** (« 1mN0TTh3PwTru5tM3 » ≈ *I'm not the pwtrustme*, en leet). Pas de user/login : un seul champ.

```bash
python3 tools/gettoknow-solve.py -q        # 1mN0TTh3PwTru5tM3
python3 tools/gettoknow-solve.py --check   # émule main(): bon mot de passe -> "YOU DID IT! LETS GOOO", "petik" -> "Try again..."
```

## Premier regard

```bash
python3 -c "print(open('original/download.bin','rb').read(4))"   # b'PK\x03\x04' : ce n'est PAS un PE
7z x -pcrackmes.one -oanalysis/extracted original/download.bin    # -> GTK-v0.1.exe (137 836 o)
strings -n 6 analysis/extracted/GTK-v0.1.exe | head -20
```

- Le « .bin » est un ZIP chiffré (le script `add-crackme.sh` l'a conservé tel quel) ; `GTK-v0.1.exe` est un PE32+ MinGW, symboles `main` présents.
- Strings utiles : `Enter Password: `, `%s`, `YOU DID IT! LETS GOOO`, `Try again...`, `pause`.
- **Le mot de passe n'apparaît pas dans `strings`** : il est construit par des `mov` d'immediates sur la pile.

## Flow

`main` (0x140001450) : construit une C-string sur la pile, `puts("Enter Password: ")`, `scanf("%s", buf)`, `strcmp(secret, buf)` ; égal → « YOU DID IT! LETS GOOO », sinon « Try again... » ; puis `system("pause")`.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/extracted/GTK-v0.1.exe > analysis/GTK.asm`, puis on cherche `main` (symbole conservé) et le `.rdata` (`objdump -s -j .rdata`) pour relier les chaînes aux adresses (0x140004000 = « Enter Password: », 0x140004011 = `%s`, 0x140004014 = succès, 0x14000402a = échec).

```asm
140001450 <main>:
  14000145d: movabs rax,0x33685454304e6d31   ; octets LE : 31 6d 4e 30 54 54 68 33  = "1mN0TTh3"
  140001467: movabs rdx,0x4d74357572547750   ; octets LE : 50 77 54 72 75 35 74 4d  = "PwTru5tM"
  140001471: mov QWORD PTR [rbp-0x20],rax
  140001475: mov QWORD PTR [rbp-0x18],rdx
  140001479: mov WORD  PTR [rbp-0x10],0x33   ; 33 00 = "3" + NUL terminal
  ...
  14000149c: call scanf                      ; rdx = [rbp-0x60] (buffer saisi)
  1400014a1: lea rdx,[rbp-0x60]
  1400014a5: lea rax,[rbp-0x20]              ; secret reconstruit
  1400014ac: call strcmp                     ; strcmp(secret, saisie)
  1400014b4: cmp DWORD PTR [rbp-0x4],0
  1400014b8: jne 1400014cb                   ; != 0 -> "Try again..."
```

Décodage : les trois écritures consécutives en `[rbp-0x20]`, `[rbp-0x18]`, `[rbp-0x10]` forment un buffer contigu de 17 octets + NUL. Les immediates sont little-endian, donc on lit chaque octet à l'envers :

| Écriture | Immediate | Octets (LE) | ASCII |
|---|---|---|---|
| `[rbp-0x20]` | `0x33685454304e6d31` | 31 6d 4e 30 54 54 68 33 | `1mN0TTh3` |
| `[rbp-0x18]` | `0x4d74357572547750` | 50 77 54 72 75 35 74 4d | `PwTru5tM` |
| `[rbp-0x10]` | `0x0033` (word) | 33 00 | `3` + `\0` |

Concaténation : `1mN0TTh3` + `PwTru5tM` + `3` = **`1mN0TTh3PwTru5tM3`**. Le solveur refait exactement ce `struct.pack("<QQH", …)`.

Pièges :
- `strings` ne le montre pas (immediates dans des `movabs`, pas dans `.rdata`).
- `download.bin` est un ZIP, pas un exe : `file`/`diec` ne servent à rien avant l'extraction.
- Le `scanf("%s")` s'arrête au premier espace ; le mot de passe n'en contient pas, pas de souci.

## Vérification

Ni Wine ni GDB ne sont installés sur la machine de travail : **pas de session GDB**, donc pas de section « Debug GDB ». La preuve est une **émulation unicorn du vrai code** de `main` (le PE est mappé, `main` exécuté depuis 0x140001450 ; seuls les appels CRT `puts`/`scanf`/`strcmp`/`system`/`__main` sont remplacés par des stubs, ce qui laisse le code qui construit le secret sur la pile s'exécuter réellement) :

```text
$ python3 tools/gettoknow-solve.py --check
GetToKnow — mot de passe : 1mN0TTh3PwTru5tM3
OK  -> ['Enter Password: ', 'YOU DID IT! LETS GOOO']
KO  -> ['Enter Password: ', 'Try again...']      # saisie « petik »
check OK
```

Limite honnête : pas d'exécution native sous Wine ; la logique du check est triviale (un `strcmp` direct) et l'émulation la couvre.

## Notes

- Mot de passe statique, aucun calcul dépendant d'un user.
- Pas d'anti-debug, pas de packer.
