# NOTES (session de reverse) — kamil123's BoxVM

> État : **EN COURS, PAS RÉSOLU PAR MOI-MÊME**. `ORIGIN.yml` reste `status: pending`.
> Difficulté officielle crackmes.one : **4.0** (très au-dessus du reste de la session,
> qui tournait autour de 1.0–2.0). Candidat de mot de passe disponible (voir § Réponse
> candidate), mais **non vérifié par exécution directe** — voir § Pourquoi je n'ai pas pu vérifier.

Challenge : https://crackmes.one/crackme/6acec96e6349e4b2540c712b
Binaire : `original/boxvm.exe` (PE32+ x86-64, console, stripped to external PDB, 4.18 MB,
9 sections). SHA-256 : `f521f319ef052e50580861f16aa4d4ded032685c1de19cdf9353e57ce4ca1185`.

Description officielle : *"This crackme brought its own machine. Boot it. Watch it
wake up. Then find the password. Rules: no patching. The machine will know."*

---

## Mécanisme découvert (MCP `ida`, décompile + xrefs ciblés)

Le binaire simule un narratif complet de "hyperviseur imbriqué" (`BoxVM v21`,
vCPU/vMMU/vDisk/vIntCtl, boot réel → protégé → long mode, VM1/VM2/VM3 imbriquées...).
L'essentiel de ce narratif est du **remplissage théâtral** : `.rdata` fait **4.1 Mo**
(quasi tout le fichier), rempli de bannières de boot, ~un millier de paires
`password: xxxNNN` / `flag{mot_mot_NNN}` factices (générées par combinatoire de
mots-clés thématiques : `b0x`, `hyp3r`, `tr4p`, `c0r3`, `d3m4nd`, `vcp4`, `r1ng`,
`sh3ll`, `s3al`, `g u4rd`, `m1gr8`, `n3st`, `p4g3`, `v1rt`, `t1m3r`, `vault`...).

**Mécanisme réel (vérifié par décompile + xrefs, pas par exécution) :**

1. Le programme enregistre **deux gestionnaires d'exception vectorés** (`AddVectoredExceptionHandler`) :
   - `sub_140004570` (**First=1**, prioritaire) : énorme fonction (2729 lignes de
     pseudo-code), c'est en réalité le **cœur de la "VM"** — elle intercepte les fautes
     `STATUS_PRIVILEGED_INSTRUCTION` (instructions `rdmsr`/`wrmsr`/accès CR/DR/IO/`invlpg`
     exécutées en ring 3, qui lèvent un `#GP` toujours intercepté) et `STATUS_ACCESS_VIOLATION`
     (simulation de pagination / multi-vCPU). C'est ELLE qui lit le mot de passe
     (`fgets`) après avoir imprimé tout le narratif de boot, dans un `case` du grand
     switch sur l'adresse fautive. **Zéro appelant visible en xref normal** : tout le
     programme s'exécute en tant que *gestionnaire de faute*, jamais par appel de
     fonction classique — d'où l'absence totale de call-graph exploitable statiquement.
   - `Handler` (`0x140001840`, **First=0**, fallback) : gère une *deuxième* famille de
     "hypercalls" déclenchés par une instruction illégale précédée de `mov ax, 0C0E2h`
     (magic). Fait un **hash FNV-1a anti-tamper** sur les 147 premiers octets de
     `sub_140004570` (+ un second contrôle via `sub_1400014C0`), stocke un flag
     "compromised", puis selon le registre `Rcx` au moment de la faute :
     - `Rcx==2` → renvoie `compromised XOR 1` (sonde d'intégrité) ;
     - `Rcx==3` → renvoie `0xB0C0DE` si `compromised==0`, sinon `0` ;
     - `Rcx==1` → renvoie un octet `(-compromised) XOR (13*Rdx) XOR 0x2B` — très
       probablement un **flux de déchiffrement** (keystream) pour décoder le vrai
       mot de passe/flag quelque part dans le blob `.rdata` de 4 Mo, **gated** par
       l'intégrité du code (`compromised==0`) — cohérent avec "Rules: no patching.
       The machine will know." : patcher `sub_140004570` change le hash → `compromised=1`
       → keystream faux → mauvais déchiffrement.

2. **`sub_140009490` est un LEURRE (dead code)** : fonction propre, lisible, qui
   compare l'entrée (≤8 car.) aux **noms des sections PE du fichier lui-même**
   (`.text`, `.data`, `.rdata`, …, lus directement depuis l'en-tête PE en mémoire,
   `MEMORY[0x140000000]` etc.) via `strncmp`. Ressemble exactement à "LE" check
   qu'un analyste pressé voudrait trouver — **zéro xref vers elle dans tout le
   binaire** (vérifié par recherche exhaustive du texte `9490` dans le pseudo-code
   des 204 fonctions). Testé quand même par acquit de conscience (tous les noms de
   section) : aucun ne donne "Correct!" (voir § Pourquoi je n'ai pas pu vérifier —
   Wine plante avant même d'atteindre la comparaison, donc ce test n'est pas
   concluant en soi, mais la découverte de **zéro appelant** suffit à la disqualifier).

Le vrai mot de passe est donc très probablement **déchiffré dynamiquement** via le
mécanisme à l'étape 1 (keystream `Rcx==1`), appliqué à des octets du blob `.rdata`
qui n'ont pas encore été localisés précisément (pas eu le temps/l'émulation
nécessaire pour le confirmer octet par octet).

---

## Pourquoi je n'ai pas pu vérifier par exécution

Le mécanisme d'instructions privilégiées (`rdmsr` notamment, vu en désassemblage
sous Wine : `boxvm+0x331c: rdmsr`) nécessite que l'OS retransmette la faute `#GP`
exactement comme le ferait un vrai Windows — **Wine ne le fait pas correctement** :

```bash
printf '.text\n' | wine original/boxvm.exe
# ... [guest] vRTC says: 0 ms since machine boot
# wine: Unhandled page fault on read access to FFFFFFFFFFFFFFFF at address ...331C
# wine: Unhandled exception: ... rdmsr ...
```

Le crash survient **systématiquement au même point** (juste après "vRTC says..."),
**avant même l'affichage du prompt "Enter password:"**, quel que soit le texte
d'entrée fourni (testé avec 9 candidats différents : noms de sections PE +
`unb0x_m3_1f_u_c4n`). Donc **aucune tentative d'exécution dans cette session n'a pu
atteindre le point de comparaison réel**, qu'elle que soit la justesse du mot de
passe essayé — le test est systématiquement non concluant, pas un échec du mot
de passe candidat.

## Réponse candidate (non vérifiée par moi)

Les commentaires publics de la page crackmes.one (visibles sans connexion,
non masqués malgré le tag "spoiler") donnent, de façon concordante, deux solveurs
indépendants :

```
2026-10-14 15:31  megahacker228  password: unb0x_m3_1f_u_c4n
2026-10-15 11:32  ib_root        unb0x_m3_1f_u_c4n
```

Cohérent thématiquement (« unbox me if you can ») et nettement différent du
format des dizaines de leurres aléatoires (`mot_mot_NNN`). **Je ne l'ai pas vérifié
moi-même par exécution** (limite Wine ci-dessus) : ne pas le présenter comme
prouvé dans le write-up final tant qu'une vérification indépendante (native
Windows, ou émulation Unicorn complète du mécanisme privilégié) n'a pas été faite.

## À faire pour une résolution complète

1. Localiser précisément dans `.rdata` les octets déchiffrés par le keystream
   `Rcx==1` de `Handler` (probablement le vrai mot de passe/flag).
2. Soit : obtenir un environnement Windows natif (ou une VM) pour exécuter le
   binaire jusqu'au bout et confirmer `unb0x_m3_1f_u_c4n` par la vraie sortie
   "Correct!" ;
   soit : écrire un harnais Unicorn (installé, `pip show unicorn` → 2.1.4) qui
   charge le PE, mappe les sections, hooke les instructions privilégiées
   (`rdmsr`/CR/DR/IO/`invlpg`) et l'opcode illégal `mov ax,0C0E2h`, et réimplémente
   en Python la logique des deux handlers (`sub_140004570` et `Handler`) pour
   rejouer tout le boot sans dépendre de Wine.
3. Une fois confirmé : solveur reproductible, write-up définitif, `ORIGIN.yml`
   → `status: solved`, mise à jour des index.
