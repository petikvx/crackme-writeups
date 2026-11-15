# tenzo_aoki — Tenzo Crackme

| | |
|---|---|
| **ID** | [`69f114ad3fba64e45dcea925`](https://crackmes.one/crackme/69f114ad3fba64e45dcea925) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | tenzo_aoki |
| **Plateforme** | Windows PE64, console, MSVC 14.50 (C++/iostream) |
| **SHA-256 (`download.bin`)** | `6e0dc59c40d3d92453257316e1b5de4f8732dc112be7bc914d7d2ec2da3432c3` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | **ZIP** (mot de passe `crackmes.one`) contenant `TenzoCrackme.exe` (220 672 o) — non modifié |
| `tools/tenzo-crackme-solve.py` | solveur (inverse la boucle de check) + `--check` Wine |

## Réponse

**Mot de passe : `wowyoufoundit`** (13 caractères, pas de user/login — donc pas de `petik` ici).

```bash
python3 -I tools/tenzo-crackme-solve.py -q            # wowyoufoundit
python3 -I tools/tenzo-crackme-solve.py --check <TenzoCrackme.exe extrait>
```

## Premier regard

- `download.bin` n'est pas un PE mais un ZIP chiffré (`diec` : « ZIP ») ; extraction avec `crackmes.one` dans un dossier temporaire (hors `original/`).
- `diec` : PE64, MSVC 19.50, pas de packer. Aucune chaîne utile dans `strings` (ni ASCII ni UTF-16) : tous les messages sont **chiffrés** (tableaux d'immédiates `mov DWORD PTR [rbp-…], 0x…` déchiffrés à l'exécution par `0x140002eb0`).
- Wine : `== Tenzo Crackme ==` / `Enter password:` → `Nope. That password is wrong.`

## Flow

`main` = `0x140003da0` (trouvé en suivant `entry 0x14000700c → 0x140006e90`, le `call 0x140003da0` juste avant `exit`).

1. Affiche la bannière (chaîne déchiffrée).
2. **Anti-debug** : `IsDebuggerPresent` (`[0x140022000]`), `CheckRemoteDebuggerPresent` (`[0x140022008]`), `PEB->BeingDebugged` (`gs:0x60 → +2`). Si l'un est vrai → saute en `0x1400043f5` (message d'échec).
3. Lit la ligne (`getline`), calcule un hash décoratif (`imul 0x45d9f3b`, `rol`, `0x9e3779b9`, boucle « deadc0de » à `0x140004083`) dont le résultat n'influence pas le verdict.
4. **Longueur == 13** (`cmp r10,0xd` en `0x140004100`).
5. **Check principal** (boucle à état aplatie, `0x14000413e`–`0x140004199`), puis un 2ᵉ contrôle `call 0x140003920` (mélange de 8 constantes + `0x9e3779b9`, également validé par la même entrée).
6. `al != 0` → « Congrats! Access granted. », sinon « Nope. That password is wrong. ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel TenzoCrackme.exe` puis lecture de `main` (`0x140003da0`). Pas d'IDA disponible sur la machine (`decc` absent) : reverse 100 % `objdump`.

**Le dispatcher aplati.** Le contrôle par caractère est caché dans un pseudo-« switch » sur `eax` (valeurs 0x41 → 0x52/0x53 → 0x68) :

```asm
14000413e: mov  eax,0x41
140004143: sub  eax,0x41 ; je 1a0         ; état 0x41 : i<13 ? eax = (~i&1)+0x52 : fin
140004148: sub eax,0x11 ; je 15c          ; état 0x52 → corps
14000414d: sub eax,1    ; je 15c          ; état 0x53 → corps (même code)
140004152: cmp eax,0x15 ; jne fin         ; état 0x68 → i++ et retour à 0x41
```

Les états 0x52/0x53 (parité de `i`) mènent au **même corps** : le flattening n'ajoute que du bruit. Le corps (`0x14000415c`) :

```asm
movzx edx, [pw+i]
xor   dl, A[i]            ; A = 21 43 65 87 19 2b 3d 4f 51 62 73 84 95   ([rbp-0x59])
lea   eax,[i+3]; imul ecx,eax,0x11; add dl,cl   ; + (i+3)*0x11
ror   dl,5
mov   al,0xa5 ; sub al,i*7 ; xor dl,al           ; ^ (0xa5 - 7i)
xor   dl, B[i]            ; B = e9 1d ac b3 e6 b5 dc 22 93 a0 f8 86 56   ([rbp-0x19])
or    r9b, dl             ; accumulateur : doit rester 0
```

Les tableaux A et B sont les immédiates little-endian posés en `0x140004106`–`0x140004134` (`0x87654321`, `0x4f3d2b19`, `0x84736251`, `0x95` ; `0xb3ac1de9`, `0x22dcb5e6`, `0x86f8a093`, `0x56`).

**Inversion** (tout est bijectif octet par octet) : exiger `r9b == 0` ⇒ pour chaque `i`

```
x = B[i] ^ ((0xa5 - 7i) & 0xff)
x = rol8(x, 5)
x = (x - (i+3)*0x11) & 0xff
pw[i] = x ^ A[i]
```

Exemple `i=0` : `x = 0xe9 ^ 0xa5 = 0x4c` → `rol 5 = 0x89` → `- 0x33 = 0x56` → `^ 0x21 = 0x77` = `w`. Sur 13 positions : `wowyoufoundit`.

**Pièges** : (1) `download.bin` est un ZIP ; (2) aucune chaîne en clair ; (3) le hash « deadc0de » et les `xor` sur constantes ressemblent à la vraie vérif mais ne servent à rien ; (4) anti-debug (`IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, PEB) : le mauvais message s'affiche si on trace sans les contourner — pas de GDB utilisé ici (preuve via Wine seulement).

## Vérification

```text
$ echo wowyoufoundit | xvfb-run -a wine TenzoCrackme.exe
== Tenzo Crackme ==
Enter password:
Congrats! Access granted. You found the right password.

$ echo wrongpass | xvfb-run -a wine TenzoCrackme.exe
Nope. That password is wrong.
```

`tools/tenzo-crackme-solve.py --check` rejoue le cas OK et sort `check: OK`.

## Notes

- Le 2ᵉ contrôle (`0x140003920`) n'a pas été inversé : `wowyoufoundit` le passe en pratique (accès accordé par le binaire), donc il ne contraint pas davantage la solution trouvée ; l'unicité n'est pas prouvée.
- Aucune modification du binaire d'origine.
