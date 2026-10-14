# crackmes.de's guys_first_crackme by guy_

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2a4`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2a4) |
| **Auteur (site)** | crackmes.de (auteur original : Guy) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 x86, **C++/CLI mixed-mode** (.NET CLR 2.0 + code natif, VS2008) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `0b53144a208591e96724e2794e491e7260c309be400c50ac8a59b949ba3df54d` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Guy___s_First_Crackme.zip` | archive crackmes.one (mot de passe `crackmes.one`) |
| `original/My First Crackme.exe` | binaire (49152 octets, fenêtre « Furious Siberian Tiger ») |
| `original/readme.txt` | readme de l'auteur (exemple `John` / `1b1f`) |
| `analysis/my-first-crackme.ilspy.cs` | décompilation ILSpy de la partie managée |
| `analysis/getserial-0x402410.asm` | désassemblage de la fonction native `getserial` |
| `analysis/emu-getserial.txt` | sortie de l'exécution Unicorn du code original |
| `tools/guys_first_crackme-solve.py` | keygen (`-q`, `--check`) |
| `tools/emu-getserial.py` | exécute `getserial` **du binaire original** sous Unicorn |

## Réponse

Keygen : `serial = getserial(nom)`, transformation octet par octet.

Exemple : **`petik` → `xJpzr`** (et l'exemple de l'auteur `John` → `1b1f` est retrouvé).

```bash
python3 tools/guys_first_crackme-solve.py            # name='petik' serial=xJpzr
python3 tools/guys_first_crackme-solve.py -q John    # 1b1f
python3 tools/guys_first_crackme-solve.py --check xJpzr   # OK
```

## Premier regard

```
$ file "My First Crackme.exe"
PE32 executable for MS Windows 5.00 (GUI), Intel i386 Mono/.Net assembly, 5 sections
$ diec "My First Crackme.exe"
Linker: Microsoft Linker(9.00.30729) / Compiler: Microsoft Visual C/C++(15.00.30729)[LTCG/C++]
Library: .NET Framework(CLR 2.0.50727) / Tool: Microsoft Visual Studio(2008)
$ strings -el "My First Crackme.exe"
The C++ module failed to load ...   ← runtime C++/CLI (mixed-mode)
Incorrect serial. / Nicely done. / Name: / Serial: / Validate! / Furious Siberian Tiger
```

Le readme annonce « managed and unmanaged code, plenty of anti-debug code,
executable integrity checks » : c'est un assembly **C++/CLI**. ILSpy décompile la
partie managée (WinForms, anti-debug), mais les fonctions marquées
`MethodImplOptions.Unmanaged / MethodCodeType.Native` n'ont pas d'IL : il faut
lire leur x86.

## Flow

1. `Form1_Load` → `Initialize()` (natif) : anti-debug (`CheckRemoteDebugger`,
   `SetStackTrap`, `RmHeaderInfo` qui efface l'en-tête PE, thread `CheckThread`
   qui énumère modules / threads / régions et compare le code à une copie).
2. Clic sur **Validate!** — handler (nommé `label1_Click` par l'auteur, les noms de
   contrôles sont volontairement mélangés : `button1` = TextBox du nom,
   `label3` = TextBox du serial) :

```csharp
sbyte* ptr  = (sbyte*)Marshal.StringToHGlobalAnsi(button1.Text);   // nom
sbyte* ptr2 = (sbyte*)Marshal.StringToHGlobalAnsi(label3.Text);    // serial
byte nice = (byte)((strcmp(getserial(ptr), ptr2) != 0) ? 1 : 0);
_MessageBox.Text = rock(nice != 0);   // 1 → "Incorrect serial.", 0 → "Nicely done."
```

Le prédicat est donc `strcmp(getserial(nom), serial) == 0`.

## Comment on trouve le prédicat

### Ancrage

```bash
ilspycmd "original/My First Crackme.exe" > analysis/my-first-crackme.ilspy.cs
```

`getserial` apparaît comme `public unsafe static extern sbyte* getserial(sbyte*)`
(sans corps). Son RVA est dans la table `MethodDef` des métadonnées (lue avec
`dnfile`) : `getserial` → **RVA 0x2410**, soit **VA 0x402410** (ImageBase 0x400000).

```bash
objdump -d -M intel --start-address=0x402410 --stop-address=0x402515 "original/My First Crackme.exe"
```

### Lecture de `getserial` (VA 0x402410, cdecl, modifie la chaîne en place)

```asm
40241d..402435: for (i = 0; i < strlen(s); i++)        ; strlen = thunk 0x4021dc
402441: movsx eax,[s+i] ; xor eax,33h ; mov [s+i],al    ; c ^= 0x33
402455: mov al,[s+i]    ; shl al,1    ; mov [s+i],al    ; c <<= 1   (8 bits)
402467: movsx eax,[s+i] ; xor eax,89h ; mov [s+i],al    ; c ^= 0x89
40247d: test eax,eax ; jne → ; mov byte [s+i],'a'       ; if (c == 0) c = 'a'
40248d: cmp (signed)c,41h ; jge → ; shl c,1 ; jmp 40248d ; while (c < 'A') c <<= 1
4024af: cmp (signed)c,7Ah ; jle → ; sar c,1 ; jmp 4024af ; while (c > 'z') c >>= 1
4024d1: if (c > 'z' || c < 'A') c = '1'                  ; garde-fou final
4024fb: s[strlen(s)] = 0 ; return s
```

Points importants :

- tous les tests sont **signés** (`movsx`, `jge`/`jle`) : un octet ≥ 0x80 est
  négatif, donc « < 'A' » et repasse dans la boucle `shl` ;
- la boucle `sar` ne s'exécute qu'une fois pour 0x7B..0x7F et donne 0x3D..0x3F,
  donc **< 'A'** : c'est le cas qui produit le `'1'` final (ex. `J` de `John` :
  0x4A^0x33=0x79 → 0xF2 → ^0x89=0x7B → sar → 0x3D → `'1'`) ;
- la plage `[0x5B..0x60]` (`[ \ ] ^ _ \``) est acceptée : le serial n'est pas
  forcément alphanumérique.

### Exemple `petik`

| c | `^0x33` | `<<1` | `^0x89` | boucles | résultat |
|---|---|---|---|---|---|
| `p` 0x70 | 0x43 | 0x86 | 0x0F | shl ×3 → 0x78 | `x` |
| `e` 0x65 | 0x56 | 0xAC | 0x25 | shl ×1 → 0x4A | `J` |
| `t` 0x74 | 0x47 | 0x8E | 0x07 | shl ×4 → 0x70 | `p` |
| `i` 0x69 | 0x5A | 0xB4 | 0x3D | shl ×1 → 0x7A | `z` |
| `k` 0x6B | 0x58 | 0xB0 | 0x39 | shl ×1 → 0x72 | `r` |

→ **`xJpzr`**.

## Vérification

1. **Exemple de l'auteur** : le keygen redonne `John` → `1b1f` (readme).
2. **Exécution du code original** : `tools/emu-getserial.py` charge le PE avec
   `pefile`, mappe l'image dans **Unicorn**, émule `strlen` (thunk 0x4021dc) et
   exécute les octets réels de `getserial` à 0x402410 :

```
$ python3 tools/emu-getserial.py John petik AndSoOn Guy 'zZ09~'
John -> 1b1f
petik -> xJpzr
AndSoOn -> mfNIbqf
Guy -> aPt
zZ09~ -> l[xtL
```

   identique au keygen Python sur ces 5 noms.
3. `getserial` n'est **pas** modifiée au runtime : le seul `VirtualProtect` +
   `memset` (`RmHeaderInfo`) vise 0x4000EA (en-tête PE), et `CheckThread` ne fait
   que comparer le code à une copie (intégrité).

**Limite** : sous Wine (CLR 4 natif du préfixe) la fenêtre ne s'affiche pas — le
processus se termine au démarrage (anti-debug / environnement mixed-mode), donc pas
de capture GUI « Nicely done. ». La preuve repose sur l'exécution émulée de la
fonction native d'origine + l'exemple officiel de l'auteur.

## Notes

- **Caractères qui bloquent le crackme** : `7` et `w` (ASCII imprimable). Ex. `7` :
  0x37^0x33 = 0x04 → 0x08 → ^0x89 = 0x81 (négatif) → `shl` : 0x02, 0x04 … 0x40,
  0x80 (négatif), **0x00** → `0 < 'A'` pour toujours : boucle infinie dans le
  binaire. Le keygen lève une erreur pour ces noms.
- Le `'a'` de remplacement (c == 0 après le XOR) n'est atteint que si
  `((c^0x33)<<1) == 0x89`, impossible (valeur paire) : code mort.
- Patches autorisés par l'auteur, mais le keygen est trivial une fois `getserial`
  localisée via les métadonnées.
