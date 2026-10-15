# NOTES (session de reverse) — sumhex's RiJiN crackme

> État : **EN COURS, PAS RÉSOLU**. `ORIGIN.yml` reste `status: pending`.
> Difficulté officielle crackmes.one : **4.5** (la plus haute rencontrée ce soir).
> Labels : Anti-debugging, IsDebuggerPresent, Packer, Code virtualization / VM,
> Control-flow obfuscation. **Zéro solveur public** listé sur la page (contrairement
> à BoxVM qui en avait 8) — personne n'a visiblement résolu ce challenge à ce jour.

Challenge : https://crackmes.one/crackme/6ace4d0b6349e4b2540c7107
Binaire : `original/sumhex.exe` (PE32+ x86-64, **GUI** (pas console), stripped to
external PDB, 364 KB, 6 sections + une section non standard `.obfh`).
SHA-256 : `4a6d0572400555e8c2fb2ec7be31bf5beca437c46b822b41ed948f93afdde8de`.

Description officielle : *"crackme with RiJiN's loader design, obfuscated by
obfus.h (by DosX)"* — `obfus.h` est un obfuscateur C/C++ public connu
(flattening de flot de contrôle + prédicats opaques + junk bytes anti-désassemblage).

---

## Flux applicatif (confirmé par décompile IDA, fiable)

Ce n'est **pas** une fenêtre custom avec un champ de saisie : le mot de passe est
saisi via la **boîte de dialogue Windows native** `CredUIPromptForWindowsCredentialsW`
(import `credui.dll`), exactement comme une invite d'identifiants Windows. Le texte
saisi est ensuite récupéré via `CredUnPackAuthenticationBufferW`.

Fonction hôte : `sub_401a14` (alias affiché `sub_4019B6`/chaînes « Enter password? »,
« wrong key, keep reversing », « wrong key, try again », « find the key »).
Elle est **entièrement décompilable** (pas obfusquée elle-même) :

1. `sub_439301()` : garde initiale (très probablement anti-debug/anti-instance,
   proche de l'import `IsDebuggerPresent` @ `0x44f4b0`, appelé depuis `0x439341`
   dans le même voisinage) — si échoue, affiche un message alternatif et quitte.
2. `CredPackAuthenticationBufferW` → `CredUIPromptForWindowsCredentialsW` (titre
   « sumhex crackme », nom d'utilisateur par défaut pré-rempli **`@mov_eax_4`** —
   clin d'œil cosmétique, pas un indice fonctionnel) → `CredUnPackAuthenticationBufferW`
   pour extraire le mot de passe tapé (UTF-16).
3. Le mot de passe est compté (longueur), puis **réduit à une copie ANSI** octet
   par octet ; si un seul caractère est non-ASCII (`>0x7F`), un flag `rbp-1284`
   passe à 0 et **la vérification réelle est court-circuitée** (traité comme faux).
4. Si 100% ASCII : appel de **`sub_44A76C(ansi_password, len, out_buf, 0x100)`** —
   **c'est le vrai vérificateur**. Son retour non nul → `dword_45D038 = 1` (succès).
5. Affichage final : « find the key » (style normal) si succès, « wrong key, keep
   reversing » / « wrong key, try again » sinon — la différenciation success/fail
   passe par un paramètre caractère (`'w'` vs `'0'`) donné à la routine d'affichage
   `sub_4019B6`, probablement une couleur/état, pas un texte de victoire explicite
   type « Congratulations ».

## Le vérificateur réel est fortement obfusqué (obfus.h / RiJiN)

`sub_44A76C` (et toute la chaîne qu'elle appelle) est **illisible directement** en
pseudo-code : prédicats opaques (`x + x² toujours pair`, `(x+a)(x+a+1)+1 toujours
impair`, `(x)^4 & 0xE toujours 0`…), constantes XOR, et surtout des **dispatchs
par pointeur de fonction calculé** (`*(v0-24) = sub_X ^ constante ; call *(v0-24)`)
qui forment une chaîne de « trampolines » : `sub_44A76C → {sub_44AA72|sub_44AB00}
→ sub_44AB8E → sub_44AC51 → … → sub_4073FD → …` (confirmé en suivant la trace
d'exécution angr, ~61 blocs de base avant un premier retour).

**Fausse piste initiale, corrigée en cours de route** : `sub_44F188`, appelée en
tête de chaque fonction obfusquée avec un « magic » dans `eax` (`mov eax,0x13A0;
call sub_44F188`), ressemble à un dispatcher de VM mais **n'en est pas un** — son
désassemblage brut (`xchg [rsp],rbp; push rbp; lea rbp,[rsp+8]; ...; test
qword[rcx],rax; ...; jmp [rax+8]`) est la signature exacte du **`__chkstk`**
standard MSVC (stack-probe pour les grosses frames), juste rendu confus par
Hex-Rays à cause de son prologue non standard. `eax` = taille à allouer, pas un
opcode. **Leçon** : vérifier par désassemblage brut avant de conclure à un VM
dédié — l'air de famille avec un dispatcher peut tromper.

Plus loin dans la chaîne (`sub_4073FD` et suivantes), le code calcule une valeur
par mélange bit à bit (XOR/ROL/ROR/ADD/SUB en chaîne façon mini-hash) **à partir
de l'adresse de pile elle-même** (`*(v0-11) = ((v0-68)>>4) ^ 0xD4655C11` dans
`sub_44A76C`, consommé par les trampolines suivants) — un sélecteur de branche
qui dépend de l'**adresse runtime**, pas seulement du mot de passe. Objdump brut
montre aussi de nombreux octets de désassemblage-poubelle après les branches
mortes (anti-désassemblage classique) : ne jamais faire confiance à un
désassembleur linéaire après un saut conditionnel dans cette zone, toujours
suivre le flot réel.

## Tentative d'exécution symbolique (angr) — résultat actuel : non concluant

`angr` (+ `claripy` 9.3.7 forcé avec `z3-solver` 5.1.0.0, installés dans la
session — pas de sudo nécessaire, voir commandes ci-dessous) permet d'exécuter
mécaniquement tout ce magma sans avoir à le comprendre bloc par bloc. Scripts
dans `tools/` :

- `tools/angr-harness-verify.py` : exécute `sub_44A76C(password_symbolique,
  longueur, out_buf, 0x100)` depuis un état « blank » (pile angr par défaut,
  pas une vraie exécution du programme depuis `main`).
- `tools/angr-sweep-lengths.py` : balaie les longueurs 1 à 24.

**Résultat pour TOUTES les longueurs testées (1-24), mot de passe entièrement
symbolique ASCII imprimable** : exactement **61 blocs**, **zéro fork**, retour
`RAX = 0` **concret** (jamais symbolique) — c.-à-d. que le chemin exploré ne
dépend **d'aucun octet du mot de passe testé** et échoue toujours. Testé aussi
avec le candidat des commentaires publics `LwDYrgFzXpnB87K4tySLZJjyg6tRNFXNfgkFx96yNdBHZqgY`
(commentaire de `arshi`, **non confirmé comme solution validée** — contrairement
au challenge BoxVM précédent, cette page ne liste **aucun solveur**, donc ce
candidat pourrait être une simple tentative, pas une réponse prouvée) : 124
blocs, `RAX = 0` aussi (échec), mais pas de certitude que mon harnais reproduise
fidèlement l'état réel du programme à ce point (voir limite ci-dessous).

## Limite actuelle (pourquoi ce n'est pas concluant)

L'exécution symbolique part d'un état **"blank"** directement à l'adresse de
`sub_44A76C`, pas d'une vraie exécution depuis le point d'entrée du programme.
Deux conséquences :

1. Les prédicats basés sur l'**adresse de pile** (`(v0-68)>>4`) prennent une
   valeur arbitraire (celle que `angr` choisit par défaut pour `rsp`), pas celle
   d'une vraie exécution Windows — si le code s'en sert comme **sélecteur de
   branche réel** (pas juste une obfuscation tautologique), mon harnais peut
   suivre un chemin « poubelle » qui échoue toujours, sans jamais atteindre la
   vraie comparaison du mot de passe.
2. Le flot GUI (fenêtre, boucle de messages, `CredUIPromptForWindowsCredentialsW`)
   n'est pas rejoué : impossible ici de lancer le vrai binaire pour comparer
   (pas d'outil d'automatisation GUI disponible dans cette session — `xvfb`,
   `xdotool` absents, installation `apt` bloquée sans sudo interactif ; la
   connexion à l'affichage X réel de la machine est refusée par le bac à sable
   de l'agent — limite d'environnement délibérée, pas contournée).

## À faire pour une résolution complète

1. **Démarrer l'état angr plus tôt** (depuis l'entrée réelle du programme ou au
   moins depuis `sub_401a14` juste avant l'appel à `sub_44A76C`), avec un
   `CallState`/hooks sur `CredUIPromptForWindowsCredentialsW` et
   `CredUnPackAuthenticationBufferW` pour injecter le mot de passe symbolique
   **exactement comme le vrai flot le ferait** (bon `rsp`/pile cohérente avec le
   reste du programme).
2. Élargir l'exploration (`simgr.explore` avec de vrais `find`/`avoid`, pas une
   simple boucle `step()`) sur une fenêtre de temps plus longue, pour laisser
   `angr` forker sur les branches qui dépendent réellement du mot de passe une
   fois le bon contexte en place.
3. Si l'adresse de pile influence vraiment la sélection de branche (pas qu'une
   obfuscation tautologique), envisager une exécution **concrète** (Unicorn, ou
   une vraie machine Windows) plutôt que purement symbolique.
4. Une fois un mot de passe candidat confirmé par `RAX != 0` dans le harnais (ou
   par exécution réelle) : solveur reproductible, write-up définitif,
   `ORIGIN.yml → status: solved`, mise à jour des index.

## Commandes utiles pour reprendre

```bash
cd authors/sumhex/6ace4d0b6349e4b2540c7107
pip install angr && pip install claripy==9.3.7 --no-deps   # évite le conflit z3-solver avec angr 10.x
python3 tools/angr-sweep-lengths.py
```
