# buggers_v.5 (shism)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc2a) · id `5ab77f6633c5d40ad448cc2a`  
> Import crackmes.de — auteur **shism**. Diff ~1.0.

Crackme **PE32 GUI** ASM (~3 KiB) : **anti-debug Olly** (pas de password / serial).

| Fichier | Rôle |
|---|---|
| [`original/_u/buggers.exe`](original/_u/buggers.exe) | binaire |
| [`tools/buggers-v5-solve.py`](tools/buggers-v5-solve.py) | patch NOP TerminateProcess |
| [`analysis/buggers.asm`](analysis/buggers.asm) | objdump |

## Réponse

Pas de clé. Objectif : **empêcher la mort d’Olly**.

| Patch | Détail |
|---|---|
| VA | `0x4011CB` … `0x4011D8` |
| Action | **NOP** (14 octets) sur `push`/`push`/`call TerminateProcess` |
| Effet | le process Olly n’est plus tué ; `ExitProcess` suit toujours |

```bash
python3 tools/buggers-v5-solve.py -q --check
# NOP@0x5cbx14
# check: OK

python3 tools/buggers-v5-solve.py --patch analysis/buggers.patched.exe
```

---

## Flow

1. Résolution manuelle d’API (`GetProcAddress` / `LoadLibraryA`) — kernel32 + user32.
2. `CreateToolhelp32Snapshot` + `Process32First`.
3. `FindWindowA(NULL, "OLLYDBG")` :
   - fenêtre absente → `FreeLibrary` + `ExitProcess(0)` ;
   - présente → boucle `Process32Next` / `lstrcmpA` sur **`OLLYDBG.EXE`** (et string **`DAEMON`** en data).
4. Match → `OpenProcess` + **`TerminateProcess`** → `ExitProcess(0)`.

Strings mortes (non référencées) : `not debugged!` / `u are debugging me :)`.

## Notes

- **Wine** : pagefault au walk TEB/kernel32 (`401005`) — pas de preuve live utile sous Wine ; reverse + patch offline.
- Write-up historique crackmes.de : *deibiz_xxl* (même patch NOP).
