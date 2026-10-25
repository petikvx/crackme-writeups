# Obnoxious's KeygenMe #1 (obnoxious) — crackmes.de

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c347`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c347) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | obnoxious (famille locale `crackmes-de`) |
| **Plateforme** | Windows PE32 GUI, .NET 2.0 (WinForms, C#) |
| **SHA-256 (zip)** | `bf162541bb30065e70b5d0c20bd00b0725f47e3a434b6e0871a03a5602045970` |

| Fichier | Rôle |
|---|---|
| `original/Obnoxious__sKGM#1.zip` | archive d'origine (`Obnoxious'sKGM#1.exe` + `ReadME.txt`) |
| `analysis/source/Form1.cs` | logique décompilée (ilspycmd) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine : Registered / Unregistered |
| `tools/obnoxiousskgm1-solve.py` | keygen |

## Réponse

Le serial dépend de l'**heure de lancement** et du **jour du mois** :

```
serial = "Obnoxious-" + H[1:9] + "-" + <jour> + "-" + name[2:4]
```

`H` = `TimeSpan.GetHashCode()` (décimal) calculé au `Form_Load`, et **écrit par le crackme dans `c:\windows\time_data.txt`** : le keygen n'a qu'à le relire.

```bash
python3 tools/obnoxiousskgm1-solve.py --name petik1          # lit $WINEPREFIX/drive_c/windows/time_data.txt
python3 tools/obnoxiousskgm1-solve.py --name petik1 --hash 1818386021 --day 25 -q
# Obnoxious-81838602-25-ti
```

| Name | H (de la session) | Jour | Serial |
|---|---|---|---|
| `petik1` | `1818386021` | 25 | `Obnoxious-81838602-25-ti` |

Le nom doit faire **≥ 6 caractères** : `petik` (5) est refusé (« Name Length Not Valid! »), on prend donc `petik1` (le serial n'utilise que `name[2:4]` = `ti`).

## Premier regard

```bash
unzip original/*.zip -d /tmp/x
file /tmp/x/*.exe     # PE32 GUI, Mono/.Net assembly
diec /tmp/x/*.exe     # Microsoft Linker 8.0, .NET Framework CLR 2.0
ilspycmd -p -o src k.exe   # (decompiledotnet absent du shell agent → ilspycmd direct)
```

`ReadME.txt` : règles « no patching / no bruteforcing », musique chiptune (WAV en ressource, `SoundPlayer.PlayLooping`). Rien d'obfusqué.

## Flow

1. `Form1_Load` : joue le WAV, crée `c:\windows\time_data.txt`, lit `HKLM\SOFTWARE\crackmes\User\MyKey`. Clé absente → « Not A Crackmes.de User? » et fermeture ; valeur ≠ `user@crackmes.de` → « Not A Valid Crackmes.de User. ». Sinon `xxxx.Text = DateTime.Now.TimeOfDay.GetHashCode()` (label caché) et la valeur est écrite dans `time_data.txt`.
2. `button1_Click` : nom < 6 → erreur ; serial vide → « Enter A Serial NitWit! » ; sinon compare le serial saisi à `get(name)`. Égal → `::Registered::`, sinon les deux champs sont vidés + `::Unregistered::`.

## Comment on trouve

Ancrage : `ilspycmd` donne tout le C# (`analysis/source/Form1.cs`), la validation est dans `get` :

```csharp
private string get(string serial)   // 'serial' est en fait le NOM
{
    serial = "Obnoxious-" + xxxx.Text.Substring(1, 8)      // hash du TimeSpan, sans le 1er caractère
           + "-" + DateTime.Today.Day                      // jour du mois, sans zéro de tête
           + "-" + serial.Substring(2, 2);                 // 3e et 4e caractères du nom
    return serial;
}
```

- `xxxx.Text` est rempli avec `DateTime.Now.TimeOfDay.GetHashCode()`. `TimeSpan.GetHashCode()` = `(int)ticks ^ (int)(ticks >> 32)` → un entier signé de ~10 chiffres. `Substring(1,8)` saute donc le 1er caractère (le `-` si le hash est négatif, sinon le 1er chiffre) et en prend 8. Le hash n'est pas reproductible (dépend de l'heure de lancement)… mais le crackme le **laisse en clair** dans `c:\windows\time_data.txt` : c'est le « piège » du keygenme, un keygen lit ce fichier.
- Pas de bruteforce, pas de patch : formule directe.
- Exemple `petik1` : hash `1818386021` → `[1:9]` = `81838602` ; jour 25 ; `name[2:4]` = `ti` → `Obnoxious-81838602-25-ti`.

Pièges :
- le paramètre de `get` s'appelle `serial` mais contient le **nom** ;
- le jour n'est pas zéro-paddé (`DateTime.Day` : `5` et non `05`) — le keygen utilise le jour courant, `--day` pour forcer ;
- si le hash a moins de 9 caractères, le crackme lui-même lèverait `ArgumentOutOfRange` (cas rare, le keygen le signale).

## Vérification (Wine, `xvfb-run`)

Particularités de l'environnement : sous Wine 10 + wine-mono le .NET 2.0 plante dès le CLR (`stack overflow` dans `mscorwks`) ; le préfixe de test avait `dotnet40` natif, il a fallu un `k.exe.config` (copie hors `original/`) :

```xml
<configuration><startup useLegacyV2RuntimeActivationPolicy="true"><supportedRuntime version="v4.0.30319"/></startup></configuration>
```

et la clé de registre dans la vue **64 bits** (`wine reg add 'HKLM\SOFTWARE\crackmes\User' /v MyKey /d user@crackmes.de /f /reg:64`), sinon « Not A Crackmes.de User? ». Pilotage : Xvfb + `xdotool` (clics aux coordonnées absolues, pas de gestionnaire de fenêtres), capture `ffmpeg x11grab`.

| Cas | Saisie | Résultat |
|---|---|---|
| OK | `petik1` / `Obnoxious-81838602-25-ti` (hash lu dans `time_data.txt` de la même session) | `::Registered::` — [`screenshot-ok.png`](analysis/screenshot-ok.png) |
| KO | `petik1` / même serial + `x` | champs vidés, `::Unregistered::` — [`screenshot-ko.png`](analysis/screenshot-ko.png) |

## Notes

- Aucun GDB / x64dbg / IDA : reverse 100 % statique sur le C# décompilé, preuve dynamique par Wine.
- Ce n'est **pas** un keygen purement hors-ligne : il faut avoir lancé le crackme (ou connaître son hash de session) car `H` est lié au `Form_Load`. La clé de registre `user@crackmes.de` est un simple garde « utilisateur crackmes.de » à créer avant de lancer.
- `original/` intact (zip seul) ; le `.exe` extrait n'est pas conservé dans le dépôt.
