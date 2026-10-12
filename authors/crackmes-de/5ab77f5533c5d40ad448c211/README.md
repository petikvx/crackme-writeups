# keygenme_0.51 by bswap (crackmes.de)

« CrackMe 0.51 » de Bswap (2002) : « a simple asm Keygenme », MASM 7.0, packé **FSG** « pour réduire la taille ».
Goal : *make a keymaker*.

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c211> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM, packé FSG 1.0) — difficulté 1.0
- **Archive** : `original/keygenme051.zip` → `Keygenme051.exe` + `Bswap.txt`
- **SHA-256 zip** : `93736de3b1ec83e4fbcbcef0c95e34ea8e3d97a6b27780dac64c8808b2d0287b`
- **Statut** : résolu (keymaker), vérifié **sous wine/Xvfb** sur le binaire original : « You are Registered !!! »

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Keygenme051.exe` | binaire d’origine (non patché, packé FSG) |
| `tools/unfsg-unicorn.py` | dé-FSG par émulation Unicorn (repris de [crackme_0.68](../5ab77f5533c5d40ad448c20c/), IAT du stub lue avec pefile) |
| `analysis/Keygenme051-unfsg.bin` | image mémoire dépackée (base `0x400000`, OEP `0x401000`) |
| `tools/keygenme051-solve.py` | keymaker + `--check` : émule le **vrai** code de calcul de l’image dépackée |
| `tools/dlgdrive.c` | petit outil Win32 (mingw) : remplit Name/Key, envoie le clic « Register », relit le statut |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + `dlgdrive.exe` |
| `analysis/registered-petik.png` / `analysis/ko-petik.png` | captures OK / KO |

## Réponse

| Name | Registration |
|---|---|
| `petik` | **`xaa11111aa11a`** (le 1er caractère est libre) |
| `petik` | `x111111111111` → KO |

```
$ python3 tools/keygenme051-solve.py petik
Name = petik
Key  = xaa11111aa11a
check: OK
$ tools/verify-wine.sh petik xaa11111aa11a
avant :  Status : Unregistered
apres : You are Registered !!!
```

## Premier regard

```
$ file original/Keygenme051.exe     → PE32 executable (GUI) Intel 80386, 2 sections
$ diec original/Keygenme051.exe     → Packer: FSG(1.0)
```

Deux sections sans nom, seule import `LoadLibraryA` / `GetProcAddress` : on dépacke avant de lire quoi que ce soit.

## Comment on trouve

1. **Dépack** : `tools/unfsg-unicorn.py` émule le stub FSG depuis l’EP `0x408405`, simule `LoadLibraryA` /
   `GetProcAddress` (adresses factices `0x7f00xxxx` journalisées) et s’arrête au premier saut dans la section 1 :
   **OEP `0x401000`**. On dumpe l’image → `analysis/Keygenme051-unfsg.bin`. On repère l’IAT reconstruite
   (`GetDlgItemTextA` = slot `0x402054`, thunk `jmp [..]` en `0x401bba`) puis ses deux appels `0x4011c3` / `0x4011f3`.

2. **Lecture** (branche `WM_COMMAND`, bouton `0x65`) :

   ```asm
   4011c3 GetDlgItemTextA(hDlg, 0x2d, 0x403092, 0x21)   ; Name
   4011f3 GetDlgItemTextA(hDlg, 0x2e, 0x4030b3, 0x21)   ; Key
   ```

   Piège : ces buffers ne sont **pas** vides au départ. `0x403092` contient `iTisgrEattobyjdsfdsfa32002098734`,
   `0x4030b3` contient `jdsfdsfa320020987jdsfdsfa3200209`. `GetDlgItemTextA` n’écrit que le texte + `\0`, donc avec
   `petik` le calcul porte sur `petik\0Eattobyjdsf…`. (Un premier keymaker qui remettait les buffers à zéro donnait
   `xaa11111aaaaa`, refusé live : c’est ce qui a fait trouver le piège.)

3. **Moulinette** `0x401217..0x4013ee` : 4 dwords du buffer nom (`bswap`, une boucle `+1` jusqu’à dépasser la valeur
   d’origine, `sar`, `and`, `idiv` par 14/12/13/11…). Le résultat réécrit `0x403092..0x4030b1`. Plutôt que de
   réécrire ces ~80 instructions en Python (et de risquer une erreur sur un `sar ecx, 0x8f` masqué à 5 bits), le
   solveur **émule ce code tel quel** avec Unicorn sur l’image dépackée.

4. **Mise en bits** puis comparaison :

   ```asm
   4013fc mov eax,[ecx+0x4030b2] / xor al,0x30 ...      ; clé : c ^= 0x30
   40141d cmp byte [ebp-0x41],0x50 / jae → 0 sinon 1    ; bit clé = (c ^ 0x30) < 0x50
   401444 cmp …,0xc1 / jbe → 0 ; cmp …,0xf0 / jae → 0   ; bit nom = 0xc1 < b < 0xf0
   401466 [0x4030b4] == [0x403094] ; [0x4030b8] == [0x403098] ; [0x4030bc] == [0x40309c]
   4014b0 SetDlgItemText(0x37, "You are Registered !!!")
   ```

   ⇒ `clé[1..12]` doit reproduire les 12 bits `nom[2..13]`. `'1'` (`0x31 ^ 0x30 = 1 < 0x50`) code un 1,
   `'a'` (`0x61 ^ 0x30 = 0x51`) code un 0. `clé[0]` n’est jamais testé.

5. **Remarque** : la boucle `+1` de `0x40124c` tourne jusqu’à ce que `bswap(dword0)+k` dépasse `dword0` (signé). Pour
   un nom dont le 1er dword « bswappé » est plus petit (ex. `Bswap…`), ça fait des centaines de millions de tours :
   le crackme rame et l’émulation aussi. Avec `petik` c’est immédiat.

## Vérification live (wine)

`tools/dlgdrive.c` trouve le dialogue (celui qui a les contrôles `0x2d` / `0x2e`), y met nom et clé par `WM_SETTEXT`,
envoie `WM_COMMAND 0x65` (le bouton « Register ») et relit le statut `0x37`. C’est le binaire original packé qui
tourne, sans modification. Résultat : « You are Registered !!! » pour `petik` / `xaa11111aa11a`, « Status :
Unregistered » pour `petik` / `x111111111111`.
