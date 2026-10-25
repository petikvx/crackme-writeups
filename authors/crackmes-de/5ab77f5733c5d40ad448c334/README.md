# crackmes.de's am0k_crackme_2 by am0k

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c334`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c334) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | am0k (crackmes.de) |
| **Plateforme** | Windows PE32 (i386), GUI, MSVC 6 (Linker 5.12) |
| **SHA-256 (zip)** | `14e069c5432fe9d20d1e1d4d8ae336a582b990c94a2afc06825733f7608bd503` (mot de passe zip : `crackmes.one`) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Am0kCM_2.zip` | archive d'origine (contient `Am0kCM_2.exe`, jamais modifié) |
| `tools/am0k-crackme2-solve.py` | génère le binaire patché (depuis le zip, en mémoire) et vérifie sous Wine (`--check`) |
| `analysis/Am0kCM_2.patched.exe` | résultat du patch (2 × `jne` → `nop nop`) |

## Réponse

**Il n'y a ni nom ni serial** : le programme n'a aucune saisie, il affiche directement une MessageBox. Le chemin « Good Job » est mathématiquement inatteignable, la solution est donc un **patch** de 4 octets :

| VA | Fichier (VA−0x400000) | Avant | Après |
|---|---|---|---|
| `0x401018` | `0x1018` | `75 1e` (`jne bad`) | `90 90` |
| `0x40101d` | `0x101d` | `75 19` (`jne bad`) | `90 90` |

```bash
python3 tools/am0k-crackme2-solve.py --check     # (exemple petik : sans objet, aucun champ de saisie)
```

## Premier regard

```bash
unzip -P crackmes.one original/Am0kCM_2.zip -d /tmp/am0k     # extraction hors du dépôt
file /tmp/am0k/Am0kCM_2.exe     # PE32 GUI i386, 4 sections
diec  /tmp/am0k/Am0kCM_2.exe    # MSVC 6 / Linker 5.12, pas de packer
strings -n 3 /tmp/am0k/Am0kCM_2.exe | grep -iE "job|crack"
```

Imports : `USER32` (MessageBoxA) et `KERNEL32` seulement — pas de `GetDlgItemText`, pas de dialogue. Strings utiles : `Hehe, don't stop trying :P\nStill not cracked..` / `Bad Job` et `You re one the good way to become a cracker ;)` / `Good Job`.

## Flow

Le CRT MSVC (entry `0x401088`) appelle `WinMain` en `0x401000` (`call 0x401000` en `0x401151`).

## Comment on trouve

`objdump -d -M intel --start-address=0x401000` :

```asm
401000: push 0x4876e7ff
401005: call 0x401060        ; srand(0x4876e7ff)  -> [0x4050a4] = seed
40100d: call 0x40106a        ; rand()
401012: cdq                  ; edx = signe d'eax
401013: cmp eax,0x4876e7ff
401018: jne 0x401038         ; -> "Bad Job"
40101a: cmp edx,0x17
40101d: jne 0x401038
401021: MessageBoxA("You re one the good way...", "Good Job")
401038: MessageBoxA("Hehe, don't stop trying :P\nStill not cracked..", "Bad Job")
```

- `0x401060` stocke l'argument dans la variable globale `0x4050a4` : c'est `srand`.
- `0x40106a` est le LCG de la MSVCRT : `seed = seed*0x343fd + 0x269ec3 ; return (seed >> 16) & 0x7fff` : c'est `rand()`.
- Donc `eax ∈ [0, 0x7fff]` alors que le test exige `eax == 0x4876e7ff` ⇒ jamais vrai. De plus `cdq` d'une valeur positive donne `edx = 0`, jamais `0x17`. Les deux tests sont indépendamment impossibles, et la seed ne change rien.
- Aucune autre entrée (pas de contrôle, pas de ligne de commande utilisée) : le crackme est un « patchme ». Le choix le plus propre : neutraliser les deux `jne` (le `cmp` devient sans effet), on tombe dans le bloc « Good Job ».

Piège : on peut croire à un keygen en voyant `srand` + valeur magique ; la plage de `rand()` (15 bits) l'exclut.

## Vérification

`tools/am0k-crackme2-solve.py --check` lance chaque exe sous `xvfb-run -a wine` avec `WINEDEBUG=+relay` et relève l'appel `MessageBoxA` :

```text
orig    -> MessageBoxA(0, "Hehe, don't stop trying :P\nStill not cracked..", "Bad Job", 0)
patched -> MessageBoxA(0, "You re one the good way to become a cracker ;)", "Good Job", 0)
```

Cas KO = binaire d'origine (Bad Job), cas OK = binaire patché (Good Job). Pas de session GDB ni de debugger live : reverse statique + trace Wine.

## Notes

- Le patch est appliqué sur une copie sous `analysis/` ; `original/` n'est pas touché.
- Alternative équivalente : changer le saut `75` en `EB`/`74` ne suffit pas pour le second test ; NOP des deux est le plus simple.
