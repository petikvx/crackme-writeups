# crackme4 by tcn30

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c19c`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c19c) |
| **Auteur (site)** | crackmes.de (tcn30) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows x86, Borland Delphi 2006 (GUI) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `567e1ecb65fc2bb5ed685cae3efb67dd8214667cd5f8b141c237e289db71c0e2` |

## Solution

| Champ | Valeur |
|---|---|
| Username | `TURRICAN` |
| Password | `NEWYEAR` |

Couple fixe (pas de keygen) : l'utilisateur `petik` n'a pas de mot de passe valide.

## Idée en une phrase

Le login et le mot de passe sont stockés **chiffrés** (variante XTEA, clé 128 bits en clair à côté) ; le handler `LogInButtonClick` les déchiffre, fait `TrimRight` + `UpperCase`, puis compare tel quel avec le texte des deux `TEdit`.

## Comment on trouve

1. `diec` → Borland Delphi 2006, Turbo Linker. Le zip contient `PasswordApp2.exe` (fiche `TLoginForm`, champs `usrname`, `password`, bouton `LogInButton`).
2. `strings -t x` : juste après les noms de méthodes `LogInButtonClick` / `FormCreate`, deux chaînes de 16 caractères suspectes :
   `TirUZn6IFKtnLfqA` (VA `0x456430`) et `ZyFkQc3e2N7cVr3i` (VA `0x456468`), chacune suivie d'une « chaîne » binaire de 16 octets (`0x45644C`, `0x456484`).
   Conversion offset → VA : `.text` à file-off `0x400` ↔ VA `0x401000`.
3. `objdump -d -M intel` autour de ces constantes → `LogInButtonClick` = `0x456230` :
   - copie les 4 constantes dans des globales `G+0x34..0x40` ;
   - `G44 = sub_455F28(G38, clé=G34)` et `G48 = sub_455F28(G40, clé=G3C)` ;
   - `G4C = UpperCase(TrimRight(G44))`, `G50 = UpperCase(TrimRight(G48))`
     (`0x40835C` = TrimRight — boucle `cmp [..], 0x20 / jbe` ; `0x40826C` = UpperCase → `CharUpperBuffA`) ;
   - `Edit[0x368].Text == G4C` **et** `Edit[0x36C].Text == G50` (`LStrCmp` `0x404A58`) → `ModalResult := mrOk (1)`, sinon `3`.
4. `sub_455F28` découpe la donnée en blocs de 8 octets et appelle `sub_455E98` : constante `0x9E3779B9`, `shl 4 / shr 5`, sélection de sous-clé par `sum >> 11` → déchiffrement de la famille TEA/XTEA.
5. Plutôt que réimplémenter la variante exacte, on **émule la vraie routine** `0x455E98` avec Unicorn (fonction pure : `eax` = bloc, `edx` = clé) :
   - `Turrican\r\n` → `TURRICAN`
   - `Newyear\r\n` → `NEWYEAR`

Comparaison sensible à la casse : il faut taper en majuscules.

## Solveur

```bash
python3 tools/crackme4-by-tcn30-solve.py
# user: TURRICAN
# pass: NEWYEAR
```

Le script lit l'exe directement dans `original/PasswordApp2.zip` et émule `0x455E98` (nécessite `unicorn`).

## Vérification

- **Émulation Unicorn du code réel** de déchiffrement du binaire (routine `0x455E98`) → clairs `Turrican` / `Newyear`.
- Post-traitement (TrimRight + UpperCase) et comparaison lus statiquement dans `LogInButtonClick`.
- Le lancement sous wine/xvfb affiche bien la fiche « Crackme 4 by TcN30 », mais la saisie clavier via `xdotool` sans window manager n'a pas pu être pilotée de façon concluante : la validation live n'est **pas** revendiquée.
