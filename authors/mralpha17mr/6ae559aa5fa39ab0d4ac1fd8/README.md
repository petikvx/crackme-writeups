# mrAlpha17mr's mothlight

| | |
|---|---|
| **ID** | [`6ae559aa5fa39ab0d4ac1fd8`](https://crackmes.one/crackme/6ae559aa5fa39ab0d4ac1fd8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | mrAlpha17mr |
| **Plateforme** | Windows PE64 console, non packé, non strippé de ses `.data` (3 sections) |
| **SHA-256 (zip)** | `1ff9209b0571bd845ac58fb44367769c436d530cce2dbfbdd43e597c06201f00` |
| **SHA-256 (exe)** | `d95bfa459bee870501e3db7bdc384fa8c4f40f72146f9b05136d49e047c62f5f` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/upload-mothlight.zip` | archive d'origine (mdp `crackmes.one`) |
| `original/mothlight.exe`, `original/README.txt` | contenu extrait |
| `analysis/mothlight.objdump.asm` | `objdump -d -M intel` complet |
| `tools/mothlight-solve.py` | keygen (`-q`, `--check` via Wine) |

## Réponse

```bash
python3 tools/mothlight-solve.py --name petik        # name=petik  serial=ML-85B5-54A6-E67E
python3 tools/mothlight-solve.py --name CrackMes1 --check
```

| name | serial | sortie |
|---|---|---|
| `petik` | `ML-85B5-54A6-E67E` | `The moth lands. Lantern CMO{F53EB7B4}.` |
| `CrackMes1` | `ML-1F57-0F11-C79E` | `The moth lands. Lantern CMO{AEA8CD56}.` |

Le jeton `CMO{…}` dépend uniquement du serial (voir plus bas).

## Premier regard

- `file` : PE32+ console x86-64, 3 sections (`.text`, `.data`, `.pdata`), imports `kernel32` (ReadFile/WriteFile/GetStdHandle/ExitProcess) + `msvcrt`.
- `strings` : bannière ASCII-art, messages d'erreur, et `ML-DEAD-BEEF-0451` (leurre annoncé par le README de l'auteur). Le message de succès n'apparaît **pas** en clair : il est chiffré en `.data` (`0x402000`), donc patcher un saut ne sert à rien.
- Le README du challenge donne le format : nom 3–20 caractères `[A-Za-z0-9 -]`, serial `ML-XXXX-YYYY-ZZZZ`.

## Flow

`entry 0x401dd0` → `0x401b36` (main) :

1. `0x4010b5` lit une ligne sur stdin (saute `\r`, arrêt sur `\n`, max 0x50) ; deux appels : nom puis serial.
2. `0x401204` valide le nom : longueur 3..20, caractères `A-Za-z0-9 -`, au moins une lettre.
3. `0x401664` valide la forme du serial : longueur 17, `M`,`L`,`-` en 0..2, `-` en 7 et 12, puis 3 groupes de 4 hex parsés par `0x4015c1` (via `0x40153c`, nibble par nibble).
4. `0x401336` calcule trois mots 16 bits à partir du nom.
5. `0x4018ec` compare, puis construit/affiche la phrase si tout colle.

## Comment on trouve

### Ancrage
`objdump -d -M intel original/mothlight.exe` ; code généré par un compilateur maison (prologues `push rbp / sub rsp`, tout passe par r10/r11). La fonction clé est `0x401336` (3 boucles sur le nom), appelée depuis main en `0x401d64`.

### Les trois passes (`0x401336`)
Chaque caractère est d'abord passé par `0x4011cd` (= `toupper`, `a-z → -0x20`), d'où l'insensibilité à la casse.

```asm
mov eax,0x811c9dc5          ; passe 1 : FNV-1a forward   -> h (32 bits)
 xor eax,c ; imul eax,0x1000193
...
xor ecx,0x4d4c ; imul ecx,0x9e37 ; shr ecx,16 ; and 0xffff   ; A = ((h^0x4d4c)*0x9e37)>>16
```
```asm
mov eax,0x6d6f7468          ; passe 2 : de len-1 à 0
 xor s,(c+0x20) ; rol s,5 ; add s,0x9e3779b9
...
xor s,(h>>16) ; and 0xffff                                   ; B
```
```asm
t = (len<<8) + upper(name[0])   ; passe 3 : dépend de la position
 t += c*(i+3) ; t = t*0x21 + 0x17
...
t ^ (h & 0xffff) ^ 0x17a1 ; and 0xffff                       ; C
```

Résumé (voir `keys()` dans le solveur) : **A** = FNV-1a forward, **B** = rotation 5 en marche arrière mêlée à `h>>16`, **C** = somme pondérée par la position mêlée à `h&0xffff`.

### L'ordre des groupes (piège du hint)
Dans main, les pointeurs passés à `0x401664` (`r8=&[rbp-0xb8]`, `r9=&[rbp-0xba]`, 5ᵉ arg `=&[rbp-0xbc]`) et le stockage dans `0x401664` (`[rbp+0x30]=g1`, `[rbp+0x20]=g2`, `[rbp+0x28]=g3`) donnent : `[bc]=g1`, `[b8]=g2`, `[ba]=g3`. Le compare de `0x4018ec` :

```asm
(A ^ g2) | (B ^ g3) | (C ^ g1) == 0
```
Donc **g1 = C, g2 = A, g3 = B** → `ML-<C>-<A>-<B>` (« les groupes ne sont pas dans l'ordre des passes »).

### Message de succès
`0x4018ec` appelle `0x4017df` (LCG `x = x*0x19660d + 0x3c6ef35f`, graine `(A<<16)^(B<<8)^C^0xc3a55a17`, octet = `(x>>16)&0xff`) avec les valeurs **du serial** puis avec celles **calculées** ; le message affiché = `data[i] ^ 0x6b ^ ks1[i] ^ ks2[i]`. Si le serial est faux, les deux keystreams diffèrent (de toute façon on sort avant), s'il est bon ils s'annulent. Le jeton de 8 hex vient de `0x4017ad` : `(g2<<16)^(g3<<8)^g1^0xa17e4c01` rendu via la table `0123456789ABCDEF` (`0x40223c`). Conclusion : **le jeton ne dépend que du serial**, et un `jz` patché afficherait un message déchiffré avec de mauvaises clés.

### Pièges
- Les trois groupes ne sont pas dans l'ordre des passes (cf. ci-dessus).
- Le leurre `ML-DEAD-BEEF-0451` est juste une chaîne de la bannière.
- Les multiplications sont des `imul` 32 bits tronquées : masquer à 32 bits à chaque étape en Python.
- `A` utilise le `h` final de la passe 1, `B` et `C` aussi (`h>>16`, `h&0xffff`).

## Vérification (Wine)

```text
$ python3 tools/mothlight-solve.py --name petik --check
name=petik  serial=ML-85B5-54A6-E67E
name> serial> The moth lands. Lantern CMO{F53EB7B4}.

$ python3 tools/mothlight-solve.py --name CrackMes1 --check
name> serial> The moth lands. Lantern CMO{AEA8CD56}.

$ printf 'petik\nML-0000-0000-0000\n' | xvfb-run -a wine original/mothlight.exe
... The moth circles and does not land.

$ printf 'pe!\n' | xvfb-run -a wine original/mothlight.exe
... The porch light ignores that name.
```

## Notes

Reverse 100 % statique (objdump) + preuve Wine ; ni GDB, ni debugger live, ni IDA n'ont servi.
