# koboldschwaengel's Medium

| | |
|---|---|
| **ID** | [`6951b52d0c16072f40f5a546`](https://crackmes.one/crackme/6951b52d0c16072f40f5a546) |
| **Auteur (site)** | koboldschwaengel |
| **Auteur (local)** | koboldschwaengel |
| **SHA-256** | `175e1ab4ccdb0264c35ee6c6a828734469d15e7a187a164d84146e2a08677649` |

## Origine

- Page : https://crackmes.one/crackme/6951b52d0c16072f40f5a546
- Download : https://crackmes.one/download/crackme/6951b52d0c16072f40f5a546
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   # binaire d'origine
analysis/   # IDA, screenshots
tools/      # solveur, recon
```

## Status

- [ ] reverse
- [ ] write-up
- [ ] solveur

---

# Write-up

| Fichier | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/extracted/crackme/` | `crackme.exe` + `Readme.md` extraits (hors `original/`) |
| `tools/koboldschwaengel-medium-solve.py` | solveur / `--check` sous Wine |

## Réponse

Pas de user : le mot de passe est une suite de **7 octets non ASCII** : `dd bf de ad 9c ec 9e`.

```bash
python3 tools/koboldschwaengel-medium-solve.py            # affiche l'hex
python3 tools/koboldschwaengel-medium-solve.py -q | wine analysis/extracted/crackme/crackme.exe
python3 tools/koboldschwaengel-medium-solve.py --check analysis/extracted/crackme/crackme.exe
```

## Premier regard

`crackme.exe` : PE32+ console x64 (MSVC, SHA-256 `c86df8ef…abc8`). Strings : `Enter the Password:`, `Correct!`, `Wrong password`. Imports `VirtualAlloc`, `VirtualProtect`, `FlushInstructionCache`, `IsDebuggerPresent` → code chargé à l'exécution. Le `Readme.md` donne les indices : *Runtime*, *find the right address*, *Keygen with XOR*.

## Flow

1. Lecture de 11 octets max sur stdin, retrait du `\n` (`0x140001030`–`0x140001086`).
2. 0x71 octets de shellcode sont construits sur la pile par 28 `mov dword [rbp-…]` immédiats (`0x1400010b6`–`0x140001173`), copiés dans une page `VirtualAlloc` (RWX via `VirtualProtect`).
3. Déchiffrement (`0x140001232`) : `byte ^= IsDebuggerPresent() + 0x10` → clé **0x10** sans debugger (sous debugger la clé change et le code devient du bruit).
4. `FlushInstructionCache`, puis `call rdi` (`0x140001292`) avec `rcx=buffer`, `rdx=longueur` ; `al` = résultat (forcé à 0 si debugger).
5. Un switch aplati (control-flow flattening, états `0x17,0x21,0x42,0x66,0x99,0xad,0xde`, table d'octets en `.text+0x3f4`) manipule des prédicats opaques sur `al` ; j'ai simulé la machine d'états : `al=1` → `Correct!`, `al=0` → `Wrong password`. Seul le résultat du shellcode compte.

## Comment on trouve

- Ancrage : `objdump -d -M intel crackme.exe` ; les immediates u32 LE à `0x1400010b6…` sont concaténés dans l'ordre (pas de 4 octets, 113 octets avec le `0xd3` final de `0x1400011e8`).
- XOR avec 0x10 puis `objdump -D -b binary -mi386:x86-64 -M intel` donne le shellcode :

```asm
cmp  rdx,7 ; jne fail              ; longueur exactement 7
mov  [rsp],"pass" ; [rsp+4]="12" ; [rsp+6]="3"   ; référence "pass123"
loop: r9b = input[i] ; test r9b ; je fail
  cl = (i&1)<<3 ; dx = 0xdead >> cl ; dl ^= r9b
  cmp dl,[ref+i] ; jne fail
```

- Clé par position : `0xdead >> 0` → octet bas `0xad` (i pair), `0xdead >> 8` → `0xde` (i impair). Donc `input[i] = "pass123"[i] ^ clé[i]` :
  `70^ad=dd`, `61^de=bf`, `73^ad=de`, `73^de=ad`, `31^ad=9c`, `32^de=ec`, `33^ad=9e`.
- Pièges : la référence `pass123` n'est **pas** le mot de passe (tentative piégeuse) ; le déchiffrement dépend du debugger (le dumper sous x64dbg avec ScyllaHide/IsDebuggerPresent=0 ou le faire à la main comme ici) ; l'entrée doit être envoyée en octets bruts (pipe, pas de saisie clavier ASCII).

## Vérification (Wine, `xvfb-run -a wine`)

```text
$ solveur --check crackme.exe
Enter the Password:
Correct!
$ printf 'passwd1\r\n' | xvfb-run -a wine crackme.exe
Wrong password
```

## Notes

Aucun GDB/x64dbg/IDA utilisé : analyse 100 % statique (`objdump`) + simulation Python + preuve Wine. Pas de screenshot.
