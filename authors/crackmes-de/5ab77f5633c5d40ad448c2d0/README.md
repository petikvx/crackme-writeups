# crackmes.de — crackme_2.75 by bullet

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2d0`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d0) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (binaire)** | BuLLeT, release scène **TOL'98** (The Outlaws), 1998-06-09 |
| **Plateforme** | Windows PE32 (i386), GUI, **Visual Basic 5** (natif, pas p-code) |
| **SHA-256 (zip)** | `a1d511b45888f9cf8c47b94cfd9a5e99c184afcdb61f25618ca8a3287b5d8a2f` |
| **SHA-256 (exe)** | `b2b9f34db32c7163cee531d12bcb5ace014d7e0615da2b94f5a5d87e93a0f56f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/tol_b275.zip` | archive d'origine (release scène complète) |
| `original/extracted/B-CRKME2.EXE` | binaire |
| `original/extracted/TOL98.NFO`, `FILE_ID.DIZ` | artefacts de la release (ANSI art, crédits du groupe) |
| `analysis/screenshot-initial.png` | formulaire au lancement |
| `analysis/screenshot-ok.png` | après mot de passe correct |
| `analysis/screenshot-ko-example.png` | exemple de leurre rejeté |
| `tools/crkme275-solve.py` | mot de passe |
| `tools/gdb-live-password.py` | script de preuve live (GDB + Wine + Xvfb, voir § Debug GDB) |

## Réponse

```
2rK4HJ4-7n8RgT09IW6a7kSlg33
```

Saisi dans le champ puis clic sur **Verify** → le formulaire affiche l'e-mail de l'auteur `BuL_LeT@hotmail.com` et le bouton devient « Contact ».

## Premier regard

```bash
file original/extracted/B-CRKME2.EXE
# PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
strings -el -n 3 original/extracted/B-CRKME2.EXE
#   l2rK4sdg6lk7n8Rg2ovcns6a7kSlk09ush4dg3312dklfv   (UTF-16, VB5)
#   DFGKHJ45TDLKDSFVLK234RT09IWCFPOMGBH698UGSEOIVN-5NVEWTO845VKJLLKN
#   kjg / h4356 / lkasdffc1tg5
#   Nope. That's not the one!
```

`MSVBVM50.DLL` en import : binaire **Visual Basic 5**. `objdump -h` montre une
section `.text` de seulement `0x1294` octets — trop petite pour contenir de
la vraie logique applicative si le projet était compilé en *p-code*
(interprété par la VM VB), mais ici le code EST natif x86 (confirmé plus
bas) : juste un très petit programme.

## Flow

```
[ champ texte ] [ Verify ]
```
Mauvais mot de passe → le texte du champ devient `Nope. That's not the one!`.
Bon mot de passe → bascule en mode « contact » (e-mail de l'auteur, bouton
« Contact »).

## Comment on trouve

**Ancrage.** `strings -el` (UTF-16, VB stocke ses littéraux ainsi) fait
ressortir **deux longues chaînes qui ressemblent exactement à des mots de
passe candidats** :

```
l2rK4sdg6lk7n8Rg2ovcns6a7kSlk09ush4dg3312dklfv·kjg·h4356·lkasdffc1tg5   (· = séparateur 0xE6)
DFGKHJ45TDLKDSFVLK234RT09IWCFPOMGBH698UGSEOIVN-5NVEWTO845VKJLLKN
```

**Piège n°1 — ce sont des leurres.** Testées telles quelles (directement
contre le binaire, via Wine), **aucune** des quatre sous-chaînes séparées par
`0xE6` ni la seconde chaîne complète ne fonctionnent — toutes donnent
`Nope. That's not the one!`.

**Désassemblage.** `.text` fait seulement 4756 octets, mais ce n'est **pas**
du p-code interprété : un `jmp 0x401d24` à `0x401840` mène vers du vrai code
x86 natif (`push ebp; mov ebp,esp; …`), précédé de 4 octets `0xE9` de
bourrage qui désynchronisent `objdump` en désassemblage linéaire (il décode
un faux `jmp` géant) — redésassembler **exactement** à partir de `0x401d24`
donne le vrai flot.

Ce code charge les deux chaînes leurres en `Variant` (BSTR), puis exécute
**six extractions `Mid$`** à des positions précises dans ces deux blobs, et
concatène les fragments obtenus — **les leurres sont en réalité la matière
première du vrai mot de passe**, pas des fausses pistes à ignorer. Reconstruire
à la main l'ordre exact (quel paramètre est le *start*, lequel est la
*longueur*, dans quel ordre VB5 empile les arguments d'un helper d'ordinal
non nommé `#632` de `MSVBVM50.DLL`) s'est avéré **ambigu** : plusieurs
hypothèses plausibles testées (`Mid$(first,4,2)+…`, puis `Mid$(first,2,4)+…`)
donnaient toutes `Nope.` — voir § Debug GDB pour la résolution définitive,
en lisant directement la valeur calculée en mémoire plutôt qu'en la
recalculant à la main.

**Pièges.**
- Les deux chaînes « évidentes » dans `strings` ne sont ni le mot de passe,
  ni du bruit : ce sont les morceaux à découper puis réassembler.
- `.text` minuscule ≠ forcément p-code : ce binaire particulier est compilé
  natif malgré sa taille, avec juste très peu de code applicatif.
- Octets de bourrage `0xE9 0xE9 0xE9 0xE9` juste avant le vrai point d'entrée
  piègent un désassemblage linéaire naïf — toujours repartir de l'adresse
  cible exacte d'un `jmp`/`call` plutôt que de la ligne suivante.

## Debug GDB (pas à pas)

Script complet : [`tools/gdb-live-password.py`](tools/gdb-live-password.py)
(contient tous les détails d'installation en tête de fichier).

Ce binaire de 1998 ne tourne pas tel quel dans cet environnement : il faut
d'abord reconstituer un environnement GUI complet, **sans accès root** :

1. **Xvfb sans sudo** : `apt-get download xvfb` récupère le `.deb` (lecture
   seule, pas d'installation système), `dpkg-deb -x` l'extrait dans un
   répertoire local ; le binaire `Xvfb` qui en sort fonctionne directement.
2. **Runtime VB5** (`MSVBVM50.DLL`) : absent de Wine par défaut (« program
   cannot be run in DOS mode » sans lui, en réalité `import_dll` échoue).
   `winetricks vb5run` télécharge l'installeur officiel Microsoft
   (`msvbvm50.exe`, source légitime `download.microsoft.com`) mais son
   exécution silencieuse (`/q`) est cassée sous Wine récent (bug connu,
   `--force` requis) — on extrait directement les 5 DLL du `.exe`
   (c'est une archive 7-Zip auto-extractible) et on les copie dans
   `$WINEPREFIX/drive_c/windows/syswow64/`, avec `WINEDLLOVERRIDES`
   forçant ces DLL en natif (pas les fakes Wine).
3. **GDB ne peut pas s'attacher** à un process Wine déjà lancé
   (`yama/ptrace_scope=1`, pas de sudo pour le désactiver) — il faut lancer
   le binaire **comme enfant direct de GDB** dès le départ. `gdb --args wine
   …` échoue aussi (`wine` est un script shell, pas un format que GDB sait
   charger comme « file ») : il faut viser le vrai ELF sous-jacent,
   `/usr/lib/x86_64-linux-gnu/wine/wine` (remonté via la chaîne de wrappers
   `/usr/bin/wine` → `wine-stable` → `wine64-stable` → ce binaire).
4. Le process est lancé, son thread principal tourne librement (boucle de
   messages Windows) ; un **`SIGINT` envoyé au process GDB lui-même**
   (`kill -2`, pas au process debuggé) l'interrompt proprement et rend la
   main au prompt GDB — à ce moment seulement on pose le breakpoint sur
   l'appel à `__vbaVarTstEq` (`0x40208d`, trouvé via `objdump -p` → table
   d'imports → adresse de l'IAT thunk → xref du `call` dans le code) puis
   `continue`.
5. **GUI pilotée sans X11/sudo additionnel** : `python-xlib` (déjà
   installé) + l'extension `XTest` envoient directement des événements
   clavier/souris synthétiques au serveur **Xvfb** local (`DISPLAY=:99`) —
   pas besoin de `xdotool` ni d'accès à l'affichage réel de la machine.
   Capture d'écran : lecture brute du framebuffer via `XGetImage`
   (`root.get_image`), converti en PNG avec Pillow.
6. Un mot de passe quelconque est tapé et "Verify" cliqué → le breakpoint
   se déclenche. À l'arrêt, `[esp]` et `[esp+4]` pointent les deux
   `VARIANT` comparés par `__vbaVarTstEq` : l'un est la saisie utilisateur,
   l'autre est **la référence calculée par le programme**. Chaque
   `VARIANT` (16 octets) a son pointeur `BSTR` à l'offset `+8` ; un `BSTR`
   est précédé de 4 octets de longueur puis son contenu en UTF-16LE.
   Lire directement ce `BSTR` donne le mot de passe **sans avoir à
   recalculer les positions `Mid$` à la main**.

Sortie observée (extrait) :

```
x/1xw $b1-4
0x16908:  0x00000036            <- longueur BSTR = 0x36 = 54 octets = 27 car. UTF-16
x/40bx $b1
0x1690c:  32 00 72 00 4b 00 34 00 48 00 4a 00 34 00 2d 00 …
          2  .  r  .  K  .  4  .  H  .  J  .  4  .  -  .     -> "2rK4HJ4-…"
```

Décodé entièrement : `2rK4HJ4-7n8RgT09IW6a7kSlg33` (27 caractères) —
confirmé **correct** en le ressaisissant dans l'interface réelle (capture
`analysis/screenshot-ok.png`).

## Vérification

```bash
python3 tools/crkme275-solve.py -q
# 2rK4HJ4-7n8RgT09IW6a7kSlg33
```

Capturé en direct sous Wine/Xvfb :

- `analysis/screenshot-initial.png` — formulaire vide au lancement.
- `analysis/screenshot-ko-example.png` — une des chaînes leurres testée
  seule, rejetée (`Nope. That's not the one!`).
- `analysis/screenshot-ok.png` — mot de passe correct saisi, le champ
  affiche l'e-mail de l'auteur et le bouton devient « Contact ».

## Notes

- `MSVBVM50.DLL` et les DLL associées installées dans cette session
  proviennent du redistribuable officiel Microsoft (via `winetricks`,
  source `download.microsoft.com`) — pas un binaire tiers non vérifié.
- Rien dans `original/` n'a été modifié ; toute l'installation du runtime
  VB5 et d'Xvfb a été faite dans des répertoires de travail hors du dépôt.
- Fait partie du lot historique **crackmes.de** réimporté via
  crackmes.one (`authors/crackmes-de/`) — contrairement à la plupart des
  entrées de cette famille (ELF Linux classiques, souvent NASM), celle-ci
  est une rareté **Windows/VB5** de 1998, ce qui explique le traitement
  dédié (Xvfb + runtime VB5 + GDB, documenté ici intégralement).
