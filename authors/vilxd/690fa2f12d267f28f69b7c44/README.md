# vilxd's crack the points

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/690fa2f12d267f28f69b7c44) · id `690fa2f12d267f28f69b7c44`

Crackme **Windows** PE64 (MinGW-w64, console) : `point-cracker.exe`. Auteur : **vilxd**.
[Série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/download.bin`](original/download.bin) | ZIP du site (mot de passe `crackmes.one`) |
| `analysis/extracted/point-cracker.exe` | exe extrait (non patché) |
| `analysis/point-cracker-patched.exe` | exe patché généré par le solveur |
| [`tools/point-cracker-solve.py`](tools/point-cracker-solve.py) | patcher + `--check` sous Wine |

## Réponse

Il n'y a pas de serial : le programme affiche `Your count points is 0` et le but est de **changer les points**. Pas d'utilisateur à saisir (donc pas de `petik` ici).

| | |
|---|---|
| Patch | `e8 1e fe fe ff 31 d2` (`call __main ; xor edx,edx`) → `ba 65 00 00 00 90 90` (`mov edx,101`) |
| Offset | VA `0x140011924` = offset fichier `0x10d24` |
| Résultat | **`Your count points is 101`** |

```bash
python3 -I tools/point-cracker-solve.py --check     # --points N pour une autre valeur
# Your count points is 101
# OK
```

## 1. Premier regard

```bash
diec original/download.bin            # ZIP
7z x -pcrackmes.one -oanalysis/extracted original/download.bin
diec analysis/extracted/point-cracker.exe   # PE64, MinGW
strings -n 4 point-cracker.exe | grep -i point   # "Your count points is %d"
xvfb-run -a wine point-cracker.exe </dev/null     # Your count points is 0
```

Le `.bin` téléchargé est en fait un ZIP contenant un seul exe. Les strings utiles : `Your count points is %d` et `%d` (format du scanf). Le reste est du CRT MinGW.

## 2. Flow

Le binaire est minuscule côté logique. `main` @ `0x140011920` (`objdump -d -M intel --start-address=0x140011920 --stop-address=0x140011950`) :

```asm
140011924: call __main                 ; init CRT MinGW
140011929: xor  edx,edx                ; <-- points = 0
14001192b: lea  rcx,[rip+0x16ce]       ; "Your count points is %d"
140011932: call printf.constprop.0
140011937: lea  rcx,[rip+0x16da]       ; "%d"
14001193e: call scanf.constprop.0      ; attend Entrée (pas de destination)
140011943: xor  eax,eax
140011949: ret
```

## 3. Comment on trouve

1. `main` est repérable via `__tmainCRTStartup` : `call main` @ `0x14000133b`, avec `argc/argv/envp` dans `ecx/rdx/r8`.
2. Les points ne sont pas stockés dans une variable : c'est l'argument `edx` de `printf` (2e argument, Windows x64), mis à zéro par `xor edx,edx` (2 octets, `31 d2`).
3. Remplacer seulement ces 2 octets ne suffit pas : un `mov edx,imm32` fait 5 octets. L'instruction juste avant, `call __main` (5 octets), n'est pas indispensable ici : le CRT a déjà fait ses `_initterm` dans `__tmainCRTStartup` et `__main` ne sert qu'aux constructeurs globaux, absents dans ce programme C. On écrase donc les 7 octets `call + xor` par `ba imm32` + 2 `nop`.
4. Le `scanf("%d")` final n'a pas d'argument de sortie : il ne sert qu'à garder la console ouverte.

Piège : la première tentative avec un simple `mov dl,N` laisse les bits hauts de `edx` indéfinis, car `__main` les écrase.

## 4. Vérification

```bash
python3 -I tools/point-cracker-solve.py --check
# Your count points is 101  / OK
python3 -I tools/point-cracker-solve.py --points 9999 --check
# Your count points is 9999 / OK
xvfb-run -a wine analysis/extracted/point-cracker.exe </dev/null
# Your count points is 0     (KO : exe d'origine inchangé)
```

Preuve live : Wine (`xvfb-run`), pas de GDB ni de debugger MCP utilisé (reverse statique + Wine).

## 5. Notes

- L'énoncé exact n'est pas dans le zip ; par analogie avec les autres crackmes de vilxd (« points > 100 »), la valeur par défaut est 101, mais `--points` accepte n'importe quel entier.
- Le patch est appliqué à une copie en mémoire puis écrit sous `analysis/` ; `original/` n'est jamais modifié.
