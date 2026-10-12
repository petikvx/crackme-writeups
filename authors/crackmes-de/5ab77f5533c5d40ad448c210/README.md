# super_funky_0.82 by bswap (crackmes.de)

« Keygen Me Super funky 0.82 » de Bswap (Hollande, 2003), MASM, « not packed or protected ». Goal : *find the right
combination to unlock the code, and make the notice say "Registered"* — sans patcher. En récompense, un code qui
déverrouille l’archive des sources fournie (`SourceKM082.zip`, chiffrée ZipCrypto).

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c210> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM 6.14, non packé) — difficulté 2.0
- **Archive** : `original/superfunky082.zip` → `SuperFunky082.exe`, `Read Me.txt`, `SourceKM082.zip`
- **SHA-256 zip** : `ee516dce8300b710f937df22a1c7adba9d7ec26087a5bfccf575ea6dea884893`
- **Statut** : résolu (keyfile maker), vérifié **sous wine/Xvfb** sur le binaire original : « Registered!, Unlock code:
  AABSWAZPP », et ce code ouvre bien `SourceKM082.zip`

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/SuperFunky082.exe` | binaire d’origine (non patché) |
| `original/SourceKM082.zip` | sources de l’auteur, mot de passe = unlock code |
| `tools/superfunky082-solve.py` | générateur de keyfile `Bswap.2003` + `--check` (réimplémentation du check) |
| `tools/dropfile.c` | petit outil Win32 (mingw) qui envoie un `WM_DROPFILES` au dialogue |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + `dropfile.exe`, lit les contrôles |
| `analysis/Bswap.2003-petik` | keyfile généré pour `petik` / `Paris` |
| `analysis/registered-petik.png` | capture après le drop |

## Réponse

Il n’y a **aucune saisie** : les champs Name / City / Key sont désactivés. On **glisse-dépose un fichier** sur la
fenêtre ; son nom doit finir par `Bswap.2003` et ses 60 premiers octets portent nom, ville et contrôles.

```
$ python3 tools/superfunky082-solve.py petik Paris
Keyfile Bswap.2003 (60 o) :
43 6f 6f 6c 29 44 75 64 65 2d 7c 41 20 0c ea 36 16 70 65 74 69 6b 20 20 20 20 20 20 20 20 20 00
50 61 72 69 73 20 20 20 20 20 20 20 20 20 00 0a 00 10 00 00 fd 9b 00 00 81 27 39 31
$ tools/verify-wine.sh petik Paris
ctrl 11: Registered!, Unlock code: AABSWAZPP
ctrl 20: petik
ctrl 21: Paris
ctrl 22: 54235-U-kji
$ 7z t -pAABSWAZPP original/SourceKM082.zip   → Everything is Ok
```

## Premier regard

```
$ file original/SuperFunky082.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
$ diec …  → MASM 6.14 / MASM32, Microsoft Linker 5.12
```

- Imports parlants : `DragQueryFileA` (shell32), `CreateFileA` / `GetFileSize` / `ReadFile`, `CreateThread` / `Sleep`.
  Pas de `GetDlgItemText` : le crackme ne lit rien au clavier.
- Bouton Hint : « So you need a hint this quick, just look at the WM_COMMAND. » (fausse piste, le vrai code est dans
  `WM_DROPFILES`).
- Chaînes `54235-U-kji`, `59328-P-tdw`, `53673-Q-pol` noyées dans le code (sautées par des `jmp`).

## Comment on trouve

1. **Ancrage** : le DlgProc (`0x401030`) teste `uMsg` en cascade ; la branche `cmp [ebp+0xc], 0x233`
   (`WM_DROPFILES`, `0x401210`) appelle `DragQueryFileA` puis `CreateFileA` sur le chemin déposé.

2. **Nom du fichier** (`0x4012a6`) : on se place à `len-10`, on saute un `B`, puis `bswap` des dwords comparés à
   `0x73776170` (« swap ») et `0x32303033` (« 2003 ») ⇒ le chemin doit finir par **`Bswap.2003`**.

3. **Contenu** : `ReadFile` de `0x3c` octets vers `0x4030db` (buffer mis à zéro avant). Les tests, offset dans le fichier :

   ```asm
   401308 mov eax,[0x4030db] / mov ebx,[0x4030e0] / bswap ×2
   401317 cmp eax,'Cool' ; cmp ebx,'Dude'          ; [0:4]="Cool", [5:9]="Dude" (octet 4 libre)
   40135e SetDlgItemText(11, "Ok, you are in now registering")
   40137c mov ecx,2 / mov esi,0x4030e4 / mov edi,0x401373 / repe cmpsd
                                                    ; [9:17] = 8 octets du CODE à 0x401373 : 2d 7c 41 20 0c ea 36 16
   401393 mov byte [0x4030fa],0 / [0x403109],0      ; termine nom [17:31] et ville [32:46]
   4013a1 SetDlgItemText(20, nom) / (21, ville)
   4013c9 mov dl,[0x40310a] : 0x0a / 0x14 / 0x1e   ; [47] choisit la « Key » affichée (54235-U-kji / 59328-P-tdw / 53673-Q-pol)
   401457 d=[0x40310b] ; ((d & 0x11001100)|0x101) bswap |0x101 == 0x01110101
                                                    ; ⇒ octet [49] bit 4 = 1, octet [51] bit 4 = 0 → 00 10 00 00
   40147c d=[0x40310f] ; ((d ^ 0x1999) & 0x18af6) | 0x0a (dl) == 0x826e
                                                    ; ⇒ (d^0x1999)&0x18af6 = 0x8264 → d = 0x9bfd
   40149e c=[0x403113] ; somme des 60 octets − 60, xor c == 0x313929e9
   ```

   Les 8 octets de `[9:17]` sont une astuce : `0x401373` est une instruction « morte » (`sub eax, 0xc20417c` +
   `jmp far`) jamais exécutée, juste là pour servir de référence. On les lit tels quels dans le PE.

4. **Checksum auto-référent** : le dword `c` fait lui-même partie des 60 octets sommés. Comme la somme est < `0x10000`,
   `c` vaut forcément `0x3139xxxx` (« 1991 » côté fichier de l’auteur). Le solveur cherche le point fixe sur les 16 bits
   bas et, si aucun n’existe, ajuste l’octet libre `[4]` (ici `0x29`).

5. **Récompense** (`0x4014f7`) : 0x27 octets copiés depuis `0x4014cf`, XOR `[0]` (= `'C'`) sur les indices 1..0x23 ⇒
   « Registered!, Unlock code: AABSWAAPP ». Puis un **thread** (`0x401697`) remplace l’octet `0x20` par `'Z'` si
   l’octet `[5]` vaut `'D'` ⇒ le vrai code est **`AABSWAZPP`** (la version XOR seule ne déchiffre pas le zip, piège
   pour qui s’arrête à l’analyse statique du XOR).

## Vérification live (wine)

Sous Xvfb il n’y a pas d’explorateur pour un vrai glisser-déposer, d’où `tools/dropfile.c` : il trouve le dialogue
(`#32770`), écrit une structure `DROPFILES` **dans la mémoire du processus cible** (`VirtualAllocEx` +
`WriteProcessMemory`, un `HDROP` étant local au processus) et poste `WM_DROPFILES`. Le crackme exécute alors son vrai
chemin de code, non modifié. `verify-wine.sh` relit les contrôles 11/20/21/22 et fait la capture
`analysis/registered-petik.png`. Contre-épreuve : le fichier de l’auteur (`Bswap.2003`, dans les sources déchiffrées)
passe aussi `--check`.
