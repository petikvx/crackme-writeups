# crackmes.de's .net_anarchy by sas0

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3a4`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3a4) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (crackme de *sas0*) |
| **Plateforme** | .NET 2.0 console, PE32 (x86) |
| **SHA-256 (zip)** | `d77ede5143fc95b02da5787ca3294759717d82627a5a4767cf72d1a4870a4a18` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/NET_Anarchy.zip` | archive d'origine (mot de passe `crackmes.one`) : `Anarchy.exe` + `readme.txt` |
| `analysis/Anarchy.il` | listing IL (`ilspycmd -il`) |
| `tools/net-anarchy-solve.py` | keygen + `--check` (port Python du prédicat) |

## Réponse

Pas de nom/login : le code ne dépend de rien (le serial est le même pour `petik`).

| Code | |
|---|---|
| **`.NET-Gac6`** | minimal (1 groupe) |
| **`.NET-8puBf_Vf`** | 2 groupes (sortie par défaut du solveur) |

```bash
python3 tools/net-anarchy-solve.py            # code = .NET-8puBf_Vf
python3 tools/net-anarchy-solve.py -q -n 3 --seed 7
python3 tools/net-anarchy-solve.py --check '.NET-Gac6'
```

Format : `.NET-` + N groupes de 4 caractères (N ≥ 1) ; la partie 1 est fixe, la partie 2 est libre sous contraintes (beaucoup de solutions).

## Premier regard

```bash
unzip -P crackmes.one original/NET_Anarchy.zip -d /tmp/na
file /tmp/na/Anarchy.exe     # PE32 console, Mono/.Net assembly
strings -n 5 /tmp/na/Anarchy.exe   # "Enter code: ", "Code is invalid", "Congratulation..."
~/.dotnet/tools/ilspycmd -il /tmp/na/Anarchy.exe > analysis/Anarchy.il
```

Le readme annonce « deux parties, la première triviale ». `ilspycmd -p` (C#) ne rend que `Main` et `CreateNa` : le décompilé C# est peu lisible (XOR/`not` opaques, `DynamicMethod`), j'ai donc travaillé sur l'**IL** directement.

## Flow

1. `Console.ReadLine()` → `Split("-", RemoveEmptyEntries)` ;
2. contrôles sur la partie 1 (4 caractères, reverse de bits) ;
3. la partie 2 est découpée en groupes de 4 octets, validés par 6 petits delegates `NETAnarchyFun(int,int)` créés à l'exécution par `CreateNa()` via `DynamicMethod` + `DynamicILInfo.SetCode(bytes)` — d'où le « anarchy » : le code des delegates n'existe nulle part dans les métadonnées, seulement sous forme d'**entiers** passés à `BitConverter.GetBytes`/`Buffer.BlockCopy`.

## Comment on trouve

### Partie 1 (`Main`, IL_0054…IL_00d8)

```
split.Length ^ 5 ^ 7 == 0        → Length == 2   (5^7 = 2)
((p0.Length << 4) ~) ^ 191 (u1)  → ~(16L)&0xFF == 0xBF → L ≡ 4 (mod 16) → L == 4
v = BitConverter.ToUInt32(ASCII(p0))
boucle i=1..32 : si v&1 : r |= 1 << ((32-i)&31) ; v >>= 1       → r = bit-reverse(v)
((-1953669675 = 0x8B8D5DD5) ^ r) + 1 == 0  → r = ~0x8B8D5DD5 = 0x7472A22A
```

Inversion : `rev32(0x7472A22A) = 0x54454E2E` → octets LE `2E 4E 45 54` = **`.NET`**. Pas de piège de signe : on teste `r ^ C == 0xFFFFFFFF`.

### Les 6 delegates (`CreateNa`)

Chaque bloc écrit des entiers dans un buffer `byte[]` (initialement 11 octets, redimensionné ensuite par `Array.Resize` — **les octets restants d'avant persistent**, piège à ne pas oublier) puis `SetCode(buf, maxstack 2)`. Reconstitution du buffer (little-endian) et désassemblage CIL :

| idx | octets | CIL | sens |
|---|---|---|---|
| 0 | `02 20 00000000ff 5f 1f 18 64 2a` | `ldarg.0; ldc.i4 0xFF000000; and; ldc.i4.s 24; shr; ret` | b3 (octet 3) |
| 1 | `02 20 ff000000 5f 2a` | `ldarg.0; ldc.i4 0xFF; and; ret` | b0 |
| 2 | `02 03 61 2a` | `ldarg.0; ldarg.1; xor; ret` | `a ^ b` |
| 3 | `02 20 0000ff00… 5f 1f 10 64 2a` | `& 0x00FF0000 >> 16` | b2 |
| 4 | `02 20 00ff0000… 5f 1f 08 64 2a` | `& 0xFF00 >> 8` | b1 |
| 5 | `02 18 5a 1f 7f 5e 2a` | `ldarg.0; ldc.i4.2; mul; ldc.i4.s 127; rem.un; ret` | `(2a) % 127` |

(Les index 0/3/4/1/2/5 suivent l'ordre des `stelem` dans `CreateNa`, pas l'ordre de construction. Le décalage final est arithmétique mais les caractères sont ASCII < 0x80.)

### Partie 2 (boucle IL_0119…IL_0265)

`Length % 4 == 0`, `n = Length/4` groupes ; pour chaque groupe `i`, `a = ToInt32(4 octets ASCII)` = `b0 | b1<<8 | b2<<16 | b3<<24`. Le test `1 == (i & 1)` saute vers la branche impaire :

- **i pair** : `((b3 ^ b0) * 2) % 127 == b2` **et** `(b3 + b0 + b2) % 127 == b1` ;
- **i impair** : `b3 ^ b2 == 48` **et** `b0 ^ b1 == 57`.

Dans chaque cas, 2 contraintes sur 4 octets : on choisit b0, b3 libres, les deux autres en découlent (le solveur énumère les caractères imprimables, `random.choice` avec `--seed`).

Exemple, groupe 0 de `.NET-Gac6` : `G=0x47(b0) a=0x61(b1) c=0x63(b2) 6=0x36(b3)` → `(0x36^0x47)*2 = 0x71*2=226 %127 = 99 = 'c'` ✔, `(0x36+0x47+0x63)%127 = 0x120 %127 = 97 = 'a'` ✔.

## Vérification

Wine (`xvfb-run -a wine Anarchy.exe`) **ne fonctionne pas** ici : le runtime .NET 2.0 de Wine fait un `stack overflow` dès le lancement (`err:virtual:virtual_setup_exception stack overflow`), aucune sortie. Preuve live faite avec le `Anarchy.exe` **d'origine, non modifié**, via le runtime .NET 8 (copie dans un dossier temporaire + `Anarchy.runtimeconfig.json`) ; `DynamicILInfo` y fonctionne :

```bash
mkdir /tmp/na_run && cp /tmp/na/Anarchy.exe /tmp/na_run/ && cd /tmp/na_run
echo '{"runtimeOptions":{"tfm":"net8.0","framework":{"name":"Microsoft.NETCore.App","version":"8.0.0"}}}' > Anarchy.runtimeconfig.json
echo '.NET-Gac6'      | dotnet Anarchy.exe   # Congratulation, the code is right
echo '.NET-8puBf_Vf'  | dotnet Anarchy.exe   # Congratulation, the code is right
echo '.NET-Gac7'      | dotnet Anarchy.exe   # Code is invalid   (b1 modifié)
echo 'x-y'            | dotnet Anarchy.exe   # Code is invalid
```

## Notes

- Aucun GDB/x64dbg/IDA utilisé : reverse 100 % statique (IL) + exécution du binaire d'origine.
- Piège principal : le buffer d'IL est **réutilisé** entre delegates (`Resize` tronque/étend sans effacer) ; sans ça les octets 8-10 des delegates 1/2/5 sont faux.
- Le vrai « trivial » est la partie 1 (`.NET`) ; la partie 2 est un système de contraintes sous-déterminé → plusieurs codes valides.
