# firstcrackme (damiok) — crackmes.de

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c358`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c358) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de damiok) |
| **Plateforme** | Windows PE32 console, MinGW GCC 4.8.2 (`diec`) |
| **SHA-256 du ZIP** | `9dc8e17e02ad3eb2554544cf4e665ab1daf517f32e3588ae826ba2801431771a` |
| **SHA-256 de `a.exe`** | `29e849c0ce480750e4243b332880e3c03bfd53bcc0d3d61e5088e18de6a12267` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/a.zip` | archive d'origine (mot de passe ZIP `crackmes.one`), contient `a.exe` |
| `tools/firstcrackme-solve.py` | solveur (`-q`, `--check` = preuve Wine/xvfb) |

## Réponse

Crackme à mot de passe fixe (pas de nom d'utilisateur, donc pas de `petik` ici) :

> **`BombaDG`** (puis Entrée)

```bash
python3 tools/firstcrackme-solve.py --check
```

## Premier regard

```bash
unzip -P crackmes.one original/a.zip -d /tmp/fc   # hors du dépôt, original/ intact
file a.exe      # PE32 console, i386
diec a.exe      # MinGW GCC 4.8.2
strings -n 5 a.exe
```

`strings` donne `Enter password:`, `Wrong password`, `Password ok`, mais **aucune** trace du mot de passe : il est construit à l'exécution.

## Flow

`main` @ `0x4013e0` : boucle de 4 essais max. Chaque tour : `printf("Enter password:")`, `fgets(buf, 100, stdin)`, `strcmp(buf, secret)`. Égal → `puts("Password ok")` ; sinon `puts("Wrong password")`, compteur +1, et sortie (code −1) après le 4ᵉ échec.

## Comment on trouve

Ancrage : `objdump -d -M intel a.exe --start-address=0x4013e0 --stop-address=0x4014a0`.

```asm
4013fc: mov DWORD PTR [esp+0x83], 0x626d6f42   ; 4 premiers octets du secret
401407: mov DWORD PTR [esp+0x87], 0x0a474461   ; 4 suivants
401412: mov BYTE  PTR [esp+0x8b], 0x0          ; NUL final
...
40143e: call fgets          ; buf = [esp+0x1f], 100 octets
401443: lea eax,[esp+0x83]  ; secret
401455: call strcmp         ; strcmp(buf, secret)
40145a: test eax,eax / je   -> "Password ok"
```

Décodage des immediates (little-endian → ASCII) :

- `0x626d6f42` → octets `42 6f 6d 62` = `Bomb`
- `0x0a474461` → octets `61 44 47 0a` = `aDG` + `\n`

Le secret est donc `"BombaDG\n"` (8 octets + NUL). Piège : le `\n` final. `fgets` conserve le retour à la ligne du buffer, donc le `strcmp` réussit quand on tape `BombaDG` suivi d'Entrée — le `\n` est fourni par la touche Entrée, il ne faut pas le « taper » en plus. `strings` ne voit rien, car ces octets sont des immediates dans les `mov`, pas une chaîne dans `.rdata`.

## Vérification

```text
$ printf 'BombaDG\n' | xvfb-run -a wine a.exe
Enter password:Password ok

$ printf 'nope\n' | xvfb-run -a wine a.exe        # cas KO
Enter password:Wrong password   (×4, puis sortie)
```

`python3 tools/firstcrackme-solve.py --check` → `CHECK OK` (OK avec `BombaDG`, KO avec un mot de passe erroné).

## Notes

- Pas de GDB ni de debugger : reverse 100 % statique + preuve Wine.
- Pas d'anti-debug, pas de transformation du mot de passe saisi : comparaison directe.
