# rqueww's AegisShield

| | |
|---|---|
| **ID** | [`6acbc705cdee6e086a173793`](https://crackmes.one/crackme/6acbc705cdee6e086a173793) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | rqueww |
| **Plateforme** | Windows PE64, Rust, console |
| **SHA-256** | `02f2424a7307969996cc99beb2dcfe889b0377745a1c75cd86d929bf08bf652e` |

| Fichier | Rôle |
|---|---|
| `original/AegisShield_crackme_1.exe` | binaire d'origine (non modifié) |
| `analysis/aegis-patched-hash.exe` | **copie patchée** générée par le solveur |
| `tools/aegisshield-solve.py` | construit la copie patchée, la lance sous Wine, affiche le flag |
| `tools/recon-vm.py`, `tools/recon-flag.py` | extraction du bytecode de la mini-VM de hash ; tentative (échouée) de déchiffrement hors binaire |
| `tools/hash-inverse-z3.py`, `brute.c`, `brute.cu`, `aegis-hash.h`, `dict.c` | tentatives d'inversion du hash (z3 ne converge pas ; brute force CPU/H100 sans résultat) |

## Réponse

**Flag : `CMO{a3g1s_vmp_cff_mba_sh13ld_1s_4ct1v3}`**

```bash
python3 tools/aegisshield-solve.py -q      # nécessite wine
```

> ⚠️ Le **mot de passe** attendu par le binaire (pré-image d'un hash 64 bits) n'a **pas** été retrouvé. Le flag est obtenu en contournant la vérification, pas en saisissant le bon mot de passe.

## Premier regard

- Binaire Rust (chaînes `/rustc/…`), 308 224 octets, bannière `AegisShield v1.0 :: protected crackme`, prompt `enter password:`.
- Mauvais mot de passe : `[-] ACCESS DENIED` puis `license hwid: A455A49F` / `environment: bare-metal | sysroot: C:\windows`.
- Chaînes trompeuses : beaucoup de bruit libstd. Utile : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent` (résolus dynamiquement via `GetProcAddress`, noms collés à `CMO{` dans `.rdata`).

## Flow

1. Lecture du mot de passe → `sub_140007FE0` : hash 64 bits (compression en 4 slots avec `rol 17` et LCG, puis mini-VM de 71 instructions, cf. `recon-vm.py`).
2. Comparaison à `0x2A8FADFD62AD902E` (`main` = `sub_140003F40`, ~l. 2883 du pseudo-C).
3. Si OK : clé AES-256 dérivée **du seul hash** (4 qwords `v11,v5,v4,v6` issus de 4 tours LCG/rotations), AES déroulé à la main en CTR (préfixe de compteur `A3E6117C4B92D85F`), déchiffrement de 39 octets (`xmmword_14003F6A8/B8` + qword `0xDC74BDD2A2596257`) → flag.
4. Garde-fous qui posent `byte_14004ABE0 = 1` (→ refus même avec le bon hash) : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `KdDebuggerEnabled` (`0x7FFE02D4`), timing `rdtsc` autour du hash, et **intégrité** (`dword_14004A000` comparé à un CRC calculé sur le module).

## Comment on trouve

- **Ancrage** : MCP `ida` sur `original/…exe`, pseudo Hex-Rays de `sub_140003F40`. La constante `0x2A8FADFD62AD902E` et les deux appels à `sub_140007FE0` (l. 554 et 2883) situent le check ; la clé AES ne dépend que de `v3 = hash(...)`.
- **Idée** : puisque le flag ne dépend que du hash, inutile d'inverser le hash si on force `sub_140007FE0` à retourner la cible. Patch de la **copie** (jamais `original/`) :
  ```asm
  ; sub_140007FE0 (VA 0x140007FE0, offset fichier 0x73E0)
  mov rax, 0x2A8FADFD62AD902E
  ret
  ```
- **Piège (anti-tamper)** : ce premier patch donne encore `ACCESS DENIED`. Le code compare un CRC du module à `dword_14004A000` (l. ~2430 : `if (dword_14004A000 != 0 && v206 != dword_14004A000) byte_14004ABE0 = 1`). Modifier `.text` change le CRC → le drapeau est posé. Mettre `dword_14004A000` à 0 (`.data`, offset fichier `0x48A00`, valeur d'origine `742506b5`) désactive la comparaison.
- **Résultat** : n'importe quel mot de passe affiche le flag sur la copie.
- **Ce qui n'a pas marché** : inversion z3 du hash (multiplications 64 bits en cascade), brute force (CPU et H100 côté auteur du dépôt), et reproduction en Python de la dérivation AES (`recon-flag.py`) : l'AES est déroulé à la main avec des `bswap` par dword non reproduits fidèlement, aucun compteur plausible retrouvé. Le flag n'est donc pas recalculé hors binaire.

## Vérification

```text
$ echo petik | wine original/AegisShield_crackme_1.exe          # KO
[-] ACCESS DENIED

$ python3 tools/aegisshield-solve.py -q                          # OK (copie patchée)
CMO{a3g1s_vmp_cff_mba_sh13ld_1s_4ct1v3}
```

Le flag fait bien 39 octets, la longueur du blob chiffré.

## Notes

- Pas de GDB / x64dbg utilisés : reverse statique (MCP `ida`) + Wine.
- Piste ouverte : retrouver le mot de passe (pré-image) ou reproduire l'AES déroulé pour déchiffrer sans patch.
