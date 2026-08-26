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
# plusieurs d’un coup :
./scripts/add-crackme.sh URL1 URL2 ID3
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
# PE : objdump -d -M intel, wine (console), decompiledotnet / ilspycmd si .NET
# ELF : readelf, objdump, gdb
# PyInstaller (PE/ELF « python ») : voir § Python / PyInstaller ci-dessous
```

Identifier : plateforme, arch, compiler, UI (console / GUI), type de prédicat  
(serial, maze, HWID, mini-VM, quiz…).

Si besoin de **sources lisibles** du binaire (hors Python) — wrappers dans `~/.bash_aliases` :

```bash
# Shell interactif (charge .bash_aliases) — IDA_HOME/idat
decasm original/<binaire>   # idat -B            → listing .asm (+ .i64)
decc   original/<binaire>   # idat -A -Sproduce_c_file.py → <idb>.c (Hex-Rays)
# .NET : décompilation C# via ilspycmd (préférer ça plutôt que d’appeler ilspycmd à la main)
decompiledotnet original/<assembly.exe>   # → original/<stem>-src/ (projet C#)
# depuis un shell non-interactif (agent) :
bash -ic 'decc original/<binaire>'
bash -ic 'decasm original/<binaire>'
bash -ic 'decompiledotnet original/<assembly.exe>'
```

Sorties typiques à côté du binaire (ex. `foo.exe.i64`, `foo.exe.i64.c`, `foo-src/`) : déplacer / copier sous `analysis/` ou garder en `original/source/` / `original/<stem>-src/` si utile ; **`*.i64` est gitignoré**, le `.c` / sources C# peuvent aller dans le dépôt. Documenter la commande dans le write-up.

### 2. Reverse jusqu’à une réponse vérifiable

- Extraire le prédicat (formule, grille, bytecode, HWID…).
- **Vérifier** : solveur + binaire live (Wine / **`xvfb-run -a wine`** sur serveur sans écran ; native pour ELF).
- Ne pas inventer une solution non testée.
- Si le binaire est **déjà chargé / actif dans x64dbg (ou x32dbg)** via MCP : voir **§ Debug live x64dbg** — approfondir le dynamique et enrichir le write-up **en cours**, ne pas attendre la fin du reverse.

---

## Debug live x64dbg / x32dbg (MCP)

Serveurs MCP configurés dans `~/.grok/config.toml` : `x64dbg`, `x32dbg`.  
Dès qu’on reverse un challenge PE (ou qu’on reprend une analyse) :

1. **Interroger le debugger** (`search_tool` / outils MCP) : y a-t-il un processus / module actif qui correspond au binaire du challenge (`original/…`, même nom, chemin, ou image en mémoire) ?
2. **Si oui (actif / attaché)** — **obligatoire** d’en profiter tout de suite :
   - Approfondir le reverse **dynamique** : EIP/RIP, registres, pile, mémoire autour du prédicat, breakpoints sur cmp/call critiques, dump de buffers (name/serial, clé, état VM…).
   - Croiser live ↔ statique (`decc` / `objdump` / strings) : confirmer ou corriger les hypothèses.
   - **Mettre à jour le write-up / notes `analysis/` en cours** avec ce qu’on voit (adresses, valeurs, captures si fournies) — pas un paragraphe vague « vu sous x64dbg » à la fin.
   - Préférer x64dbg pour PE64, x32dbg pour PE32 ; si le MCP timeout (hôte debug injoignable), le noter et continuer en statique / Wine.
3. **Si non** : workflow habituel (statique + Wine / native). Ne pas exiger que l’utilisateur lance x64dbg ; ne pas inventer un état debugger.

Le debug live **complète** la preuve Wine / solveur ; il ne remplace pas un solveur reproductible.

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
3. **Réponse** (serial / path / password) en évidence + commande solveur — si user/login : exemple **`petik`**  

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

### Outils : CLI d’abord

Pour reverse / preuve / solveurs dans ce dépôt, **préférer les outils en ligne de commande** (agent, serveur headless, scripts reproductibles) :

- OK : `file`, `diec`, `strings`, `objdump`, `readelf`, `gdb`, `Wine`/`xvfb-run`, `ilspycmd` / `decompiledotnet`, `GoReSym`, `pycdc`, `yara`/`yarac`, `tools/upx-3.96`, `tools/pyinstxtractor.py`, IDA **headless** (`decc` / `decasm`)
- Éviter d’**exiger** des GUI (Ghidra/Cutter/IDA interactive, etc.) pour un challenge « solved » — utiles seulement si l’utilisateur les pilote (ex. x64dbg MCP déjà actif)

`scripts/install-re-tools.sh` ne pose que du CLI (+ snap `glow` pour le markdown terminal).

**YARA** : compilé depuis les sources (VirusTotal, même idée que `postinstall` dans `~/.bash_aliases`) → tree `~/yara` + symlinks `/usr/local/bin/yara` / `yarac`. **Pas** le paquet apt `yara`, **pas** `yara-python` pour la CLI.

### Noms

| Type | Convention |
|---|---|
| Solveur | `tools/<slug>-solve.py` (ex. `cfb3-solve.py`, `easy-keygen-solve.py`) |
| Asm recon | `*-nasm.asm`, `*-fasm.asm`, `*-masm.asm`, dumps IDA nommés clairement |
| Screens | `analysis/screenshot01.png`, ou noms descriptifs (`screenshot-ok.png`, `screenshot-verification-vm.png`) |
| User / login d’exemple | **`petik`** (voir ci-dessous) |

### Exemples user / keygen : toujours `petik`

Quand un challenge prend un **username / login / name** (keygen, name→serial, user+key, …) :

- Write-up « Réponse » : table d’exemple avec **`petik`** (et le serial/password qui en découle).
- Solveur : défaut CLI `--user` / `--login` / `--name` = **`petik`** ; docstrings / `-q` / `--check` alignés.
- Index (`authors/*/README.md`, `solution_summary`) : citer `petik→…` plutôt que `test` / `admin` / le nick de l’auteur du crackme.

Exceptions seulement si la contrainte du binaire **interdit** `petik` (longueur min/max, charset, etc.) — alors le dire dans le write-up et choisir le plus proche possible.

### Analyse PE sous Linux

- Préférer **objdump / strings / Python** + **Wine** pour la preuve live console.
- **Serveur dédié / sans display** : Wine GUI casse souvent → wrapper **`xvfb-run`** (Xvfb) :
  ```bash
  xvfb-run -a wine original/<exe>
  xvfb-run -a wineconsole original/<exe>   # si console
  ```
  (`scripts/install-re-tools.sh` installe `xvfb` ; check : `xvfb-run`, `Xvfb`.)
- **UPX** (si `file` / DIE / sections `UPX0`/`UPX1`) : utilitaire repo-wide **`tools/upx-3.96`** — ne pas re-télécharger UPX, ne pas unpacker dans `original/` :
  ```bash
  ./tools/upx-3.96 -d -o analysis/<name>.unpacked.exe original/<exe>
  # ou in-place sur une copie :
  cp original/<exe> analysis/<name>.unpacked.exe
  ./tools/upx-3.96 -d analysis/<name>.unpacked.exe
  ```
  Reverse sur l’unpacké sous `analysis/` ; preuve live = binaire d’origine (souvent encore packé).
- `.NET` : wrapper shell **`decompiledotnet`** (`~/.bash_aliases`, s’appuie sur `ilspycmd -p`) — décompile tranquillement un crackme .NET en projet C# :
  ```bash
  # fichier → crée <stem>-src/ à côté, laisse l’exe en place
  bash -ic 'decompiledotnet original/<assembly.exe>'
  # dossier → chaque *.exe du dossier (mode historique ; déplace l’exe en .ex_ dans le sous-dossier)
  bash -ic 'decompiledotnet analysis/some-dir/'
  ```
  Sortie typique : `original/<stem>-src/` (ou déplacer / renommer en `original/source/`). Documenter dans le write-up. Éviter d’appeler `ilspycmd` à la main si `decompiledotnet` est dispo.
- MessageBox Wine : parfois `hWnd` invalide → recon avec `hWnd=NULL` si besoin (cas déjà vus timotei).
- Dumps C/asm : fonctions shell `decc` / `decasm` (`~/.bash_aliases` → `idat`) ; via `bash -ic 'decc …'` si le shell agent n’est pas interactif. Sinon export IDA manuel vers `analysis/`.

### Analyse ELF

- Native Linux : `file`, `readelf`, `objdump`, `gdb`, NASM/FASM pour recon.

### Go

Quand `file` / DIE annonce un binaire **Go** (souvent gros, statique, parfois stripé) :

```bash
go version -m original/<bin>     # buildinfo / modules (si non stripé)
GoReSym original/<bin>           # pclntab / symboles / types (strip OK)
# alias minuscule aussi installé :
goresym original/<bin>
```

`GoReSym` + `golang-go` : via `scripts/install-re-tools.sh`.

### Python / PyInstaller

Quand `file` / DIE annonce **PyInstaller** (ou un « python frozen » PE/ELF) :

1. Extraire avec l’outil partagé du dépôt :
   ```bash
   python3 tools/pyinstxtractor.py path/to/original/<exe>
   # sortie typique : <exe>_extracted/ (pyc, PYZ, manifest…)
   ```
   Garder l’extrait sous `analysis/` (ne pas polluer `original/`).
2. Décompiler les `.pyc` avec **`pycdc`** (installé par `scripts/install-re-tools.sh`) :
   ```bash
   pycdc analysis/<exe>_extracted/<module>.pyc > analysis/source/<module>.py
   # disasm bytecode si besoin :
   pycdas analysis/<exe>_extracted/<module>.pyc
   ```
   Repli : `decompyle3` / `uncompyle6` si `pycdc` absent. Sortie idéalement `original/source/` ou `analysis/source/`.
3. Reverse / solveur comme d’habitude ; preuve live = binaire d’origine (Wine ou native).

Utilitaires **repo-wide** (pas des solveurs de challenge) :

| Outil | Rôle |
|---|---|
| `tools/upx-3.96` | unpack UPX 3.96 (PE/ELF) → sortie sous `analysis/` |
| `tools/pyinstxtractor.py` | extract PyInstaller |
| `pycdc` / `pycdas` | décompile / disasm `.pyc` (via `install-re-tools.sh`) |
| `GoReSym` | symboles Go / pclntab (via `install-re-tools.sh`) |
Les solveurs restent dans `authors/<slug>/<id>/tools/`.

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
- [ ] Preuve live (Wine / native) OK ; si x64dbg/x32dbg MCP actif sur le binaire → observations dynamiques dans le write-up  

- [ ] Write-up lisible avec **réponse en tête** (user d’exemple = **`petik`** si applicable)  
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
| Unpack UPX | `tools/upx-3.96` → `analysis/*.unpacked.exe` |
| Extract PyInstaller | `tools/pyinstxtractor.py` puis `pycdc` |
| Décompile .NET | `decompiledotnet` (`~/.bash_aliases` → `ilspycmd -p`) |
| Go strip / pclntab | `GoReSym` / `go version -m` |
| YARA (CLI) | build `install-re-tools.sh` / `postinstall` → `yara` `yarac` |

Quand l’utilisateur dit « on continue » avec une URL `add-crackme` réussie : **enchaîner reverse → solveur → write-up → index** sans redemander la structure. **Pas** de commit/push sauf s’il le demande ensuite.
