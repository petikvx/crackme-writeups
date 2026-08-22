# crackme-writeups

Write-ups de crackmes (surtout [crackmes.one](https://crackmes.one)). Reverse engineering éducatif, un dossier par auteur / série, un sous-dossier par épreuve.

Les binaires d’origine sont inclus. Ce ne sont **pas** des malwares, mais un AV peut quand même gueuler sur les ELF / PE.

> **Agents / automatisation** : voir [`AGENTS.md`](AGENTS.md) (workflow reverse → solveur → write-up → index ; commit/push **sur demande**).

## Arborescence

```
crackme-writeups/
├── README.md
├── scripts/
│   ├── install-re-tools.sh
│   ├── install-grok-build.sh   ← Grok Build (Colab / Codespaces / local)
│   └── add-crackme.sh          ← URL ou ID crackmes.one
└── authors/
    └── <auteur>/                 # slug local (ex. timotei)
        ├── author.yml            # aliases site (timotei / tim0tei / …)
        ├── catalog.yml           # id ↔ sha256 ↔ path
        ├── README.md
        └── <id-crackmes.one>/    # ex. 64e275ead931496abf908ff7
            ├── ORIGIN.yml        # id + urls + binary.sha256
            ├── README.md         # write-up
            ├── original/         # binaire d’origine
            ├── analysis/         # IDA, screenshots
            └── tools/            # solveur, recon, serializers
```

L’**ID** crackmes.one est la clé d’origine ; le **SHA-256** du fichier dans `original/` prouve le binaire.
Un numéro de série (`series_index`) n’est utilisé que s’il existe (ex. timotei #01…#12).

Outils Linux (file, objdump, gdb, nasm, wine32, xvfb, diec, glow, …) :

```bash
./scripts/install-re-tools.sh --dry-run
./scripts/install-re-tools.sh          # sudo / apt (+ snap install glow)
```

Grok Build (agent TUI xAI) — utile sur **Codespaces** / **Colab** / machine locale :

```bash
./scripts/install-grok-build.sh --dry-run
./scripts/install-grok-build.sh              # curl | install.sh officiel
./scripts/install-grok-build.sh --login      # + grok login --device-auth
```

Auth sans navigateur local : `grok login --device-auth` (ou `export XAI_API_KEY=…`).

- `glow` (rendu markdown en terminal) : **snap** si `snap` est disponible.
- `xvfb` / `xvfb-run` : display virtuel pour lancer **Wine** sur un serveur sans écran :

```bash
xvfb-run -a wine original/CFB1.exe
```

- `diec` (Detect It Easy, binaire CLI) : **pas** un paquet apt — le script télécharge le **.deb** adapté à la distro depuis [DIE-engine releases](https://github.com/horsicq/DIE-engine/releases) (`/etc/os-release` / `lsb_release` → Ubuntu 20.04 / 22.04 / 24.04 / 26.04, Debian, …).

### Ajouter un crackme (crackmes.one)

**Dépendances** : `curl`, `7z` (p7zip), `sha256sum`, `python3`.

```bash
# n’importe laquelle de ces formes
./scripts/add-crackme.sh https://crackmes.one/crackme/<id>
./scripts/add-crackme.sh https://crackmes.one/download/crackme/<id>
./scripts/add-crackme.sh <id>

# forcer le slug auteur local (recommandé pour une série connue)
./scripts/add-crackme.sh --author timotei <id-ou-url>

# options
./scripts/add-crackme.sh --dry-run <id>         # simule, n’écrit rien
./scripts/add-crackme.sh --no-download <id>     # dossiers + ORIGIN sans ZIP
./scripts/add-crackme.sh --skip-existing <id>   # si l’ID est déjà là → exit 0
./scripts/add-crackme.sh --force <id>           # re-scaffold + re-télécharge (écrase ORIGIN/README squelette)
```

**ID déjà présent**

Le script cherche `authors/*/<id>/` **avant** tout téléchargement.

- En **TTY** : menu  
  `[a]` annuler (défaut) · `[s]` skip · `[r]` re-télécharger `original/` seulement · `[f]` force scaffold  
  Si le challenge a l’air déjà travaillé (tools/analysis/write-up/`status: solved`), le mode scaffold demande une confirmation.
- Hors TTY : **erreur** (rien n’est téléchargé), sauf `--skip-existing` ou `--force`.
- Mode `[r]` : ne touche pas au README / write-up ; conserve `original/source/` s’il existe ; met à jour les hash dans `ORIGIN.yml`.

**Ce que fait le script**

1. Extrait l’**ID** (24 hex) depuis l’URL ou l’argument.
2. (Best-effort) lit titre / auteur / plateforme sur la page crackmes.one.
3. Résout l’auteur local via `authors/*/author.yml` (`aliases`), ou crée un nouveau slug.
4. Si l’ID existe déjà → menu / flags (ci-dessus) ; **pas de download** tant qu’on n’a pas choisi.
5. Télécharge le ZIP (`…/download/crackme/<id>`).
6. Dézippe avec **7z** et le mot de passe du site : **`crackmes.one`**  
   (`7z x -y -pcrackmes.one -ooriginal/ …`).
7. Calcule **sha256** / md5 du binaire extrait.
8. Crée :
   ```text
   authors/<auteur>/<id>/
     ORIGIN.yml     # id + urls + binary.path + binary.sha256
     README.md      # squelette write-up
     original/      # contenu du ZIP
     analysis/      # vide (IDA, screens plus tard)
     tools/         # vide (solveur, recon plus tard)
   ```
9. Met à jour `authors/<auteur>/catalog.yml` (`by_id` / `by_sha256`).

**Ensuite (manuel)**

- Reverse → fichiers dans `analysis/` et `tools/`.
- Write-up dans le `README.md` du challenge.
- Dans `ORIGIN.yml` : `status: solved`, `solution_summary`, éventuellement `series_index` si c’est une série numérotée (timotei #01…#12).
- Mettre à jour le tableau dans `authors/<auteur>/README.md` si besoin.

**Lien ID ↔ fichier** : `ORIGIN.yml` contient à la fois l’id crackmes.one et le `sha256` du binaire dans `original/`.

## Familles

| Famille | Auteur | Épreuves | Résolues |
|---|---|---|---|
| [timotei](authors/timotei/README.md) | timotei (`tim0tei`, `timotei_`) | 12 (4 ELF64 + 8 PE32) | 12 / 12 |
| [cracknotme](authors/cracknotme/README.md) | CrackNotMe | 16+ (CFB… + Wonka + Turbine + MCM1–3) | 15 / 16 |
| [plikan](authors/plikan/README.md) | plikan | 1 (Easy Keygen .NET) | 1 / 1 |
| [cyberpenguin](authors/cyberpenguin/README.md) | Cyberpenguin | 1 (What password???) | 1 / 1 |
| [simbahdd](authors/simbahdd/README.md) | SimbaHDD | 1 (CRACKME) | 1 / 1 |

## Convention

- Dossier challenge = **ID crackmes.one** (24 hex), pas le titre.
- `ORIGIN.yml` : `id` + `urls` + `binary.sha256` (lien page ↔ fichier).
- `original/` : binaire d’origine **non patché** ; recon / solveurs dans `tools/`.
- Write-up = `README.md` du dossier challenge (rendu GitHub à l’ouverture).
- Dumps IDA dans `analysis/` ; sources `*-nasm.asm` / `*-fasm.asm` / `*-masm.asm` dans `tools/`.
- Auteur local = slug (`timotei`) + `aliases` dans `author.yml` si le pseudo site change.

## Licence / origine

Les crackmes restent la propriété de leurs auteurs. Les write-ups et sources reconstruits de ce repo sont là pour apprendre, pas pour republier les challenges comme si c’était nous.
