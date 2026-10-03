# Mini LLM Sentinel (Crackme #3)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abd98190885f990699dc084) · id `6abd98190885f990699dc084`

PE64 **C++** MinGW-w64 (GCC 16.2, lié statique). Diff. site **6.0**.  
Un mini LLM embarqué joue le **sentinel** anti-analyse. Le mot de passe est un **classifieur MLP** à côté — patcher le sentinel est autorisé, il faut quand même un password valide.

| Fichier | Rôle |
|---|---|
| [`original/crackme03.exe`](original/crackme03.exe) | binaire d’origine (ne pas patcher) |
| [`analysis/crackme03.patched.exe`](analysis/crackme03.patched.exe) | copie, sentinel NOP |
| [`tools/mini-llm-sentinel-patch.py`](tools/mini-llm-sentinel-patch.py) | lit `original/crackme03.exe` → écrit la copie patchée |
| [`tools/mini-llm-sentinel-solve.py`](tools/mini-llm-sentinel-solve.py) | keygen / `--check` |

## Réponse

Format **16 caractères** : `AI-` + 12 chars + `!`.

| | |
|---|---|
| **User d’exemple** | `petik` |
| **Password** | `AI-petik0005999!` |
| OK | `[+] ACCESS GRANTED - you beat the LLM sentinel. Well done!` |
| KO | `[-] Wrong password.` (5 essais) |

Équivalent (même checksum / même score) : `AI-petik9995000!`.

```bash
python tools/mini-llm-sentinel-solve.py -q --user petik
# AI-petik0005999!
python tools/mini-llm-sentinel-solve.py --user petik --check
```

Le LLM **ne génère pas** le password. Il vote « environnement hostile » (x64dbg, timing, titres de fenêtres, PEB, INT3, …) et appelle `ExitProcess(3)`.

---

## 1. Premier regard

```text
crackme03.exe: PE32+ console x86-64, MinGW-w64, statique
sha256  bd758259be76d9fa3eddde7ae4cd56f417d076fc84496090e3dfe701fd68aaef
md5     c359a6b2bdd5da89121e2746ca56bf8e
size    478720
```

Strings utiles :

```text
[llm:%s] ctx:
[llm] generated:
CRACKME_AI_VERBOSE
CRACKME_LLM_SELFTEST
[%d/5] Enter password:
[+] ACCESS GRANTED - you beat the LLM sentinel. Well done!
[AI] sentinel verdict: HOSTILE ENVIRONMENT detected!
```

`CRACKME_LLM_SELFTEST` : 26 golden cases du modèle (inférence), pas le password.  
`CRACKME_AI_VERBOSE` : dump capteurs + strings XOR.

---

## 2. Flow (`sub_14001C180`)

1. `getenv("CRACKME_LLM_SELFTEST")` non `"0"` → init poids + selftest, exit.
2. Banner, `InitializeCriticalSection`, init LLM (`sub_140003000` / `sub_1400033F0`), capteurs (`sub_140002B20`).
3. Premier vote sentinel `sub_140001490` ; si hostile → `sub_140002E50` (`ExitProcess(3)`).
4. Thread `StartAddress` (`0x140001B00`) : toutes les ~1,2 s, re-vote + shutdown.
5. Boucle 5× : `fgets` → trim CR/LF → re-vote sentinel → **`sub_140004360` + `sub_140004B30`**.
6. Si `result[0] != 0` → ACCESS GRANTED.

Le check mot de passe est `sub_140004360` (classifieur). `sub_140004B30` ne fait que du log (format strings XOR) si verbose.

---

## 3. Comment on trouve le prédicat

### 3.1 Ancrage IDA (MCP `ida`)

Image base `0x140000000`.

| Symbole | VA |
|---|---|
| `main` | `0x14001C180` |
| LLM infer / sentinel | `0x140001490` |
| shutdown hostile | `0x140002E50` |
| thread sentinel | `0x140001B00` |
| **check password** | `0x140004360` |
| dummy `(i*(i+1))&1` | `0x140004340` |
| tanh | `0x14000D8D0` |
| exp | `0x14000E130` |

### 3.2 Forme du password

Décryptage préfixe (clé BSS `byte_140110CA0` = 0 après init) :

```text
C713 XOR (0x97, 0xD8, 0x19) → 'A' 'I' '-'
suffixe (0-105)^0xB6        → '!'
```

Tous les commentaires spoiler du site collent : `AI-…………!` de longueur 16.

### 3.3 Table de classes (256 octets)

À `unk_14006C540`, reconstruite en SIMD :

```text
clas[i] = ((i * 51 + 0x5B) & 0xFF) ^ tab[i]
```

Sur l’ASCII imprimable :

| bit | classe |
|---|---|
| 0 | `0-9` |
| 1 | `A-Z` |
| 2 | `a-z` |
| 3 | tout imprimable `0x20–0x7E` (AND sur **tous** les chars) |

### 3.4 Features (6 floats)

Pour `pw` de longueur `n`, somme `S = Σ pw[i]` :

| idx brut | feature |
|---|---|
| 0 | 1 si préfixe `AI-` **et** suffixe `!` **et** bit3 partout |
| 1 | `clamp(1 - | (S&0xFF) - 101 | * 0.015625, 0)` |
| 2 | 1 si (nombre de chiffres) > 3 |
| 3 | `nb_uniques * 0.0625` |
| 4 | `(nb A-Z) * 0.0625` |
| 5 | `(nb a-z) * 0.0625` |

Permutation Fisher-Yates **cassée** (seed `0xB07EC09E`, indices 0..5, **pas** de swap sur l’index 5) → `perm = [1, 2, 0, 4, 3, 5]`.

### 3.5 MLP 6 → 8 (tanh) → 1 (sigmoid)

Poids : 65 floats XOR xorshift32 seed `0xEB78774D` sur `unk_14006C720` (260 octets).

```text
h_i = tanh(b_h[i] + W_h[i] · feat)     # 8 neurones
z   = b_o + W_o · h
p   = 1 / (1 + exp(-z))
OK  ⇔  n == 16  et  p ≥ 0.5
```

Pour coller le score max sur le checksum : `Σ bytes ≡ 101 (mod 256)`.  
`AI-` + `!` = 216, donc les 12 chars du milieu somment à `141 (mod 256)`.

`petik` au début du payload + padding digits :

```text
AI-petik0005999!     # solveur
AI-petik9995000!     # même Σ, même classe
```

Les serials publiés en spoiler (`AI-60h08e4ne8z9!`, `AI-11111111111r!`, …) passent tous le MLP (`p ≈ 0.94–0.96`).

### 3.6 Sentinel (à part)

Capteurs (format log) : `bd` (BeingDebugged), `ngf`, heap, DR, INT3 dans quelques stubs, titre de fenêtre, timing TSC, sys/self/text/sysc.  
Le thread re-scanne ; verdict hostile → `ExitProcess(3)`.

Bypass (autorisé) : copie [`analysis/crackme03.patched.exe`](analysis/crackme03.patched.exe) (l’original reste intact).

```bash
python tools/mini-llm-sentinel-patch.py
# lit original/crackme03.exe → analysis/crackme03.patched.exe
```

```text
llm infer  RVA 0x1490  file+0x890  →  xor eax, eax ; ret     (31 C0 C3)
hostile    RVA 0x2E50  file+0x2250 →  ret                    (C3)
```

Preuve live (x64dbg / IDA ouverts, le sentinel tuerait l’original) :

```text
analysis\crackme03.patched.exe
[1/5] Enter password: AI-petik9995000!
[guard-ai] verdict: ACCEPT (confidence 0.97)
[+] ACCESS GRANTED - you beat the LLM sentinel. Well done!
exit 0
```

Sous x64dbg, mêmes octets en mémoire (module `crackme03` @ `0x7FF753DE0000` sur cette session). Un INT3 logiciel **dans** `.text` du crackme peut aussi faire basculer le capteur INT3 — d’où le patch plutôt qu’un BP sur `main`.

---

## 4. Prédicat consolidé

```text
pw[0:3] == "AI-"
pw[-1]  == "!"
len(pw) == 16
tous les octets ont clas[c] & 8
softmax-like : sigmoid(MLP_6_8_1(features(pw))) >= 0.5
```

Le keygen place `user` dans les 12 chars du milieu, complète avec des digits, ajuste pour `Σ ≡ 101 (mod 256)` et ≥ 4 chiffres.

---

## 5. Debug x64dbg

Processus déjà chargé (PE64 → x64dbg). System breakpoint ntdll, image `crackme03.exe`.

1. `GetDebugState` / `ListModules` : base `0x7FF753DE0000`.
2. Patch RVA `0x1490` / `0x2E50` (ci-dessus) — le thread sentinel continue de tourner mais vote 0.
3. Run jusqu’au prompt `[1/5] Enter password:`.
4. Entrer `AI-petik0005999!`.

Sans patch, x64dbg ouvert → souvent `HOSTILE ENVIRONMENT` (titre + PEB) avant le check.

---

## 6. Vérification

```bash
python tools/mini-llm-sentinel-solve.py --user petik --check
# check ok  golden=3  petik->AI-petik0005999!  sig=0.9594

# preuve native (sentinel patché) :
#   analysis\crackme03.patched.exe  +  AI-petik9995000!
#   → ACCESS GRANTED, confidence 0.97, exit 0

python tools/mini-llm-sentinel-solve.py --score "AI-petik9995000!"
# ok=True sig=0.9594 sum8=101 c0=7

python tools/mini-llm-sentinel-solve.py --score "AI-111111111111!"
# ok=False  (checksum 36, trop loin de 101 → sigmoid ~0)
```

KO utiles : longueur ≠ 16 ; pas de `AI-`/`!` ; checksum loin de 101 (`AI-xxxxxxxxxxxx!`).

---

## 7. Notes

- Ce n’est **pas** un appel réseau / API LLM. Poids XOR dans `.rdata` (~78k dwords aussi pour le vrai réseau sentinel).
- Hex-Rays se trompe souvent sur la boucle d’init (decode puis « zero » de la même plage) et sur `v43++` dans le check — le listing Intel de `0x140004690` est la source.
- `sub_140004340` est un dummy `n(n+1)&1` (toujours 0) laissé par le compilateur.
- User `petik` rentre dans les 12 chars ; un nick > 12 ou sans place pour 4 digits casse le keygen (message FR).
