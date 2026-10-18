# Computerboy's Gemy

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/673ff5da9b533b4c22bd2fff) · id `673ff5da9b533b4c22bd2fff`

ELF64 PIE console, **packé UPX 4.22**. Diff. site **1.5**.
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/gem`](original/gem) | binaire packé UPX (tel que fourni) |
| [`tools/gemy-solve.py`](tools/gemy-solve.py) | affiche la clé / `--check` |

## Réponse

| | |
|---|---|
| **Clé d'accès** | `KEY` |
| OK | `Congrats you solves this challenge` |
| KO | `Access denied. Try again.` |

```bash
python3 tools/gemy-solve.py          # affiche "Clé d'accès : KEY"
python3 tools/gemy-solve.py -q       # KEY
python3 tools/gemy-solve.py --check  # lance le binaire, code retour 0/1
printf 'KEY\n' | ./original/gem
```

## 1. Premier regard

```text
gem: ELF 64-bit LSB pie executable, x86-64, statically linked, no section header
sha256  a0b7d45b5c495f5bcc2df918fe8315d6b4726efcf99c1a8ecdbe1adaa1b3c4cd
size    5812 bytes
```

```bash
strings -n 5 original/gem
```

```text
$Info: This file is packed with the UPX executable packer http://upx.sf.net $
$Id: UPX 4.22 Copyright (C) 1996-2024 the UPX Team. All Rights Reserved. $
Welcome to
curVault
ystem v3.2.1
PROT_EXEC|PROT_WRITE failed.
mysteryKEY
*cess keyr          <- fragments coupés par la compression UPX
```

**Packé UPX 4.22** : `file` affiche "statically linked, no section header"
(artefact du stub UPX, pas la réalité — une fois dépaqueté en mémoire au
runtime, le process charge normalement `libc.so.6` / `ld-linux`, confirmé
via `/proc/<pid>/maps`). Le dépôt ne fournit que **UPX 3.96**
(`tools/upx-3.96`) :

```bash
./tools/upx-3.96 -d -o analysis/gem.unpacked original/gem
# -> CantUnpackException: need a newer version of UPX
```

Pas de UPX 4.x dans le dépôt, et consigne du dépôt de ne pas en
retélécharger un : dépaquetage fait **en mémoire** (le binaire s'auto-extrait
très bien à l'exécution, UPX 3.96 n'étant nécessaire que pour l'outil CLI
`upx -d` sur le *fichier*) — voir § 2.

## 2. Comment on trouve la clé — dump mémoire + MCP `ida`

### Dépaqueter en mémoire plutôt que sur le fichier

Le binaire s'exécute très bien tel quel (UPX décompresse en RAM au
démarrage puis saute au code original) :

```bash
$ printf 'test\n' | ./original/gem
Welcome to the Secure Vault System v3.2.1
Error: Invalid data detected in memory block 0xDEADBEEF
Please contact support with code 0xBAADF00D
Enter the access key: Access denied. Try again.
```

On lance le process avec un pipe (il reste bloqué sur `scanf` au prompt
"Enter the access key:"), on lit `/proc/<pid>/maps` pour repérer les 4
mappings anonymes contigus juste avant la page résiduelle du fichier packé
(`r--`, `r-xp`, `r--`×2, `rw-` — le pattern classique des `PT_LOAD` d'un
petit PIE une fois dépaqueté), puis on copie ces octets depuis
`/proc/<pid>/mem` :

```python
import subprocess, time
p = subprocess.Popen(["./original/gem"], stdin=subprocess.PIPE,
                      stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
time.sleep(0.3)
maps = open(f"/proc/{p.pid}/maps").read().splitlines()
idx = next(i for i, l in enumerate(maps) if l.endswith("original/gem"))
block = maps[idx-4:idx]                       # les 4 pages anonymes juste avant
lo = int(block[0].split("-")[0], 16)
hi = int(block[-1].split()[0].split("-")[1], 16)
with open(f"/proc/{p.pid}/mem", "rb") as mem:
    mem.seek(lo); data = mem.read(hi - lo)
open("analysis/gem.dump.bin", "wb").write(data)   # 0x5000 octets, ELF valide
```

Le résultat (`analysis/gem.dump.bin`) est un **ELF valide** (en-tête +
program headers intacts, juste les section headers manquants — normal pour
un binaire UPX) : `file` le confirme (`ELF 64-bit ... dynamically linked,
interpreter /lib64/ld-linux-x86-64.so.2, stripped`), chargeable directement
dans IDA.

### Pseudocode Hex-Rays (MCP `ida`)

```bash
# ouverture du dump via le MCP ida : open_database puis execute_python
# db.functions -> liste des fonctions, db.pseudocode.get_text(ea) pour main
```

`main` (adresse `0x1169` dans le dump) :

```c
__int64 sub_1169()
{
  _BYTE v1[16];     // buffer de comparaison
  char v2[24];      // saisie utilisateur
  int v3 = 0;

  puts("Welcome to the Secure Vault System v3.2.1");
  puts("Error: Invalid data detected in memory block 0xDEADBEEF");
  puts("Please contact support with code 0xBAADF00D");

  for (i = 0; i <= 6; ++i)
    v3 += byte_4030[i] ^ 0xAB;      // <-- calculé... puis jamais relu : code mort
  for (i = 0; i <= 2; ++i)
    v1[i] = byte_4037[i];           // <-- copié TEL QUEL, pas de XOR
  v1[3] = 0;

  printf("Enter the access key: ");
  scanf("%15s", v2);
  if (strcmp(v2, v1) != 0)
    puts("Access denied. Try again.");
  else
    puts("Congrats you solves this challenge");
}
```

Deux pièges volontaires :
1. **La boucle XOR `0xAB` sur `byte_4030[0..6]`** calcule une somme (`v3`)
   qui n'est **jamais réutilisée** derrière — un leurre qui fait croire à un
   checksum à inverser.
2. **`byte_4030` / `byte_4037` ne sont pas deux tableaux distincts** : c'est
   la **même chaîne** `"mysteryKEY"` vue à deux offsets. Confirmé en lisant
   les octets bruts du dump à l'offset ELF `0x4030` (segment `RW`,
   `readelf -lW analysis/gem.dump.bin` : `LOAD` à `VirtAddr 0x3dd0`,
   `0x270` octets) :

```text
00004030: 6d79 7374 6572 794b 4559 0000 0000 0000  mysteryKEY......
```

- `byte_4030[0..6]` = `"mystery"` → entre dans la boucle XOR morte.
- `byte_4037[0..2]` = `"KEY"` (offset `+7`, juste après `"mystery"`) →
  copié directement dans `v1`, comparé par `strcmp` à la saisie : **c'est
  la vraie clé**, sans transformation.

### Vérification

```bash
$ printf 'KEY\n' | ./original/gem
Welcome to the Secure Vault System v3.2.1
Error: Invalid data detected in memory block 0xDEADBEEF
Please contact support with code 0xBAADF00D
Enter the access key: Congrats you solves this challenge
```

Edge case : toute autre saisie (`test`, `mystery`, la somme XOR calculée en
décimal/hex, etc.) → `Access denied. Try again.` — confirme que seule
`KEY` fonctionne et que la boucle XOR est bien un leurre sans effet.

## 3. Notes

- **UPX 4.22** packé le binaire, mais le dépôt n'embarque que
  **UPX 3.96** (`tools/upx-3.96`, incompatible : `CantUnpackException`) et
  la consigne du dépôt est de ne pas en retélécharger un autre. Contourné
  en laissant le binaire **se dépaqueter lui-même en mémoire** (comportement
  normal d'un stub UPX à l'exécution) puis en **dumpant les pages
  résultantes** via `/proc/<pid>/mem` pendant qu'il est bloqué sur `scanf` —
  reproduit un ELF chargeable tel quel dans IDA, sans jamais relancer `upx`
  sur le fichier.
- Pas de GDB utilisé ici (dump mémoire + MCP `ida` ont suffi) — pas de
  section "Debug GDB" (voir `AGENTS.md`, § Debug GDB : uniquement si GDB a
  servi au reverse).
- `"Error: Invalid data..."`, `"0xDEADBEEF"`, `"0xBAADF00D"` : juste de la
  mise en scène (constantes "magiques" classiques), affichées
  inconditionnellement, sans rapport avec le check réel.
