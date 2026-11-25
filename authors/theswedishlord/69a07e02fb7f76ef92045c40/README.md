# TheSwedishLord's SirCrackaLot v2

| | |
|---|---|
| **ID** | [`69a07e02fb7f76ef92045c40`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69a07e02fb7f76ef92045c40) |
| **Auteur** | TheSwedishLord (`theswedishlord`) |
| **Plateforme** | Linux x86-64, ELF PIE Rust, strippé (difficulté annoncée 3/6) |
| **SHA-256 (zip)** | `5518263ea857f3ef4bd75ea77d381b498f9aa5bb56cd649b4806202d93596b53` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/SirCrackaLot.zip` | archive d’origine (password `crackmes.one`), **non modifiée** |
| `analysis/extract/` | zip dépaqueté (`SirCrackaLot` + `README.md` de l’auteur) |
| `analysis/sircrackalot.asm` | `objdump -d -M intel` complet (la fonction utile : `0x10400`–`0x11000`) |
| `tools/sircrackalot-solve.py` | keygen (`--name`, `-q`, `--check BIN`) |

## Réponse

Format `XXXX-XXXX-XXXX-XXXX` (4 mots hexa de 16 bits), dépend du nom.

| Nom | Clé |
|---|---|
| `petik` | **`1174-ADE9-5D52-0047`** |
| `a` | `D320-2DDE-9FCB-2C57` |
| `Sir Lancelot` | `7A25-ADA8-4DC4-7CA8` |

```bash
python3 tools/sircrackalot-solve.py --name petik            # name='petik' key=1174-ADE9-5D52-0047
python3 tools/sircrackalot-solve.py -q --check analysis/extract/SirCrackaLot
```

## Premier regard

```bash
unzip -P crackmes.one original/SirCrackaLot.zip -d analysis/extract
file analysis/extract/SirCrackaLot   # ELF 64-bit PIE, dynamically linked, stripped
strings -n 5 analysis/extract/SirCrackaLot
```

Binaire **Rust** strippé (320 Ko, beaucoup de bruit libstd). `strings` ne montre **aucune** chaîne du crackme
(« Trial of the Hash », « Hail, worthy Knight… ») : elles sont décodées à l’exécution, donc pas de xref
facile depuis une chaîne. Le README de l’auteur donne les indices : 1er sceau issu du nom seul, chaque
sceau alimente le suivant, le dernier garde les autres.

## Flow

1. Bannière (4 « Trials »), lecture du nom puis de la clé sur stdin.
2. Parse de `XXXX-XXXX-XXXX-XXXX` → `bp`=sceau 1, `r13d`=sceau 2, `r14d`=sceau 3, `r12`=sceau 4
   (boucles `shl 4 / or` en `0x101d4`, `0x1022e`, `0x1028e`, `0x102e6`).
3. Contrôle **anti-debug** : `/proc/self/status` (TracerPid), `ptrace(PTRACE_TRACEME)` (syscall `0x65` en `0x107fe`),
   et un delta `rdtsc` (`0x10803`…`0x10824`, seuil `0x7a121`). Ils alimentent un « seed » `[rsp+8]`.
4. Quatre calculs (« Trials ») sur le nom ; les 4 booléens sont ANDés (`0x10e0c`–`0x10e13`) → message de bienvenue.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn` ; entry `0xf040` → `__libc_start_main(0x116b0)` (lang_start de la std) ;
la fonction `main` du crackme est celle juste avant, qui contient le `syscall` `0x65` (ptrace) en `0x107fe` et le test final en `0x10e13`.
(`decc`/MCP `ida` indisponibles ici : lecture à l’objdump + émulation Unicorn d’un seul bloc SIMD.)

### Anti-debug = seed

```asm
107ed  xor r8d,r8d ; mov eax,0x65 ; ... ; syscall          ; ptrace(TRACEME) : 0 si pas de tracer, -1 sinon
10808  sar rsi,0x3f ; and esi,0xdead                        ; -1 -> 0xdead
1081f  rdtsc ; sub rax,rcx ; cmp rax,0x7a121 ; cmovb eax,r8d ; (lent -> 0xface)
10833  or esi,ebx ; or esi,eax ; mov [rsp+8],rsi            ; ebx = 0xbeef si TracerPid != 0
```

Exécution normale : **seed = 0**. Sous `strace`/`gdb` le seed devient non nul et *toutes* les clés sont refusées
(piège : j’ai d’abord vu « The gates remain sealed » sous `strace`, à cause de ça, pas de la clé). Le keygen suppose seed = 0.

### Sceau 1 — hash du nom (`0x10873`–`0x10928`)

```asm
10878  mov edx,eax ; xor edx,0xdeadbeef                     ; h = seed ^ 0xdeadbeef
108a0  rol edx,5 ; xor edx,esi(byte) ; imul edx,edx,0x1000193   ; h = (rol(h,5) ^ c) * 0x01000193   (par octet, déroulé x4)
10912  mov ecx,edx ; shr ecx,16 ; xor ecx,edx ; add esi,ecx      ; b8 = len + ((h>>16)^h)
10aa8  cmp bp,[rsp+0xb8]                                          ; sceau1 == b8 & 0xFFFF
```

### Sceau 2 — rol/add 16 bits (`0x10934`–`0x109f4`, `0x10ad4`)

```asm
1094c  add esi,edi(byte) ; rol si,3        ; si = rol16(si + c, 3), départ si = sceau1 (b8)
109e3  xor si,r8w ; mov esi,0x1337 ; cmovne esi,edi   ; X = si^seed, ou 0x1337 si nul
10ad4  imul ecx,r13d,0x7a69 ; cmp cx,[rsp+0x68]       ; (sceau2 * 0x7a69) & 0xFFFF == X
```

`0x7a69` est impair → inversible mod 2^16 : `sceau2 = X * 0x7a69^-1 mod 65536` (`pow(0x7a69,-1,1<<16)`).

### Sceau 3 — permutation pseudo-aléatoire (`0x10a07`–`0x10eff`)

1. `b = X` ; pour chaque octet `c` du nom : `b = b*31 + c` (`shl 5 ; sub`, `0x10a0a`) ; puis `b ^= seed`.
2. Tableau `arr = 0..15` (rodata `0x2fc0/2f70/2f40/2f50`). Fisher–Yates, `i` de 15 à 1 :
   `j = (((b*M_i + A_i) mod 2^32) >> 16) % (i+1) ; swap(arr[i], arr[j])`.
   Les 15 couples `(M_i, A_i)` sont lus tels quels dans les `imul ecx,ebx,M / add ecx,A` de `0x10b17`–`0x10d99`
   (le `% (i+1)` est compilé en multiplication magique `0x8889`, `0xaaab`, `0x4925`…, ou en masque `& 0x3c`, `& 0x1c`, … pour 16/8/4/2).
3. Somme SIMD (`pmullw`/`paddw`, `0x10e1b`–`0x10efb`) — pour ne pas la lire lane par lane, j’ai **émulé** ce bloc avec Unicorn
   sur des vecteurs unitaires : poids = `1,2,…,16` (linéaire, vérifié sur 3 tableaux aléatoires).
   `sceau3 = (Σ arr[k]·(k+1) ^ X) & 0xFFFF` (`xor eax,[rsp+0x68]` ; `cmp ax,r14w`).

### Sceau 4 — CRC-16/ARC (`0x10f0d`–`0x10f79`)

La table à `0x5f60` (256 mots, `0, 0xC0C1, 0xC181, 0x140…`) est la table CRC-16/ARC (poly `0xA001`).
Octets traités (little-endian, init 0) : `b8 & 0xFFFF`, `X`, `sceau3` ; puis `^ seed` ; `cmp si,r12w`.

### Exemple `petik`

```
h = hash FNV-like(petik) ; b8 = 5 + ((h>>16)^h) → b8&0xFFFF = 0x1174 → sceau1 = 1174
rol/add 16 bits → X = 0x5E91 ; sceau2 = X * inv(0x7a69) = ADE9
shuffle(b) → Σ arr[k]*(k+1) ^ X = 5D52 → sceau3
CRC16/ARC(1174, X, 5D52) = 0047 → sceau4
→ 1174-ADE9-5D52-0047
```

## Vérification (binaire d’origine, exécution native, sans tracer)

```text
$ python3 tools/sircrackalot-solve.py --name petik --check analysis/extract/SirCrackaLot
name='petik' key=1174-ADE9-5D52-0047
Enter thy name, Aspirant: Present thy sacred key: Hail, worthy Knight! The Order welcomes thee!   (exit 0)
```

Aussi OK pour `a`, `Sir Lancelot`, `abcdefghijklmnopqrstuvwxyz`.  
Cas KO : `petik` + `1174-ADE9-5D52-0048` → `The gates remain sealed. Begone!`.

## Notes

- Pas de GDB utilisé (le binaire détecte les tracers ; analyse statique + Unicorn sur un bloc).
- Pas de patch, `original/` intact (le zip est dépaqueté sous `analysis/extract/`).
- Le nom est lu sur une ligne (retour chariot retiré) ; noms ASCII testés.
