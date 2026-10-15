# kamil123 — BoxVM

> **Statut : EN COURS, PAS RÉSOLU.** Reverse avancé (mécanisme identifié), mais
> mot de passe **non vérifié par moi-même** — voir § Pourquoi, et § Réponse candidate.
> Difficulté officielle : **4.0** (nettement au-dessus du reste des challenges
> traités ce soir, qui tournaient autour de 1.0–2.0).

| | |
|---|---|
| **ID** | [`6acec96e6349e4b2540c712b`](https://crackmes.one/crackme/6acec96e6349e4b2540c712b) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | kamil123 |
| **Plateforme** | Windows PE32+ x86-64, console, stripped to external PDB, 4.18 MB, 9 sections |
| **SHA-256** | `f521f319ef052e50580861f16aa4d4ded032685c1de19cdf9353e57ce4ca1185` |

## Description officielle (crackmes.one)

> *"This crackme brought its own machine. Boot it. Watch it wake up. Then find the
> password. Rules: no patching. The machine will know."*

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/boxvm.exe` | binaire |
| `analysis/NOTES.md` | notes complètes de la session d'investigation (mécanisme, fonction leurre, limite Wine) |

## Réponse candidate (⚠️ non vérifiée par exécution)

Les commentaires publics de la page crackmes.one (deux solveurs indépendants,
non masqués) donnent :

```
unb0x_m3_1f_u_c4n
```

Cohérent thématiquement (« unbox me if you can », le thème de la « boîte » du
challenge) et structurellement différent des centaines de leurres générés par le
binaire (`mot_mot_NNN`). **Je n'ai pas pu le confirmer moi-même** par exécution
directe (voir § Pourquoi je n'ai pas pu vérifier) — à traiter comme un indice
communautaire fort, pas une preuve.

## Premier regard

```bash
file original/boxvm.exe
# PE32+ executable (console), x86-64, stripped to external PDB, 9 sections
strings -n 6 original/boxvm.exe | grep -iE "vm|box|flag|password"
```

Immédiatement visible : un narratif complet de « mini-hyperviseur » (`BoxVM v21`,
boot 16-bit réel → protégé → long mode, vCPU/vMMU/vDisk, VM imbriquées L1→L2→L3…)
et **des centaines** de paires `password: xxxNNN` / `flag{mot_mot_NNN}` factices,
générées par combinatoire de racines (`b0x`, `hyp3r`, `tr4p`, `c0r3`, `vault`,
`d3m4nd`, `r1ng`, `sh3ll`, `vcp4`…). `.rdata` fait **4.1 Mo** (l'essentiel du
fichier) — un « disque »/ROM de façade annoncé `sectors=8400`.

## Comment on trouve (ce qui est confirmé statiquement)

**Ancrage.** MCP `ida` (headless) : 204 fonctions. Les chaînes `"Enter password: "`
et `"[+] Correct! You escaped the box, reverser!"` **n'ont aucune xref statique**
(ni code, ni data) — signe qu'elles sont référencées uniquement de façon indirecte.

**Le vrai mécanisme — deux gestionnaires d'exception vectorés.** Le programme
appelle `AddVectoredExceptionHandler` deux fois :

1. **`sub_140004570`** (prioritaire, `First=1`) — fonction de **2729 lignes** de
   pseudo-code, qui est en réalité **tout le programme** : elle intercepte les
   fautes `STATUS_PRIVILEGED_INSTRUCTION` levées par de vraies instructions
   privilégiées exécutées en ring 3 (`rdmsr`, accès CR/DR, I/O, `invlpg` — vu en
   désassemblage sous Wine : `boxvm+0x331c: rdmsr`) et les fautes de pagination
   (`STATUS_ACCESS_VIOLATION`, simulation de « vCPU »/« pages »). C'est à
   l'intérieur de cette fonction, dans un `case` du grand switch sur l'adresse
   fautive, que le programme lit le mot de passe (`fgets`) — **après** tout le
   narratif de boot. **Zéro appelant visible dans le call-graph normal** : tout
   s'exécute via des fautes CPU, jamais par appel de fonction ordinaire — ce qui
   explique l'absence totale d'xref vers les chaînes « password »/« Correct ».
2. **`Handler`** (`0x140001840`, fallback, `First=0`) — gère une famille différente
   de « hypercalls » déclenchés par une instruction illégale précédée de
   `mov ax, 0C0E2h` (magic). Calcule un **hash FNV-1a d'auto-intégrité** sur les
   147 premiers octets de `sub_140004570`, pose un flag `compromised`, puis
   selon le registre `Rcx` : `2` → sonde d'intégrité, `3` → constante `0xB0C0DE`
   si intact, `1` → **octet de keystream** `(-compromised) XOR (13·Rdx) XOR 0x2B`,
   très probablement utilisé pour **déchiffrer le vrai mot de passe/flag** quelque
   part dans le blob `.rdata` — avec un `compromised` non nul (code patché) qui
   casserait silencieusement le déchiffrement. Ça correspond exactement à
   « Rules: no patching. The machine will know. ».

**Le piège : `sub_140009490`, un leurre « propre ».** Une fonction nette et
lisible compare l'entrée (≤8 car.) aux **noms des sections PE du fichier
lui-même** (`.text`, `.data`, `.rdata`…, lus directement dans l'en-tête PE en
mémoire) via `strncmp` — exactement le genre de fonction qu'un outil ou un
analyste pressé repère et prend pour « LE » check. Recherche exhaustive
(texte `9490` dans le pseudo-code des 204 fonctions, data refs, code refs) :
**aucun appelant nulle part dans le binaire**. C'est un honeypot statique.
Testé quand même (tous les noms de section comme mot de passe) : aucun ne
donne « Correct! », mais ce test n'est pas concluant en soi vu la limite
suivante.

## Pourquoi je n'ai pas pu vérifier par exécution

```bash
printf '.text\n' | wine original/boxvm.exe
# ... [guest] vRTC says: 0 ms since machine boot
# wine: Unhandled page fault ... at address 000000014000331C
# ... boxvm+0x331c: rdmsr
```

Le mécanisme d'instructions privilégiées nécessite que l'OS retransmette la
faute `#GP` exactement comme un vrai Windows le ferait. **Wine ne le fait pas
correctement** : le process plante systématiquement au même point, juste après
`[guest] vRTC says: 0 ms since machine boot`, **avant même l'affichage du prompt
du mot de passe** — quel que soit le texte fourni en entrée. Testé avec 9
candidats différents (les 8 noms de section PE + `unb0x_m3_1f_u_c4n`) : **tous
crashent au même endroit**, donc aucun test effectué dans cette session n'a pu
réellement atteindre la comparaison du mot de passe. Ce n'est pas un rejet du
candidat — c'est une limite de l'environnement d'exécution disponible ici.

## À faire pour clore ce challenge

1. Localiser précisément les octets `.rdata` déchiffrés par le keystream
   `Rcx==1` du `Handler` (probablement le vrai secret).
2. Vérifier `unb0x_m3_1f_u_c4n` soit sur une vraie machine Windows, soit via un
   harnais **Unicorn** qui charge le PE, mappe les sections, hooke les
   instructions privilégiées et l'opcode magique `0xC0E2`, et rejoue la logique
   des deux handlers sans dépendre de Wine.
3. Une fois confirmé : solveur reproductible + `ORIGIN.yml: status: solved` +
   mise à jour des index.

Détails complets de l'investigation (adresses, pseudo-code, recherche
exhaustive de xrefs) : [`analysis/NOTES.md`](analysis/NOTES.md).
