# cyclops_crackme_5.0 — cyclops (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c157
- Plateforme : Windows PE32 GUI (MSVC 6 / MFC 4.2 **debug**)
- Difficulté : 2.0 — type **passcode** (pas de champ texte : on tape directement dans la fenêtre)

## Solution

```
CrAcKiNg Is CoOl
```

Il suffit de taper ces 16 caractères (casse comprise) avec la fenêtre au premier plan → MessageBox « Cracked / Send me solution to cyclops@hackersclub.net ». Pas de nom, donc pas d'exemple `petik` ici.

Calcul : `python3 tools/crackmes-de-cyclops_crackme_5.0-solve.py`

## Comment on trouve

1. **Repérage.** `diec` : MSVC 6, MFC 4.2 debug. Le readme dit qu'on tape le code « dans la fenêtre ». Les chaînes `Wrong password!!` et `Bravo U cracked.` existent… mais ce sont des leurres : leur unique xref (`0x40139b`, `0x4013b2`) est un `strcpy` dans l'objet, pas un affichage.
2. **Initialisation (`0x401350`).** Six `strcpy` de 16 octets dans le dialogue : `+0x124 = "ution.1234567890"` (E), `+0x135 = "Send me the  sol"` (D), `+0x146 = "Bravo U cracked."` (C), `+0x157 = "Wrong password!!"` (B), `+0x168 = "This is Cyclops-"` (A) et `+0x179` = 16 octets binaires (F = `fd fd de f5 d2 be b1 b8 cf 96 b9 fd 89 a0 80 b3`).
3. **Génération (`0x401210`).** Boucle de 16 : `pw[i] = (A ^ ~B ^ (C & D)) | ~E`, puis une seconde boucle `pw[i] ^= F[i]`, résultat en `+0x18a`. En Python ça donne directement `CrAcKiNg Is CoOl`.
4. **Saisie (`OnChar`, `0x4010a0`).** Chaque touche est ajoutée à un tampon `+0xc0` (compteur `+0x19c`, remis à 0 à 99 caractères), puis `0x401140` est appelé : `strstr(tampon, pw)` ; si trouvé → MessageBox « Cracked », puis le mot de passe est écrasé par des espaces et le compteur remis à zéro. Comme c'est un `strstr`, des caractères tapés avant le code ne gênent pas.

## Vérification

Pas de pilotage du GUI en headless (et `MFC42D.DLL` debug n'est pas fournie par wine). `tools/crackmes-de-cyclops_crackme_5.0-emu.py` exécute **le vrai `OnChar`** (et donc la vraie génération + comparaison) sous Unicorn en lui envoyant les caractères un à un, en simulant seulement `strcpy`, `strstr`, `_chkesp` et `MessageBox`. Résultat (`analysis/emu-passcode.txt`) : MessageBox « Cracked » pour `CrAcKiNg Is CoOl` (aussi précédé de `xx`), aucun message pour `CrAcKiNg Is Cool`.
