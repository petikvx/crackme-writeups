# micky23310's HiddenFlag

| | |
|---|---|
| **ID** | [`6aeed49ec0ad374eab08168d`](https://crackmes.one/crackme/6aeed49ec0ad374eab08168d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | micky23310 |
| **Plateforme** | Windows PE64 console, C++ (MinGW-w64 GCC 16.2, stripped) |
| **SHA-256** | `9975b7834f0b08db4865f2cf62493697e142281bd2e0521d6f3330db9a553bae` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/HiddenFlag.exe` | binaire d'origine (non modifié) |
| `tools/hiddenflag-solve.py` | solveur (`--check` : preuve sous Wine) |

## Réponse

**`CMO{X64_X0R_1s_A_G00d_St4rt}`**

```bash
python3 -I tools/hiddenflag-solve.py --check
```

(Pas de champ user/login : l'exemple `petik` ne s'applique pas. `CMO{petik}` est refusé, cf. vérification.)

## Premier regard

- `file` : PE32+ console x86-64 ; `strings` : bannière « Hidden Flag », « Flag format: CMO{...} », « Correct! You found the hidden flag. » / « Wrong flag. Try again. », runtime MinGW-w64 GCC 16.2.
- Pas de packer. Sous Wine : lit une ligne sur stdin (`std::getline`), sinon « No input. ».

## Flow

`main` (VA `0x140001802`) : affiche la bannière, lit la ligne, retire un éventuel `\r` final, appelle la fonction de check `0x140001760` ; `al=1` → « Correct! », sinon « Wrong flag ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/HiddenFlag.exe`, puis recherche de l'adresse de la chaîne de bannière `0x1400ce070` → `main` en `0x140001812`. L'appel juste avant « Correct » (`0x1400018db: call 0x140001760`) est le check. Juste avant la bannière dans `.rdata`, `0x1400ce050` contient 28 octets sans aspect de texte : la table de comparaison.

**Le check** (`0x140001760`) :

```asm
call  0x140032230          ; std::string::size()
cmp   rax,0x1c             ; longueur obligatoire = 28
...
movzx eax,BYTE PTR [rax]   ; c = flag[i]  (operator[])
xor   eax,0x5a             ; c ^ 0x5a
lea   eax,[rcx+rcx*2]      ; 3*i  (ecx + 2*ecx)
add   eax,edx              ; (c^0x5a) + 3*i
mov   [rbp-0xa],al         ; tronqué à 8 bits
lea   rcx,[rip+0xcc881]    ; 0x1400ce050 (table)
... cmp [rbp-0xa], table[i] ; sinon return 0
```

Pseudo-code : `for i in 0..27: if ((flag[i] ^ 0x5a) + 3*i) & 0xff != T[i]: return false`.

**Inversion** : `flag[i] = ((T[i] - 3*i) & 0xff) ^ 0x5a`, avec
`T = 19 1a 1b 2a 0e 7b 80 1a 1a 85 26 26 8f 50 2f 48 35 50 a0 a3 7a 44 4b 73 b6 73 7c 78`.
Ex. `i=0` : `0x19 ^ 0x5a = 0x43 = 'C'` ; `i=1` : `(0x1a-3) ^ 0x5a = 0x17^0x5a = 0x4d = 'M'` ; `i=2` : `(0x1b-6)=0x15 ^ 0x5a = 0x4f = 'O'`.
Le résultat commence bien par `CMO{` et finit par `}`, ce qui valide le sens de l'inversion.

**Pièges** : la longueur (0x1c) est vérifiée avant ; le `\r` final est supprimé par `main` ; l'« hidden » du titre ne correspond ici qu'à une table de constantes non lisible dans `strings` (je n'ai pas trouvé d'altération de la table à l'exécution : la valeur obtenue statiquement est acceptée telle quelle par le binaire).

Pas de session GDB ni x64dbg/IDA : reverse statique `objdump` + preuve Wine.

## Vérification

```text
$ echo 'CMO{X64_X0R_1s_A_G00d_St4rt}' | xvfb-run -a wine original/HiddenFlag.exe
Enter flag: Correct! You found the hidden flag.
$ echo 'CMO{petik}' | xvfb-run -a wine original/HiddenFlag.exe
Enter flag: Wrong flag. Try again.
```

## Notes

Aucun patch du binaire (le crackme l'interdit). Flag = leet de « X64 XOR is a good start ».
