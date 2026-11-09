# MAS's ZSecure

| | |
|---|---|
| **ID** | [`6aa5ccb13b246e477b6c0c12`](https://crackmes.one/crackme/6aa5ccb13b246e477b6c0c12) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | MAS (`mas`) |
| **Plateforme** | Windows PE32, .NET Framework 4 (WinForms), 58 880 o |
| **SHA-256** | `612914f0cb8a5ff9d46dedea0633bc30e089329b696c27aa3724a8972e86dffb` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/ZSecure.exe` | binaire d'origine (non modifié) |
| `original/ZSecure-src/` | décompilation C# (`ilspycmd -p`, version 8.2) |
| `tools/zsecure-solve.py` | solveur : boot key + toute la chaîne + FLAG (`-q`, `--check`) |
| `tools/zsecure-verify-harness.cs` (+ `.csproj.txt`) | harnais .NET 8 qui appelle le **vrai** `ZOS.GameState` du binaire par réflexion |

## Réponse

| Étape | Valeur |
|---|---|
| **Boot key** (écran « ZOS Secure Boot ») | **`K7P-2XM-9Q4-T8V`** |
| Mail (To / corps) | `oday@zsecure.zplus` / un corps contenant `burger` |
| PC1 | `oday` / `Aa123456` |
| VPN | `10.10.55.21` / `4444` / `ROT13` |
| PC2 | `mohamad` / `Aa123456` |
| Overflow (DBM) | `win_addr` + marker 8 hex (`win_addred8edadd` avec le corps de mail `burger`) |
| **FLAG** | **`Z+{1tS_JU5t_SImulation}`** |

```bash
python3 -I tools/zsecure-solve.py          # tout
python3 -I tools/zsecure-solve.py -q       # boot key seule
python3 -I tools/zsecure-solve.py --check
```

Pas de champ nom/serial : l'exemple `petik` ne s'applique pas (la clé est fixe, unique).

## Premier regard

```bash
file original/ZSecure.exe     # PE32 GUI, Mono/.Net assembly
diec original/ZSecure.exe     # .NET Framework 4, Visual Studio
strings -n 5 original/ZSecure.exe | head   # ZOS, 0123456789ABCDEF…Z, mail/pc1/vpn/pc2, "overflow"
~/.dotnet/tools/ilspycmd -p -o original/ZSecure-src original/ZSecure.exe
```

Le `strings` montre déjà des noms parlants (`ValidatePc1`, `TryUnlock`, `HashCracked`…) et l'alphabet base-36 : c'est un mini-jeu « Corporate Network Simulation » en WinForms. Tout est dans `ZOS/GameState.cs` ; `Program.Main` lance `BootGateForm`.

## Flow

1. **BootGateForm** : clé `XXX-XXX-XXX-XXX` → `GameState.ValidateBootKey` (`TryUnlock`).
2. **MailForm** : mail à Oday contenant un mot déclencheur → `PhishingSent`, `RecordPhishing`.
3. **Pc1LoginForm** : login Oday → `ValidatePc1` (le mot de passe est aussi retrouvable via le MD5 « cassé » dans `FisherForm`/`HashCracked`).
4. **VpnForm** : IP + port + algorithme → `ValidateVpn`.
5. **Pc2LoginForm** : login Mohamad → `ValidatePc2`.
6. **DbmForm** : « buffer overflow » (champ censé faire 10 car.) → `ValidateOverflow` → affiche le FLAG.

## Comment on trouve

### 1. Boot key (`GameState.ValidateBootKey`)

Format : 15 car., tirets en 3/7/11, puis 12 caractères base-36 `i = 0..11` :

```csharp
num = ((num*29) ^ num2 ^ (i*17) ^ array[i%4]) & 0xFF;      // num0=109, num2_0=35, array={43,145,23,196}
if (((num ^ ((v*7 + i*11)&0xFF) ^ (i%3==0 ? 165 : 60)) & 0xFF) != array2[i]) return false;
num2 = v;                                                    // v = index du caractère dans l'alphabet
```

Le `num` ne dépend que de l'état précédent (`num`, `num2` = caractère précédent) et de `i`, jamais du caractère courant. Donc, à chaque position, on calcule `num`, puis on cherche `v ∈ [0,36)` tel que l'égalité avec `array2[i]` tienne. `7` est inversible mod 256, donc `v` est **unique** : la clé est unique. Détail : `array2 = {120,185,62,239,51,36,134,223,145,18,111,216}` → `K7P2XM9Q4T8V`.

### 2. Chaînes obfusquées

`DecodeString(blob, seed)` : `blob[i] ^ ((seed + i*29) & 0xFF)`. Appliqué à `EmailBlob` (seed 253) → `oday@zsecure.zplus`, `TriggerBlob` (121) → `burger`, `PasswordBlob` (143) → `Aa123456`, `OdayUserBlob` (99) → `oday`, `MohamadUserBlob` (132) → `mohamad`.

### 3. `ReverseChallenge` (IP / port / algo / win_addr)

`Resolve(field)` : `records[SelectRecord] ^ ExpandKey()[i%7] ^ ((i*23+43)&0xFF)`. Piège de lecture : `SelectRecord` passe par `switchTable` : Address→`switchTable[1]`=0, Port→`[3]`=1, Algorithm→`[0]`=2, WinAddress→`[2]`=3, donc records 0,1,2,3 = IP, port, algo, win_addr. `ExpandKey` est une clé 7 octets dépendant de l'ordre de `switchTable`. Résultat : `10.10.55.21`, `4444`, `ROT13`, `win_addr`.

### 4. Marqueur d'overflow (la partie piégeuse)

`ValidateOverflow` exige `len > 10`, la présence de `WinAddrToken` (`win_addr`) **et** de `OverflowMarker` = 8 premiers hex de `journeyDigest`. Ce digest est une chaîne SHA-256 qui dépend de **tout le parcours** (recipient+corps du mail, user/mdp PC1, ip/port/algo, user/mdp PC2) :

```
d0 = sha256("mail\x1f" + email + "\x1f" + body.Trim())
d1 = sha256(d0 + "\x1fpc1\x1f" + user + "\x1f" + pwd)
d2 = sha256(d1 + "\x1fvpn\x1f" + ip + "\x1f" + port + "\x1f" + algo)
d3 = sha256(d2 + "\x1fpc2\x1f" + user + "\x1f" + pwd)
marker = d3[:8]
```

Le marqueur n'est donc pas statique ; il change avec le corps du mail (et la casse du login passée telle quelle). Avec le corps `burger` et les valeurs canoniques : `ed8edadd`. Les saisies sont à faire exactement ainsi (login en minuscules, pas d'espaces dans le corps hors `Trim`).

### 5. FLAG

`DecodeFlag` : 23 octets XOR clé cyclique `{167,19,92,209,46}` → `Z+{1tS_JU5t_SImulation}`. Le FLAG est statique (pas lié au digest), mais n'est affiché qu'après l'overflow validé.

## Vérification

Pas de GDB ici (reverse 100 % statique .NET), donc pas de section GDB. Preuve contre le **binaire d'origine** : harnais .NET 8 qui charge `original/ZSecure.exe` et appelle son `ZOS.GameState` (le code de validation n'a pas de dépendance WinForms) :

```bash
mkdir /tmp/zs_h && cp tools/zsecure-verify-harness.cs /tmp/zs_h/P.cs && cp tools/zsecure-verify-harness.csproj.txt /tmp/zs_h/zs.csproj
cd /tmp/zs_h && dotnet run -- <chemin>/original/ZSecure.exe
```

Sortie :

```
badkey=False                       # AAA-AAA-AAA-AAA  (KO)
boot=True                          # K7P-2XM-9Q4-T8V
pc1=True
vpn=True
pc2=True
input=win_addred8edadd overflow=True
FLAG=Z+{1tS_JU5t_SImulation}
```

Le marker lu par le binaire (`ed8edadd`) est identique à celui calculé par `tools/zsecure-solve.py`. Limite : l'interface WinForms elle-même n'a pas été pilotée sous Wine (pas de screenshot) ; la preuve porte sur les fonctions de validation réelles du binaire.

## Notes

- Le « mot de passe » de PC1/PC2 est le même (`Aa123456`) ; `Md5Of` sert au mini-jeu de crack de hash (stage Fisher/wordlist), non nécessaire pour le FLAG.
- Le champ DBM « 10 car. max » n'est pas imposé côté `ValidateOverflow` : il suffit de dépasser 10 car.
- Plusieurs autres checks UI (`HashCracked`) ne conditionnent pas les `Validate*` ; seuls `PhishingSent`, `Pc1LoggedIn`, `VpnConnected` sont requis.
