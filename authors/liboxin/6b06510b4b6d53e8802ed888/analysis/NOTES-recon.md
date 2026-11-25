# easy vm v2 (liboxin) — notes de recon (non résolu)

## Identité
- `original/supervm_v144_full_5mb.exe` — PE32+ console, x86-64, **20 sections**, 4.8 MB
- sha256 `58231c214c2bb01ebf00bb11d55d57d2954f83645ae4f4aba8ff4b9892be2876`

## Banner (Wine)
```
=== AEGIS SUPER VM CRACKME ===
Two independent encrypted bytecode VMs guard one 22-byte key.
input flag: ACCESS DENIED.
```
Commande : `xvfb-run -a wine original/supervm_v144_full_5mb.exe`

## Layout
Protecteur custom « Aegis » :

| section | taille | rôle supposé |
|---|---|---|
| `.text` | 0x7600 | **junk / anti-désassemblage** (icebp, `rcr`, JUMPOUT hors bornes) |
| `.s4`…`.s81` | 0x200–0x1000 | petits blobs |
| `.aegis` | 0x49000 | code réel (entry `start` = 0x140019034) |
| `.aegisd` | 0x2404c0 | données (bytecode VM + strings chiffrées) |
| `.aeg` | 0x200000 | code (2 MB) |

Les 10 fonctions de `.text` décompilées par IDA sont du garbage non exécuté.
Le vrai point d'entrée est `start` dans `.aegis`, qui calcule une cible via
`qword_140062074 = v3 ^ sub_14001A3DD(... ^ 0xA5C3E1F70B9D2468)` puis saute dedans.

## Ce qui est fait
- `decc` → `analysis/supervm-hexrays.c` (10.4 MB, 21911 fonctions, `.i64` gitignoré)
- Imports : `KERNEL32` (VirtualProtect/VirtualQuery/WriteFile) + `msvcrt`
  (`fgets`, `strncmp`, `strlen`) — mais **aucune xref IDA vers l'IAT** :
  les thunks sont résolus à l'exécution par le loader Aegis, donc Hex-Rays ne
  rattache pas les appels aux noms d'import.
- Strings du prompt absentes du fichier → déchiffrées au runtime.


## Percée : le protecteur « aegis » v144 est décrit statiquement

Le dépôt a déjà traité deux crackmes du même auteur avec un protecteur « aegis »
([unpack me v1](../6af59fc52c7537120cbe8a22/), [hellgate1](../6af00c585fa39ab0d4ac2236/)).
La v144 réutilise les mêmes primitives, avec un format de header différent :

```
mix(x)            = finaliseur splitmix64                 (sub_14001A3DD)
  x ^= x>>30 ; x *= 0xBF58476D1CE4E5B9
  x ^= x>>27 ; x *= 0x94D049BB133111EB
  x ^= x>>31
keystream(k, i)   = mix(k ^ 0x9E3779B97F4A7C15 * i)       (sub_14005BDBB, i = bloc de 8 o)
seed              = qword_1400620D8
```

`seed` vaut **0** : il n'est écrasé par `rdtsc` (`sub_140019F0E`) que si le
self-hash FNV-1a de `.aegis` (0x49000 octets, `sub_14001AAC4`) ne vaut pas
`hdr+0x68` — c'est l'anti-patch, un octet modifié rend le déchiffrement
irrécupérable.

Header AGIS (magic `"AGIS"` dans `.aegisd`, file offset `0x157638`) :

| champ | valeur | rôle |
|---|---|---|
| `+0x14` | 16 | nombre de pages |
| `+0x18` | `0x164560` | rva de la table de pages (chiffrée) |
| `+0x28`/`+0x2c` | `0x164770` / `0x13daa4` | gros blob (~1.3 Mo) dans `.aegisd` |
| `+0x40`/`+0x44` | `0x1644d8` / 17 | seconde table |
| `+0x4c` | `0xc911be79` | sel du self-hash |
| `+0x60`/`+0x64` | `0x2a2218` / 2 | table de constructeurs |
| `+0x68` | `0xf181870e660406c0` | self-hash attendu de `.aegis` |
| `+0x84`/`+0x88` | `0x5be48` / `0x5db8` | **région chiffrée de `.aegis` lui-même** |
| `+0x90`/`+0x94` | `0x2a3000` / `0x200000` | `.aeg` |

**La table de pages se déchiffre** avec `mix(hdr+0x4c ^ hdr+0x68)` =
`0x4d09340f4d7f3d5f` → 16 entrées de 32 octets, toutes plausibles :

```
+0x00 u64 key   +0x08 u32 rva   +0x0c u32 size
+0x10 u64 k2    +0x18 u32 flags +0x1c u32 k3
```

rva/size couvrent `.text` (0x1000–0x8000) **et** les petites sections `.sNN`
(0x12000–0x18000). Donc **`.text` est chiffré** : les 10 « fonctions » que
Hex-Rays y décompile (icebp, `rcr`, JUMPOUT hors bornes) sont du chiffré mal
interprété, pas du junk volontaire. Voir `tools/aegis-table-v144.py`.

Clé de page, lue en asm dans `sub_14001AB40` (`0x14001ab56`–`0x14001ab68`) :

```asm
mov  rcx, r8                      ; entry.key
xor  rcx, QWORD PTR [rbp+0x10]    ; ^ k2
mov  eax, DWORD PTR [rbp+0x1c]
xor  rcx, rax                     ; ^ k3
call 0x14001a3dd                  ; mix(...)
xor  rbx, QWORD PTR [0x1400620d8] ; ^ seed (= 0)
```

## Ce qui bloque encore
Le XOR des pages n'est pas `keystream(pagekey, i)` : appliqué à la page
`rva 0xa000` (`.rdata`) il ne sort aucune chaîne lisible, et aucune des
variantes de clé testées (`mix(key^k2^k3)`, `key^k2^k3`, `key`, `mix(key)`,
`k2`, `mix(k2)`, `key^k2`, `mix(k3^key)`, `mix(k2^key)`) ne marche.

La vraie boucle est dans `sub_14005BE50`, atteinte via
`sub_14001AB40 → sub_14005BE35 → sub_14001A4C9 → jmp 0x14005be50` — or
`0x14005be50` **tombe dans la région `.aegis` chiffrée `+0x84`/`+0x88`**
(`0x5be48`–`0x61c00`), donc `objdump` n'y voit que du bruit. Hex-Rays ne
décompile de `sub_14001AB40` que la queue (`size & 7`), la boucle principale
étant dans cette zone.

**Prochaine étape** : déchiffrer la région `.aegis` `0x5be48`+`0x5db8`. Ses
candidats de clé évidents ont échoué (`hdr+0x30 ^ mix(hdr+0x4c ^ 0x564D5F4B45595F44)`
— la constante `"VM_KEY_D"` lue dans `sub_14005BD20` —, `mix(hdr+0x4c ^ VM_KEY_D)`,
`hdr+0x30`, `mix(hdr+0x30)`), donc il faut lire la seconde table
(`+0x40`, 17 entrées, 8 octets chacune vu l'espace disponible jusqu'à `0x164560`)
ou le constructeur TLS qui déchiffre cette zone avant tout le reste.

## Dump mémoire : bloqué
`/proc/<pid>/mem` refusé (`yama/ptrace_scope = 1`) et Wine 10 lance le PE dans un
process distinct du lanceur, donc `gdb --args /usr/lib/x86_64-linux-gnu/wine/wine …`
ne voit pas l'image à 0x140000000 (testé avec `catch syscall read`, interruption
temporisée, et balayage de tous les inferiors — image jamais accessible).
Pistes restantes : `winedbg --gdb` (proxy gdb côté Wine), ou rejouer
statiquement la routine de déchiffrement de `start`.

## Reste à faire
1. Déchiffrer la région `.aegis` `+0x84`/`+0x88` pour lire `sub_14005BE50`
   (la boucle XOR des pages), puis dépaqueter `.text`.
2. Identifier les deux VMs et leur jeu d'instructions.
3. Inverser le prédicat sur la clé de 22 octets.
