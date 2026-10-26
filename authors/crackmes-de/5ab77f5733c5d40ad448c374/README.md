# crackmes.de's newhitmans_keygenme4 (KeyGenMe#4) by newhitman

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c374`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c374) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (newhitman, 2009) |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 7 + skin SUIPack (`Office2007`) |
| **SHA-256 (zip)** | `0544ec180e5542adb0b68ee62bdd35817330dcc6b528ca2e43c06d7d2950e86d` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/KeyGenMe#4.zip` | archive d'origine (contient `KeyGenMe#4.exe`, 1 228 800 octets) — non modifiée |
| `tools/keygenme4-solve.py` | keygen (`--name`, `-q`, `--check` Wine + Xvfb + xdotool) |
| `analysis/screenshot-ok.png` | « Well Done » + titre `{REGISTERED}` |

## Réponse

Le crackme enchaîne **3 « algorithmes »** (chacun valide un serial et coche une case). Exemple avec le nom **`petik`** :

| Étape | Serial |
|---|---|
| Algorithm 1 | `keitt` |
| Algorithm 2 | `707465` |
| Algorithm 3 (final → `{REGISTERED}`) | `10734633` (constante, indépendante du nom) |

```bash
python3 -I tools/keygenme4-solve.py --name petik          # affiche les 3 serials
python3 -I tools/keygenme4-solve.py -q                    # serial final seul
python3 -I tools/keygenme4-solve.py --name petik --check  # preuve live Wine/xvfb
```

## Premier regard

```bash
unzip -P crackmes.one original/KeyGenMe#4.zip -d analysis/extracted   # (zip non chiffré en pratique)
file analysis/extracted/*.exe      # PE32 GUI i386, 8 sections
diec  analysis/extracted/*.exe     # Borland Delphi 7, Turbo Linker 2.25
```

Fenêtre : `Name`, `Serial`, trois paires radio/case « Algorithm1..3 », boutons **Unlock** et **Exit**, titre `KeyGenMe#4  {UNREGISTERED}`.
Les `strings` ne servent à rien (VCL + SUIPack, skin de 90 Ko dans la DFM) ; le message utile est dans les ressources/`.text` Delphi.

## Flow

Delphi : le handler est un événement publié du formulaire. Les ressources `RCDATA` (`TFORM1`) listent `suiButton1Click` / `suiButton2Click` ; la table des méthodes publiées (`size(2) addr(4) len name`) donne leurs adresses :

```text
suiButton2Click (Exit)    @ 0x4834dc
suiButton1Click (Unlock)  @ 0x4834e4   <- le check
```

## Comment on trouve

**Ancrage** : DFM de `TFORM1` (`pefile`, RCDATA) → noms `suiButton1Click`, `suiEdit1/2` ; recherche de la chaîne Pascal `\x0fsuiButton1Click` dans le fichier → adresse `0x4834e4` juste avant (`objdump -d -M intel --start-address=0x4834e4`).

**Lecture du handler** (`ebx` = Self ; `[ebx+0x300]` = Edit Name, `[ebx+0x304]` = Edit Serial ; `0x4045f0` = `_LStrCopy(src, idx, cnt, &dst)`, `0x404390` = `Length`, `0x4085d0` = `IntToHex(v, 0)`, `0x404450` = `_LStrCatN`, `0x4044dc` = `_LStrCmp`) :

```asm
483505  mov eax,[ebx+0x314] ; mov al,[eax+0x210]   ; f1 = radio1.Checked
483514  ... [ebx+0x31c] ... [ebp-0x3a]              ; f2
483523  ... [ebx+0x320] ... [ebp-0x3b]              ; f3
; si len(name)==0 ou len(serial)==0 -> sortie
```

*Étape 1* (copies 1-based de `name`, `n` = longueur) :

```asm
483579  if f1 && len(serial)==6:  p0 = Copy(name,1,1)    ; sinon p0 = ''
4835a7  p1 = Copy(name, n,   1)      ; dernier caractère
4835bd  p2 = Copy(name, 2,   1)
4835cb  p3 = Copy(name, n-1, 1)
4835e2  p4 = Copy(name, 3,   1)
4835f5  p5 = Copy(name, n-2, 1)
48361f  s = p0+p1+p2+p3+p4+p5 ; if s == serial -> coche suiCheckBox1, active la suite
```

Flags par défaut non cochés ⇒ `p0` vide, **serial1 = n[-1] n[1] n[-2] n[2] n[-3]**. Pour `petik` : `k`,`e`,`i`,`t`,`t` → **`keitt`**.
Piège : l'ordre de concaténation est celui des `push` (premier poussé = premier caractère) — confirmé en live.

*Étape 2* (`IntToHex(octet, 0)` de caractères du nom) :

```asm
48366b  if f2 && len(serial)==8: h0 = hex(name[n-2])   ; octets 0-based, sinon ''
483676  h1 = hex(name[0])      ; [eax]
483693  h2 = hex(name[n-3])
4836a5  h3 = hex(name[1])
4836c4  s = h0+h1+h2+h3 ; if s == serial -> coche suiCheckBox2
```

Flag par défaut : **serial2 = hex(n[0]) hex(n[-3]) hex(n[1])**. `petik` : `p`=70, `t`=74, `e`=65 → **`707465`**.
(Piège : mon premier essai `69707465`, avec le 4ᵉ octet en tête, est refusé — il faut le flag f2 coché pour qu'il compte.)

*Étape 3* :

```asm
4836fd  if f3: tmp = name[n-1] (boucle sur tous les caractères, garde le dernier) ; sinon tmp = 0
483720  v = tmp + 0x999
48372a  v = v * 0x1111                     ; imul
48374c  s = Format('%U', v)                ; décimal non signé
483757  if s == serial -> suiCheckBox3, titre {REGISTERED}, MessageDlg « Well done you solved all these Algorithms … »
```

Les radios (f1/f2/f3) ne sont pas cochables à la souris dans l'UI (cliquer dessus n'a aucun effet), donc elles restent à l'état par défaut « non coché » ⇒ `tmp = 0` ⇒ `v = 0x999 * 0x1111 = 2457 * 4369 = 10734633`. Le serial final est donc **constant**, indépendant du nom. (Avec f3 coché ce serait `(ord(n[-1])+0x999)*0x1111`, ex. `petik` → `11202116` ; testé : refusé, car f3 est bien faux.)

Les trois checks sont indépendants dans le code : seule l'étape 3 déclenche le `{REGISTERED}`, mais la chaîne 1→2→3 est le parcours voulu par l'auteur (le keygen donne les trois).

## Debug GDB (pas à pas)

Non utilisé : reverse statique (`objdump`) + vérification live Wine/Xvfb pilotée par `xdotool`.

## Vérification

```bash
python3 -I tools/keygenme4-solve.py --name petik --check
# titre fenêtre : KeyGenMe#4  {REGISTERED}
# CHECK: OK
python3 -I tools/keygenme4-solve.py --name Alexandre --check   # elred / 41646C / 10734633 -> OK
```

- **OK** : [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png) (boîte « Well Done », titre `{REGISTERED}`).
- Étapes 1 et 2 testées individuellement en live : `keitt` coche la case 1, `707465` coche la case 2.
- **KO** : serial `11202116` (ou `69707465`) pour `petik` → titre reste `{UNREGISTERED}`, case non cochée.
- Le zip n'est pas chiffré ; le solveur ré-extrait `KeyGenMe#4.exe` sous `analysis/extracted/` (non versionné) sans toucher `original/`.

## Notes

- Les noms doivent faire ≥ 3 caractères (le code lit `name[3]`).
- Binaire gonflé par la lib de skin ; le vrai code tient dans ~0x2e0 octets de `suiButton1Click`.
- `analysis/extracted/` est jetable (recréé par `--check`).
