# m477hi45 — first_crackme_asm (`crackme1.exe`)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3de`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3de) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | m477hi45 (famille locale `crackmes-de`) |
| **Plateforme** | DOS, fichier `.COM` 16 bits (382 octets) déguisé en `.exe` |
| **SHA-256 zip** | `59dcc388…2719` |
| **SHA-256 `crackme1.exe`** | `78b1cee1130a3ea90d9b562de3e0a2cec671207060d2115d24971285dc05f97a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme1_1.zip` | archive d'origine (non modifiée) : `crackme1.exe` + `readme.txt` |
| `analysis/extracted/` | contenu dézippé (copie de travail) |
| `tools/m477hi45-first-crackme-solve.py` | solveur + vérification `--check` (émulation Unicorn 16 bits) |

## Réponse

**Serial (4 touches) : `2a69`**

```bash
python3 tools/m477hi45-first-crackme-solve.py --check
```

(Pas de username : le crackme ne demande que 4 frappes, donc pas de `petik` ici.)

## Premier regard

```bash
unzip original/crackme1_1.zip -d analysis/extracted
file analysis/extracted/crackme1.exe   # COM executable for DOS
strings -n 3 analysis/extracted/crackme1.exe
```

Le `readme.txt` annonce : « 4 key strokes… compared with the hardcoded key ». Les strings sont terminées par `$` (fonction DOS `int 21h/AH=09h`) : `## ENTER SERIAL CODE ##`, `You entered the right serial!`, `Wrong Serial Code!`.

## Flow

Un `.COM` est chargé en `CS:0100h` : l'offset fichier N correspond à l'adresse `0100h+N`. On désassemble donc en brut :

```bash
objdump -D -b binary -mi8086 -M intel analysis/extracted/crackme1.exe
```

Il faut ignorer les `mov ah,4Ch` sans `int 21h` derrière : le code ne termine pas, il retombe simplement sur l'instruction suivante (leurre). Le vrai flot : bannières → `call 7a` (affiche un `\r\n`) ×2 → `cl='0'` → affichage du prompt → 4 lectures `int 21h/AH=01h` (getchar avec écho) → test de `cl`.

## Comment on trouve

Chaque touche est comparée à une constante, et si elle est égale on fait `inc cl` (compteur initialisé à `0x30`). **Un mauvais caractère n'arrête rien** : on continue simplement sans incrémenter. À la fin, `cmp cl,0x34` : il faut les 4 bonnes touches.

1. **Touche 1** (offset `0x2d`–`0x3d`) : le piège est le « push/pop » :
   ```asm
   push 3030h ; push 3830h ; push 3230h ; push 3530h
   pop cx     ; cx = 3530h   (dernier push)
   pop cx     ; cx = 3230h   → ch = 0x32
   cmp ch, al ; touche 1 == '2' ?   (le `je 97` → inc cl)
   ```
   Les 4 immediates sont des leurres (`strings` voit même `h00h08h02h05` : opcode `68h` + octets) ; seul le 2ᵉ pop compte : `ch = 0x32 = '2'`.
2. **Touche 2** : `cmp ch,61h` → `'a'`.
3. **Touche 3** : `bh=38h ; dec bh ; dec bh` → `36h` = `'6'`.
4. **Touche 4** : `bh=36h ; inc×3 ; dec ; inc` = `36h+3-1+1 = 39h` = `'9'`.
5. `cmp cl,34h` en `0x70` : `cl = 0x30+4` ⇒ branche « right serial » (`0x86`) ; sinon `jne 0xab` → « Wrong Serial Code! ».

Résultat : `2` `a` `6` `9` → **`2a69`**.

## Vérification

Pas de DOSBox disponible ici ; preuve par émulation Unicorn (mode 16 bits, `int 21h` AH=01/09 simulés) du binaire d'origine extrait du zip :

```text
$ python3 tools/m477hi45-first-crackme-solve.py --check
Serial : 2a69
OK  : True | You entered the right serial!
KO  : True            # "2a6x" → "Wrong Serial Code!"
```

Aucune session GDB / debugger live : reverse purement statique + émulation.

## Notes

- Le fichier est un COM, pas un PE : Wine/`xvfb-run` ne s'applique pas (NTVDM absent sous Linux).
- Le fait que les erreurs ne coupent pas le flot signifie qu'il n'y a pas de test d'ordre ; seul le nombre de bonnes touches (4) compte, chaque position ayant sa propre constante.
