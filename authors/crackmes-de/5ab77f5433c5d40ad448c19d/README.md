# password_app by tcn30

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c19d`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c19d) |
| **Auteur (site)** | crackmes.de (tcn30 — « Password app for crackmes.de by R.Holland 2007 ») |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows x86, Delphi (GUI) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `691cd2a634d2eabc59a15ee49dd82cd96c10908addb5baf498518ecf58dbd7bd` |

## Solution

Mot de passe : **`Letmein97531`** (fixe, pas de nom : l'utilisateur `petik` n'intervient pas).

## Idée en une phrase

Le mot de passe est rangé chiffré dans `.data` et déchiffré à la volée par le classique « Decrypt » Delphi (clé 16 bits 12345, `C1=0xCE6D`, `C2=0x58BF`) avant un simple `LStrCmp` avec le `TEdit`.

## Comment on trouve

1. `diec` → Delphi, GUI ; noms de champs/méthodes du `TLoginForm` **obfusqués** (`PNoLBEyYFMId`…), donc pas de `LogInButtonClick` lisible.
2. On cherche plutôt l'écriture de `ModalResult` (`[ebx+0x294]`) : trois occurrences, toutes dans le handler `0x4560FC` :
   - `call 0x456014` = thunk `IsDebuggerPresent` → si débogueur, `ModalResult := 3` (anti-debug) ;
   - `Edit[0x368].Text` lu (`0x437B38` = GetText) ;
   - `sub_45601C(index=0, len=12, out)` puis `LStrCmp` (`0x404A58`) → égal : `ModalResult := mrOk`, sinon `3`.
3. `sub_45601C` : copie 12 octets depuis `0x459720 + index` puis boucle :
   ```
   di = 0x3039                 ; 12345
   out[i] = c[i] ^ (di >> 8)
   di = (di + c[i]) * 0xCE6D + 0x58BF   ; 16 bits
   ```
   (le grand classique `Encrypt/Decrypt(S, Key)` des forums Delphi).
4. Table `.data` @ `0x459720` (file-off `0x57720`) : `7c de c6 e6 57 3b 63 5b 07 b3 2c 8b` → `Letmein97531`.

## Solveur

```bash
python3 tools/password-app-by-tcn30-solve.py
# password: Letmein97531
```

## Vérification

Live sous **wine + xvfb + xfwm4**, saisie via `xdotool` (texte, `Tab`, `Espace` sur le bouton LogIn) :

- `Letmein97531` → la fiche de login se ferme et **« Main Form »** s'ouvre ;
- `petik` (témoin) → pas de Main Form (l'appli reste sur sa fenêtre principale « Password app for crackmes.de by R.Holland 2007 » / se ferme).

Pas de GDB (et l'appli refuse de toute façon un débogueur via `IsDebuggerPresent`).
