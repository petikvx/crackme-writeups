# pietrogamer's Embrace RSA

| | |
|---|---|
| **ID** | [`6ab95f87cdee6e086a1734a9`](https://crackmes.one/crackme/6ab95f87cdee6e086a1734a9) ([ORIGIN.yml](ORIGIN.yml)) |
| **Auteur** | pietrogamer |
| **Plateforme** | Java (jar Swing, Multiplatform) |
| **SHA-256** | `533a005c5e5ee54ecf6603cbecfdff0caf6136ad701b4e93a2dcaf6d16d39b0e` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.jar` | binaire d'origine (non modifié) |
| `tools/embrace-rsa-solve.py` | keygen (`--name`, `-q`, `--check`) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve live (JRE 25 sous Xvfb) |

## Réponse

Le serial dépend du nom : `serial = SHA256(name)^d mod N`, en hexadécimal.

| Name | Serial |
|---|---|
| `petik` | `a95e8ed35628568a4efa88b90e751134d9254a9a532aaee45724a8b4d7fc27c92f9781f0cfe4027ef13424bf080cd378293ea47099355ff540534dbc11a8f12dccc5ff15bb2e0cc1ca38fc07e4261630bd2036136521f861172e3f622ab88ec262236aeba1a7fc66918038d06c57cc4f6938ada8f7d9be07281a494a38ffe28cfe2e3beea34f73513ff9fa6c0a9d494beb088a5f087cf631e823fe2d432b8f9339af5406504c8ec2bc8a6bd4a88a698442e827f1ae602529cf06a679c8099c181dbdfe9b52a12cd8c1bed77c1384c8e7d4bfa8fda9da10763951d306e057b082cf4936438f0cc738f519aa58a8eeeba04a306294e8b1e36aa2c7473a731ebe26` |

```bash
python3 tools/embrace-rsa-solve.py --name petik      # name + serial
python3 tools/embrace-rsa-solve.py --name petik -q   # serial seul
python3 tools/embrace-rsa-solve.py --check           # auto-vérification RSA
```

## Premier regard

- `file` : « Java archive data (JAR) » ; `diec` ne reconnaît rien de plus.
- `unzip -l` : `Main.class`, `Main$Bg.class`, `Cript3.class`, `Primes.class`, `Embrace.png` (fond de la fenêtre). Manifest : `Main-Class: Main`.
- Pas de `javap`/décompileur installé : les .class ont été désassemblés en Python avec `jawa` (pool de constantes + bytecode).
- Strings de `Main` : « Name: », « Serial: », « Send », « YOU WIN!!!! », « LOSER!!!!! PATHETIC », « Please fill in all fields! ».
- `Primes` (génération de premiers de 1024 bits via `SecureRandom`) est instancié par `Cript3` mais jamais utilisé : leurre.

## Flow

`Main.main` construit une JFrame 350×220 (Name, Serial, bouton Send). Le listener (`lambda$main$0`) lit les deux champs : vide → « Please fill in all fields! » ; sinon `Cript3.valid(name, serial)` → « YOU WIN!!!! » / « LOSER!!!!! PATHETIC ».

## Comment on trouve

### 1. Le prédicat (`Cript3.valid`)

Bytecode lu avec `jawa` (désassemblage de `valid(String nome, String serial)`), équivalent Java :

```java
MessageDigest md = MessageDigest.getInstance("SHA-256");
byte[] hash = md.digest(nome.getBytes(UTF_8));
BigInteger h = new BigInteger(1, hash);        // new BigInteger(1, bytes) : entier positif
BigInteger s = new BigInteger(serial, 16);     // serial en hexa
return s.modPow(Cript3.e, this.q).equals(h);   // s^e mod N == h
```

- `Cript3.e` (`<clinit>`, `ldc2_w`) = **65537** (`BigInteger.valueOf`).
- `this.q` (constructeur, `new BigInteger("2649663…")`) = module **N de 2048 bits** (617 chiffres décimaux), présent en clair dans le constant pool de `Cript3.class`.

Il s'agit donc d'une **vérification de signature RSA** : le serial doit être la signature de SHA-256(name), soit `h^d mod N`. Il faut d.

### 2. Factoriser N ? Non.

Essais sur N (composite, confirmé par Miller-Rabin) : divisions d'essai < 2·10⁶, Fermat (2·10⁶ itérations), Pollard p-1 (B = 2²²) : rien. Pas de faille cryptographique, il faut chercher ailleurs.

### 3. L'exposant privé caché dans l'image

Le jar embarque `Embrace.png`, 122 948 octets. Le PNG réel se termine à `IEND` ; `strings` montre des données après.

```python
png = zipfile.ZipFile("original/crackme.jar").read("Embrace.png")
tail = png[png.rfind(b"IEND") + 8:]
# b'!ITISNOTAKEY!C7E9393830E73D…FD8F7F1…C681'   (512 chiffres hex = 2048 bits)
```

Le marqueur « `!ITISNOTAKEY!` » (« ce n'est pas une clé ») est un leurre. On teste : `pow(pow(5, 65537, N), x, N) == 5` → **vrai**, donc `x` est bien l'exposant privé **d** (gcd(x, N) = 1, 2048 bits).

### 4. Assemblage

```
h      = int(SHA256("petik"), 16)
serial = hex( pow(h, d, N) )
```

Vérification : `pow(int(serial,16), 65537, N) == h` (`--check`), puis test sur le jar d'origine (ci-dessous).

### Pièges

- `new BigInteger(1, hash)` : hash traité comme positif (pas de signe négatif si le premier octet ≥ 0x80).
- Le serial est parsé en base 16 sans préfixe, minuscules (`format(x, "x")`).
- Aucun GDB utilisé (pas de section Debug GDB) : reverse statique du bytecode.

## Vérification

Le binaire d'origine a été exécuté pour de vrai avec un JRE 25 (paquet pip `jdk4py`, sans compilateur) sous `Xvfb`, champs remplis via `xdotool`, clic sur Send, capture avec Pillow.

| Cas | Résultat |
|---|---|
| `petik` + serial ci-dessus | « YOU WIN!!!! » — [screenshot-ok](analysis/screenshot-ok.png) |
| `petik` + serial avec un `0` ajouté | « LOSER!!!!! PATHETIC » — [screenshot-ko](analysis/screenshot-ko.png) |

## Notes

- Ce n'est pas un vrai cassage RSA : la clé privée est fournie par l'auteur dans l'image (données ajoutées après `IEND`).
- Un serial valide est unique modulo N pour un nom donné ; `s` et `s+N` sont équivalents côté `modPow`.
