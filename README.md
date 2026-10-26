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
| [cracknotme](authors/cracknotme/README.md) | CrackNotMe | 17+ (CFB… + Wonka + Turbine + MCM1–3 + Zero4) | 16 / 17 |
| [zenoniatranoss](authors/zenoniatranoss/README.md) | zenoniatranoss | 1 (zenobiatranoss) | 1 / 1 |
| [crudd](authors/crudd/README.md) | crudd | 1 (PatchPad) | 1 / 1 |
| [plikan](authors/plikan/README.md) | plikan | 1 (Easy Keygen .NET) | 1 / 1 |
| [cyberpenguin](authors/cyberpenguin/README.md) | Cyberpenguin | 1 (What password???) | 1 / 1 |
| [simbahdd](authors/simbahdd/README.md) | SimbaHDD | 1 (CRACKME) | 1 / 1 |
| [tdaron](authors/tdaron/README.md) | tdaron | 1 (Use your brain) | 1 / 1 |
| [pipedown](authors/pipedown/README.md) | pipedown | 1 (I need to be honest) | 1 / 1 |
| [jeffli6789](authors/jeffli6789/README.md) | jeffli6789 | 6 (wallpaper + x86 + Maze + Orbit Fold + Date of Birth) | 6 / 6 |
| [cr-ck_god001](authors/cr-ck_god001/README.md) | Cr@ck_God001 | 1 (Crackme GUI) | 1 / 1 |
| [neoncarrot](authors/neoncarrot/README.md) | neoncarrot | 1 (Find the correct key!) | 1 / 1 |
| [cosmosss](authors/cosmosss/README.md) | CosmoSSS | 1 (Password Very Easy) | 1 / 1 |
| [abolhb](authors/abolhb/README.md) | ABOLHB | 1 (MasonCrackmeV2) | 1 / 1 |
| [alessiosca](authors/alessiosca/README.md) | alessiosca | 1 (python - decryptme) | 1 / 1 |
| [ockotajny](authors/ockotajny/README.md) | OckoTajny | 1 (netCrack) | 1 / 1 |
| [teknikclel69](authors/teknikclel69/README.md) | Teknikclel69 | 2 (silly + hell) | 2 / 2 |
| [xeeven](authors/xeeven/README.md) | Xeeven | 1 (FindThePassword1) | 1 / 1 |
| [r3tr0bs](authors/r3tr0bs/README.md) | R3tr0BS | 1 (EZ crackme) | 1 / 1 |
| [oguzbey](authors/oguzbey/README.md) | oguzbey | 1 (Lucky Numbers) | 1 / 1 |
| [andrewl](authors/andrewl/README.md) | andrewl | 1 (Quick Crypto) | 1 / 1 |
| [bageyelet](authors/bageyelet/README.md) | bageyelet | 1 (rop-obf) | 1 / 1 |
| [crackmes-de](authors/crackmes-de/README.md) | crackmes.de | 30+ | 390 / 390 |
| [chaltu](authors/chaltu/README.md) | chaltu | 3 (a Treasure + Double Door + Accsess me please) | 3 / 3 |
| [qerr0r](authors/qerr0r/README.md) | QERR0R | 2 (crackit + CrackIt;)) | 2 / 2 |
| [steve_maxwell](authors/steve_maxwell/README.md) | steve_maxwell | 1 (X-0-R) | 1 / 1 |
| [vodeff](authors/vodeff/README.md) | vodeff | 1 (FindLicenseKey) | 1 / 1 |
| [segfaults](authors/segfaults/README.md) | segfaults | 1 (Jame's Cybersecurity Company) | 1 / 1 |
| [khaledddd](authors/khaledddd/README.md) | khaledddd | 1 (InputPrinter) | 1 / 1 |
| [shadowlegion](authors/shadowlegion/README.md) | ShadowLegion | 1 (VaultBreaker) | 1 / 1 |
| [toronto](authors/toronto/README.md) | Toronto | 1 (c) | 1 / 1 |
| [mystergaif](authors/mystergaif/README.md) | mystergaif | 1 (U Can't Pass) | 1 / 1 |
| [arshi](authors/arshi/README.md) | arshi | 1 (LvArshu / TWO-RING VOW) | 1 / 1 |
| [th](authors/th/README.md) | th | 1 (ComputeTheKey) | 1 / 1 |
| [kryptos](authors/kryptos/README.md) | Kryptos | 1 (Hecate) | 1 / 1 |
| [marco007](authors/marco007/README.md) | marco007 | 2 (time based riddle + simple crackme) | 2 / 2 |
| [sftmlg](authors/sftmlg/README.md) | sftmlg | 1 (Quite a simple crackme) | 1 / 1 |
| [nutcake](authors/nutcake/README.md) | nutcake | 3 (WhiteRabbit) | 3 / 3 |
| [cbm-hackers](authors/cbm-hackers/README.md) | cbm-hackers | 1 (jumpjumpjump) | 1 / 1 |
| [bahha](authors/bahha/README.md) | bahha | 1 (easy_keygenme) | 1 / 1 |
| [c1](authors/c1/README.md) | c1 | 1 (c1_keygenme1) | 1 / 1 |
| [rion](authors/rion/README.md) | rion | 1 (keyGme) | 1 / 1 |
| [yuri](authors/yuri/README.md) | Yuri | 1 (Simple Keygen) | 1 / 1 |
| [inxaneninja](authors/inxaneninja/README.md) | inxaneninja | 1 (Keygen Practice) | 1 / 1 |
| [loz](authors/loz/README.md) | Loz | 2 (Password Login 2) | 2 / 2 |
| [m00ny](authors/m00ny/README.md) | m00ny | 1 (am i really random?) | 1 / 1 |
| [novn91](authors/novn91/README.md) | novn91 | 1 (crackmepal) | 1 / 1 |
| [hikilaka](authors/hikilaka/README.md) | hikilaka | 1 (crackme #1) | 1 / 1 |
| [ker2x](authors/ker2x/README.md) | ker2x | 2 (guild hall adventure Ch.2) | 2 / 2 |
| [kawaii-flesh](authors/kawaii-flesh/README.md) | kawaii-flesh | 3 (keygenme) | 3 / 3 |
| [mrt4ntr4](authors/mrt4ntr4/README.md) | mrT4ntr4 | 1 (Save Scooby) | 1 / 1 |
| [skudo](authors/skudo/README.md) | skudo | 1 (Crack the algorithm) | 1 / 1 |
| [paypain](authors/paypain/README.md) | paypain | 3 (Election) | 3 / 3 |
| [totothetoro](authors/totothetoro/README.md) | totothetoro | 1 (alien_bin) | 1 / 1 |
| [ezman](authors/ezman/README.md) | ezman | 1 (easy keyg3nme) | 1 / 1 |
| [m3hd1](authors/m3hd1/README.md) | m3hd1 | 1 (half-twins) | 1 / 1 |
| [bkamp](authors/bkamp/README.md) | Bkamp | 1 (glow wine [keygen practice]) | 1 / 1 |
| [exxtra12](authors/exxtra12/README.md) | Exxtra12 | 1 (Ext.challenges) | 1 / 1 |
| [raphiolet](authors/raphiolet/README.md) | raphiolet | 1 (mgdilolmsoamasiug) | 1 / 1 |
| [owo_whats_this](authors/owo_whats_this/README.md) | owo_whats_this | 1 (Very Special Number v1) | 1 / 1 |
| [chillywilly](authors/chillywilly/README.md) | chillywilly | 1 (racecars) | 1 / 1 |
| [476f64](authors/476f64/README.md) | 476f64 | 1 (easyAF) | 1 / 1 |
| [shad3](authors/shad3/README.md) | Shad3 | 1 (Baby Ransom) | 1 / 1 |
| [zed-zahir](authors/zed-zahir/README.md) | zed-zahir | 1 (ZED-Crackme) | 1 / 1 |
| [destructeur](authors/destructeur/README.md) | destructeur | 2 (ShAPK1) | 2 / 2 |
| [d4rkfl0w](authors/d4rkfl0w/README.md) | D4RKFL0W | 5 (Crack_5) | 5 / 5 |
| [tynkute](authors/tynkute/README.md) | tynkute | 1 (Just crackme) | 1 / 1 |
| [rafi](authors/rafi/README.md) | rafi | 1 (what) | 1 / 1 |
| [silentwraith](authors/silentwraith/README.md) | SilentWraith | 1 (lockcode) | 1 / 1 |
| [pranav](authors/pranav/README.md) | pranav | 1 (unlockme) | 1 / 1 |
| [s0k1t](authors/s0k1t/README.md) | s0k1t | 1 (GO GO GO - Harmful Logic) | 1 / 1 |
| [harel21](authors/harel21/README.md) | Harel21 | 1 (crackme) | 1 / 1 |
| [asbo_general](authors/asbo_general/README.md) | ASBO_GENERAL | 1 (My_first_ever_crackme) | 1 / 1 |
| [dirkd](authors/dirkd/README.md) | DirkD | 1 (EZwan) | 1 / 1 |
| [yariza](authors/yariza/README.md) | yariza | 2 (Keygen Me) | 2 / 2 |
| [mkesenheimer](authors/mkesenheimer/README.md) | MKesenheimer | 1 (Forest) | 1 / 1 |
| [0xtamsee1](authors/0xtamsee1/README.md) | 0xtamsee1 | 1 (revv) | 1 / 1 |
| [4n0ny31ty](authors/4n0ny31ty/README.md) | 4N0NY31TY | 1 (4N0NY31TY's First Crackme) | 1 / 1 |
| [eventhorizon02](authors/eventhorizon02/README.md) | eventhorizon02 | 1 (super_easy) | 1 / 1 |
| [raphdev](authors/raphdev/README.md) | RaphDev | 1 (PleaseCrackMe) | 1 / 1 |
| [bueb810](authors/bueb810/README.md) | bueb810 | 1 (gugus the first) | 1 / 1 |
| [mrempy](authors/mrempy/README.md) | MrEmpy | 1 (TryCrackMe) | 1 / 1 |
| [nomanprodhan](authors/nomanprodhan/README.md) | NomanProdhan | 3 (License Checker 0x03) | 3 / 3 |
| [pourmeadrinkwhileimfloating](authors/pourmeadrinkwhileimfloating/README.md) | pourmeadrinkwhileimfloating | 1 (licesnse_checker_3) | 1 / 1 |
| [b3nd3p](authors/b3nd3p/README.md) | b3nd3p | 1 (my_f1rs7_cr4ckm3) | 1 / 1 |
| [marufmurtuza](authors/marufmurtuza/README.md) | marufmurtuza | 1 (Illogical Logic) | 1 / 1 |
| [skibur](authors/skibur/README.md) | skibur | 1 (Just In Time) | 1 / 1 |
| [sirender125](authors/sirender125/README.md) | SirEnder125 | 2 (RegistrationCrackme) | 2 / 2 |
| [ghost256](authors/ghost256/README.md) | ghost256 | 1 (baby) | 1 / 1 |
| [ss1ned](authors/ss1ned/README.md) | ss1ned | 1 (My first crackme) | 1 / 1 |
| [yekong](authors/yekong/README.md) | Yekong | 2 (Vending Machine) | 2 / 2 |
| [varsovie](authors/varsovie/README.md) | Varsovie | 1 (GDB basics) | 1 / 1 |
| [sudo0x18](authors/sudo0x18/README.md) | sudo0x18 | 1 (Level1) | 1 / 1 |
| [ithawk](authors/ithawk/README.md) | ithawk | 1 (Find password) | 1 / 1 |
| [mt77](authors/mt77/README.md) | mt77 | 1 (based) | 1 / 1 |
| [i3a4dam](authors/i3a4dam/README.md) | I3a4dam | 1 (Plain sight) | 1 / 1 |
| [exzettabyte](authors/exzettabyte/README.md) | exzettabyte | 1 (Weird) | 1 / 1 |
| [m4st4rcr4ck](authors/m4st4rcr4ck/README.md) | M4st4rCr4ck | 1 (H1dd3n Fl4g) | 1 / 1 |
| [arjunrajesh](authors/arjunrajesh/README.md) | ArjunRajesh | 1 (FLAG) | 1 / 1 |
| [oxymore](authors/oxymore/README.md) | Oxymore | 1 (Password) | 1 / 1 |
| [nimacpp](authors/nimacpp/README.md) | nimacpp | 1 (level2) | 1 / 1 |
| [jackioye](authors/jackioye/README.md) | jackioye | 1 (Simple but not simple) | 1 / 1 |
| [stonezarcon](authors/stonezarcon/README.md) | stonezarcon | 1 (Getting started) | 1 / 1 |
| [ananascharles](authors/ananascharles/README.md) | AnanasCharles | 1 (Authorize by PIN) | 1 / 1 |
| [dzonerzy](authors/dzonerzy/README.md) | dzonerzy | 1 (KGenMe v2) | 1 / 1 |
| [froglover22](authors/froglover22/README.md) | froglover22 | 1 (Crack On The Cob - COBOL) | 1 / 1 |
| [b4te](authors/b4te/README.md) | b4te | 1 (guess_the_password) | 1 / 1 |
| [fdisotto](authors/fdisotto/README.md) | fdisotto | 1 (good_boy) | 1 / 1 |
| [saltedmacaroni841](authors/saltedmacaroni841/README.md) | saltedMacaroni841 | 2 (Levels Keygen! + Upgraded Levels Keygen) | 2 / 2 |
| [hybridkenrel](authors/hybridkenrel/README.md) | hybridkenrel | 1 (yum :P) | 1 / 1 |
| [rafaelgfreveng](authors/rafaelgfreveng/README.md) | RafaelGFreveng | 1 (Sexy 1337) | 1 / 1 |
| [cappybara](authors/cappybara/README.md) | Cappybara | 1 (BabyRev) | 1 / 1 |
| [fragus](authors/fragus/README.md) | Fragus | 1 (Very simple crackme) | 1 / 1 |
| [hfirewoxlf](authors/hfirewoxlf/README.md) | hFireWoxlf | 1 (My First Rust Crackme) | 1 / 1 |
| [vulnix](authors/vulnix/README.md) | vulnix | 1 (easyjerk) | 1 / 1 |
| [idanhajbeko](authors/idanhajbeko/README.md) | idanhajbeko | 1 (babyFirstCrackme) | 1 / 1 |
| [userrrrrr](authors/userrrrrr/README.md) | userrrrrr | 1 (EasyCrackme) | 1 / 1 |
| [mark_godez](authors/mark_godez/README.md) | Mark_Godez | 1 (Godez_Mark crackme) | 1 / 1 |
| [izijerry](authors/izijerry/README.md) | izijerry | 1 (int overflow) | 1 / 1 |
| [thedollar](authors/thedollar/README.md) | thedollar | 1 (Bingus) | 1 / 1 |
| [emilia161](authors/emilia161/README.md) | Emilia161 | 1 (good kitty) | 1 / 1 |
| [asmboy](authors/asmboy/README.md) | ASMboy | 1 (segfault) | 1 / 1 |
| [ezloom](authors/ezloom/README.md) | ezloom | 1 (really easy) | 1 / 1 |
| [yanderemia](authors/yanderemia/README.md) | YandereMia | 2 | 2 / 2 |
| [svidnet](authors/svidnet/README.md) | svidnet | 1 (ZEXOR-v1 (Linux)) | 1 / 1 |
| [howosec](authors/howosec/README.md) | howosec | 1 (Password And Flag in C) | 1 / 1 |
| [popacracker](authors/popacracker/README.md) | PopaCracker | 1 (Python CrackMe) | 1 / 1 |
| [noname_user](authors/noname_user/README.md) | noname_User | 2 | 2 / 2 |
| [nizzix](authors/nizzix/README.md) | Nizzix | 1 (Ageis) | 1 / 1 |
| [thefakeking](authors/thefakeking/README.md) | TheFakeKing | 1 (Basic ConsoleBased) | 1 / 1 |
| [svz](authors/svz/README.md) | SVz | 2 (Orrery + Orrery 2) | 2 / 2 |
| [ray33ee](authors/ray33ee/README.md) | ray33ee | 3 (x or and add + obscurio-1 + obscurio-3) | 3 / 3 |
| [muhemed](authors/muhemed/README.md) | muhemed | 1 (muhemed crackme) | 1 / 1 |
| [muffin](authors/muffin/README.md) | muffin | 1 (The Goat) | 1 / 1 |
| [soulreaper](authors/soulreaper/README.md) | soulreaper | 3 (Dead Terminal + XorGate + Death Trap) | 3 / 3 |
| [toasterbirb](authors/toasterbirb/README.md) | toasterbirb | 10 (yap + série asm flags…branchless-fixed + main.cpp + argc + shellcoding) | 10 / 10 |
| [ttlhacker](authors/ttlhacker/README.md) | ttlhacker | 3 (hell86 + jittery + hard_software) | 3 / 3 |
| [jasper676767](authors/jasper676767/README.md) | Jasper676767 | 3 (Red light + forgot password + Functions!) | 3 / 3 |
| [pitou](authors/pitou/README.md) | pitou | 1 (Evaisve) | 1 / 1 |
| [fatih](authors/fatih/README.md) | Fatih | 1 (S-BOX) | 1 / 1 |
| [vilxd](authors/vilxd/README.md) | vilxd | 2 (points + CRACK ME DLL) | 2 / 2 |
| [mazzotti](authors/mazzotti/README.md) | Mazzotti | 6 (patch-me + multi-layer + cortisol + getting started keygen + back to the beginning + rage) | 6 / 6 |
| [fourexp](authors/fourexp/README.md) | fourexp | 1 (fourexps hard crackme) | 1 / 1 |
| [23x41](authors/23x41/README.md) | 23x41 | 5 (Secure Vault + DPRK + Maze + Gate + Vault) | 5 / 5 |
| [pera](authors/pera/README.md) | Pera | 2 (Simple keygenme + Tiktok comment) | 2 / 2 |
| [hacktooth](authors/hacktooth/README.md) | hacktooth | 1 (Simple Crack/Keygenme AutoIt) | 1 / 1 |
| [gregland](authors/gregland/README.md) | gregland | 4 (CrackMe #1–#4) | 4 / 4 |
| [brembo](authors/brembo/README.md) | brembo | 1 (license-cli) | 0 / 1 *(parked)* |
| [hydra14212](authors/hydra14212/README.md) | Hydra14212 | 1 (HydraVault) | 1 / 1 |
| [xalperen](authors/xalperen/README.md) | xalperen | 1 (KryptonVM) | 1 / 1 |
| [shadowlegion](authors/shadowlegion/README.md) | ShadowLegion | 1 (TermBreaker) | 1 / 1 |
| [5iriu5](authors/5iriu5/README.md) | 5iriu5 | 1 (SSE Login) | 1 / 1 |
| [jenya](authors/jenya/README.md) | Jenya | 3 (math_crackme + linux_asm_jenya) | 3 / 3 |
| [0x6f6d6172h](authors/0x6f6d6172h/README.md) | 0x6f6D6172h | 1 (crackme1) | 1 / 1 |
| [s4r](authors/s4r/README.md) | s4r | 5 (encrypted_box + fuckalight2 + bitflip + prime + matrice) | 5 / 5 |
| [ximxn](authors/ximxn/README.md) | Ximxn | 1 (perwira) | 1 / 1 |
| [breadleaf](authors/breadleaf/README.md) | breadleaf | 1 (Password and Username) | 1 / 1 |
| [thephilosopher](authors/thephilosopher/README.md) | ThePhilosopher | 2 (Bruteverse + The Matrix) | 2 / 2 |
| [x3ero0](authors/x3ero0/README.md) | X3eRo0 | 2 (Trace + fl04t) | 2 / 2 |
| [dev0](authors/dev0/README.md) | dev0 | 1 (x64_crackme_keygen) | 1 / 1 |
| [s01den](authors/s01den/README.md) | S01den | 1 (0verney) | 1 / 1 |
| [lubimpiskoty](authors/lubimpiskoty/README.md) | LubimPiskoty | 1 (Personal Safe) | 1 / 1 |
| [bagolymadar](authors/bagolymadar/README.md) | bagolymadar | 1 (virtual.1) | 1 / 1 |
| [bitfriends](authors/bitfriends/README.md) | BitFriends | 2 (nasm crack) | 2 / 2 |
| [binarynewbie](authors/binarynewbie/README.md) | BinaryNewbie | 2 (Small Keygenme) | 2 / 2 |
| [weissi1994](authors/weissi1994/README.md) | weissi1994 | 1 (crackme-not) | 1 / 1 |
| [2bitsin](authors/2bitsin/README.md) | 2bitsin | 1 (Secret message from a traveller) | 1 / 1 |
| [fentcat](authors/fentcat/README.md) | FentCat | 1 (Assembler Crackme) | 1 / 1 |
| [sallos](authors/sallos/README.md) | Sallos | 2 (Key License + EscapeFromMatrix) | 2 / 2 |
| [tempesta](authors/tempesta/README.md) | Tempesta | 1 (Lord Winderton) | 1 / 1 |
| [tenzo_aoki](authors/tenzo_aoki/README.md) | tenzo_aoki | 1 (Tenzo Crack ME Beta) | 1 / 1 |
| [towel](authors/towel/README.md) | Towel | 2 (Mars Analytica + QR Scanner) | 2 / 2 |
| [alpjs](authors/alpjs/README.md) | alpjs | 1 (custom vmp) | 0 / 1 |
| [bang1338](authors/bang1338/README.md) | bang1338 | 1 (Oops! All sarr) | 1 / 1 |
| [victormeloasm](authors/victormeloasm/README.md) | victormeloasm | 2 (Froggate II + Simple Frog) | 1 / 2 |
| [nillya](authors/nillya/README.md) | Nillya | 1 (Nillya's Pass CrackMe) | 0 / 1 |
| [leotrungkien](authors/leotrungkien/README.md) | Leotrungkien | 1 (Fugs) | 1 / 1 |
| [fon37](authors/fon37/README.md) | fon37 | 2 (Secret Menu + King of Asgard) | 2 / 2 |
| [memetic0](authors/memetic0/README.md) | memetic0 | 2 (Tropical, Lattice) | 2 / 2 |
| [vetementsvmnts](authors/vetementsvmnts/README.md) | vetementsvmnts | 5 | 5 / 5 |
| [acheylate](authors/acheylate/README.md) | acheylate | 4 (Find password L+W, State Machine, Beat The Game) | 4 / 4 |
| [keep](authors/keep/README.md) | Keep | 2 (sygil gui + console) | 2 / 2 |
| [mas](authors/mas/README.md) | MAS | 2 (zW0rM + Type Punning) | 2 / 2 |
| [glitch_baby](authors/glitch_baby/README.md) | Glitch_Baby | 1 (Wheredakey) | 1 / 1 |
| [lypd0](authors/lypd0/README.md) | lypd0 | 1 (Lantern01) | 1 / 1 |
| [whyyourapedme](authors/whyyourapedme/README.md) | whyyourapedme | 1 (study get PASSWORD) | 1 / 1 |
| [michaelsrtsrt](authors/michaelsrtsrt/README.md) | michaelsrtsrt | 1 (AHardcodedKeyGoneWrong) | 1 / 1 |
| [prestdayzero](authors/prestdayzero/README.md) | prestdayzero | 1 (Bobs gambling) | 1 / 1 |
| [5](authors/5/README.md) | 5 | 1 (Quintessence) | 1 / 1 |
| [kaban](authors/kaban/README.md) | KAban | 1 (custom protector) | 1 / 1 |
| [va7d1n3](authors/va7d1n3/README.md) | Va7D1n3 | 1 (Automata Simulation) | 1 / 1 |
| [confining0367](authors/confining0367/README.md) | confining0367 | 1 (Key) | 1 / 1 |
| [rodrigoteixeira](authors/rodrigoteixeira/README.md) | RodrigoTeixeira | 1 (Loggin) | 1 / 1 |
| [nake](authors/nake/README.md) | nake | 1 (SP network cipher) | 1 / 1 |
| [kamil123](authors/kamil123/README.md) | kamil123 | 1 (Mini LLM Sentinel) | 1 / 1 |
| [joejoejoe](authors/joejoejoe/README.md) | JoeJoeJoe | 1 (thefirsttest) | 1 / 1 |
| [vmlinuz719](authors/vmlinuz719/README.md) | vmlinuz719 | 1 (Product Activation) | 1 / 1 |
| [pwned.cpp](authors/pwned.cpp/README.md) | Pwned.cpp | 1 (ImGUI-CrackME) | 1 / 1 |
| [trynatobe6for6def](authors/trynatobe6for6def/README.md) | TrynaToBe6for6Def | 3 (My First / Second / Third Crackme) | 3 / 3 |
| [rqueww](authors/rqueww/README.md) | rqueww | 1 (AegisShield) | 1 / 1 |
| [orbitz](authors/orbitz/README.md) | ORBITZ | 1 (BabyDotNet) | 1 / 1 |
| [radoncoding](authors/radoncoding/README.md) | RadonCoding | 2 (binsafe + binsafe #2) | 1 / 2 |
| [nimanikjoo](authors/nimanikjoo/README.md) | NimaNikjoo | 1 (nightmare CrackMe) | 1 / 1 |
| [vsec](authors/vsec/README.md) | vsec | 2 (Challenger No.1 / Challenger #2) | 2 / 2 |
| [yugnatd](authors/yugnatd/README.md) | YugnatD | 1 (WarGames) | 1 / 1 |
| [zydak](authors/zydak/README.md) | zydak | 3 (simple obfuscated + LeetObfuscator + Tetris DRM) | 0 / 3 |
| [reiika](authors/reiika/README.md) | Reiika | 1 (stckwzrd) | 1 / 1 |
| [s3c_cult](authors/s3c_cult/README.md) | S3c_Cult | 2 (Schizo + XORcist) | 2 / 2 |
| [rr7](authors/rr7/README.md) | RR7 | 1 (Secret key) | 1 / 1 |
| [mr-x47](authors/mr-x47/README.md) | Mr.X47 | 1 (BiLoop Cipher) | 1 / 1 |
| [wut](authors/wut/README.md) | wut | 1 (frd) | 1 / 1 |
| [sudoddos](authors/sudoddos/README.md) | sudoddos | 1 (sudoddos's crackme) | 1 / 1 |
| [0xf00](authors/0xf00/README.md) | 0xf00 | 1 (Ghost) | 1 / 1 |
| [computerboy](authors/computerboy/README.md) | Computerboy | 1 (Gemy) | 1 / 1 |
| [fedguy](authors/fedguy/README.md) | fedguy | 1 (FedGuy easy crack) | 1 / 1 |
| [klip29mat1](authors/klip29mat1/README.md) | Klip29mat1 | 1 (Rev1) | 1 / 1 |
| [emiflake](authors/emiflake/README.md) | emiflake | 1 (Time is of the Essence) | 1 / 1 |
| [sacredgravel44](authors/sacredgravel44/README.md) | sacredgravel44 | 1 (matryoshka9) | 0 / 1 *(parked)* |
| [gordonbm](authors/gordonbm/README.md) | GordonBM | 1 (Reverse_Keygenme) | 1 / 1 |

## Mis de côté (PARKED — y revenir)

Challenges `status: pending` volontairement suspendus (`parked: true` dans `ORIGIN.yml`) :

| Crackme | Auteur | Reprendre |
|---|---|---|
| [matryoshka9](authors/sacredgravel44/6ad44c6c5fa39ab0d4ac1c16/) | sacredgravel44 | Windows PE64 natif ; serial 76 car. ; déchiffrement ARX (31 rounds) + check final localisés (hash 64 bits vs `0x23030D333EA5FEC6`) ; code flatten + MBA massif, Z3 n'a pas convergé ; `analysis/NOTES.md` |
| [Prometheora](authors/sobrazen/697e95cb977274421cc111e1/) | SoBrazen | Rust PIE, 500 KB ; VM bytecode maison + control-flow flattening + sbox + anti-debug (`rdtsc`/`lock cmpxchg`) ; profondeur ~4.0-4.5 malgré l'étiquette 1.6 ; `secure_verify.rs` pas localisé ; `analysis/NOTES.md` |
| [LeetObfuscator Crackme](authors/zydak/6ab666ec5ef425e62ef7fd50/) | zydak | watchdog `LeetCrackme` ptrace `./CXXD4` ; `Hell no` ; strings @ `0x4b3060` ; pas de flag ; `analysis/NOTES.md` |
| [Tetris DRM](authors/zydak/6ac989246349e4b2540c6fe9/) | zydak | prologue `main` @ `0x124a00` ; `EB FF`/`jmp rax` ; suite `0xF6968` ; `SIGILL` sous strace ; notes `analysis/NOTES.md` |
| [Froggate II: Croackpocallypse](authors/victormeloasm/6aa471e83b246e477b6c0be7/) | victormeloasm | `transform(serial)==mask` prouvé GDB ; inv. transform (~407 mixers) TBD |
| [custom vmp crackme](authors/alpjs/6aa4b6d3585e8875bcbebf80/) | alpjs | crypto OK ; brute H100 (`analysis/H100.md`) ; a-z len5 ~68 % ; flag bloc0 `Doğru! F` |
| [license-cli](authors/brembo/6a8c54dc585e8875bcbebcfb/) | brembo | préimage SHA-256 `112c2add…` (x64dbg XOR OK ; rockyou×rules miss) |
| [bugger_v.7](authors/crackmes-de/5ab77f6633c5d40ad448cc25/) | crackmes.de / shism | clé RC6 + wake shell dormant |
| [meloquynthe](authors/crackmes-de/5ab77f5933c5d40ad448c46f/) | crackmes.de / meat | boutons `0x532..0x536` vs wave (`sub_40507f`) ; pas de saisie clavier |
| [MCM 3.0 REWORK](authors/cracknotme/698fb9e9a79466462e957bec/) | CrackNotMe | parent/`--3a1f9b` + VM ; mask XOR TBD (notes 2026-09-01) |
| [binsafe #2](authors/radoncoding/6ad4ab462c7537120cbe832b/) | RadonCoding | `F` devirtualisee (`mix(b+(2c+1)*G)`, bijection ; `tools/binsafe-model.py`) ; reste un chemin vers 0 (MITM >9 coups, ~x64/coup) ou le hash final `T` (SAT sur le keystream) |

## Historique des résolutions

Dates = jour du commit write-up / soluce sur `main` (**plus récent en haut**).

| Date | Crackme | Auteur |
|---|---|---|
| 2026-10-26 | [gc_crackme_9 by gandalf](authors/crackmes-de/5ab77f5733c5d40ad448c370/) | crackmes.de / gandalf |
| 2026-10-26 | [gc_crackme_10 by gandalf](authors/crackmes-de/5ab77f5733c5d40ad448c36b/) | crackmes.de / gandalf |
| 2026-10-26 | [gc_crackme_8 by gandalf](authors/crackmes-de/5ab77f5733c5d40ad448c368/) | crackmes.de / gandalf |
| 2026-10-26 | [eazy_peazy_crackme (SerialMe) by fego](authors/crackmes-de/5ab77f5733c5d40ad448c366/) | crackmes.de / fego |
| 2026-10-26 | [evidence2 by GiveMe5](authors/crackmes-de/5ab77f5733c5d40ad448c362/) | crackmes.de / GiveMe5 |
| 2026-10-26 | [KeygenME #1 by l0calh0st](authors/crackmes-de/5ab77f5733c5d40ad448c35f/) | crackmes.de / l0calh0st |
| 2026-10-26 | [crackme_2 by magenta](authors/crackmes-de/5ab77f5733c5d40ad448c35d/) | crackmes.de / magenta |
| 2026-10-26 | [crackme_4 by magenta](authors/crackmes-de/5ab77f5733c5d40ad448c35c/) | crackmes.de / magenta |
| 2026-10-26 | [crackme_1 by magenta](authors/crackmes-de/5ab77f5733c5d40ad448c35b/) | crackmes.de / magenta |
| 2026-10-25 | [thorwak_crackme01 by thorwak](authors/crackmes-de/5ab77f5733c5d40ad448c359/) | crackmes.de / thorwak |
| 2026-10-25 | [firstcrackme by damiok](authors/crackmes-de/5ab77f5733c5d40ad448c358/) | crackmes.de / damiok |
| 2026-10-25 | [cm01 by cyriel](authors/crackmes-de/5ab77f5733c5d40ad448c356/) | crackmes.de / cyriel |
| 2026-10-25 | [keygenme_1_v2.1_final by haspor](authors/crackmes-de/5ab77f5733c5d40ad448c355/) | crackmes.de / haspor |
| 2026-10-25 | [crackme_by_hackereh by hackereh@](authors/crackmes-de/5ab77f5733c5d40ad448c354/) | crackmes.de / hackereh@ |
| 2026-10-25 | [very_easy_keygenme by hackereh@](authors/crackmes-de/5ab77f5733c5d40ad448c353/) | crackmes.de / hackereh@ |
| 2026-10-25 | [Simple KGM 2 by v3sa](authors/crackmes-de/5ab77f5733c5d40ad448c352/) | crackmes.de / v3sa |
| 2026-10-25 | [Parts by axel.net](authors/crackmes-de/5ab77f5733c5d40ad448c34b/) | crackmes.de / axel.net |
| 2026-10-25 | [justafewnumbers by obnoxious](authors/crackmes-de/5ab77f5733c5d40ad448c349/) | crackmes.de / obnoxious |
| 2026-10-25 | [obnoxiousskgm1 by obnoxious](authors/crackmes-de/5ab77f5733c5d40ad448c347/) | crackmes.de / obnoxious |
| 2026-10-25 | [Lattice](authors/memetic0/6add58b64ab951a9999da0c8/) | memetic0 |
| 2026-10-25 | [zenobiatranoss](authors/zenoniatranoss/6add0af25fa39ab0d4ac1e11/) | zenoniatranoss |
| 2026-10-25 | [Zero4](authors/cracknotme/6add1a434b6d53e8802ed06a/) | CrackNotMe |
| 2026-10-25 | [obnoxiousskgm2 by obnoxious](authors/crackmes-de/5ab77f5733c5d40ad448c346/) | crackmes.de / obnoxious |
| 2026-10-25 | [optimise by obnoxious](authors/crackmes-de/5ab77f5733c5d40ad448c344/) | crackmes.de / obnoxious |
| 2026-10-25 | [get2thatnumber by obnoxious](authors/crackmes-de/5ab77f5733c5d40ad448c343/) | crackmes.de / obnoxious |
| 2026-10-25 | [crackme1_by_cr4ckd0r](authors/crackmes-de/5ab77f5733c5d40ad448c33f/) | crackmes.de / cr4ckd0r |
| 2026-10-25 | [key_check_crackme by kcom](authors/crackmes-de/5ab77f5733c5d40ad448c33c/) | crackmes.de / kcom |
| 2026-10-25 | [key_file_crack_1 (CrackMe3) by kcom](authors/crackmes-de/5ab77f5733c5d40ad448c33b/) | crackmes.de / kcom |
| 2026-10-25 | [nag_screen_1 by kcom](authors/crackmes-de/5ab77f5733c5d40ad448c33a/) | crackmes.de / kcom |
| 2026-10-25 | [amkTwo by am0k](authors/crackmes-de/5ab77f5733c5d40ad448c336/) | crackmes.de / am0k |
| 2026-10-25 | [Am0kCM_2 by am0k](authors/crackmes-de/5ab77f5733c5d40ad448c334/) | crackmes.de / am0k |
| 2026-10-25 | [xcrackme by am0k](authors/crackmes-de/5ab77f5733c5d40ad448c331/) | crackmes.de / am0k |
| 2026-10-25 | [keygenme_1 by toma6868](authors/crackmes-de/5ab77f5733c5d40ad448c330/) | crackmes.de / toma6868 |
| 2026-10-24 | [KeygenMe #1 by boonz](authors/crackmes-de/5ab77f5733c5d40ad448c32d/) | crackmes.de / boonz |
| 2026-10-24 | [KeygenMe2 by boonz](authors/crackmes-de/5ab77f5733c5d40ad448c32c/) | crackmes.de / boonz |
| 2026-10-24 | [crackmev5 by logan](authors/crackmes-de/5ab77f5733c5d40ad448c32a/) | crackmes.de / logan |
| 2026-10-24 | [crackme_v4 by logan](authors/crackmes-de/5ab77f5733c5d40ad448c328/) | crackmes.de / logan |
| 2026-10-24 | [creepys_crackme by creepy](authors/crackmes-de/5ab77f5733c5d40ad448c327/) | crackmes.de / creepy |
| 2026-10-24 | [creepys_crackme3 by creepy](authors/crackmes-de/5ab77f5733c5d40ad448c326/) | crackmes.de / creepy |
| 2026-10-24 | [crackme20 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c323/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme07 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c322/) | crackmes.de / attilhaz |
| 2026-10-24 | [Functions!](authors/jasper676767/6ad6c85c4ab951a9999d9f55/) | Jasper676767 |
| 2026-10-24 | [crackme26 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c321/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme22 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c31e/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme02 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c31d/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme08 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c31b/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme13 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c31a/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme05 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c317/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme14 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c316/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme09 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c315/) | crackmes.de / attilhaz |
| 2026-10-24 | [crackme21 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c313/) | crackmes.de / attilhaz |
| 2026-10-23 | [crackme01 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c30f/) | crackmes.de / attilhaz |
| 2026-10-23 | [crackme04 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c30e/) | crackmes.de / attilhaz |
| 2026-10-23 | [crackme06 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c30c/) | crackmes.de / attilhaz |
| 2026-10-22 | [crackme12 by attilhaz](authors/crackmes-de/5ab77f5733c5d40ad448c309/) | crackmes.de / attilhaz |
| 2026-10-21 | [Keygenme v.1 by albertus](authors/crackmes-de/5ab77f5633c5d40ad448c302/) | crackmes.de / albertus |
| 2026-10-21 | [crackme_extreme_v1.0 by the_rapture](authors/crackmes-de/5ab77f5633c5d40ad448c300/) | crackmes.de / the_rapture |
| 2026-10-21 | [CrackMe #1 by MiSSiNG iN ByTES](authors/crackmes-de/5ab77f5633c5d40ad448c2ff/) | crackmes.de / MiB |
| 2026-10-21 | [nelix_crackme_1 by nelix](authors/crackmes-de/5ab77f5633c5d40ad448c2fd/) | crackmes.de / nelix |
| 2026-10-21 | [crackme_1 by nrz0e1](authors/crackmes-de/5ab77f5633c5d40ad448c2f7/) | crackmes.de / nrz0e1 |
| 2026-10-21 | [Reverse_Keygenme by GordonBM](authors/gordonbm/5ab77f5633c5d40ad448c2f6/) | gordonbm |
| 2026-10-20 | [lafarges_crackme_1 by lafarge](authors/crackmes-de/5ab77f5633c5d40ad448c2f1/) | crackmes.de / lafarge |
| 2026-10-20 | [crackme_v0.2 by lafarge](authors/crackmes-de/5ab77f5633c5d40ad448c2f0/) | crackmes.de / lafarge |
| 2026-10-20 | [keygenme2 by saytos](authors/crackmes-de/5ab77f5633c5d40ad448c2ef/) | crackmes.de / saytos |
| 2026-10-20 | [enableme_pushme_1_by_saytos by saytos](authors/crackmes-de/5ab77f5633c5d40ad448c2ee/) | crackmes.de / saytos |
| 2026-10-20 | [crackme2_by_mabaker by mabaker](authors/crackmes-de/5ab77f5633c5d40ad448c2ed/) | crackmes.de / mabaker |
| 2026-10-18 | [Time is of the Essence](authors/emiflake/5d09368533c5d41c6d56e124/) | emiflake |
| 2026-10-18 | [Upgraded Levels Keygen (difficulty 1-3)](authors/saltedmacaroni841/66c724b9b899a3b9dd02ad98/) | saltedMacaroni841 |
| 2026-10-18 | [Rev1](authors/klip29mat1/6970da549bf7b8997653a66f/) | Klip29mat1 |
| 2026-10-18 | [FedGuy easy crack](authors/fedguy/691abffc2d267f28f69b7e8a/) | fedguy |
| 2026-10-18 | [Gemy](authors/computerboy/673ff5da9b533b4c22bd2fff/) | Computerboy |
| 2026-10-18 | [Ghost](authors/0xf00/682f69bd6297cca3ff7d7b9b/) | 0xf00 |
| 2026-10-18 | [sudoddos's crackme](authors/sudoddos/6ad4fb7e4ab951a9999d9ed6/) | sudoddos |
| 2026-10-18 | [AegisShield](authors/rqueww/6acbc705cdee6e086a173793/) | rqueww |
| 2026-10-18 | [My Third Crackme (Medium + Flag)](authors/trynatobe6for6def/6ac8f2506349e4b2540c6fc0/) | TrynaToBe6for6Def |
| 2026-10-18 | [Basics::AHardcodedKeyGoneWrong](authors/michaelsrtsrt/6ab56a1e95b976f8f1300b7a/) | michaelsrtsrt |
| 2026-10-18 | [anonimoser_crackme_i by anonimoser](authors/crackmes-de/5ab77f5633c5d40ad448c2e8/) | crackmes.de / anonimoser |
| 2026-10-18 | [anonimoser_crackme_ii by anonimoser](authors/crackmes-de/5ab77f5633c5d40ad448c2e7/) | crackmes.de / anonimoser |
| 2026-10-18 | [nirvana_crackme_i by anonimoser](authors/crackmes-de/5ab77f5633c5d40ad448c2e6/) | crackmes.de / anonimoser |
| 2026-10-18 | [keygenme_1 by ksil](authors/crackmes-de/5ab77f5633c5d40ad448c2e4/) | crackmes.de / ksil |
| 2026-10-18 | [crackme by aharli](authors/crackmes-de/5ab77f5633c5d40ad448c2e1/) | crackmes.de / aharli |
| 2026-10-18 | [frd (TWO-RING VOW)](authors/wut/6ad3c8922c7537120cbe82fe/) | wut |
| 2026-10-17 | [VSEC Challenger #2](authors/vsec/6acc0cbbace07d1c3fbc4afb/) | vsec |
| 2026-10-17 | [PrettyDamnEasy](authors/nutcake/5c11dcaf33c5d41e58e00578/) | nutcake |
| 2026-10-17 | [PieIsMyFav](authors/nutcake/5c11e1f333c5d41e58e00579/) | nutcake |
| 2026-10-17 | [WhiteRabbit](authors/nutcake/5c11e2f333c5d41e58e0057a/) | nutcake |
| 2026-10-17 | [jumpjumpjump](authors/cbm-hackers/5c1a939633c5d41e58e005d1/) | cbm-hackers |
| 2026-10-17 | [easy_keygenme](authors/bahha/5c1cc7d533c5d41e58e005ee/) | bahha |
| 2026-10-17 | [c1_keygenme1](authors/c1/5c2335c033c5d41e58e00625/) | c1 |
| 2026-10-17 | [keyGme](authors/rion/5c268e8333c5d41e58e00654/) | rion |
| 2026-10-17 | [Simple Keygen](authors/yuri/5c2acb8933c5d46a3882b8d4/) | Yuri |
| 2026-10-17 | [Keygen Practice](authors/inxaneninja/5c8d45c333c5d4776a837ec2/) | inxaneninja |
| 2026-10-17 | [Easy_firstCrackme-by-D4RK_FL0W](authors/d4rkfl0w/5c8e1a9533c5d4776a837ecf/) | D4RKFL0W |
| 2026-10-17 | [Password Login](authors/loz/5c90a72d33c5d4776a837f07/) | Loz |
| 2026-10-17 | [de_tcrack1](authors/paypain/5c9d9eea33c5d4419da55641/) | paypain |
| 2026-10-17 | [Crack3-by-D4RK_FL0W](authors/d4rkfl0w/5ca0b3f833c5d4419da5567a/) | D4RKFL0W |
| 2026-10-17 | [Password Login 2](authors/loz/5ca0b6c833c5d4419da5567b/) | Loz |
| 2026-10-17 | [am i really random?](authors/m00ny/5cb7533133c5d4419da5584b/) | m00ny |
| 2026-10-17 | [EasyCrack - Much0l0k0](authors/paypain/5cc1117833c5d4419da558dc/) | paypain |
| 2026-10-17 | [crackmepal](authors/novn91/5ccecc7e33c5d4419da559b3/) | novn91 |
| 2026-10-17 | [Sh4ll10](authors/destructeur/5ccf3bf333c5d4419da559bd/) | destructeur |
| 2026-10-17 | [D4RK_FL0W-3.5](authors/d4rkfl0w/5ce137b933c5d4419da55ac2/) | D4RKFL0W |
| 2026-10-17 | [crackme #1](authors/hikilaka/5cf574fe33c5d41c6d56e01b/) | hikilaka |
| 2026-10-17 | [Simple crackme](authors/kawaii-flesh/5d0d1e1333c5d41c6d56e155/) | kawaii-flesh |
| 2026-10-17 | [guild hall adventure Ch.1](authors/ker2x/5d0fa1ac33c5d41c6d56e172/) | ker2x |
| 2026-10-17 | [Key and keygen](authors/kawaii-flesh/5d17962b33c5d41c6d56e1f2/) | kawaii-flesh |
| 2026-10-17 | [guild hall adventure Ch.2](authors/ker2x/5d1a344033c5d410dc4d0c3e/) | ker2x |
| 2026-10-17 | [keygenme](authors/kawaii-flesh/5d24585133c5d410dc4d0cbd/) | kawaii-flesh |
| 2026-10-17 | [Save Scooby](authors/mrt4ntr4/5d41bf7633c5d444ad30189b/) | mrT4ntr4 |
| 2026-10-17 | [Crack the algorithm](authors/skudo/5d46d2bd33c5d444ad3018d3/) | skudo |
| 2026-10-17 | [Election](authors/paypain/5d64749533c5d46f00e2c324/) | paypain |
| 2026-10-17 | [Simple obfuscation](authors/binarynewbie/5d6da7bc33c5d46f00e2c3a3/) | BinaryNewbie |
| 2026-10-17 | [alien_bin](authors/totothetoro/5d78168833c5d46f00e2c428/) | totothetoro |
| 2026-10-17 | [easy keyg3nme](authors/ezman/5da31ebc33c5d46f00e2c661/) | ezman |
| 2026-10-17 | [half-twins](authors/m3hd1/5dce805c33c5d419aa0131ae/) | m3hd1 |
| 2026-10-17 | [glow wine [keygen practice]](authors/bkamp/5df26b4033c5d419aa013362/) | Bkamp |
| 2026-10-17 | [Ext.challenges](authors/exxtra12/5dfd77a833c5d419aa013406/) | Exxtra12 |
| 2026-10-17 | [Crackme-4](authors/d4rkfl0w/5e0fa43b33c5d419aa01351e/) | D4RKFL0W |
| 2026-10-17 | [mgdilolmsoamasiug](authors/raphiolet/5e604d4333c5d4439bb2dd72/) | raphiolet |
| 2026-10-17 | [Very Special Number v1](authors/owo_whats_this/5e6ac90233c5d4439bb2de39/) | owo_whats_this |
| 2026-10-17 | [racecars](authors/chillywilly/5e76c37d33c5d4439bb2df1b/) | chillywilly |
| 2026-10-17 | [easyAF](authors/476f64/5eae2d6633c5d47611746500/) | 476f64 |
| 2026-10-17 | [Baby Ransom](authors/shad3/5ec1a37533c5d449d91ae535/) | Shad3 |
| 2026-10-17 | [ZED-Crackme](authors/zed-zahir/5ecd7cc133c5d449d91ae641/) | zed-zahir |
| 2026-10-17 | [ShAPK1](authors/destructeur/5eea811d33c5d449d91ae870/) | destructeur |
| 2026-10-17 | [bubbly](authors/jeffli6789/5f00a02533c5d4285070947a/) | jeffli6789 |
| 2026-10-17 | [simple overflow](authors/bitfriends/5f05ec3c33c5d42a7c66792b/) | BitFriends |
| 2026-10-17 | [Crack_5](authors/d4rkfl0w/5f0998cb33c5d42a7c667974/) | D4RKFL0W |
| 2026-10-17 | [Just crackme](authors/tynkute/5fa2cdce33c5d424269a1740/) | tynkute |
| 2026-10-17 | [what](authors/rafi/5fd5c44c33c5d424269a1b76/) | rafi |
| 2026-10-17 | [lockcode](authors/silentwraith/5fda4fa433c5d41f64dee37b/) | SilentWraith |
| 2026-10-17 | [unlockme](authors/pranav/5ff53c5c33c5d42c3d0165b7/) | pranav |
| 2026-10-17 | [GO GO GO - Harmful Logic](authors/s0k1t/6044083333c5d42c3d016d3d/) | s0k1t |
| 2026-10-17 | [crackme](authors/harel21/6047ffb433c5d42c3d016da6/) | Harel21 |
| 2026-10-17 | [My_first_ever_crackme](authors/asbo_general/6074618733c5d44899821e35/) | ASBO_GENERAL |
| 2026-10-17 | [EZwan](authors/dirkd/60957b9a33c5d458ce0ec88e/) | DirkD |
| 2026-10-17 | [Yariza Crackme #2](authors/yariza/60bd61ea33c5d410b8842c76/) | yariza |
| 2026-10-17 | [Keygen Me](authors/yariza/60c24a7133c5d410b8842d3c/) | yariza |
| 2026-10-17 | [Forest](authors/mkesenheimer/60f31f1d33c5d42814fb3381/) | MKesenheimer |
| 2026-10-17 | [revv](authors/0xtamsee1/60fc687b33c5d42814fb34e0/) | 0xtamsee1 |
| 2026-10-17 | [4N0NY31TY's First Crackme](authors/4n0ny31ty/611e76ec33c5d45db85dc2d1/) | 4N0NY31TY |
| 2026-10-17 | [super_easy](authors/eventhorizon02/611e9bfb33c5d45db85dc2d7/) | eventhorizon02 |
| 2026-10-17 | [PleaseCrackMe](authors/raphdev/612e85d833c5d41acedffa4f/) | RaphDev |
| 2026-10-17 | [gugus the first](authors/bueb810/61e9983133c5d413767ca5ac/) | bueb810 |
| 2026-10-17 | [TryCrackMe](authors/mrempy/61c8deff33c5d413767ca0ea/) | MrEmpy |
| 2026-10-17 | [License Checker 0x01](authors/nomanprodhan/619eda7b33c5d455dece628d/) | NomanProdhan |
| 2026-10-17 | [License Checker 0x02](authors/nomanprodhan/61c62bde33c5d413767ca0a0/) | NomanProdhan |
| 2026-10-17 | [License Checker 0x03](authors/nomanprodhan/62072dd633c5d46c8bcbfd9b/) | NomanProdhan |
| 2026-10-17 | [licesnse_checker_3](authors/pourmeadrinkwhileimfloating/62327b0433c5d46c8bcc0335/) | pourmeadrinkwhileimfloating |
| 2026-10-17 | [my_f1rs7_cr4ckm3](authors/b3nd3p/6296c1ff33c5d45b75903c0f/) | b3nd3p |
| 2026-10-17 | [Illogical Logic](authors/marufmurtuza/637c66b633c5d43ab4ecec2a/) | marufmurtuza |
| 2026-10-17 | [Just In Time](authors/skibur/63c4ee1a33c5d43ab4ecf49a/) | skibur |
| 2026-10-17 | [MyFirstCrackme](authors/sirender125/63ff9d5c33c5d447bc7616f0/) | SirEnder125 |
| 2026-10-17 | [RegistrationCrackme](authors/sirender125/6404055233c5d447bc7617ad/) | SirEnder125 |
| 2026-10-17 | [baby](authors/ghost256/6419d74e33c5d447bc761afa/) | ghost256 |
| 2026-10-17 | [My first crackme](authors/ss1ned/644af68433c5d43938912c6b/) | ss1ned |
| 2026-10-17 | [Salt and Hash - Linux](authors/yekong/644bd78b33c5d43938912c94/) | Yekong |
| 2026-10-17 | [Vending Machine](authors/yekong/6454d06c33c5d43938912e8a/) | Yekong |
| 2026-10-17 | [GDB basics](authors/varsovie/645d3d4e33c5d43938913079/) | Varsovie |
| 2026-10-17 | [Level1](authors/sudo0x18/646627a933c5d439389131d9/) | sudo0x18 |
| 2026-10-17 | [Find password](authors/ithawk/64e91b92d931496abf9091e3/) | ithawk |
| 2026-10-17 | [based](authors/mt77/64fdf93bd931496abf90994b/) | mt77 |
| 2026-10-17 | [Plain sight](authors/i3a4dam/6513567328b5870bef263329/) | I3a4dam |
| 2026-10-17 | [Weird](authors/exzettabyte/65727e2035240bf986f0ff19/) | exzettabyte |
| 2026-10-17 | [nice_crackme](authors/jenya/659fde9deef082e477ff59ba/) | Jenya |
| 2026-10-17 | [H1dd3n Fl4g](authors/m4st4rcr4ck/65a172f0eef082e477ff5a6e/) | M4st4rCr4ck |
| 2026-10-17 | [FLAG](authors/arjunrajesh/65a97cbaeef082e477ff5d84/) | ArjunRajesh |
| 2026-10-17 | [Password](authors/oxymore/65c926c6eef082e477ff6b5a/) | Oxymore |
| 2026-10-17 | [level2](authors/nimacpp/65da0fce6d3d2b1fef4be4df/) | nimacpp |
| 2026-10-17 | [Simple but not simple](authors/jackioye/6603c10ccddae72ae250bcd6/) | jackioye |
| 2026-10-17 | [Getting started](authors/stonezarcon/660a24f1cddae72ae250bf56/) | stonezarcon |
| 2026-10-17 | [Authorize by PIN](authors/ananascharles/6617d3a5cddae72ae250c556/) | AnanasCharles |
| 2026-10-17 | [KGenMe v2](authors/dzonerzy/6672bf9ee7b35c09bb266f5e/) | dzonerzy |
| 2026-10-17 | [Crack On The Cob - COBOL](authors/froglover22/6629bf7aa562ef06c3b52e86/) | froglover22 |
| 2026-10-17 | [guess_the_password](authors/b4te/6640d1d26b8bd8ddfe33c80a/) | b4te |
| 2026-10-17 | [good_boy](authors/fdisotto/669a714890c4c2830c820bc0/) | fdisotto |
| 2026-10-17 | [Levels Keygen!](authors/saltedmacaroni841/66a288ed90c4c2830c820fa0/) | saltedMacaroni841 |
| 2026-10-17 | [yum :P](authors/hybridkenrel/6754620160fa67152406b53c/) | hybridkenrel |
| 2026-10-17 | [Sexy 1337](authors/rafaelgfreveng/6715466c9b533b4c22bd18bb/) | RafaelGFreveng |
| 2026-10-17 | [lfalchs_1st_crackme by lfalch](authors/crackmes-de/5ab77f5633c5d40ad448c2df/) | crackmes.de / lfalch |
| 2026-10-17 | [orcs236_crackme by orcs236](authors/crackmes-de/5ab77f5633c5d40ad448c2de/) | crackmes.de / orcs236 |
| 2026-10-17 | [orks236_crackme_2 by orcs236](authors/crackmes-de/5ab77f5633c5d40ad448c2dd/) | crackmes.de / orcs236 |
| 2026-10-17 | [crackme_1.0 by skjobax](authors/crackmes-de/5ab77f5633c5d40ad448c2dc/) | crackmes.de / skjobax |
| 2026-10-17 | [wtf_serial_protected_round_1 by skjobax](authors/crackmes-de/5ab77f5633c5d40ad448c2db/) | crackmes.de / skjobax |
| 2026-10-16 | [BabyRev](authors/cappybara/6784f8a84d850ac5f7dc5173/) | Cappybara |
| 2026-10-16 | [Very simple crackme](authors/fragus/67afd55ae36dd9b0e79b2ec6/) | Fragus |
| 2026-10-16 | [My First Rust Crackme](authors/hfirewoxlf/680cffd48f555589f3530fac/) | hFireWoxlf |
| 2026-10-16 | [easyjerk](authors/vulnix/67fa22568f555589f3530a94/) | vulnix |
| 2026-10-16 | [babyFirstCrackme](authors/idanhajbeko/680d04208f555589f3530fb5/) | idanhajbeko |
| 2026-10-16 | [EasyCrackme](authors/userrrrrr/682767d26297cca3ff7d79be/) | userrrrrr |
| 2026-10-16 | [XORcist](authors/s3c_cult/684f47bd2b84be7ea774390e/) | S3c_Cult |
| 2026-10-16 | [shellcoding](authors/toasterbirb/6869167eaadb6eeafb398fb4/) | toasterbirb |
| 2026-10-16 | [argc](authors/toasterbirb/68698837aadb6eeafb399017/) | toasterbirb |
| 2026-10-16 | [main.cpp](authors/toasterbirb/6869233eaadb6eeafb398fdb/) | toasterbirb |
| 2026-10-16 | [Godez_Mark crackme](authors/mark_godez/688328248fac2855fe6fb07d/) | Mark_Godez |
| 2026-10-16 | [int overflow](authors/izijerry/6894d8e98fac2855fe6fb3ff/) | izijerry |
| 2026-10-16 | [Bingus](authors/thedollar/68a153668fac2855fe6fb67b/) | thedollar |
| 2026-10-16 | [good kitty](authors/emilia161/68c44e20224c0ec5dcedbf4b/) | Emilia161 |
| 2026-10-16 | [segfault](authors/asmboy/6919feb12d267f28f69b7e5c/) | ASMboy |
| 2026-10-16 | [really easy](authors/ezloom/691fd9362d267f28f69b7f89/) | ezloom |
| 2026-10-16 | [Introduction to RE](authors/yanderemia/6940b5870992a052ab22235b/) | YandereMia |
| 2026-10-16 | [simple XOR crackme](authors/yanderemia/6946be18523504d8c842eb7e/) | YandereMia |
| 2026-10-16 | [ZEXOR-v1 (Linux)](authors/svidnet/6963af82143c47935bdea9ab/) | svidnet |
| 2026-10-16 | [Password And Flag in C](authors/howosec/6973ebc6d735cd51e7a1aa97/) | howosec |
| 2026-10-16 | [crackme_2.75 (BuLLeT)](authors/crackmes-de/5ab77f5633c5d40ad448c2d0/) | crackmes.de / BuLLeT |
| 2026-10-16 | [crackme1 by dlap](authors/crackmes-de/5ab77f5633c5d40ad448c2d8/) | crackmes.de / dlap |
| 2026-10-16 | [madeinqcs_crackme by madeinqc](authors/crackmes-de/5ab77f5633c5d40ad448c2d3/) | crackmes.de / madeinqc |
| 2026-10-16 | [crackme_4.75 by bullet](authors/crackmes-de/5ab77f5633c5d40ad448c2d2/) | crackmes.de / BuLLeT |
| 2026-10-16 | [crackme_1.75 by bullet](authors/crackmes-de/5ab77f5633c5d40ad448c2d1/) | crackmes.de / BuLLeT |
| 2026-10-16 | [crackme1_s4tan by s4tan](authors/crackmes-de/5ab77f5633c5d40ad448c2ce/) | crackmes.de / s4tan |
| 2026-10-16 | [Quite a simple crackme](authors/sftmlg/697f761b32fcb81e1bd005c6/) | sftmlg |
| 2026-10-16 | [simple crackme](authors/marco007/698a6214fb46458f1ef6cef5/) | marco007 |
| 2026-10-16 | [time based riddle](authors/marco007/6990e4b9a15272fa37a80cb8/) | marco007 |
| 2026-10-16 | [CrackIt;)](authors/qerr0r/69a65ee60f5b9757a6a5f73f/) | QERR0R |
| 2026-10-16 | [Hecate linux/unix](authors/kryptos/6a5010dac630e9c9509785f6/) | Kryptos |
| 2026-10-16 | [ComputeTheKey](authors/th/6a53f2cb055757d3df60fcd4/) | th |
| 2026-10-15 | [LvArshu (Flag) / TWO-RING VOW](authors/arshi/6acfedfb6349e4b2540c7170/) | arshi |
| 2026-10-15 | [U Can't Pass](authors/mystergaif/69cd36983e328e778db052c2/) | mystergaif |
| 2026-10-15 | [c](authors/toronto/69e352c2643676f8bb961d2e/) | Toronto |
| 2026-10-15 | [VaultBreaker](authors/shadowlegion/69fba1198fab7bbca27300f2/) | ShadowLegion |
| 2026-10-15 | [InputPrinter](authors/khaledddd/69fc5a3a3fba64e45dcea9ed/) | khaledddd |
| 2026-10-15 | [Jame's Cybersecurity Company](authors/segfaults/6a0c8b608fab7bbca2730221/) | segfaults |
| 2026-10-15 | [FindLicenseKey](authors/vodeff/6a2c61c06840520e01b21e2d/) | vodeff |
| 2026-10-15 | [Accsess me please :)](authors/chaltu/6a3a7734a4b247348ae80666/) | chaltu |
| 2026-10-15 | [Rage keygen](authors/mazzotti/6a357cd98a86e4c2c55254d8/) | Mazzotti |
| 2026-10-15 | [Back To The beginning Keygen](authors/mazzotti/6a37cbc65f26f108ba18b982/) | Mazzotti |
| 2026-10-15 | [Getting started keygen](authors/mazzotti/6a3ce36d39dd6183d62b9dfe/) | Mazzotti |
| 2026-10-15 | [Cortisol level low keygen](authors/mazzotti/6a400d20a4b247348ae806cf/) | Mazzotti |
| 2026-10-15 | [23x41's 0x8A7 Vault (Joker)](authors/23x41/6a597d5e055757d3df60fd58/) | 23x41 |
| 2026-10-15 | [23x41's 0x8A7 Gate (Batcave)](authors/23x41/6a597d2a0b25d281a656896b/) | 23x41 |
| 2026-10-15 | [patchme_1 by doomsweek](authors/crackmes-de/5ab77f5633c5d40ad448c2c6/) | crackmes.de / doomsweek |
| 2026-10-15 | [d00msweek039s_crackme_2 by doomsweek](authors/crackmes-de/5ab77f5633c5d40ad448c2c5/) | crackmes.de / doomsweek |
| 2026-10-15 | [d00msweek039s_crackme_1 by doomsweek](authors/crackmes-de/5ab77f5633c5d40ad448c2c4/) | crackmes.de / doomsweek |
| 2026-10-15 | [King of Asgard](authors/fon37/6acf9047ace07d1c3fbc4c0f/) | fon37 |
| 2026-10-14 | [code_linux](authors/crackmes-de/5ab77f5f33c5d40ad448c800/) | crackmes.de / buga0205 |
| 2026-10-14 | [crackme2](authors/crackmes-de/5ab77f5e33c5d40ad448c78d/) | crackmes.de / seveb |
| 2026-10-14 | [crackme05](authors/crackmes-de/5ab77f5e33c5d40ad448c78c/) | crackmes.de / seveb |
| 2026-10-14 | [crackme1](authors/crackmes-de/5ab77f5e33c5d40ad448c78b/) | crackmes.de / seveb |
| 2026-10-14 | [crackme04](authors/crackmes-de/5ab77f5e33c5d40ad448c78a/) | crackmes.de / seveb |
| 2026-10-14 | [keygen](authors/crackmes-de/5ab77f5e33c5d40ad448c745/) | crackmes.de / tvk6843 |
| 2026-10-14 | [keygen_1](authors/crackmes-de/5ab77f5e33c5d40ad448c744/) | crackmes.de / tvk6843 |
| 2026-10-14 | [kylix_crackme](authors/crackmes-de/5ab77f5e33c5d40ad448c728/) | crackmes.de / warleyalex |
| 2026-10-14 | [xrockmr](authors/crackmes-de/5ab77f5d33c5d40ad448c69f/) | crackmes.de / synamics |
| 2026-10-14 | [blaad](authors/crackmes-de/5ab77f5c33c5d40ad448c639/) | crackmes.de / nobody |
| 2026-10-14 | [ritz_crackme_for_linux](authors/crackmes-de/5ab77f5c33c5d40ad448c638/) | crackmes.de / nobody |
| 2026-10-14 | [eyecandylocked](authors/crackmes-de/5ab77f5b33c5d40ad448c563/) | crackmes.de / nexy |
| 2026-10-14 | [var](authors/crackmes-de/5ab77f5b33c5d40ad448c5b3/) | crackmes.de / unchapelierfou |
| 2026-10-14 | [sys_linux_crackme](authors/crackmes-de/5ab77f5c33c5d40ad448c637/) | crackmes.de / syscalo |
| 2026-10-14 | [pof_kgme_0x01](authors/crackmes-de/5ab77f5a33c5d40ad448c532/) | crackmes.de / pof_es |
| 2026-10-14 | [jandepora](authors/crackmes-de/5ab77f5b33c5d40ad448c5c2/) | crackmes.de / esn_min |
| 2026-10-14 | [k_genme](authors/crackmes-de/5ab77f5a33c5d40ad448c4fa/) | crackmes.de / macabre |
| 2026-10-14 | [kde_enableme1](authors/crackmes-de/5ab77f5a33c5d40ad448c4fb/) | crackmes.de / macabre |
| 2026-10-14 | [arm_crack1](authors/crackmes-de/5ab77f5a33c5d40ad448c52b/) | crackmes.de / blankwall |
| 2026-10-14 | [ps3crackme1](authors/crackmes-de/5ab77f5a33c5d40ad448c4f9/) | crackmes.de / macabre |
| 2026-10-14 | [easy_crackme_1](authors/crackmes-de/5ab77f5a33c5d40ad448c507/) | crackmes.de / stefanie |
| 2026-10-14 | [infector_unpackme](authors/crackmes-de/5ab77f5a33c5d40ad448c4f6/) | crackmes.de / macabre |
| 2026-10-14 | [crackmejenny](authors/crackmes-de/5ab77f5a33c5d40ad448c4ed/) | crackmes.de / sraboy |
| 2026-10-14 | [easy_celen](authors/crackmes-de/5ab77f5a33c5d40ad448c4da/) | crackmes.de / s4t4y |
| 2026-10-14 | [crackme_1](authors/crackmes-de/5ab77f5933c5d40ad448c48a/) | crackmes.de / batman10 |
| 2026-10-14 | [facets](authors/crackmes-de/5ab77f5833c5d40ad448c411/) | crackmes.de / monads |
| 2026-10-14 | [cm1](authors/crackmes-de/5ab77f5833c5d40ad448c3f5/) | crackmes.de / lagalopex |
| 2026-10-14 | [bf](authors/crackmes-de/5ab77f5833c5d40ad448c39b/) | crackmes.de / crp |
| 2026-10-14 | [exceptional](authors/crackmes-de/5ab77f5833c5d40ad448c39a/) | crackmes.de / crp |
| 2026-10-14 | [1337_arm](authors/crackmes-de/5ab77f5733c5d40ad448c380/) | crackmes.de / gtksor |
| 2026-10-14 | [gtk_k3yg3nme](authors/crackmes-de/5ab77f5733c5d40ad448c37f/) | crackmes.de / gtksor |
| 2026-10-14 | [first_keygenme](authors/crackmes-de/5ab77f5733c5d40ad448c363/) | crackmes.de / twistedtux |
| 2026-10-14 | [drscm3](authors/crackmes-de/5ab77f5733c5d40ad448c307/) | crackmes.de / drspliff |
| 2026-10-14 | [linux_crackme_02](authors/crackmes-de/5ab77f5633c5d40ad448c2d7/) | crackmes.de / cyrex |
| 2026-10-14 | [linux_crackme](authors/crackmes-de/5ab77f5633c5d40ad448c2d6/) | crackmes.de / cyrex |
| 2026-10-14 | [easy_math_keygenme](authors/crackmes-de/5ab77f5633c5d40ad448c2d5/) | crackmes.de / cyrex |
| 2026-10-14 | [linux_crackme_v2](authors/crackmes-de/5ab77f5433c5d40ad448c16b/) | crackmes.de / veneta |
| 2026-10-14 | [linux_crackme_v1](authors/crackmes-de/5ab77f5433c5d40ad448c169/) | crackmes.de / veneta |
| 2026-10-14 | [qcrk_1](authors/crackmes-de/5ab77f5333c5d40ad448c0f7/) | crackmes.de / qnix |
| 2026-10-14 | [Schizo](authors/s3c_cult/6accbf32ace07d1c3fbc4b46/) | S3c_Cult |
| 2026-10-14 | [asm_is_fun by qhf](authors/crackmes-de/5ab77f5633c5d40ad448c2bf/) | crackmes.de / qhf |
| 2026-10-14 | [full_patchme by qhf](authors/crackmes-de/5ab77f5633c5d40ad448c2be/) | crackmes.de / qhf |
| 2026-10-14 | [qhfs_crackme1 by qhf](authors/crackmes-de/5ab77f5633c5d40ad448c2bd/) | crackmes.de / qhf |
| 2026-10-14 | [Mr.X47's BiLoop Cipher](authors/mr-x47/6a48e4146840520e01b22041/) | Mr.X47 |
| 2026-10-14 | [RR7's Secret key](authors/rr7/6a46f20c8a86e4c2c5525631/) | RR7 |
| 2026-10-14 | [crack_me_01 by dynsym](authors/crackmes-de/5ab77f5633c5d40ad448c2b7/) | crackmes.de / dynsym |
| 2026-10-14 | [gulcrackme_1 by gul](authors/crackmes-de/5ab77f5633c5d40ad448c2b0/) | crackmes.de / gul |
| 2026-10-14 | [cryxenet_0.01a by tfb](authors/crackmes-de/5ab77f5633c5d40ad448c2a8/) | crackmes.de / tfb |
| 2026-10-14 | [guys_first_crackme by guy_](authors/crackmes-de/5ab77f5633c5d40ad448c2a4/) | crackmes.de / Guy |
| 2026-10-14 | [andsoon_crackme1 by andsoon](authors/crackmes-de/5ab77f5633c5d40ad448c2a3/) | crackmes.de / AndSoOn |
| 2026-10-14 | [matrix_acid_crack by acid_crack](authors/crackmes-de/5ab77f5633c5d40ad448c29e/) | crackmes.de / acid_crack |
| 2026-10-14 | [a_c_c_m by acid_crack](authors/crackmes-de/5ab77f5633c5d40ad448c29d/) | crackmes.de / acid_crack |
| 2026-10-14 | [password_check by therapy](authors/crackmes-de/5ab77f5633c5d40ad448c291/) | crackmes.de / therapy |
| 2026-10-14 | [therapy039s_crackme_1 by therapy](authors/crackmes-de/5ab77f5633c5d40ad448c290/) | crackmes.de / therapy |
| 2026-10-14 | [easyone___nameserial by therapy](authors/crackmes-de/5ab77f5633c5d40ad448c28f/) | crackmes.de / therapy |
| 2026-10-14 | [crackme_1 by rammy](authors/crackmes-de/5ab77f5633c5d40ad448c28d/) | crackmes.de / rammy |
| 2026-10-14 | [keygenme_conflux1 by conflux](authors/crackmes-de/5ab77f5633c5d40ad448c28b/) | crackmes.de / conflux |
| 2026-10-14 | [keygenme_1 by chaak](authors/crackmes-de/5ab77f5633c5d40ad448c28a/) | crackmes.de / chaak |
| 2026-10-14 | [keygenme_1 by cobrasniper555](authors/crackmes-de/5ab77f5633c5d40ad448c289/) | crackmes.de / cobrasniper555 |
| 2026-10-14 | [crackme_2 by cobrasniper555](authors/crackmes-de/5ab77f5633c5d40ad448c288/) | crackmes.de / cobrasniper555 |
| 2026-10-14 | [hypercrackme3 by thehyper](authors/crackmes-de/5ab77f5633c5d40ad448c286/) | crackmes.de / thehyper |
| 2026-10-14 | [hypercrackme2 by thehyper](authors/crackmes-de/5ab77f5633c5d40ad448c285/) | crackmes.de / thehyper |
| 2026-10-13 | [zi___crakme_v2 by zionz](authors/crackmes-de/5ab77f5633c5d40ad448c279/) | crackmes.de / zionz |
| 2026-10-13 | [hypercrackme by thehyper](authors/crackmes-de/5ab77f5633c5d40ad448c27f/) | crackmes.de / thehyper |
| 2026-10-13 | [hypercrackme6 by thehyper](authors/crackmes-de/5ab77f5633c5d40ad448c281/) | crackmes.de / thehyper |
| 2026-10-13 | [zi___crakme by zionz](authors/crackmes-de/5ab77f5633c5d40ad448c278/) | crackmes.de / zionz |
| 2026-10-13 | [mishka_tribute by zart](authors/crackmes-de/5ab77f5633c5d40ad448c277/) | crackmes.de / zart |
| 2026-10-13 | [c_crackme_2 by mayhem](authors/crackmes-de/5ab77f5633c5d40ad448c274/) | crackmes.de / mayhem |
| 2026-10-13 | [mayhems_crackme_3 by mayhem](authors/crackmes-de/5ab77f5633c5d40ad448c272/) | crackmes.de / mayhem |
| 2026-10-13 | [hades by j](authors/crackmes-de/5ab77f5533c5d40ad448c26f/) | crackmes.de / j |
| 2026-10-13 | [old_keygenme_2010 by zaas](authors/crackmes-de/5ab77f5533c5d40ad448c267/) | crackmes.de / zaas |
| 2026-10-13 | [mms_crackme by haiklr](authors/crackmes-de/5ab77f5533c5d40ad448c264/) | crackmes.de / haiklr |
| 2026-10-13 | [gloops_crackme by haiklr](authors/crackmes-de/5ab77f5533c5d40ad448c263/) | crackmes.de / haiklr |
| 2026-10-13 | [hysteria_crackme by haiklr](authors/crackmes-de/5ab77f5533c5d40ad448c25e/) | crackmes.de / haiklr |
| 2026-10-13 | [baby_crackme_2 by haiklr](authors/crackmes-de/5ab77f5533c5d40ad448c261/) | crackmes.de / haiklr |
| 2026-10-13 | [baby_crackme_1 by haiklr](authors/crackmes-de/5ab77f5533c5d40ad448c262/) | crackmes.de / haiklr |
| 2026-10-13 | [impostors_crack_me_0.5 by impostor](authors/crackmes-de/5ab77f5533c5d40ad448c25d/) | crackmes.de / impostor |
| 2026-10-13 | [crackme_delphi_2.0 by defc0n1](authors/crackmes-de/5ab77f5533c5d40ad448c25c/) | crackmes.de / defc0n1 |
| 2026-10-13 | [crackme_delphi_1.0 by defc0n1](authors/crackmes-de/5ab77f5533c5d40ad448c25b/) | crackmes.de / defc0n1 |
| 2026-10-13 | [xdstylas_crackme_1 by xdstyla](authors/crackmes-de/5ab77f5533c5d40ad448c25a/) | crackmes.de / xdstyla |
| 2026-10-13 | [nev_crackme by nevyn](authors/crackmes-de/5ab77f5533c5d40ad448c258/) | crackmes.de / nevyn |
| 2026-10-13 | [fjlj_crackme_3 by fjlj](authors/crackmes-de/5ab77f5533c5d40ad448c253/) | crackmes.de / fjlj |
| 2026-10-13 | [fjlj_crackme_2 by fjlj](authors/crackmes-de/5ab77f5533c5d40ad448c252/) | crackmes.de / fjlj |
| 2026-10-13 | [crackme_3 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c24d/) | crackmes.de / fr1c |
| 2026-10-13 | [crackme_1_1 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c24c/) | crackmes.de / fr1c |
| 2026-10-13 | [stckwzrd](authors/reiika/6acdbcb9ace07d1c3fbc4bb1/) | Reiika |
| 2026-10-13 | [crackme_5 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c249/) | crackmes.de / fr1c |
| 2026-10-13 | [crackme_8 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c24a/) | crackmes.de / fr1c |
| 2026-10-13 | [crackme_6 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c24b/) | crackmes.de / fr1c |
| 2026-10-13 | [crackme_2 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c248/) | crackmes.de / fr1c |
| 2026-10-13 | [crackme_7 by fr1c](authors/crackmes-de/5ab77f5533c5d40ad448c247/) | crackmes.de / fr1c |
| 2026-10-13 | [knights_crackme1 by knight](authors/crackmes-de/5ab77f5533c5d40ad448c245/) | crackmes.de / knight |
| 2026-10-13 | [crackme_and_eatme_1 by mghty_kng](authors/crackmes-de/5ab77f5533c5d40ad448c235/) | crackmes.de / mghty_kng |
| 2026-10-13 | [renascense_crackme by skapunky](authors/crackmes-de/5ab77f5533c5d40ad448c233/) | crackmes.de / skapunky |
| 2026-10-13 | [ncn by eslimasec](authors/crackmes-de/5ab77f5533c5d40ad448c230/) | crackmes.de / eslimasec |
| 2026-10-13 | [flatlines_crackme_1 by flatline](authors/crackmes-de/5ab77f5533c5d40ad448c22f/) | crackmes.de / flatline |
| 2026-10-13 | [cyclone by double_zer0](authors/crackmes-de/5ab77f5533c5d40ad448c22e/) | crackmes.de / double_zer0 |
| 2026-10-13 | [kgm1 by kkr_we_rule](authors/crackmes-de/5ab77f5533c5d40ad448c22d/) | crackmes.de / kkr_we_rule |
| 2026-10-13 | [red_crew_kgm1_by_kkr by kkr_we_rule](authors/crackmes-de/5ab77f5533c5d40ad448c22b/) | crackmes.de / kkr_we_rule |
| 2026-10-12 | [asm_keygen_me_2 by kkr_we_rule](authors/crackmes-de/5ab77f5533c5d40ad448c223/) | crackmes.de / kkr_we_rule |
| 2026-10-12 | [asm_keygen_me_1 by kkr_we_rule](authors/crackmes-de/5ab77f5533c5d40ad448c222/) | crackmes.de / kkr_we_rule |
| 2026-10-12 | [shortcut by kkr_we_rule](authors/crackmes-de/5ab77f5533c5d40ad448c220/) | crackmes.de / kkr_we_rule |
| 2026-10-12 | [fatmikes_crackme1 by fatmike](authors/crackmes-de/5ab77f5533c5d40ad448c21f/) | crackmes.de / fatmike |
| 2026-10-12 | [crackme_nop by opcode0x90](authors/crackmes-de/5ab77f5533c5d40ad448c21b/) | crackmes.de / opcode0x90 |
| 2026-10-12 | [fatmikes_crackme_2 by fatmike](authors/crackmes-de/5ab77f5533c5d40ad448c21c/) | crackmes.de / fatmike |
| 2026-10-12 | [fatmikes_crackme1___fixed_version by fatmike](authors/crackmes-de/5ab77f5533c5d40ad448c21d/) | crackmes.de / fatmike |
| 2026-10-12 | [crackme_nop_vm by opcode0x90](authors/crackmes-de/5ab77f5533c5d40ad448c21a/) | crackmes.de / opcode0x90 |
| 2026-10-12 | [sacredcrackme_5.0 by sacredlamat](authors/crackmes-de/5ab77f5533c5d40ad448c217/) | crackmes.de / sacredlamat |
| 2026-10-12 | [a_small_crackme by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c216/) | crackmes.de / bswap |
| 2026-10-12 | [assassination by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c215/) | crackmes.de / bswap |
| 2026-10-12 | [little_man_1.45 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c213/) | crackmes.de / bswap |
| 2026-10-12 | [keygenme_0.51 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c211/) | crackmes.de / bswap |
| 2026-10-12 | [super_funky_0.82 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c210/) | crackmes.de / bswap |
| 2026-10-12 | [crackme_0.68 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c20c/) | crackmes.de / bswap |
| 2026-10-12 | [ribbere_1.4 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c205/) | crackmes.de / bswap |
| 2026-10-12 | [morgana_1.49 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c204/) | crackmes.de / bswap |
| 2026-10-12 | [keygenme_0.72 by bswap](authors/crackmes-de/5ab77f5533c5d40ad448c203/) | crackmes.de / bswap |
| 2026-10-12 | [sams_keygenme by samfisher9000](authors/crackmes-de/5ab77f5533c5d40ad448c202/) | crackmes.de / samfisher9000 |
| 2026-10-12 | [sams_crackme2 by samfisher9000](authors/crackmes-de/5ab77f5533c5d40ad448c201/) | crackmes.de / samfisher9000 |
| 2026-10-12 | [crackme_1.0_by_c0de0f by c0de0f](authors/crackmes-de/5ab77f5533c5d40ad448c200/) | crackmes.de / c0de0f |
| 2026-10-12 | [crackme_2.0_by_c0de0f by c0de0f](authors/crackmes-de/5ab77f5533c5d40ad448c1ff/) | crackmes.de / c0de0f |
| 2026-10-12 | [enforcer039s_keygenme_1__arteam_cra by enforcer](authors/crackmes-de/5ab77f5533c5d40ad448c1fd/) | crackmes.de / enforcer |
| 2026-10-12 | [drpepur_5 by drpepur](authors/crackmes-de/5ab77f5533c5d40ad448c1fc/) | crackmes.de / drpepur |
| 2026-10-12 | [keygenme_drpepur_2 by drpepur](authors/crackmes-de/5ab77f5533c5d40ad448c1fb/) | crackmes.de / drpepur |
| 2026-10-12 | [drpepur_6 by drpepur](authors/crackmes-de/5ab77f5533c5d40ad448c1fa/) | crackmes.de / drpepur |
| 2026-10-12 | [just_a_little_crackme by bratalarm](authors/crackmes-de/5ab77f5533c5d40ad448c251/) | crackmes.de / bratalarm |
| 2026-10-12 | [babylon_keygenme by haiklr](authors/crackmes-de/5ab77f5533c5d40ad448c260/) | crackmes.de / haiklr |
| 2026-10-12 | [xyz_keygenme20110405 by xiayuanzhong](authors/crackmes-de/5ab77f5533c5d40ad448c1f1/) | crackmes.de / xiayuanzhong |
| 2026-10-12 | [xyz_keygenme20110505 by xiayuanzhong](authors/crackmes-de/5ab77f5533c5d40ad448c1f0/) | crackmes.de / xiayuanzhong |
| 2026-10-12 | [crackmehardestshell20110404 by xiayuanzhong](authors/crackmes-de/5ab77f5533c5d40ad448c1ef/) | crackmes.de / xiayuanzhong |
| 2026-10-12 | [damos_crackme_1_for_win32 by damo2k](authors/crackmes-de/5ab77f5533c5d40ad448c1e8/) | crackmes.de / damo2k |
| 2026-10-12 | [damos_crackme_1_for_solaris by damo2k](authors/crackmes-de/5ab77f5533c5d40ad448c1e7/) | crackmes.de / damo2k |
| 2026-10-12 | [damos_crackme_1_for_linux by damo2k](authors/crackmes-de/5ab77f5533c5d40ad448c1e6/) | crackmes.de / damo2k |
| 2026-10-12 | [crackme_2 by thefox](authors/crackmes-de/5ab77f5533c5d40ad448c1e0/) | crackmes.de / thefox |
| 2026-10-12 | [codz_1 by codz30](authors/crackmes-de/5ab77f5533c5d40ad448c1e1/) | crackmes.de / codz30 |
| 2026-10-12 | [crackme1 by adamziaja](authors/crackmes-de/5ab77f5533c5d40ad448c1df/) | crackmes.de / adamziaja |
| 2026-10-12 | [pushpushme by synfo](authors/crackmes-de/5ab77f5533c5d40ad448c1de/) | crackmes.de / synfo |
| 2026-10-12 | [keygenning4newbies_crackme_5 by analyst](authors/crackmes-de/5ab77f5533c5d40ad448c1dd/) | crackmes.de / analyst |
| 2026-10-12 | [keygenning4newbies_crackme_3 by analyst](authors/crackmes-de/5ab77f5533c5d40ad448c1dc/) | crackmes.de / analyst |
| 2026-10-12 | [keygenning4newbies_crackme_2 by analyst](authors/crackmes-de/5ab77f5533c5d40ad448c1db/) | crackmes.de / analyst |
| 2026-10-12 | [keygenning4newbies_crackme_1 by analyst](authors/crackmes-de/5ab77f5533c5d40ad448c1da/) | crackmes.de / analyst |
| 2026-10-12 | [keygenning4newbies_crackme_7 by analyst](authors/crackmes-de/5ab77f5533c5d40ad448c1d9/) | crackmes.de / analyst |
| 2026-10-12 | [keygenning4newbies_crackme_6 by analyst](authors/crackmes-de/5ab77f5433c5d40ad448c1d8/) | crackmes.de / analyst |
| 2026-10-12 | [6_levels by typhoon](authors/crackmes-de/5ab77f5433c5d40ad448c1d7/) | crackmes.de / typhoon |
| 2026-10-12 | [rdg_simple_crackme_.net by rdgmax](authors/crackmes-de/5ab77f5433c5d40ad448c1d0/) | crackmes.de / rdgmax |
| 2026-10-12 | [c_crackme_1 by ultrasound](authors/crackmes-de/5ab77f5433c5d40ad448c1cc/) | crackmes.de / ultrasound |
| 2026-10-12 | [szi_keygenme by revme](authors/crackmes-de/5ab77f5433c5d40ad448c1c0/) | crackmes.de / revme |
| 2026-10-12 | [korbut_keygen_me_1 by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1b8/) | crackmes.de / korbut |
| 2026-10-12 | [keygenme_1 by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1b7/) | crackmes.de / korbut |
| 2026-10-12 | [keygenme_2 by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1b6/) | crackmes.de / korbut |
| 2026-10-12 | [rif_crackme_2 by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1b4/) | crackmes.de / korbut |
| 2026-10-12 | [korbut_misc._crackme_1 by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1b2/) | crackmes.de / korbut |
| 2026-10-12 | [your_first_crack by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1ae/) | crackmes.de / korbut |
| 2026-10-12 | [rif_crackme_1 by korbut](authors/crackmes-de/5ab77f5433c5d40ad448c1ad/) | crackmes.de / korbut |
| 2026-10-12 | [yowmo_keygenme1 by yowmo](authors/crackmes-de/5ab77f5433c5d40ad448c1a9/) | crackmes.de / yowmo |
| 2026-10-12 | [crack_me_or_keygen_me by dragonpxx](authors/crackmes-de/5ab77f5433c5d40ad448c1a8/) | crackmes.de / dragonpxx |
| 2026-10-12 | [crackmekeygen_breaker by brk12345](authors/crackmes-de/5ab77f5433c5d40ad448c1a6/) | crackmes.de / brk12345 |
| 2026-10-12 | [breakers_crackme_4 by brk12345](authors/crackmes-de/5ab77f5433c5d40ad448c1a5/) | crackmes.de / brk12345 |
| 2026-10-12 | [crackmekeygenme1_breaker by brk12345](authors/crackmes-de/5ab77f5433c5d40ad448c1a4/) | crackmes.de / brk12345 |
| 2026-10-11 | [crackme_9 by tcn30](authors/crackmes-de/5ab77f5433c5d40ad448c19f/) | crackmes.de / tcn30 |
| 2026-10-11 | [password_app by tcn30](authors/crackmes-de/5ab77f5433c5d40ad448c19d/) | crackmes.de / tcn30 |
| 2026-10-11 | [crackme4 by tcn30](authors/crackmes-de/5ab77f5433c5d40ad448c19c/) | crackmes.de / tcn30 |
| 2026-10-11 | [libertyordeaths_linux_keygenme_1](authors/crackmes-de/5ab77f5433c5d40ad448c196/) | crackmes.de / LibertyorDeath |
| 2026-10-11 | [libertyordeaths_asm_keygenme1](authors/crackmes-de/5ab77f5433c5d40ad448c195/) | crackmes.de / LibertyorDeath |
| 2026-10-11 | [libertyordeaths_linux_keygenme_2](authors/crackmes-de/5ab77f5433c5d40ad448c194/) | crackmes.de / LibertyorDeath |
| 2026-10-11 | [libertyordeaths_keygenme_3](authors/crackmes-de/5ab77f5433c5d40ad448c193/) | crackmes.de / LibertyorDeath |
| 2026-10-11 | [firox_crackme_1](authors/crackmes-de/5ab77f5433c5d40ad448c190/) | crackmes.de / firox |
| 2026-10-11 | [upxed by blueowl](authors/crackmes-de/5ab77f5433c5d40ad448c18c/) | crackmes.de / BlueOwl |
| 2026-10-11 | [crackme_3](authors/crackmes-de/5ab77f5433c5d40ad448c189/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_6](authors/crackmes-de/5ab77f5433c5d40ad448c188/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_9](authors/crackmes-de/5ab77f5433c5d40ad448c186/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_5](authors/crackmes-de/5ab77f5433c5d40ad448c183/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_2](authors/crackmes-de/5ab77f5433c5d40ad448c182/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_15](authors/crackmes-de/5ab77f5433c5d40ad448c17f/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_12](authors/crackmes-de/5ab77f5433c5d40ad448c17e/) | crackmes.de / FireWorx |
| 2026-10-11 | [crackme_13](authors/crackmes-de/5ab77f5433c5d40ad448c17c/) | crackmes.de / FireWorx |
| 2026-10-11 | [consoleinfinity](authors/crackmes-de/5ab77f5433c5d40ad448c176/) | crackmes.de / promix17 |
| 2026-10-11 | [TinyAsm](authors/crackmes-de/5ab77f5433c5d40ad448c170/) | crackmes.de / promix17 |
| 2026-10-11 | [crackme0x1](authors/crackmes-de/5ab77f5433c5d40ad448c16d/) | crackmes.de / pickled |
| 2026-10-11 | [nts_crackme10](authors/crackmes-de/5ab77f5433c5d40ad448c162/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme6](authors/crackmes-de/5ab77f5433c5d40ad448c161/) | crackmes.de / cyclops |
| 2026-10-11 | [spear](authors/crackmes-de/5ab77f5433c5d40ad448c15f/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme3](authors/crackmes-de/5ab77f5433c5d40ad448c15e/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme2](authors/crackmes-de/5ab77f5433c5d40ad448c15d/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme7](authors/crackmes-de/5ab77f5433c5d40ad448c15c/) | crackmes.de / cyclops |
| 2026-10-11 | [crackme2](authors/crackmes-de/5ab77f5433c5d40ad448c15b/) | crackmes.de / cyclops |
| 2026-10-11 | [Beat The Game](authors/acheylate/6aca57316349e4b2540c7018/) | acheylate |
| 2026-10-11 | [VSEC Challenger No.1](authors/vsec/6acace8cca34abba98f8305a/) | vsec |
| 2026-10-11 | [nts_crackme1](authors/crackmes-de/5ab77f5433c5d40ad448c15a/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme9](authors/crackmes-de/5ab77f5433c5d40ad448c158/) | crackmes.de / cyclops |
| 2026-10-11 | [cyclops_crackme_5.0](authors/crackmes-de/5ab77f5433c5d40ad448c157/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme8](authors/crackmes-de/5ab77f5433c5d40ad448c156/) | crackmes.de / cyclops |
| 2026-10-11 | [cyclops_crackme_4.0](authors/crackmes-de/5ab77f5433c5d40ad448c152/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme4](authors/crackmes-de/5ab77f5433c5d40ad448c14d/) | crackmes.de / cyclops |
| 2026-10-11 | [nts_crackme5](authors/crackmes-de/5ab77f5433c5d40ad448c14b/) | crackmes.de / cyclops |
| 2026-10-11 | [cyclops](authors/crackmes-de/5ab77f5433c5d40ad448c149/) | crackmes.de / cyclops |
| 2026-10-11 | [lincrkme_01](authors/crackmes-de/5ab77f5333c5d40ad448c12f/) | crackmes.de / digitalbyte |
| 2026-10-11 | [4f.crackme1](authors/crackmes-de/5ab77f5333c5d40ad448c12e/) | crackmes.de / ximus |
| 2026-10-11 | [4f.crackme_2](authors/crackmes-de/5ab77f5333c5d40ad448c12d/) | crackmes.de / ximus |
| 2026-10-11 | [sennin1](authors/crackmes-de/5ab77f5333c5d40ad448c12a/) | crackmes.de / sennin |
| 2026-10-11 | [cesd_dvl_assessment_4](authors/crackmes-de/5ab77f5333c5d40ad448c121/) | crackmes.de / zero |
| 2026-10-11 | [cesd_dvl_assessment_3](authors/crackmes-de/5ab77f5333c5d40ad448c120/) | crackmes.de / zero |
| 2026-10-10 | [cesd_dvl_assessment_5](authors/crackmes-de/5ab77f5333c5d40ad448c11f/) | crackmes.de / zero |
| 2026-10-10 | [cesd_dvl_assessment_2](authors/crackmes-de/5ab77f5333c5d40ad448c11e/) | crackmes.de / zero |
| 2026-10-10 | [cesd_dvl_assessment_1](authors/crackmes-de/5ab77f5333c5d40ad448c11c/) | crackmes.de / zero |
| 2026-10-10 | [feo_crackme_12](authors/crackmes-de/5ab77f5333c5d40ad448c11b/) | crackmes.de / shoulck |
| 2026-10-10 | [learn_the_first_few_tricks_1](authors/crackmes-de/5ab77f5333c5d40ad448c11a/) | crackmes.de / deibiz_xxl |
| 2026-10-10 | [crackme_1_easy_timers](authors/crackmes-de/5ab77f5333c5d40ad448c118/) | crackmes.de / anarchy2k3 |
| 2026-10-10 | [keygen_rivendel](authors/crackmes-de/5ab77f5333c5d40ad448c117/) | crackmes.de / tryger |
| 2026-10-10 | [crackme](authors/crackmes-de/5ab77f5333c5d40ad448c115/) | crackmes.de / honestgamer |
| 2026-10-10 | [crackme_1](authors/crackmes-de/5ab77f5333c5d40ad448c111/) | crackmes.de / rith |
| 2026-10-10 | [hidewindow](authors/crackmes-de/5ab77f5333c5d40ad448c10b/) | crackmes.de / devoney |
| 2026-10-10 | [The Goat](authors/muffin/6ac9fe51cdee6e086a173728/) | muffin |
| 2026-10-10 | [keygenme_n1](authors/crackmes-de/5ab77f5333c5d40ad448c108/) | crackmes.de / xxlxdxx |
| 2026-10-10 | [crackme_july_8th_2002_release](authors/crackmes-de/5ab77f5333c5d40ad448c106/) | crackmes.de / junkcode |
| 2026-10-10 | [keygenme_by_d0min4ted](authors/crackmes-de/5ab77f5333c5d40ad448c0fd/) | crackmes.de / d0min4ted |
| 2026-10-10 | [crackme_3](authors/crackmes-de/5ab77f5333c5d40ad448c105/) | crackmes.de / br0ken |
| 2026-10-10 | [what_is_my_password](authors/crackmes-de/5ab77f5333c5d40ad448c103/) | crackmes.de / br0ken |
| 2026-10-10 | [serialkeygen_me](authors/crackmes-de/5ab77f5333c5d40ad448c102/) | crackmes.de / br0ken |
| 2026-10-10 | [crackme_4](authors/crackmes-de/5ab77f5333c5d40ad448c101/) | crackmes.de / br0ken |
| 2026-10-10 | [CrackMe#1](authors/crackmes-de/5ab77f5333c5d40ad448c100/) | crackmes.de / br0ken |
| 2026-10-10 | [qcrk_2](authors/crackmes-de/5ab77f5333c5d40ad448c0f5/) | crackmes.de / qnix |
| 2026-10-10 | [qcrk5](authors/crackmes-de/5ab77f5333c5d40ad448c0f4/) | crackmes.de / qnix |
| 2026-10-10 | [qcrk_3](authors/crackmes-de/5ab77f5333c5d40ad448c0f3/) | crackmes.de / qnix |
| 2026-10-10 | [salazans_keygenme_0001](authors/crackmes-de/5ab77f5333c5d40ad448c0e3/) | crackmes.de / salazan |
| 2026-10-10 | [salazans_keygenme_0003](authors/crackmes-de/5ab77f5333c5d40ad448c0e2/) | crackmes.de / salazan |
| 2026-10-10 | [light_keygenme](authors/crackmes-de/5ab77f5333c5d40ad448c0e1/) | crackmes.de / salazan |
| 2026-10-10 | [crackme2](authors/crackmes-de/5ab77f5333c5d40ad448c0df/) | crackmes.de / midi |
| 2026-10-10 | [dailycracking_by_flipflop](authors/crackmes-de/5ab77f5333c5d40ad448c0e0/) | crackmes.de / flipflop |
| 2026-10-10 | [skcrackme_1](authors/crackmes-de/5ab77f5333c5d40ad448c0d9/) | crackmes.de / sknine9 |
| 2026-10-10 | [k1](authors/crackmes-de/5ab77f5333c5d40ad448c0d8/) | crackmes.de / xtfusion |
| 2026-10-10 | [keygenme_2_by_nicohogtag](authors/crackmes-de/5ab77f5333c5d40ad448c0d5/) | crackmes.de / nicohogtag |
| 2026-10-10 | [matrice](authors/s4r/5aa9b47f33c5d40a63746b1f/) | s4r |
| 2026-10-10 | [prime](authors/s4r/5aa9b4a633c5d40a63746b20/) | s4r |
| 2026-10-09 | [Type Punning](authors/mas/69926c19f752dd83da8782b0/) | MAS |
| 2026-10-09 | [YugnatD's WarGames](authors/yugnatd/5f78ae7533c5d4357b3b03b8/) | YugnatD |
| 2026-10-08 | [SVz's Orrery 2](authors/svz/6ac2301aca34abba98f82e95/) | SVz |
| 2026-10-08 | [nightmare CrackMe](authors/nimanikjoo/6ac6ee38ace07d1c3fbc499e/) | NimaNikjoo |
| 2026-10-08 | [My Second Crackme (Easy + Flag)](authors/trynatobe6for6def/6ac75bcfca34abba98f82f87/) | TrynaToBe6for6Def |
| 2026-10-08 | [binsafe](authors/radoncoding/6ac3c6176349e4b2540c6ea2/) | RadonCoding |
| 2026-10-08 | [Password Check With State Machine](authors/acheylate/6ac400c80885f990699dc134/) | acheylate |
| 2026-10-07 | [BabyDotNet](authors/orbitz/6ac44fe1cdee6e086a1735ef/) | ORBITZ |
| 2026-10-07 | [My First Crackme (Very Easy)](authors/trynatobe6for6def/6ac65258cdee6e086a17364d/) | TrynaToBe6for6Def |
| 2026-10-03 | [crackme2](authors/crackmes-de/5ab77f5333c5d40ad448c114/) | crackmes.de / immortal_one |
| 2026-10-03 | [recoded_keygenme_1](authors/crackmes-de/5ab77f5333c5d40ad448c10c/) | crackmes.de / recoded |
| 2026-10-03 | [ImGUI-CrackME](authors/pwned.cpp/66685b79e7b35c09bb266b96/) | Pwned.cpp |
| 2026-10-03 | [Date of Birth](authors/jeffli6789/5f4efbb133c5d4357b3b00a0/) | jeffli6789 |
| 2026-10-03 | [Product Activation](authors/vmlinuz719/670fd1469b533b4c22bd1537/) | vmlinuz719 |
| 2026-10-03 | [thefirsttest](authors/joejoejoe/6abc48c1ace07d1c3fbc4816/) | JoeJoeJoe |
| 2026-10-03 | [Mini LLM Sentinel](authors/kamil123/6abd98190885f990699dc084/) | kamil123 |
| 2026-10-03 | [SP network cipher](authors/nake/6abd4b07cdee6e086a173522/) | nake |
| 2026-10-03 | [Loggin](authors/rodrigoteixeira/6abfc1a30885f990699dc0c2/) | RodrigoTeixeira |
| 2026-09-30 | [Key](authors/confining0367/6abb16d30885f990699dc03a/) | confining0367 |
| 2026-09-30 | [Automata Simulation](authors/va7d1n3/6abbc4dd0885f990699dc050/) | Va7D1n3 |
| 2026-09-30 | [custom protector](authors/kaban/6abcdab66349e4b2540c6df4/) | KAban |
| 2026-09-28 | [QR Scanner](authors/towel/5ec1b82133c5d449d91ae539/) | Towel |
| 2026-09-28 | [hard_software](authors/ttlhacker/5cf2866533c5d41c6d56dfed/) | ttlhacker |
| 2026-09-28 | [bitflip](authors/s4r/5c5d89ce33c5d43fd9a9387f/) | s4r |
| 2026-09-28 | [fuckalight2](authors/s4r/5b58ebc433c5d46b771434a7/) | s4r |
| 2026-09-28 | [Mars Analytica](authors/towel/5b06f97533c5d406c0abccf0/) | Towel |
| 2026-09-28 | [encrypt (rascal999)](authors/crackmes-de/5ab77f6033c5d40ad448c8b3/) | crackmes.de / rascal999 |
| 2026-09-28 | [collide](authors/crackmes-de/5ab77f5833c5d40ad448c399/) | crackmes.de / crp |
| 2026-09-27 | [ada_crackme_1](authors/crackmes-de/5ab77f5733c5d40ad448c38f/) | crackmes.de / darkphoenix_ |
| 2026-09-27 | [timemachine](authors/crackmes-de/5ab77f5333c5d40ad448c0f6/) | crackmes.de / qnix |
| 2026-09-27 | [5's Quintessence](authors/5/6ab04161cab6678aefe9de58/) | 5 |
| 2026-09-27 | [Bobs gambling](authors/prestdayzero/69b9accff2d49d8512f64a8f/) | prestdayzero |
| 2026-09-27 | [study get PASSWORD](authors/whyyourapedme/6ab6d7680f207ab92d0ae018/) | whyyourapedme |
| 2026-09-25 | [Lantern01](authors/lypd0/6ab0eeeb48cda5a2aaa3de9c/) | lypd0 |
| 2026-09-25 | [Orbit Fold](authors/jeffli6789/6ab1e2bf5c861323b6300702/) | jeffli6789 |
| 2026-09-25 | [trust me this is really easy :)](authors/vetementsvmnts/6ab2c094c2d73ca6ae44d7f6/) | vetementsvmnts |
| 2026-09-25 | [Wheredakey](authors/glitch_baby/6ab4ce5195b976f8f1300b54/) | Glitch_Baby |
| 2026-09-20 | [a bit of a challenge](authors/vetementsvmnts/6aaad62d48cda5a2aaa3de08/) | vetementsvmnts |
| 2026-09-20 | [zW0rM](authors/mas/6aa8483c48cda5a2aaa3ddc1/) | MAS |
| 2026-09-20 | [Find the password Windows ver](authors/acheylate/6aac22ff48cda5a2aaa3de2d/) | acheylate |
| 2026-09-20 | [sygil.fun](authors/keep/6aa9e8b1dbb3353b7539688c/) | Keep |
| 2026-09-20 | [sygil (gui)](authors/keep/6aaa8922585e8875bcbebfde/) | Keep |
| 2026-09-20 | [Find the password](authors/acheylate/6aac1a0c585e8875bcbec009/) | acheylate |
| 2026-09-20 | [KeygenMe](authors/vetementsvmnts/6aa94afadbb3353b7539687a/) | vetementsvmnts |
| 2026-09-20 | [Tricky challenge or is it ?](authors/vetementsvmnts/6aac1a61dbb3353b753968c0/) | vetementsvmnts |
| 2026-09-20 | [My First crackme](authors/vetementsvmnts/6aa8ec52cab6678aefe9dda5/) | vetementsvmnts |
| 2026-09-20 | [Tropical](authors/memetic0/6aadc96d585e8875bcbec043/) | memetic0 |
| 2026-09-20 | [Secret Menu](authors/fon37/6aadf84e48cda5a2aaa3de61/) | fon37 |
| 2026-09-20 | [Simple Frog](authors/victormeloasm/6aae098bcab6678aefe9de31/) | victormeloasm |
| 2026-09-20 | [Leotrungkien's Fugs](authors/leotrungkien/6aaebbc1585e8875bcbec053/) | Leotrungkien |
| 2026-09-12 | [obscurio - 1](authors/ray33ee/6a88726c3b246e477b6c094d/) | ray33ee |
| 2026-09-12 | [HydraVault](authors/hydra14212/6a898e1a48cda5a2aaa3dad3/) | Hydra14212 |
| 2026-09-12 | [Oops! All sarr](authors/bang1338/6a9e9ac9cab6678aefe9dcfe/) | bang1338 |
| 2026-09-12 | [Tenzo Crack ME Beta](authors/tenzo_aoki/6aa09754dbb3353b753967e4/) | tenzo_aoki |
| 2026-09-06 | [obscurio - 3](authors/ray33ee/6a9ae805cab6678aefe9dcb2/) | ray33ee |
| 2026-09-06 | [Death Trap](authors/soulreaper/6a7d0ce1184836c0dbe7d77e/) | soulreaper |
| 2026-09-06 | [hell](authors/teknikclel69/67630a1d60fa67152406bbde/) | Teknikclel69 |
| 2026-09-06 | [Lord Winderton](authors/tempesta/67a71e75e36dd9b0e79b2a00/) | Tempesta |
| 2026-09-06 | [PatchPad](authors/crudd/6835bf1b6297cca3ff7d7d25/) | crudd |
| 2026-09-06 | [EscapeFromMatrix](authors/sallos/6883d23c8fac2855fe6fb09e/) | Sallos |
| 2026-09-06 | [Sallos's Key License](authors/sallos/68aac9df8fac2855fe6fb849/) | sallos |
| 2026-09-06 | [Assembler Crackme](authors/fentcat/68fce1922d267f28f69b783a/) | fentcat |
| 2026-09-06 | [Secret message from a traveller](authors/2bitsin/650c14b528b5870bef26308d/) | 2bitsin |
| 2026-09-06 | [cropta_1](authors/crackmes-de/5ab77f5f33c5d40ad448c7e1/) | crackmes.de / cropta |
| 2026-09-06 | [crackme_1_by_huskyhusky](authors/crackmes-de/5ab77f5633c5d40ad448c27b/) | crackmes.de / huskyhusky |
| 2026-09-06 | [hell86](authors/ttlhacker/5bc0fe0033c5d4110a29b296/) | ttlhacker |
| 2026-09-06 | [jittery](authors/ttlhacker/5c44f1bb33c5d475210bc634/) | ttlhacker |
| 2026-09-06 | [crackme.03.32](authors/crackmes-de/5ab77f6533c5d40ad448cbc0/) | crackmes.de / geyslan |
| 2026-09-06 | [crackme-not](authors/weissi1994/5c53840a33c5d475210bc6e9/) | weissi1994 |
| 2026-09-06 | [Small Keygenme](authors/binarynewbie/5e83f7f433c5d4439bb2e059/) | BinaryNewbie |
| 2026-09-06 | [nasm crack](authors/bitfriends/5ea48a1433c5d47611746436/) | BitFriends |
| 2026-09-06 | [virtual.1 (Linux)](authors/bagolymadar/5f3a64df33c5d42a7c667d45/) | bagolymadar |
| 2026-09-06 | [x86](authors/jeffli6789/5f01df5633c5d4285070948b/) | jeffli6789 |
| 2026-09-06 | [Maze](authors/jeffli6789/5f009fa233c5d42850709479/) | jeffli6789 |
| 2026-09-06 | [fl04t](authors/x3ero0/6079170e33c5d45ca94895fa/) | X3eRo0 |
| 2026-09-06 | [0verney](authors/s01den/6049f27f33c5d42c3d016dea/) | S01den |
| 2026-09-06 | [Personal Safe](authors/lubimpiskoty/5fa94bb233c5d424269a17b7/) | LubimPiskoty |
| 2026-09-06 | [Eat Sleep Trace Repeat](authors/x3ero0/61efb6a633c5d413767ca678/) | X3eRo0 |
| 2026-09-06 | [x64_crackme_keygen](authors/dev0/61c8b23a33c5d413767ca0de/) | dev0 |
| 2026-09-06 | [The Matrix](authors/thephilosopher/617ec2cb33c5d4329c345422/) | ThePhilosopher |
| 2026-09-06 | [perwira](authors/ximxn/64eb62e2d931496abf9092e7/) | Ximxn |
| 2026-09-06 | [Password and Username guess](authors/breadleaf/647eeb9b33c5d439389136a8/) | breadleaf |
| 2026-09-06 | [Bruteverse](authors/thephilosopher/634bdec633c5d4425e2cd8ee/) | ThePhilosopher |
| 2026-09-06 | [encrypted_box](authors/s4r/64f1f7dbd931496abf90952d/) | s4r |
| 2026-09-06 | [linux_asm_jenya](authors/jenya/655b43750f4238b24302bc42/) | Jenya |
| 2026-09-06 | [crackme1](authors/0x6f6d6172h/6516c8018b6aa566ae723220/) | 0x6f6D6172h |
| 2026-09-06 | [math_crackme](authors/jenya/659ffe1beef082e477ff59d0/) | Jenya |
| 2026-09-06 | [SSE Login](authors/5iriu5/65a81968eef082e477ff5d10/) | 5iriu5 |
| 2026-09-06 | [branchless-fixed](authors/toasterbirb/68c1f30a224c0ec5dcedbeda/) | toasterbirb |
| 2026-09-06 | [jump](authors/toasterbirb/6869287daadb6eeafb398fec/) | toasterbirb |
| 2026-09-06 | [branchless](authors/toasterbirb/68692748aadb6eeafb398fe3/) | toasterbirb |
| 2026-09-06 | [branchless branching](authors/toasterbirb/68692679aadb6eeafb398fdf/) | toasterbirb |
| 2026-09-06 | [off_by_one](authors/toasterbirb/68692100aadb6eeafb398fd3/) | toasterbirb |
| 2026-09-06 | [flags](authors/toasterbirb/686918c6aadb6eeafb398fbd/) | toasterbirb |
| 2026-09-06 | [TermBreaker](authors/shadowlegion/6a9950e9cab6678aefe9dc90/) | ShadowLegion |
| 2026-09-03 | [stigger](authors/crackmes-de/5ab77f6133c5d40ad448c8f5/) | crackmes.de / stigger |
| 2026-09-03 | [protreebrains_crackme_1](authors/crackmes-de/5ab77f6133c5d40ad448c915/) | crackmes.de / protreebrain |
| 2026-09-03 | [nonzenzes_keygenme1](authors/crackmes-de/5ab77f6133c5d40ad448c933/) | crackmes.de / nonzenze |
| 2026-09-03 | [patchme_1](authors/crackmes-de/5ab77f6133c5d40ad448c93f/) | crackmes.de / oxygen |
| 2026-09-03 | [leevions_first_crackme_with_assemby](authors/crackmes-de/5ab77f6233c5d40ad448c963/) | crackmes.de / leevion |
| 2026-09-03 | [mars1](authors/crackmes-de/5ab77f6233c5d40ad448c967/) | crackmes.de / mars |
| 2026-09-03 | [connrs_crackme](authors/crackmes-de/5ab77f6233c5d40ad448c9aa/) | crackmes.de / connr |
| 2026-09-03 | [crackme_3_by_sharpe](authors/crackmes-de/5ab77f6233c5d40ad448c9e1/) | crackmes.de / sharpe |
| 2026-09-03 | [injectme_2](authors/crackmes-de/5ab77f6233c5d40ad448c9ee/) | crackmes.de / xylitol |
| 2026-09-03 | [injectme_1](authors/crackmes-de/5ab77f6233c5d40ad448c9ed/) | crackmes.de / xylitol |
| 2026-09-03 | [crackme_1_by_sharpe](authors/crackmes-de/5ab77f6233c5d40ad448c9df/) | crackmes.de / sharpe |
| 2026-09-03 | [vazonezs_keygenme_1](authors/crackmes-de/5ab77f6333c5d40ad448c9ff/) | crackmes.de / vazonez |
| 2026-09-03 | [smple_unpackme_v0.1](authors/crackmes-de/5ab77f6333c5d40ad448ca2e/) | crackmes.de / simple_re |
| 2026-09-03 | [databus_keygenme1](authors/crackmes-de/5ab77f6333c5d40ad448ca70/) | crackmes.de / databus |
| 2026-09-03 | [fishing_with_dila_v0.5](authors/crackmes-de/5ab77f6433c5d40ad448cab4/) | crackmes.de / dila |
| 2026-09-03 | [fishing_with_dila_v0.4](authors/crackmes-de/5ab77f6433c5d40ad448cab3/) | crackmes.de / dila |
| 2026-09-03 | [fishing_with_dila_v0.3](authors/crackmes-de/5ab77f6433c5d40ad448cab1/) | crackmes.de / dila |
| 2026-09-03 | [fishing_with_dila_v0.2](authors/crackmes-de/5ab77f6433c5d40ad448cab2/) | crackmes.de / dila |
| 2026-09-03 | [fishing_with_dila_v0.1](authors/crackmes-de/5ab77f6433c5d40ad448cab0/) | crackmes.de / dila |
| 2026-09-02 | [4n006135_forn00bies](authors/crackmes-de/5ab77f6433c5d40ad448cad0/) | crackmes.de / borismilner |
| 2026-09-02 | [4n006135_level_4](authors/crackmes-de/5ab77f6433c5d40ad448cad1/) | crackmes.de / borismilner |
| 2026-09-02 | [crack_me](authors/crackmes-de/5ab77f6433c5d40ad448cb0f/) | crackmes.de / hexic |
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
