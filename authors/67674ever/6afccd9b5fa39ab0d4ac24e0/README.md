# 67674ever's My lib obfusction

| | |
|---|---|
| **ID** | [`6afccd9b5fa39ab0d4ac24e0`](https://crackmes.one/crackme/6afccd9b5fa39ab0d4ac24e0) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | 67674ever |
| **Plateforme** | Windows PE64 console, C++ (MSVC 2026), lib « obfuscpp » |
| **SHA-256 (zip)** | `e53ea034987e688c35a3b178bdd7dff04238c0475905d67e5d9dbef34cdaf5b3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mdp `crackmes.one`), contient `DemoMyLib.exe` — non modifié |
| `analysis/extracted/DemoMyLib.exe` | exe extrait du zip (pour objdump / Wine) |
| `tools/mylib-obfuscation-solve.py` | solveur (déchiffrement du blob en Python pur) + `--check` live |

## Réponse

Pas de username : la licence est **constante** et se passe en argument.

```text
DemoMyLib.exe 67_67-67-xd_Confuse
[+] License OK. Welcome!
```

```bash
python3 -I tools/mylib-obfuscation-solve.py        # licence + hash
python3 -I tools/mylib-obfuscation-solve.py -q     # licence seule
python3 -I tools/mylib-obfuscation-solve.py --check
```

## Premier regard

- Le « download » est un ZIP : `unzip -P crackmes.one original/download.bin -d analysis/extracted`.
- `diec` : PE64, MSVC, CRT dynamique. Imports KERNEL32 parlants : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `CreateToolhelp32Snapshot`/`Process32*W`, `GetThreadContext`, `QueryPerformanceCounter`.
- `strings` ne donne aucun message : tout est chiffré (RTTI utile : `obfuscpp::ProxyChain::make_default`, 4 lambdas).
- Lancé sous Wine : `[!] Analysis detected.` (voir faux positif plus bas).
- Pas d'IDA/gdb disponibles sur cette machine : reverse en `objdump -d -M intel` + émulation Unicorn du déchiffreur pour valider ma réimplémentation Python.

## Flow

`entry 0x1400098d0` → CRT → `main` **0x140001280** :

1. `0x140005980` (anti-analyse) appelé deux fois ; si vrai → boucle de 2 000 000 itérations leurre puis message chiffré « Analysis detected », `return 2`.
2. Si `argc < 2` → affiche le prompt (chaîne chiffrée) ; sinon `argv[1]`.
3. Hash de l'entrée `H(s)` (0x1400011d0) :
   `h = FNV1a-64(s)` puis finaliseur murmur (`h^=h>>33; h*=0xff51afd7ed558ccd; h^=h>>33; h*=0xc4ceb9fe1a85ec53; h^=h>>33`).
4. Deux tests combinés en booléen « sans branche » (opaque predicates `or/and/sub/not`) :
   - `ProxyChain(H(s)) == mix(H(blob1))` ;
   - `H(s) == H(licence)` où `licence` = chaîne **déchiffrée à l'exécution** depuis un blob (0x140001af2–0x140001b42, via `0x1400039d0`).
5. OK → `[+] License OK. Welcome!` + `key hash` / `mixed` ; sinon `[-] Invalid license key.`

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/extracted/DemoMyLib.exe`, `main` repéré par l'appel depuis le CRT (`0x14000985a → 0x140001280`).

**Lecture** : la ligne qui compte est le second `call 0x1400011d0` (0x140001aea) : le hash de l'entrée est comparé (0x140001bb3…c10) au hash d'une chaîne issue de `0x1400039d0(blob, &str)` (0x140001b42). Donc l'entrée valide = cette chaîne déchiffrée (le hash 64 bits n'est jamais à inverser).

**Blob** (0x20 octets, empilé en immédiates LE) :

```text
7c 05 d5 16 31 ae 94 07 b5 90 50 84 0c b0 92 9f 81 08 f1 1f   ← 20 octets chiffrés
90 9b cc f8 24 9d 74 e8                                       ← seed u64 @+0x18 = 0xe8749d24f8cc9b90
```

**Déchiffreur 0x1400039d0** (19 octets de sortie), reconstruit depuis l'asm :

```python
k8[j]  = sm64(seed + (j+1)*0x9e3779b97f4a7c15) & 0xff        # j=0..7, splitmix64 finalizer
t[i]   = ror8(((seed >> (7*i % 64)) & 0x3f) ^ ct[i], 7)      # i=0..18  (ror 7 == rol 1)
out[i] = ((seed >> 8*(i%8)) & 0xff) ^ k8[i%8] ^ t[i] ^ (31*i & 0xff)
```

(`0x9e3779b97f4a7c15`, `0x3c6ef372fe94f82a`, … sont les multiples successifs du nombre d'or, visibles en `movabs` ; `imul r8d,ecx,0x1f` donne le `31*i`.)
Résultat : `67_67-67-xd_Confuse`. Contrôle : `FNV+mix` de cette chaîne = `0xAB59E8046FDF64D3`, exactement le « key hash » affiché par le binaire.

**Pièges** : (1) le ZIP « .bin » ; (2) les 2 M d'itérations et les prédicats opaques sont du bruit ; (3) l'anti-analyse bloque l'exécution sous Wine (ci-dessous) ; (4) la seconde comparaison (via ProxyChain) est redondante pour trouver la clé.

## Anti-analyse et faux positif Wine

`0x140005980` cumule : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `PEB.BeingDebugged`, `NtGlobalFlag & 0x70`, scan `0xCC` sur des API, `GetThreadContext` (DR0-3), `NtQueryInformationProcess` (0x7/0x1e/0x1f), scan de processus (Toolhelp), timing (QPC), et
`test [PEB.ProcessHeap+0x70], 0x40000062` @ **0x140005b3c** (flags du heap).
Sous Wine, c'est ce dernier qui se déclenche (j'ai neutralisé les contrôles un par un sur des copies : seul ce masque suffit à faire passer). L'original lancé tel quel sous Wine affiche donc toujours `Analysis detected` ; sur Windows natif sans debugger il ne devrait pas.

## Vérification

`--check` du solveur (sortie réelle) :

```text
== original non modifie sous Wine :
[!] Analysis detected.
== copie (anti-debug heap neutralise), bonne cle :
[+] License OK. Welcome!
  key hash: 0xAB59E8046FDF64D3
  mixed: 0x17DB86E3F3B36A8C
== copie, mauvaise cle :
[-] Invalid license key.
```

⚠️ Honnêteté : la preuve live est faite sur une **copie en /tmp** (4 octets du masque `0x40000062` mis à 0 en mémoire du script, jamais écrit dans `original/`), car l'original est bloqué par l'anti-analyse sous Wine. Le prédicat (hash de la clé = hash affiché) est cohérent avec l'analyse statique ; pas testé sur Windows natif. Pas de session GDB/x64dbg (outils absents/inactifs).

## Notes

- Aucun username : exemple `petik` non applicable.
- Le `key hash` affiché (`0xAB59…64D3`) = `H(licence)` ; `mixed` = sortie de la ProxyChain.
