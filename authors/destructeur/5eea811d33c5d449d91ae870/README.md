# destructeur — ShAPK1

| | |
|---|---|
| **ID** | [`5eea811d33c5d449d91ae870`](https://crackmes.one/crackme/5eea811d33c5d449d91ae870) |
| **Auteur** | destructeur |
| **Plateforme** | Android APK (`com.example.shapk1`), Java/Kotlin, non obfusqué |
| **SHA-256** | `ba669869c8cdc77860b08a25193ea77f7454f17b7b53e2b8442ed5817dbd4cec` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ShAPK1.apk` | binaire d'origine (APK) |
| `tools/shapk1-solve.py` | décodage statique du mot de passe (`-q`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `Welcome_T0_4ndroid_World` |

```bash
python3 tools/shapk1-solve.py
```

Dans l'app : saisir le mot de passe dans le champ de texte puis cliquer le bouton de vérification → « YES! PASSWORD IS CORRECT!! ».

## Premier regard

```bash
file original/ShAPK1.apk     # Android package (APK), AndroidManifest.xml, APK Signing Block
```

Pas de `apktool`/Java fonctionnel sur la machine (JRE absent) : décompilation directe du DEX via **androguard** (Python pur, pas de JVM), dans un venv jetable (`python3 -m venv … && pip install androguard`).

```python
from androguard.misc import AnalyzeAPK
a, d, dx = AnalyzeAPK("original/ShAPK1.apk")
a.get_main_activity()   # 'com.example.shapk1.MainActivity'
```

## Flow

`MainActivity` : un `EditText` + un `Button` ; `onCreate` appelle `check()` qui attache un `OnClickListener` (`MainActivity$1`). Pas d'anti-debug, pas d'obfuscation (noms de classes/méthodes clairs).

## Comment on trouve

**Ancrage** : décompilation Java directe via `ClassAnalysis.get_vm_class().get_source()` d'androguard (pas de Smali à relire à la main).

```python
cls = dx.get_class_analysis("Lcom/example/shapk1/MainActivity;")
print(cls.get_vm_class().get_source())
```

```java
public byte[] encrypt(byte[] p7) {
    byte[] key = getResources().getString(2131492893).getBytes(UTF_8);
    byte[] out = new byte[p7.length];
    for (int i = 0; i < p7.length; i++)
        out[i] = (byte) (p7[i] ^ key[i % key.length]);
    return out;
}
```

```java
// MainActivity$1.onClick
if (!Arrays.equals(
        Base64.encode(encrypt(editText.getText().toString().getBytes(UTF_8)), 2),
        getResources().getString(2131492895).getBytes(UTF_8)))
    result.setText("PASSWORD IS WRONG!!");
else
    result.setText("YES! PASSWORD IS CORRECT!!");
```

Donc : `Base64(XOR(saisie, clé)) == cible`, avec `clé` et `cible` lues dans `resources.arsc` (deux `R.string`). Résolution des deux IDs de ressource via `APK.get_android_resources().get_resolved_res_configs(id)` :

```
0x7f0c001d (2131492893) -> "beginning"                               (clé XOR)
0x7f0c001f (2131492895) -> "NQALCgEDDDEzUjpTBwocBgcDPTIIGwIK"        (cible base64)
```

### Inversion

Le XOR cyclique est sa propre inverse : `password = XOR(base64_decode(cible), clé)`.

```python
import base64
key = b"beginning"
target = base64.b64decode("NQALCgEDDDEzUjpTBwocBgcDPTIIGwIK")
pw = bytes(target[i] ^ key[i % len(key)] for i in range(len(target)))
# -> b'Welcome_T0_4ndroid_World'
```

Vérifié par round-trip : `Base64(XOR("Welcome_T0_4ndroid_World", "beginning"))` redonne exactement `NQALCgEDDDEzUjpTBwocBgcDPTIIGwIK`.

## Vérification

```bash
$ python3 tools/shapk1-solve.py
password = Welcome_T0_4ndroid_World
round-trip OK
```

Pas d'émulateur Android disponible sur cette machine pour rejouer l'app en live ; la preuve est la reconstruction exacte (round-trip) de la constante Base64 lue dans `resources.arsc`, qui est le seul check effectué par le code (pas de validation serveur, pas d'autre chemin).

## Notes

- Pas de JRE sur la machine → **androguard** (pur Python) à la place de `apktool`/`jadx`, installé dans un venv jetable sous le scratchpad, pas dans le dépôt.
- Aucune obfuscation : noms de classes/méthodes/ressources explicites, décompilation directe en Java lisible.
- La « complexité » tient uniquement à la résolution des deux resource-string IDs (compilés dans `resources.arsc`, invisibles via `strings`) — pas à l'algorithme (XOR simple).
