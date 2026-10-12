# crackme_1.0_by_c0de0f by c0de0f (crackmes.de)

« CrackMe 1.0 » — premier crackme de c0de0f (2002), « Ezi One ».

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c200>
- **Plateforme** : Windows **PE32** GUI, **Visual Basic 6 natif** (site : Unspecified/other) — difficulté 1.0
- **Archive** : `original/c0de0f_crackme_1.zip` → `CrackMe.exe` + `C0DE0F.NFO`
- **SHA-256 zip** : `40d6edde9d823227b38d6905926c13c88b77d8593f3e023fec0d936c3bbef5e6`
- **Statut** : résolu, vérifié **sous wine** (runtime VB6) : label « Great Job »

## Solution

Le check ne calcule pas un serial à partir du nom : il **déchiffre le serial** avec une petite routine
« Encrypt / Decrypt » du programme et compare le résultat au nom.

```
Decrypt(s) :  k1 = Asc(s[1]), k2 = Asc(s[2]), k3 = Asc(s[3]), k4 = Asc(dernier car.)
              corps = s[4 .. len-1]
              car. n° i du corps -> Chr(Asc(c) - clé[(i-1) mod 4])
Check      :  Decrypt(Serial) == Name   → « Great Job », sinon « Incorect Serial »
```

Donc n’importe quel `Encrypt(nom)` est un serial valide. Le keygen prend les **4 clés égales**
(64, `@`) : plus besoin de connaître l’ordre exact des clés, et chaque caractère `Asc(c)+64`
d’un nom en minuscules tombe dans `0xA0..0xFF` (Latin-1 = cp1252, donc tapable au clavier).

```
python3 tools/c0de0f-crackme-1-solve.py petik
@@@°¥´©«@
```

| Name | Serial |
|---|---|
| `petik` | `@@@°¥´©«@` |

## Comment on trouve

1. `diec` : VB6 *native* (6.00.8783). Chaînes UTF-16 : `Great Job`, `Incorect Serial`,
   `Error: Invalid text To Encrypt`, `Error: Invalid text To Decrypt` → il y a deux fonctions de (dé)chiffrement.
   Contrôles : `Text1`/`Text2` (Name, Serial), bouton *Check*, un label pour le résultat.
2. On annote les appels VB via l’IAT (`tools/vb-iat-objdump.py original/CrackMe.exe` : `objdump` + `pefile`,
   les thunks `jmp [IAT]` et les `call [IAT]` reçoivent le nom de l’import ; ordinaux MSVBVM60 :
   `ord516` = `Asc`, `ord608` = `Chr`, `ord617` = `Left`, `ord619` = `Right`, `ord632` = `Mid`).
3. Handler *Check* (`0x406cd0`) :
   - lit `Name.Text` → `[ebp-0x48]` (contrôle vtable `+0x304`) et `Serial.Text` → `[ebp-0x38]` (`+0x308`) ;
   - `call 0x407000` = **Encrypt(Name)** → résultat dans `[ebp-0x28]`, **jamais utilisé** (leurre) ;
   - `call 0x4078f0` = **Decrypt(Serial)** → `[ebp-0x18]` ;
   - `__vbaVarTstEq(Name, Decrypt(Serial))` (`0x406e5d`) : égal → `Caption = "Great Job"` sur le label résultat
     (`0x402910`, vtable `+0x54`), sinon « Incorect Serial ».
4. **Encrypt** (`0x407000`) : 4 clés `Int(Rnd*9)+32` (fonction `0x4081b0` : `Randomize`, `Rnd`, `Val`, `Int`),
   en-tête `Chr(k)×3`, puis pour chaque caractère `Chr(Asc(c) + clé[idx])` avec `idx` = 1→4 qui reboucle,
   et la 4ᵉ clé ajoutée à la fin.
5. **Decrypt** (`0x4078f0`) fait l’inverse : `Left(s,3)` → trois clés (`Left(·,1)`, `Mid(·,2,1)`, `Mid(·,3,1)`),
   `Right(s,1)` → quatrième, corps = `Mid(Left(s, Len(s)-1), 4)`, et `Chr(Asc(c) - clé)` (`__vbaVarSub`).
   Aucune contrainte sur les clés : on les choisit.

## Vérification

```
tools/verify-wine.sh petik '@@@°¥´©«@'  /tmp/ok.png    # label « Great Job »
tools/verify-wine.sh petik '@@@abcde@'  /tmp/ko.png    # label « Incorect Serial »
```

Binaire original (non patché) sous wine/Xvfb le 2026-10-12 : xdotool tape le nom et le serial
(clics relatifs à la fenêtre, `mousemove --window`), clique *Check*, puis capture la fenêtre.
Captures : [`analysis/great-job-petik.png`](analysis/great-job-petik.png),
[`analysis/incorect-serial.png`](analysis/incorect-serial.png).

Piège : un `xdotool windowmove` déplace la fenêtre X mais wine ne met pas à jour sa position interne,
les clics tombent alors à côté ; d’où les coordonnées relatives à la fenêtre.
