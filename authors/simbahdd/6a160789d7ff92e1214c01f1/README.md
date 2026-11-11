# SimbaHDD's easy crackme

| | |
|---|---|
| **ID** | [`6a160789d7ff92e1214c01f1`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a160789d7ff92e1214c01f1) |
| **Auteur** | SimbaHDD (`simbahdd`) |
| **Plateforme** | Windows, .NET (PE32, CLR v4.0.30319), console |
| **SHA-256** (`download.bin`) | `d75efe12be96ffafedb04b5c2e74e36140dfaa58411e7e593525dcda9232d0ec` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mot de passe `crackmes.one`) contenant `crack_me.exe` (4096 o) |
| `tools/easy-solve.py` | extrait le littéral base64, le décode, `--check` rejoue le binaire via `dotnet` |

## Réponse

**Password : `crackme12345simba`**

```bash
python3 -I tools/easy-solve.py -q          # crackme12345simba
python3 -I tools/easy-solve.py --check     # rejoue crack_me.exe : CORRECT / WRONG
```

(Pas de champ user : le crackme ne demande qu'un mot de passe. Contre-exemple testé : `petik` → `WRONG!`.)

## Premier regard

- `download.bin` commence par `PK` : c'est un ZIP **chiffré** (flag bit 0), `unzip -P crackmes.one`. Il contient `crack_me.exe`.
- `objdump -x` : PE32 i386, entry `0x40251e` = `_CorExeMain` (import `mscoree.dll`) → **.NET**. `strings` montre `BSJB`, `v4.0.30319`, et dans le heap `#Strings` : `Convert`, `ToBase64String`, `Encoding.get_UTF8`, `GetBytes`, `op_Equality`, `ReadKey`.
- Pas de `wine`/`ilspycmd` sur la machine de travail : IL lu à la main, preuve live avec le host `dotnet` (comme pour *very easy crackme*).

## Flow

```
Console.Write("Enter password: ")
s = Console.ReadLine()
b64 = Convert.ToBase64String(Encoding.UTF8.GetBytes(s))
if (b64 == "<littéral>") { Console.ForegroundColor = …; WriteLine("CORRECT!") }
else                      { Console.ForegroundColor = …; WriteLine("WRONG!") }
Console.ReadKey()
```

## Comment on trouve

1. **Ancrage** : le corps de `Main` est en `.text` à `0x402050` (RVA `0x2050`, header méthode tiny/fat `13 30`). Les tokens `0x70000001` / `0x70000033` / `0x70000055` / `0x70000067` sont des `ldstr` vers le heap `#US` (racine metadata `0x2d4`, `#US` à `+0x378`).
2. **Lecture de l'IL** (`objdump -d` n'est pas un désassembleur IL, on décode les octets) :
   ```
   72 01000070        ldstr  #US:1      ; littéral base64
   0a                 stloc.0
   72 33000070        ldstr  #US:0x33   ; "Enter password: "
   28 03000000a       call   Console.Write
   28 04 00 00 0a     call   Console.ReadLine
   0b                 stloc.1
   28 05 00 00 0a     call   Encoding.get_UTF8
   07 6f 06 00 00 0a  ldloc.1 ; callvirt GetBytes
   28 07 00 00 0a     call   Convert.ToBase64String
   0c                 stloc.2
   08 06 28 09 00 00 0a   ldloc.2 ; ldloc.0 ; call String.op_Equality
   16 fe 01           ldc.i4.0 ; ceq     ; inverse le résultat
   0d 09 2d 17        stloc.3 ; ldloc.3 ; brtrue.s → branche WRONG
   ```
   Donc la saisie est encodée UTF-8 → base64 puis comparée au littéral de `loc0`.
3. **Littéral** : dans `#US`, entrée à l'offset 1 : `31 | Y 3 J h Y 2 t t Z T E y M z Q 1 c 2 l t Y m E =`. Premier octet `0x31` = longueur (49 = 24 car. UTF-16 + 1 terminateur) — piège : `strings -el` le colle au texte et affiche `1Y3Jh…`.
4. **Décodage** : `Y3JhY2ttZTEyMzQ1c2ltYmE=` → base64 → `crackme12345simba`. Comme le check est base64(UTF8(x)) == littéral et que base64 est bijectif, le password est unique.

Exemple étape par étape : `crackme12345simba` → UTF-8 `63 72 61 63 6b 6d 65 31 32 33 34 35 73 69 6d 62 61` → base64 `Y3JhY2ttZTEyMzQ1c2ltYmE=` ✔ ; `petik` → `cGV0aWs=` ≠.

## Vérification

```text
$ python3 -I tools/easy-solve.py --check
  'crackme12345simba': 'Enter password: \nCORRECT!'
  'petik': 'Enter password: \nWRONG!'
password = crackme12345simba
check: OK
```

Exécuté sur le `crack_me.exe` d'origine extrait du ZIP en mémoire (copié dans un tmp avec un `runtimeconfig.json` pour le host `dotnet`), cas OK **et** KO.

## Notes

- Ce n'est pas du « chiffrement » : le base64 est un simple encodage, le littéral est directement décodable.
- Aucun anti-debug, pas de GDB ni de debugger MCP utilisés (statique + `dotnet`).
