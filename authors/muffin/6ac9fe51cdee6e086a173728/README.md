# muffin's The Goat

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac9fe51cdee6e086a173728) · id `6ac9fe51cdee6e086a173728`

PE64 console **Nim** (MSVC CRT, `syncio.nim`). Diff. site **3.0**, qualité **4.0**. Labels : anti-debug, string encrypt, self-mod, crypto, CFF, anti-disasm, anti-tamper, custom obf.  
Famille : [`../README.md`](../README.md).

Ce n’est **pas** un keygen name→serial : une seule réponse artiste, normalisée, hashée FNV-1a 64, puis un flag ChaCha20.

| Fichier | Rôle |
|---|---|
| [`original/crackme.exe`](original/crackme.exe) | binaire d’origine (non patché) |
| [`tools/the-goat-solve.py`](tools/the-goat-solve.py) | FNV inverse + HMAC + ChaCha20 / `-q` / `--check` |
| [`analysis/goatcod.dec.bin`](analysis/goatcod.dec.bin) | `.goatcod` déchiffré (SplitMix64) |
| [`analysis/run-live.txt`](analysis/run-live.txt) | run natif sous Hyper-V (anti-VM, exit 1) |

## Réponse

| | |
|---|---|
| **Prompt** | `Who is the greatest artist alive? (the GOAT)` |
| **Réponse** | `ye` |
| **Flag** | `flag{yeah you got it}` |
| FNV-1a 64 (`ye`) | `0x08ed4f07b58a0243` |
| OK | affiche le flag, exit 0 (chemin *clean*, anti-debug à 0) |
| KO | taunt aléatoire (`Nope. Not the GOAT.` / `Wrong. The GOAT would be disappointed.` / `That is not it.` / `Denied.`), exit 1 |
| Honeypot | `kanye` / `kanye west` → `He has not answered to that name in years.` (seulement si anti-debug **éteint**), **puis** un taunt (`Wrong. The GOAT would be disappointed.`), exit 1 — observé sur un hôte sans oracle anti-VM |

Pas de username : le binaire prend une réponse libre, donc **pas** d’exemple `petik`.

```bash
python3 tools/the-goat-solve.py -q
# flag{yeah you got it}
python3 tools/the-goat-solve.py --check
# CHECK OK
printf 'ye\n' | wine original/crackme.exe   # machine bare-metal, pas de Hyper-V guest
```

Le solveur rejoue le chemin **clean** (`v10 == 0`). Sur cette machine Windows (Hyper-V guest registry + PEB/NtQuery/RDTSC), le binaire live refuse `ye` : voir §7.

---

## 1. Premier regard

```text
crackme.exe: PE32+ executable (console) x86-64, for MS Windows
sha256  64cf4b1fb49905206b0845e4a0d35df8fb05f7175e9330e29630ea9da1a45713
md5     3fec080a56a1da3e49685cf7cefd57de
size    218624
imagebase 0x140000000
entry   RVA 0xca20
```

`strings` sort du Nim (`io.nim`, `syncio.nim`, `fatal.nim`) et **aucune** chaîne de prompt / flag en clair. Sections custom :

| Section | VA | VirtualSize | Rôle |
|---|---|---|---|
| `.text` | `0x140001000` | `0x21d60` | code Nim + crypto |
| `.goatcod` | `0x140023000` | `0x47` | code keystream chiffré (SplitMix64) |
| `.rdata` | `0x140024270` | — | blobs XOR, nonce, strings chiffrées |
| `.data` | `0x140034000` | — | marqueur `SEALMARKERSEALMK` + sceaux FNV |
| `.goatsec` | `0x140039000` | `0x30` | seed + rolling key + MAC |
| `.fptable` | `0x14003a000` | 0 | vide |

Ancrage : MCP `ida` (Hex-Rays) sur `original/crackme.exe`. x32/x64dbg MCP injoignable pendant l’analyse.

---

## 2. Flow

1. **Unseal** `.goatcod` / `.goatsec` (SplitMix64 + MAC FNV). Sceaux d’intégrité sur `.text` VirtualSize et sur le contenu des deux sections goat.
2. Anti-debug / anti-VM → octet `v10` (PEB, `NtQuery`, RDTSC `sub_140009130` seuil `0x2DC6C0`, noms d’outils hashés, clé registre Hyper-V).
3. Prompt déchiffré (`sub_140007DF0`, tags 20+21) : *Who is the greatest artist alive? (the GOAT)* puis `answer > `.
4. Lecture stdin, normalisation (blancs collapsés, lowercase).
5. Honeypot `kanye` / `kanye west` **si** `v10 == 0`.
6. FNV-1a 64 de la réponse ; si `v10` : `hash ^= 0x9E3779B97F4A7C15` (GOLDEN).
7. MBA aplatie `sub_14000B390` : succès ssi le hash *clean* vaut `0x08ed4f07b58a0243`.
8. Dérivation HMAC-SHA256 `sub_14000A790` (si `v10`, splat `0x5A`/`0xA5`/`0xFF` sur la clé ChaCha).
9. XOR goat sur le ciphertext 21 octets + digest attendu (`sub_1400092B0`).
10. ChaCha20 IETF (`sub_14000A950` / `sub_14000B060`), SHA-256 du plaintext vs digest. OK → print flag (`sub_14000C1A0`), exit 0 ; sinon taunt `rdtsc & 3` (`sub_14000C050`), exit 1.

---

## 3. Comment on trouve la réponse

### 3.1 `.goatsec` / `.goatcod` (SplitMix64)

`.goatsec` (48 octets fichier) :

```text
[0:8]   seed LE
[8:40]  rolling key XOR goatcod(seed, i)
[40:48] MAC = FNV-1a64(key) XOR keystream(seed, 40..47)
```

Keystream (même primitive que `.goatcod`) :

```text
splitmix64(x):
  x += 0x9E3779B97F4A7C15
  x ^= x >> 30; x *= 0xBF58476D1CE4E5B9
  x ^= x >> 27; x *= 0x94D049BB133111EB
  return x ^ (x >> 31)

goatcod(seed, idx) = (splitmix64(seed + idx) >> 56) & 0xFF
```

Sur ce binaire :

```text
seed         0x3bb03db859a625bd
rolling key  a9cd0abbd4fe415466535b40a0f22c2a64c37400c990834b53709ac82b31584a
```

`.goatcod` (0x47 octets) se déchiffre octet par octet avec `goatcod(i + 0x6A09E667F3BCC909)` → [`analysis/goatcod.dec.bin`](analysis/goatcod.dec.bin). C’est le petit stub appelé via `sub_140001140` pour produire le keystream runtime.

Sceau `.data` `0x140034000` = ASCII `SEALMARKERSEALMK` :

- FNV-1a 64 du **VirtualSize** de `.text` (`0x21d60`) vs `qword_140034010 ^ 0x5EA1A5C11F00D0B1`
- FNV chaîné du contenu `.goatcod` puis `.goatsec` vs `qword_140034018 ^ 0x7A1C0DE5EED12345`

Un patch dans `original/` casse le sceau (et le MAC goatsec). On ne touche pas au binaire d’origine.

### 3.2 Strings (`sub_140007DF0`)

Table 16 octets `byte_140024AC0` = `9e3779b97f4a7c152ba10cd45e6c88f3` (les 8 premiers = GOLDEN LE).

```c
out[i] = (7*i + 90) ^ src[i] ^ TAB[(5*i + tag) & 0xF] ^ (i*i + 51);
```

Les payloads Nim sont des fat strings (qword len + data) dans `.rdata` :

| VA payload | n | tag | Texte |
|---|---|---|---|
| `0x140025090` | `0x2C` | 20 | `Who is the greatest artist alive? (the GOAT)` |
| `0x1400250D8` | 9 | 21 | `answer > ` |
| `0x140025140` | `0x2A` | 22 | `He has not answered to that name in years.` |
| (taunts) | | 12–15 | `Nope. Not the GOAT.` / `Wrong. The GOAT would be disappointed.` / `That is not it.` / `Denied.` |
| | | 11 | chemin registre VM (voir §3.6) |

### 3.3 MBA / CFF `sub_14000B390`

FSM aplatie, état `v4 ^ 0x5A3C`, compteur `v6 < 32`. Réduit à :

```text
x2 = x * 0x6164B99C58E8ABFD          // case 1
x3 = x2 XOR 0x355AC876118344EB       // case 2 : (x2|C) - (x2&C)
ok  iff x3 == 0x09C7CAF8BC1DB9DC     // case 3 : ((T-x)|(x-T))==0
```

Le XOR est écrit en MBA ; l’égalité aussi. Inverse (mod 2^64), chemin **clean** (`x` non xoré GOLDEN) :

```text
x2 = TARGET ^ XOR_C
x  = x2 * inv(MUL)  =  0x08ed4f07b58a0243
```

Brute de noms d’artistes normalisés : **`ye`** est le seul hit de la liste (FNV-1a 64 ASCII).

```text
FNV("ye")         = 0x08ed4f07b58a0243   ← MBA clean
FNV("kanye")      = 0xF02DA1CF8A1A819B   honeypot
FNV("kanye west") = 0x5CC3C84980BA3F42   honeypot
```

Si `v10` (debugger / VM) : `x' = FNV(input) ^ GOLDEN` **avant** le MBA. Pour que le check passe il faudrait alors un autre préimage, `FNV == 0x96da36becac07e56`. Ce n’est pas `ye`.

### 3.4 HMAC → clé ChaCha (`sub_14000A790`)

Hex-Rays tronque les pointeurs (`int a2`). Reconstruction d’après les buffers :

```text
V75  (32 B, immediates NimMainModule) =
  bb54aac4b89dc868ba37d9cc21b2cece245d1ef853e39fc89f09b43ceb7e57a0
V90  (16 B HMAC key) =
  5e19fde90cf9b4838622421e57a12862

inner = HMAC-SHA256(V90, V75)
msg   = le64(FNV) || SHA256(V75)[:7] || 0x01
key   = HMAC-SHA256(inner, msg)          // 32 bytes
```

Si `v10` : splat XOR `0x5A` / `0xA5` / `0xFF` sur cette clé → le ChaCha ne donne plus le flag même avec le bon FNV.

### 3.5 Ciphertext, nonce, ChaCha20

`sub_1400092B0` : `buf[i] ^= goatcod(seed, i + base) ^ key[i & 0x1F]`.

- 21 octets à `0x140024FF0`, `base = 64` → ciphertext  
  `1ceed32e22ef213f6948bd499a00ba5e7b8f7f9ff5`
- 32 octets à `0x140025008`, `base = 88` → SHA-256 attendu  
  `1063b22ba3667e687552f7908e03904785fc2d43a8bd2b57703c215ef1df8aa3`

Nonce **12 octets** IETF à `0x140025028` :

```text
e1 81 1b 4c da b2 15 dc  93 4f 1c ec
= pack('<QI', 0xDC15B2DA4C1B81E1, 0xEC1C4F93)
```

**Piège Hex-Rays** : le dernier dword a été décompilé `0xEC1D8D93`. La mémoire / le fichier ont `dword_140025030 = 0xEC1C4F93`. Avec le dword inventé, SHA-256(pt) ne matche pas.

ChaCha20 IETF : constante `expand 32-byte k`, 10 double-rounds, compteur 32-bit = 0, nonce 12 B. XOR du bloc 0 sur les 21 octets →

```text
flag{yeah you got it}
SHA256 match True
```

### 3.6 Anti-debug / anti-VM

| Routine | Test |
|---|---|
| PEB / `NtQuery*` | BeingDebugged, flags, handles |
| `sub_140009130` | 5× RDTSC autour d’un appel ; seuil `0x2DC6C0` |
| `sub_140008830` | hashes de noms d’outils / VM (`0xE327DDB8844225BD`, `0x4631B2E410D62EDA`, …) |
| même fonction | `RegOpenKey` `SOFTWARE\Microsoft\Virtual Machine\Guest\Parameters` (chaîne tag 11) |

Tout ça alimente `v10`. Conséquences : XOR GOLDEN sur le FNV, splat de la clé ChaCha, et parfois court-circuit MBA (`sub_14000B230` / TLS byte).

---

## 4. Prédicat consolidé

```text
name = collapse_ws(input).lower()
if v10==0 and name in {"kanye", "kanye west"}:
    print(honeypot)   # puis chute dans le taunt, exit 1
h = FNV1a64(name)
if v10: h ^= 0x9E3779B97F4A7C15
ok_mba = ((h * 0x6164B99C58E8ABFD) ^ 0x355AC876118344EB) == 0x09C7CAF8BC1DB9DC
# clean  ⇒  h == 0x08ed4f07b58a0243  ⇒  name == "ye"
key = HMAC_SHA256(HMAC_SHA256(V90, V75), le64(h) || SHA256(V75)[:7] || 0x01)
if v10: splat(key)
pt  = ChaCha20_IETF(key, nonce=0x140025028, ctr=0, ct)
accept iff SHA256(pt) == expected   # pt = b"flag{yeah you got it}"
```

---

## 5. Vérification

Solveur (chemin clean, constantes lues dans le PE) :

```text
$ python tools/the-goat-solve.py --check
goatsec seed  0x3bb03db859a625bd
rolling key   a9cd0abbd4fe415466535b40a0f22c2a64c37400c990834b53709ac82b31584a
target FNV    0x08ed4f07b58a0243
answer        'ye'  fnv_ok=True
prompt        b'Who is the greatest artist alive? (the GOAT)answer > '
honeypot      b'He has not answered to that name in years.'
flag ct       1ceed32e22ef213f6948bd499a00ba5e7b8f7f9ff5
flag pt       b'flag{yeah you got it}'
sha256 match  True
dirty FNV     0x96da36becac07e56  (v10 set → hash ^= GOLDEN)
CHECK OK
```

Live natif **sur cet hôte** (Hyper-V guest) — [`analysis/run-live.txt`](analysis/run-live.txt) :

```text
ye      → That is not it.   exit 1
kanye   → That is not it.   exit 1
nobody  → Denied.           exit 1
```

Les taunts sont tirés au `rdtsc & 3` : le message **ne distingue pas** un échec MBA d’un échec MAC. Ici `ye` échoue parce que `v10` est posé (registre guest Hyper-V au minimum) : le FNV vu par le MBA n’est plus `0x08ed4f07b58a0243`, et la clé ChaCha est splattée. Le honeypot `kanye` ne se déclenche pas non plus (`v10 != 0`).

Preuve du flag = reconstruction crypto + SHA-256 du plaintext contre le digest goat-xoré du PE. Pour voir `flag{yeah you got it}` s’afficher, il faut un Windows **sans** les oracles anti-VM (pas de `Virtual Machine\Guest\Parameters`, pas de debugger, RDTSC calme).

**Second hôte testé** : Windows 10 dans une **VirtualBox** (`HypervisorPresent=True`), x64dbg ouvert. Mêmes symptômes en interactif comme en pipe : `ye` → `That is not it.`, `kanye` → pas de honeypot (donc `v10 != 0`). Un seul run a affiché le honeypot (`kanye`), prouvant qu’un lancement « calme » est possible, mais `ye` n’a jamais affiché le flag sur cette machine. Le prédicat clean n’a donc **pas** été observé en live ; il est établi par :

- l’inversion de la MBA (`sub_14000B390`, relue au pseudo-code : `x*MUL ^ XOR == TARGET`, recalculée en Python) ;
- le stub keystream `.goatcod` désassemblé (`splitmix64(seed+idx)>>56`, aucune dépendance à l’environnement) ;
- le SHA-256 du plaintext qui égale le digest attendu.

Sources du compteur « sale » (`sub_140008830`, `sub_140009190`) : `CPUID` leaf 1 (bit hyperviseur, +1), `CPUID` leaf `0x40000000` (hash du vendor, +4 si listé), clé registre Hyper-V Guest, énumération des processus ; `v10` est posé dès que le compteur vaut `>= 4`, ou si `sub_140008C50` (sceau `.text` en mémoire) échoue.
Sous x64dbg le processus sort pendant `sub_140009190` (anti-debug au-delà du PEB), donc `v10`/`v92` n’ont pas pu être lus en live.

x64dbg MCP : d’abord injoignable, puis utilisé sur la fin : `sub_140009250` et `sub_1400093F0` (appelés depuis `0x14000B626` / `0x14000B639`) retournent bien `1` (`v8` faux) sous debugger ; le reste de la chaîne n’a pas pu être observé (sortie du process dans `sub_140009190`).

---

## 6. Notes

- Hex-Rays a inventé le dword de nonce `0xEC1D8D93` : toujours relire `0x140025030` dans le fichier.
- `(x\|C)-(x\&C)` = XOR ; `((T-x)\|(x-T))==0` = égalité. Le CFF autour ne change pas le prédicat.
- `strings` ne donne pas le prompt : tout passe par `sub_140007DF0`.
- `kanye` est un **leurre** volontaire (Ye ne répond plus à ce nom), pas la soluce.
- Ne pas patcher `original/crackme.exe` : sceau FNV + MAC `.goatsec`.
- IDA `.i64` sous `analysis/` (gitignoré).
