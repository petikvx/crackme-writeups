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

# plusieurs URLs / IDs d’affilée (mêmes options pour tout le batch)
./scripts/add-crackme.sh URL1 URL2 URL3
./scripts/add-crackme.sh --skip-existing id1 id2 id3

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
| [tdaron](authors/tdaron/README.md) | tdaron | 1 (Use your brain) | 1 / 1 |
| [pipedown](authors/pipedown/README.md) | pipedown | 1 (I need to be honest) | 1 / 1 |
| [jeffli6789](authors/jeffli6789/README.md) | jeffli6789 | 1 (RE CTF 2026 wallpaper) | 1 / 1 |
| [cr-ck_god001](authors/cr-ck_god001/README.md) | Cr@ck_God001 | 1 (Crackme GUI) | 1 / 1 |
| [neoncarrot](authors/neoncarrot/README.md) | neoncarrot | 1 (Find the correct key!) | 1 / 1 |
| [cosmosss](authors/cosmosss/README.md) | CosmoSSS | 1 (Password Very Easy) | 1 / 1 |
| [abolhb](authors/abolhb/README.md) | ABOLHB | 1 (MasonCrackmeV2) | 1 / 1 |
| [ockotajny](authors/ockotajny/README.md) | OckoTajny | 1 (netCrack) | 1 / 1 |
| [teknikclel69](authors/teknikclel69/README.md) | Teknikclel69 | 1 (silly) | 1 / 1 |
| [xeeven](authors/xeeven/README.md) | Xeeven | 1 (FindThePassword1) | 1 / 1 |
| [r3tr0bs](authors/r3tr0bs/README.md) | R3tr0BS | 1 (EZ crackme) | 1 / 1 |
| [oguzbey](authors/oguzbey/README.md) | oguzbey | 1 (Lucky Numbers) | 1 / 1 |
| [andrewl](authors/andrewl/README.md) | andrewl | 1 (Quick Crypto) | 1 / 1 |
| [bageyelet](authors/bageyelet/README.md) | bageyelet | 1 (rop-obf) | 1 / 1 |
| [crackmes-de](authors/crackmes-de/README.md) | crackmes.de | 10+ | 10 / 10+ |

## Historique des résolutions

Dates = jour du commit write-up / soluce sur `main` (**plus récent en haut**).

| Date | Crackme | Auteur |
|---|---|---|
| 2026-08-22 | [j333](authors/crackmes-de/5ab77f5c33c5d40ad448c669/) | crackmes.de / josamont |
| 2026-08-22 | [basic_logic](authors/crackmes-de/5ab77f5f33c5d40ad448c7bd/) | crackmes.de / eholzbach |
| 2026-08-22 | [staple](authors/crackmes-de/5ab77f6133c5d40ad448c924/) | crackmes.de / chtis |
| 2026-08-22 | [yyyyyyy1](authors/crackmes-de/5ab77f6233c5d40ad448c9c3/) | crackmes.de / yyyyyyy |
| 2026-08-22 | [easy_linux_crackme](authors/crackmes-de/5ab77f6333c5d40ad448ca8a/) | crackmes.de / lord |
| 2026-08-22 | [easy_crackme_2](authors/crackmes-de/5ab77f6333c5d40ad448ca8b/) | crackmes.de / lord |
| 2026-08-22 | [CrackMe_ASM](authors/crackmes-de/5ab77f6533c5d40ad448cb71/) | crackmes.de / rezk2ll |
| 2026-08-22 | [BeatMe](authors/crackmes-de/5ab77f6533c5d40ad448cb72/) | crackmes.de / rezk2ll |
| 2026-08-22 | [KeygenmeNasm](authors/crackmes-de/5ab77f6533c5d40ad448cb73/) | crackmes.de / rezk2ll |
| 2026-08-22 | [f1nd_my_k3y5](authors/crackmes-de/5ab77f6533c5d40ad448cb74/) | crackmes.de / rezk2ll |
| 2026-08-22 | [rop-obf](authors/bageyelet/5cfb961a33c5d41c6d56e069/) | bageyelet |
| 2026-08-22 | [Quick Crypto, 18k](authors/andrewl/5d07f03233c5d41c6d56e10c/) | andrewl |
| 2026-08-22 | [Lucky Numbers](authors/oguzbey/5e567e1d33c5d4439bb2dca0/) | oguzbey |
| 2026-08-22 | [EZ crackme](authors/r3tr0bs/5fcfb87933c5d424269a1afc/) | R3tr0BS |
| 2026-08-22 | [FindThePassword1](authors/xeeven/632cf67b33c5d4425e2cd501/) | Xeeven |
| 2026-08-22 | [silly](authors/teknikclel69/65afe04ceef082e477ff6026/) | Teknikclel69 |
| 2026-08-22 | [netCrack](authors/ockotajny/693017b52d267f28f69b82ae/) | OckoTajny |
| 2026-08-22 | [MasonCrackmeV2](authors/abolhb/68ff92e62d267f28f69b78f1/) | ABOLHB |
| 2026-08-22 | [Password (Very Easy)](authors/cosmosss/6943c5440992a052ab22240f/) | CosmoSSS |
| 2026-08-22 | [Find the correct key!](authors/neoncarrot/697e5b0a16739b40dcb5da9d/) | neoncarrot |
| 2026-08-22 | [Crackme (GUI)](authors/cr-ck_god001/6991e765853c2615340abd8c/) | Cr@ck_God001 |
| 2026-08-22 | [RE CTF 2026 — wallpaper](authors/jeffli6789/69a2911b7a778cfffbfb67ca/) | jeffli6789 |
| 2026-08-22 | [I need to be honest](authors/pipedown/69cd43df49fa49a2a2602312/) | pipedown |
| 2026-08-22 | [Use your brain](authors/tdaron/69d8fe40471059af19ad08ca/) | tdaron |
| 2026-08-22 | [CRACKME](authors/simbahdd/6a160c2a2b3df128c1df5cc1/) | SimbaHDD |
| 2026-08-21 | [What password???](authors/cyberpenguin/6a83e2f205a9e80a90724421/) | Cyberpenguin |
| 2026-08-21 | [MCM 3.0 REWORK](authors/cracknotme/698fb9e9a79466462e957bec/) *(packer + honeypot ; VM pending)* | CrackNotMe |
| 2026-08-21 | [MCM 2.0](authors/cracknotme/698d9ebd3eb49a23d3417763/) | CrackNotMe |
| 2026-08-21 | [Monster CrackMe 1.0 (MCM)](authors/cracknotme/6989ed7dfb46458f1ef6cee4/) | CrackNotMe |
| 2026-08-21 | [Turbine Control KeyGenMe](authors/cracknotme/69bd737bf2d49d8512f64adc/) | CrackNotMe |
| 2026-08-20 | [Willy Wonka's Chocolate Factory](authors/cracknotme/69b4768cf2d49d8512f649ff/) | CrackNotMe |
| 2026-08-20 | [ASMe](authors/cracknotme/69ff482c8fab7bbca273011e/) | CrackNotMe |
| 2026-08-19 | [CFB #10 The Keymaster's Sigil](authors/cracknotme/6a5375046f511264ea482529/) | CrackNotMe |
| 2026-08-19 | [CFB #9 The Impostor](authors/cracknotme/6a5374be6f511264ea482525/) | CrackNotMe |
| 2026-08-18 | [CFB #8 Concurrently Yours](authors/cracknotme/6a537490055757d3df60fcc3/) | CrackNotMe |
| 2026-08-18 | [CFB #7 Shattered Mirror](authors/cracknotme/6a5374710b25d281a65688e6/) | CrackNotMe |
| 2026-08-17 | [CFB #6 Quantum State](authors/cracknotme/6a537448a27dfa335e4c8518/) | CrackNotMe |
| 2026-08-17 | [CFB #5 Game of Life](authors/cracknotme/6a1569de2b3df128c1df5cb1/) | CrackNotMe |
| 2026-08-17 | [CFB #4 Custom rotors](authors/cracknotme/6a154cab17539b5175d1238a/) | CrackNotMe |
| 2026-08-16 | [CFB #3 Mini VM](authors/cracknotme/6a154aca8fab7bbca27302a2/) | CrackNotMe |
| 2026-08-16 | [CFB #2 Maze Runner](authors/cracknotme/6a15496417539b5175d12386/) | CrackNotMe |
| 2026-08-16 | [Easy Keygen](authors/plikan/6a7d865b184836c0dbe7d789/) | plikan |
| 2026-08-16 | [CFB #1](authors/cracknotme/6a1547f42b3df128c1df5ca5/) | CrackNotMe |
| 2026-08-16 | [timotei-crackme-12](authors/timotei/) | timotei |
| 2026-08-16 | [timotei-crackme-11](authors/timotei/) | timotei |
| 2026-08-16 | [timotei-crackme-10](authors/timotei/) | timotei |
| 2026-08-16 | [timotei-crackme-09](authors/timotei/) | timotei |
| 2026-08-16 | [timotei-crackme-08](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-07](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-06](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-05](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-04](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-03](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-02](authors/timotei/) | timotei |
| 2026-08-15 | [timotei-crackme-01](authors/timotei/) | timotei |

## Convention

- Dossier challenge = **ID crackmes.one** (24 hex), pas le titre.
- `ORIGIN.yml` : `id` + `urls` + `binary.sha256` (lien page ↔ fichier).
- `original/` : binaire d’origine **non patché** ; recon / solveurs dans `tools/`.
- Write-up = `README.md` du dossier challenge (rendu GitHub à l’ouverture).
- Dumps IDA dans `analysis/` ; sources `*-nasm.asm` / `*-fasm.asm` / `*-masm.asm` dans `tools/`.
- Auteur local = slug (`timotei`) + `aliases` dans `author.yml` si le pseudo site change.

## Licence / origine

Les crackmes restent la propriété de leurs auteurs. Les write-ups et sources reconstruits de ce repo sont là pour apprendre, pas pour republier les challenges comme si c’était nous.
