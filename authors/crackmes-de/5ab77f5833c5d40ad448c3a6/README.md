# crackmes.de's patchit (`PATCHME.EXE`) by sas0

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3a6`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3a6) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | sas0 (site : crackmes.de) |
| **Plateforme** | MS-DOS 16 bits (EXE MZ, 935 octets), code auto-chiffré |
| **Type** | patch (changer le message d'échec en message de réussite) |
| **ZIP** | `patchIT.zip` (SHA-256 `4a62de87…8122`) → `readme.txt` + `PATCHME.EXE` (SHA-256 `8c54319a…b35c9`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/patchIT.zip` | archive d'origine (non modifiée) |
| `tools/patchit-solve.py` | génère le EXE patché (`-o`), `--check` = émulation unicorn avant/après |
| `analysis/PATCHME.patched.EXE` | résultat du patch (2 octets) |
| `analysis/patchme-decrypted-ndisasm.txt` | code déchiffré (dump mémoire après exécution + `ndisasm -b16`) |
| `analysis/readme-auteur.txt` | readme.txt de l'auteur |

## Réponse

Le programme affiche une bannière, attend une touche, puis affiche toujours « Nop this isn't the right msg ». Il faut le **patcher** pour obtenir « Good work you did it :) ».

**Patch (offsets dans `PATCHME.EXE`)** :

| Offset fichier | Avant | Après |
|---|---|---|
| `0x254` | `1F` | `1E` |
| `0x257` | `0F` | `FF` |

(c.-à-d. le dword chiffré en `0x254` passe de `0F27051F` à `FF27051E` ; une fois déchiffré par le programme, `mov eax,0x7C` devient `mov eax,0x6C`.)

```bash
python3 tools/patchit-solve.py --check     # écrit analysis/PATCHME.patched.EXE et vérifie
python3 tools/patchit-solve.py -q          # file+0x254: 0f27051f -> ff27051e
```

## Premier regard

```bash
unzip original/patchIT.zip -d /tmp/pit      # dans un dossier vierge
file /tmp/pit/PATCHME.EXE                   # MS-DOS executable, MZ for MS-DOS
```

- Header MZ : 0x20 paragraphes d'en-tête (image à `0x200`), `CS:IP = 0000:0000`, `SS=001B`, `SP=0400`, **une seule relocation** à l'offset `0x0001`, seg `0` (le `imm16` du premier `mov ax, …`).
- `strings` ne voit que trois messages en clair (à l'image `+0x100`) : la bannière, `Good work you did it :)` et `Nop this isn't the right msg`. Le code lui-même est du bruit : il est chiffré.

## Flow

1. `mov ax,0x10+S ; mov ds,ax` : grâce à la relocation, `DS = S+0x10`, donc `DS:0000` = image `+0x100` = les messages.
2. Quelques instructions **se modifient elles-mêmes** (`sub/xor/not dword [cs:…]`) : elles « réparent » les octets des instructions qui suivent (`call`, `mov ah,9 ; mov dx,0 ; int 21h` pour la bannière…).
3. `int 16h` (attente touche), puis `call 0x87` : routine de **déchiffrement dword par dword** de deux zones (`0x54..0x63`, 16 octets, et `0x64..0x83`, 32 octets).
4. Le code déchiffré en `0x55` fait `mov eax,0x7C ; push eax ; ret` → saut vers `0x7C` = affichage du **mauvais** message puis `int 21h/4Ch`.
5. Le bon bloc existe en `0x6C` : `mov ah,9 ; mov dx,0x6E ; int 21h` (« Good work… »), puis `mov eax,0x83 ; push eax ; ret` → `0x83 : exit`. Il n'est jamais atteint.

## Comment on trouve

**Ancrage** : pas d'outil DOS sous Linux ici (pas de DOSBox ; `wine` répond « DOS application, you need to install DOSBox »). On désassemble avec `ndisasm -b16` l'image (`tail -c +513 PATCHME.EXE`) puis on **émule avec Unicorn** (mode 16 bits, hook `INT 21h/16h`) pour obtenir le code déchiffré — l'équivalent d'un dump mémoire sous debugger.

```text
00000000  B81000            mov ax,0x10          ; imm16 relogé (+S) -> DS = S+0x10
00000006  662E812E1000C7F4B9E5  sub dword [cs:0x10],0xe5b9f4c7   ; décrypte le code en 0x10
00000010  AF F9 B9 D0 1E ...   ; => devient  E8 04 00 (call 0x17) / EB 1E (jmp 0x33)
```

Après exécution, le dump (`analysis/patchme-decrypted-ndisasm.txt`) montre la routine de déchiffrement :

```asm
0087  mov ebx,0x54 ; mov ecx,0x10            ; zone 1 : 4 dwords
0093  mov eax,[cs:ebx]
0098  jmp short +1 ; (octet poubelle 0x33)   ; anti-désassemblage
009B  ror eax,4
009F  sub eax,0x47852369
00A5  jmp short +1 ; (poubelle 0x15)
00A8  rol eax,4
00AC  not eax
00AF  xor eax,0x15935746
00B5  mov [cs:ebx],eax ; add ebx,4 ; sub ecx,4 ; jnz
; zone 2 (0x64, 32 octets) : add eax,0x30393632 ; ror 4 ; xor eax,0x48ac697b
```

**Décodage** : en appliquant la routine au dword chiffré `0F27051F` (image `+0x54`) on obtient `7CB86633`, soit les octets `33 66 B8 7C` : `33` est l'octet poubelle sauté par le `jmp short +1` en `0x52`, puis `66 B8 7C 00 00 00` = `mov eax, 0x7C`, suivi de `66 BB 6C 00 00 00` (`mov ebx,0x6C`, leurre) et `66 50 / C3` = `push eax / ret`.

Le piège : `ebx=0x6C` est un leurre, le saut utilise `eax`. La bonne cible est `0x6C` (code « Good work », `mov dx,0x6E` = `\r\n` avant le texte). Il faut donc `imm8: 7C → 6C`.

**Assemblage du patch** : la fonction de chiffrement est bijective, on l'inverse :

```python
plain = 0x7CB86633 -> 0x6CB86633
enc = rol(ror(~(plain ^ 0x15935746), 4) + 0x47852369, 4)   # = 0xFF27051E
```

Un seul octet clair change, mais la rotation de nibbles diffuse : 2 octets du fichier changent (`0x254`, `0x257`). Le reste du programme reste identique ; la zone 2 et les `not/xor` d'auto-réparation ne sont pas touchés.

## Vérification

```text
$ python3 tools/patchit-solve.py --check
patch: offset fichier 0x254, dword 0f27051f -> ff27051e
octets modifiés : 0x254:1f->1e, 0x257:0f->ff
original : Nop this isn't the right msg
patché   : Good work you did it :)
OK
```

Le test KO est l'exécution de l'original (« Nop this isn't the right msg »), le test OK celle du patché. **Limite honnête** : la vérification est faite par émulation Unicorn 16 bits (fichier EXE réel, relocation appliquée, INT 21h/16h émulés), pas sous DOS réel — DOSBox n'est pas installé et Wine ne lance pas les EXE DOS sans lui. Aucun GDB/x64dbg/IDA n'a été utilisé.

## Notes

- `original/` n'est pas modifié : le EXE patché est généré sous `analysis/`.
- La valeur du segment de chargement `S` n'importe pas tant que son octet bas est 0 (la relocation s'ajoute à l'`imm16` du `mov ax`) ; l'émulation prend `S=0x1000`.
- Variante possible : patcher le dispatcher plutôt que la donnée (p. ex. rendre le saut inconditionnel vers `0x6C`) — plus intrusif, car le code est chiffré.
