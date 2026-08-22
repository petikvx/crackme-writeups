# AGENTS.md — crackme-writeups

Instructions pour un agent (ou un humain) qui reverse / documente des crackmes dans ce dépôt.

## Mission

Reverse engineering **éducatif** de crackmes (surtout [crackmes.one](https://crackmes.one)) :

1. Scaffolder le challenge (script si besoin)
2. Reverse le binaire
3. Produire un **solveur** reproductible
4. Écrire le **write-up** (`README.md` du challenge)
5. Mettre à jour les index (`ORIGIN.yml`, `authors/*/README.md`, README racine : famille **et** historique)
6. **Stop** : livrer le challenge terminé en local. **Ne pas** `git commit` / `git push` sauf demande explicite de l’utilisateur (« commit », « push », « on push », …)

Les binaires d’origine sont **inclus** (pas des malwares, mais un AV peut gueuler).

---

## Arborescence (ne pas inventer d’autre layout)

```text
authors/<slug-auteur>/
  author.yml              # slug + aliases site
  catalog.yml             # by_id / by_sha256
  README.md               # progression de la famille
  <id-24-hex>/            # ID crackmes.one (pas le titre)
    ORIGIN.yml            # id, urls, binary.sha256, status, series_index?
    README.md             # write-up (rendu GitHub)
    original/             # binaire d’origine (non patché)
      [source/]           # optionnel : décompilé ilspycmd, etc.
    analysis/             # screenshots, dumps IDA exportés
    tools/                # solveur, recon, *-nasm.asm / *-fasm.asm / *-masm.asm
```

- **Clé** = ID crackmes.one (24 hex) + **SHA-256** du fichier dans `original/`.
- `series_index` seulement s’il y a une série numérotée (timotei #01…#12, CFB #1…).

---

## Workflow type (après `add-crackme` ou URL fournie)

### 0. Scaffold

```bash
./scripts/add-crackme.sh https://crackmes.one/crackme/<id>
# ZIP password site : crackmes.one
```

Si l’ID **existe déjà** : le script **ne re-télécharge pas** sans choix  
(`a` annuler · `s` skip · `r` re-dl `original/` · `f` force scaffold)  
ou flags `--skip-existing` / `--force`.

Ne pas re-scaffolder un challenge `status: solved` sans demande explicite.

### 1. Premier regard

```bash
file original/*
diec original/* 2>/dev/null | head
strings -n 6 original/* | head -80
# PE : objdump -d -M intel, wine (console), ilspycmd si .NET
# ELF : readelf, objdump, gdb
```

Identifier : plateforme, arch, compiler, UI (console / GUI), type de prédicat  
(serial, maze, HWID, mini-VM, quiz…).

### 2. Reverse jusqu’à une réponse vérifiable

- Extraire le prédicat (formule, grille, bytecode, HWID…).
- **Vérifier** : solveur + binaire live (Wine pour PE, native pour ELF).
- Ne pas inventer une solution non testée.

### 3. Livrables obligatoires pour un challenge « solved »

| Fichier | Contenu |
|---|---|
| `tools/*-solve.py` (ou équivalent) | keygen / path / password ; `-q`, `--check` si pertinent |
| `README.md` | write-up complet (voir modèle ci-dessous) |
| `ORIGIN.yml` | `status: solved`, `solution_summary`, `series_index` / `local_slug` si série |
| `authors/<slug>/README.md` | ligne dans le tableau de progression |
| README racine | compteur « résolues » de la famille **+** ligne dans **Historique des résolutions** |
| `analysis/` | screenshots live si l’utilisateur en fournit (les lier dans le write-up) |

**Historique (README racine)** : tableau `Date | Crackme | Auteur`.  
Ajouter la **nouvelle résolution en première ligne de données** (juste sous l’en-tête) — **plus récent en haut**.  
Date = jour du commit write-up / soluce (ou jour de la résolution locale si pas encore commit).

### 4. Write-up (`README.md` du challenge)

S’inspirer des challenges déjà solved (CFB #1/#2/#3, plikan, timotei).

Structure type :

1. En-tête : titre, lien ORIGIN + crackmes.one, auteur, plateforme  
2. Table des fichiers du dossier  
3. **Réponse** (serial / path / password) en évidence + commande solveur  
4. Premier regard (`file`, banner, hashes)  
5. Flow  
6. Prédicat (tables, asm, pseudo-code)  
7. Vérification (screenshots + commandes)  
8. Notes (pièges, ce que ce n’est *pas*)

Langue : **français** (comme le reste du dépôt), termes techniques en anglais OK.

### 5. Git (uniquement sur demande)

Par défaut : **aucun** `git commit` ni `git push` à la fin d’un challenge.  
Attendre une consigne claire (`commit`, `push`, `commit + push`, `on push`, …).

Quand c’est demandé :

```bash
git add authors/<slug>/… README.md   # ce qui a changé
git commit -m "message clair (auteur + challenge + idée de la soluce)"
# git push origin main   ← seulement si push demandé aussi
```

- Remote : **`main`** / `origin` (déjà configuré).
- Message de commit : style historique du repo (ex. `cracknotme CFB#3: mini-VM password pwn_vm_3`).
- Ne pas committer `__pycache__/`, bases IDA brutes (voir `.gitignore`).
- Screenshots / binaires d’origine : **oui**, ils font partie du dépôt (quand on commit).

---

## Conventions techniques

### Noms

| Type | Convention |
|---|---|
| Solveur | `tools/<slug>-solve.py` (ex. `cfb3-solve.py`, `easy-keygen-solve.py`) |
| Asm recon | `*-nasm.asm`, `*-fasm.asm`, `*-masm.asm`, dumps IDA nommés clairement |
| Screens | `analysis/screenshot01.png`, ou noms descriptifs (`screenshot-ok.png`, `screenshot-verification-vm.png`) |

### Analyse PE sous Linux

- Préférer **objdump / strings / Python** + **Wine** pour la preuve live console.
- `.NET` : `ilspycmd` → idéalement `original/source/` ; documenter dans le write-up.
- MessageBox Wine : parfois `hWnd` invalide → recon avec `hWnd=NULL` si besoin (cas déjà vus timotei).

### Analyse ELF

- Native Linux : `file`, `readelf`, `objdump`, `gdb`, NASM/FASM pour recon.

### Ce qu’il ne faut pas faire

- Patcher le binaire dans `original/` (garder l’original ; patchs ailleurs si vraiment utiles).
- Republier le challenge comme « nôtre ».
- Écrire des exploits / malware (hors scope éducatif crackme).
- Inventer des chemins hors `authors/<slug>/<id>/…`.
- Laisser `status: pending` si le challenge est réellement résolu.
- Écraser un write-up long avec le squelette `add-crackme` (mode `r` ou édition manuelle).

---

## Checklist « challenge terminé »

- [ ] Solveur dans `tools/`, smoke-test OK  
- [ ] Preuve live (Wine / native) OK  
- [ ] Write-up lisible avec **réponse en tête**  
- [ ] `ORIGIN.yml` : `status: solved` + summary  
- [ ] `authors/<slug>/README.md` + README racine (compteur famille) à jour  
- [ ] Historique README racine : **nouvelle ligne en haut** (`Date | Crackme | Auteur`)  
- [ ] Screenshots liés s’ils existent dans `analysis/`  
- [ ] Git : **seulement si demandé** (`commit` / `push`)

---

## Références rapides dans le repo

| Sujet | Exemple |
|---|---|
| Serial hex par caractère | `authors/cracknotme/…/CFB1` |
| Maze WASD | CFB #2 |
| Mini-VM bytecode | CFB #3 (`pwn_vm_3`, underscores) |
| HWID .NET keygen | `authors/plikan/…` |
| Série ELF/PE + recon asm | `authors/timotei/` |
| Ajout crackme | `scripts/add-crackme.sh`, section README racine |

Quand l’utilisateur dit « on continue » avec une URL `add-crackme` réussie : **enchaîner reverse → solveur → write-up → index** sans redemander la structure. **Pas** de commit/push sauf s’il le demande ensuite.
