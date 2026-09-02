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
| [alessiosca](authors/alessiosca/README.md) | alessiosca | 1 (python - decryptme) | 1 / 1 |
| [ockotajny](authors/ockotajny/README.md) | OckoTajny | 1 (netCrack) | 1 / 1 |
| [teknikclel69](authors/teknikclel69/README.md) | Teknikclel69 | 1 (silly) | 1 / 1 |
| [xeeven](authors/xeeven/README.md) | Xeeven | 1 (FindThePassword1) | 1 / 1 |
| [r3tr0bs](authors/r3tr0bs/README.md) | R3tr0BS | 1 (EZ crackme) | 1 / 1 |
| [oguzbey](authors/oguzbey/README.md) | oguzbey | 1 (Lucky Numbers) | 1 / 1 |
| [andrewl](authors/andrewl/README.md) | andrewl | 1 (Quick Crypto) | 1 / 1 |
| [bageyelet](authors/bageyelet/README.md) | bageyelet | 1 (rop-obf) | 1 / 1 |
| [crackmes-de](authors/crackmes-de/README.md) | crackmes.de | 30+ | 48 / 30+ |
| [chaltu](authors/chaltu/README.md) | chaltu | 2 (a Treasure + Double Door) | 2 / 2 |
| [qerr0r](authors/qerr0r/README.md) | QERR0R | 1 (crackit) | 1 / 1 |
| [steve_maxwell](authors/steve_maxwell/README.md) | steve_maxwell | 1 (X-0-R) | 1 / 1 |
| [popacracker](authors/popacracker/README.md) | PopaCracker | 1 (Python CrackMe) | 1 / 1 |
| [noname_user](authors/noname_user/README.md) | noname_User | 2 | 2 / 2 |
| [nizzix](authors/nizzix/README.md) | Nizzix | 1 (Ageis) | 1 / 1 |
| [thefakeking](authors/thefakeking/README.md) | TheFakeKing | 1 (Basic ConsoleBased) | 1 / 1 |
| [svz](authors/svz/README.md) | SVz | 1 (Orrery) | 1 / 1 |
| [ray33ee](authors/ray33ee/README.md) | ray33ee | 1 (x or and add) | 1 / 1 |
| [muhemed](authors/muhemed/README.md) | muhemed | 1 (muhemed crackme) | 1 / 1 |
| [soulreaper](authors/soulreaper/README.md) | soulreaper | 3 (Dead Terminal + XorGate + Death Trap) | 2 / 3 *(1 parked)* |
| [toasterbirb](authors/toasterbirb/README.md) | toasterbirb | 1 (yap) | 1 / 1 |
| [jasper676767](authors/jasper676767/README.md) | Jasper676767 | 2 (Red light + forgot password) | 2 / 2 |
| [pitou](authors/pitou/README.md) | pitou | 1 (Evaisve) | 1 / 1 |
| [fatih](authors/fatih/README.md) | Fatih | 1 (S-BOX) | 1 / 1 |
| [vilxd](authors/vilxd/README.md) | vilxd | 2 (points + CRACK ME DLL) | 2 / 2 |
| [mazzotti](authors/mazzotti/README.md) | Mazzotti | 2 (patch-me + multi-layer) | 2 / 2 |
| [fourexp](authors/fourexp/README.md) | fourexp | 1 (fourexps hard crackme) | 1 / 1 |
| [23x41](authors/23x41/README.md) | 23x41 | 3 (Secure Vault + DPRK + Maze) | 3 / 3 |
| [pera](authors/pera/README.md) | Pera | 2 (Simple keygenme + Tiktok comment) | 2 / 2 |
| [hacktooth](authors/hacktooth/README.md) | hacktooth | 1 (Simple Crack/Keygenme AutoIt) | 1 / 1 |
| [gregland](authors/gregland/README.md) | gregland | 4 (CrackMe #1–#4) | 4 / 4 |
| [brembo](authors/brembo/README.md) | brembo | 1 (license-cli) | 0 / 1 *(parked)* |
| [hydra14212](authors/hydra14212/README.md) | Hydra14212 | 1 (HydraVault) | 0 / 1 *(parked)* |
| [xalperen](authors/xalperen/README.md) | xalperen | 1 (KryptonVM) | 1 / 1 |

## Mis de côté (PARKED — y revenir)

Challenges `status: pending` volontairement suspendus (`parked: true` dans `ORIGIN.yml`) :

| Crackme | Auteur | Reprendre |
|---|---|---|
| [HydraVault](authors/hydra14212/6a898e1a48cda5a2aaa3dad3/) | Hydra14212 | RPM 12/16 OK (« last 4 bytes ») ; last4 TBD ; pas x64dbg sur hv* |
| [license-cli](authors/brembo/6a8c54dc585e8875bcbebcfb/) | brembo | préimage SHA-256 `112c2add…` (x64dbg XOR OK ; rockyou×rules miss) |
| [Death Trap](authors/soulreaper/6a7d0ce1184836c0dbe7d77e/) | soulreaper | double-fork / hash MITM ; scaffold only |
| [bugger_v.7](authors/crackmes-de/5ab77f6633c5d40ad448cc25/) | crackmes.de / shism | clé RC6 + wake shell dormant |
| [meloquynthe](authors/crackmes-de/5ab77f5933c5d40ad448c46f/) | crackmes.de / meat | prédicat name→serial (après UPX) |
| [MCM 3.0 REWORK](authors/cracknotme/698fb9e9a79466462e957bec/) | CrackNotMe | parent/`--3a1f9b` + VM ; mask XOR TBD (notes 2026-09-01) |

## Historique des résolutions

Dates = jour du commit write-up / soluce sur `main` (**plus récent en haut**).

| Date | Crackme | Auteur |
|---|---|---|
| 2026-09-02 | [clone](authors/crackmes-de/5ab77f6533c5d40ad448cb5b/) | crackmes.de / haggar |
| 2026-09-02 | [znycuks_1_crackme](authors/crackmes-de/5ab77f6633c5d40ad448cbd2/) | crackmes.de / znycuk |
| 2026-09-02 | [slayers_crackme_1](authors/crackmes-de/5ab77f6533c5d40ad448cb6b/) | crackmes.de / savage |
| 2026-09-02 | [tropes_safe_cracker_1](authors/crackmes-de/5ab77f6533c5d40ad448cb87/) | crackmes.de / trope |
| 2026-09-02 | [the_xor_algorithm](authors/crackmes-de/5ab77f6533c5d40ad448cbc5/) | crackmes.de / ksydfius |
| 2026-09-02 | [deobfuscate_1](authors/crackmes-de/5ab77f6633c5d40ad448cc26/) | crackmes.de / shism |
| 2026-09-02 | [sorting_server_ctf](authors/crackmes-de/5ab77f5e33c5d40ad448c79a/) | crackmes.de / warsaw |
| 2026-09-02 | [buggers_v.5](authors/crackmes-de/5ab77f6633c5d40ad448cc2a/) | crackmes.de / shism |
| 2026-09-02 | [Python OBF Custom VM (KryptonVM)](authors/xalperen/69d3f1bdf2d49d8512f64c87/) | xalperen |
| 2026-09-02 | [python - decryptme](authors/alessiosca/6147267033c5d4649c52bb50/) | alessiosca |
| 2026-08-31 | [gregland's CrackMe 4](authors/gregland/5b502da833c5d41c0b8ae514/) | gregland |
| 2026-08-31 | [gregland's CrackMe 3](authors/gregland/5b4f76f233c5d41c0b8ae506/) | gregland |
| 2026-08-31 | [gregland's CrackMe 2](authors/gregland/5b4df56233c5d46d830c3f3a/) | gregland |
| 2026-08-30 | [gregland's CrackMe](authors/gregland/5b4cc23733c5d467513d2d0d/) | gregland |
| 2026-08-30 | [hacktooth's Simple Crack/Keygenme](authors/hacktooth/63f6881b33c5d447bc761585/) | hacktooth |
| 2026-08-30 | [Pera's Tiktok comment crackme](authors/pera/6a937f87cab6678aefe9dbc2/) | Pera |
| 2026-08-29 | [keygenme_v1.8](authors/crackmes-de/5ab77f6033c5d40ad448c894/) | crackmes.de / greedy_fly |
| 2026-08-29 | [scarabee_crackme_5](authors/crackmes-de/5ab77f6133c5d40ad448c8fa/) | crackmes.de / scarabee |
| 2026-08-29 | [chaltu's Double Door](authors/chaltu/6a9281f948cda5a2aaa3dbf3/) | chaltu |
| 2026-08-26 | [Simple keygenme for beginners](authors/pera/6a8e45513b246e477b6c09a9/) | Pera |
| 2026-08-26 | [23x41's 0x8A7 Maze](authors/23x41/6a597d7f0691b3daf2a3f2a0/) | 23x41 |
| 2026-08-26 | [23x41's DPRK Loyalty Evaluation](authors/23x41/6a5995410b25d281a656896f/) | 23x41 |
| 2026-08-26 | [23x41's Secure Vault](authors/23x41/6a59d79ba27dfa335e4c8597/) | 23x41 |
| 2026-08-24 | [fourexps hard crackme](authors/fourexp/6a6ca92708712c1a17cbac06/) | fourexp |
| 2026-08-24 | [CRACK ME DLL](authors/vilxd/6a6e0d3d91dca16886160b86/) | vilxd |
| 2026-08-24 | [Multi-layer password check](authors/mazzotti/6a6e1787184836c0dbe7d625/) | Mazzotti |
| 2026-08-24 | [Getting started patch-me](authors/mazzotti/6a6ef28bdf981859694943d5/) | Mazzotti |
| 2026-08-24 | [Crack my points](authors/vilxd/6a70bc1c08712c1a17cbac5a/) | vilxd |
| 2026-08-24 | [S-BOX](authors/fatih/6a71d22605a9e80a90724279/) | Fatih |
| 2026-08-24 | [Evaisve](authors/pitou/6a73209208712c1a17cbac90/) | pitou |
| 2026-08-24 | [I forgot my password!!!!](authors/jasper676767/6a7590e8184836c0dbe7d6bc/) | Jasper676767 |
| 2026-08-24 | [XorGate](authors/soulreaper/6a768ab608712c1a17cbacdd/) | soulreaper |
| 2026-08-24 | [Red light](authors/jasper676767/6a76df14184836c0dbe7d6de/) | Jasper676767 |
| 2026-08-24 | [yap](authors/toasterbirb/6a77541805a9e80a907242fe/) | toasterbirb |
| 2026-08-24 | [Dead Terminal](authors/soulreaper/6a77c5d1df981859694944b8/) | soulreaper |
| 2026-08-24 | [muhemed crackme](authors/muhemed/6a7b401905a9e80a90724367/) | muhemed |
| 2026-08-24 | [x or and add](authors/ray33ee/6a81d143184836c0dbe7d7e1/) | ray33ee |
| 2026-08-24 | [Orrery](authors/svz/6a89cff9cab6678aefe9da94/) | SVz |
| 2026-08-23 | [shisms_keygenme_0.1](authors/crackmes-de/5ab77f6633c5d40ad448cc29/) | crackmes.de / shism |
| 2026-08-23 | [crackmenx2final by arthi](authors/crackmes-de/5ab77f6633c5d40ad448cc2b/) | crackmes.de / arthi |
| 2026-08-23 | [keygencrackme_1 by zyen](authors/crackmes-de/5ab77f6633c5d40ad448cc6a/) | crackmes.de / zyen |
| 2026-08-23 | [crackme by twist](authors/crackmes-de/5ab77f6633c5d40ad448cc22/) | crackmes.de / twist |
| 2026-08-23 | [abu_crackme_v1](authors/crackmes-de/5ab77f6633c5d40ad448cc10/) | crackmes.de / gauri |
| 2026-08-23 | [Basic Crackme ConsoleBased](authors/thefakeking/6492036733c5d43938913a58/) | TheFakeKing |
| 2026-08-23 | [Ageis crackme :3](authors/nizzix/693027c02d267f28f69b82b5/) | Nizzix |
| 2026-08-23 | [Test my obf. PLS](authors/noname_user/69a138ff7a778cfffbfb6797/) | noname_User |
| 2026-08-23 | [crackme_0x01_by_qfqe](authors/crackmes-de/5ab77f6033c5d40ad448c8a4/) | crackmes.de / qfqe |
| 2026-08-23 | [Unbreakable Python?](authors/noname_user/699c06a46ca1599050950670/) | noname_User |
| 2026-08-23 | [Python CrackMe](authors/popacracker/62bb2f0933c5d4251e723a46/) | PopaCracker |
| 2026-08-23 | [X-0-R](authors/steve_maxwell/6976041d9bf7b8997653a6cf/) | steve_maxwell |
| 2026-08-23 | [crackit](authors/qerr0r/69a65b6c7a778cfffbfb680e/) | QERR0R |
| 2026-08-23 | [a Treasure](authors/chaltu/6a4014135f26f108ba18ba0b/) | chaltu |
| 2026-08-23 | [crackme_1_by_amnon](authors/crackmes-de/5ab77f5333c5d40ad448c10f/) | crackmes.de / amnon |
| 2026-08-22 | [keygenme_1](authors/crackmes-de/5ab77f5f33c5d40ad448c7f5/) | crackmes.de / cauchy_htb |
| 2026-08-22 | [unlockme_crackme_9_by_sharpe](authors/crackmes-de/5ab77f6233c5d40ad448c9e0/) | crackmes.de / sharpe |
| 2026-08-22 | [epicurus](authors/crackmes-de/5ab77f6033c5d40ad448c84f/) | crackmes.de / D4ph1 |
| 2026-08-22 | [b0rken_elgamal_keygenme](authors/crackmes-de/5ab77f5a33c5d40ad448c4ec/) | crackmes.de / smilingwolf |
| 2026-08-22 | [dll_disaster](authors/crackmes-de/5ab77f5833c5d40ad448c3c1/) | crackmes.de / issogoo |
| 2026-08-22 | [negligent_deobfuscate_1](authors/crackmes-de/5ab77f6633c5d40ad448cbf4/) | crackmes.de / neon |
| 2026-08-22 | [de_kryptzo_2](authors/crackmes-de/5ab77f5833c5d40ad448c3e1/) | crackmes.de / starzboy |
| 2026-08-22 | [oxfoo1me](authors/crackmes-de/5ab77f5c33c5d40ad448c5f3/) | crackmes.de / 0xf001 |
| 2026-08-22 | [naive_crackme](authors/crackmes-de/5ab77f5833c5d40ad448c3ee/) | crackmes.de / yanisto |
| 2026-08-22 | [tiny_crackme](authors/crackmes-de/5ab77f5833c5d40ad448c3ed/) | crackmes.de / yanisto |
| 2026-08-22 | [888](authors/crackmes-de/5ab77f5833c5d40ad448c397/) | crackmes.de / crp |
| 2026-08-22 | [crackme1](authors/crackmes-de/5ab77f5533c5d40ad448c238/) | crackmes.de / darius949 |
| 2026-08-22 | [CrackmeLinux](authors/crackmes-de/5ab77f5833c5d40ad448c3d2/) | crackmes.de / nobz |
| 2026-08-22 | [grainne2](authors/crackmes-de/5ab77f5a33c5d40ad448c505/) | crackmes.de / stefanie |
| 2026-08-22 | [grainne](authors/crackmes-de/5ab77f5a33c5d40ad448c506/) | crackmes.de / stefanie |
| 2026-08-22 | [frogger](authors/crackmes-de/5ab77f5a33c5d40ad448c4f7/) | crackmes.de / macabre |
| 2026-08-22 | [Crackme3](authors/crackmes-de/5ab77f5c33c5d40ad448c62e/) | crackmes.de / sx0r |
| 2026-08-22 | [fr0g_kgm1](authors/crackmes-de/5ab77f5c33c5d40ad448c65b/) | crackmes.de / fr0gsek |
| 2026-08-22 | [j666](authors/crackmes-de/5ab77f5c33c5d40ad448c666/) | crackmes.de / josamont |
| 2026-08-22 | [j555](authors/crackmes-de/5ab77f5c33c5d40ad448c665/) | crackmes.de / josamont |
| 2026-08-22 | [j444](authors/crackmes-de/5ab77f5c33c5d40ad448c667/) | crackmes.de / josamont |
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
