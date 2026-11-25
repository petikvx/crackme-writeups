# memetic0's Veil

| | |
|---|---|
| **ID** | [`6a8f377348cda5a2aaa3db51`](https://crackmes.one/crackme/6a8f377348cda5a2aaa3db51) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | memetic0 |
| **Plateforme** | Linux ELF x86-64, statique, strippé (`veil` v3.1, ZIP `crackmes.one`) |
| **SHA-256 (zip)** | `126f4661e21c47dadd2b47c1518c6ec2370f022f3ec5ae6f1075a1bf470d18a1` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/veil.zip` | archive d'origine (non modifiée) : `veil` + `README.txt` |
| `analysis/extracted/` | zip extrait (`unzip -P crackmes.one`) |
| `analysis/veil.asm` | `objdump -d -M intel` |
| `analysis/tables-410760.bin` | dump .bss `0x410760..0x410f60` (vraies tables, voir pièges) |
| `tools/veil-solve.py` | solveur z3 (`--check` = test contre le binaire) |
| `tools/veil-dump-tables.py` | script gdb qui récupère les tables en masquant le tracer |

## Réponse

Pas de username : une clé de 128 hex (les clés valides sont nombreuses, le solveur en sort une, déterministe) :

```
5070ed578e3ac5d1734d619f4b17b89181fe485b3c98b828d4aaeeff230ea624e7c729cf9eaa898526b645dd7ff01a642176700b4e416d7909a19f3ede9cf6d9
```

```bash
python3 tools/veil-solve.py --check   # imprime la clé puis lance: veil --quiet <clé> → rc 0
./analysis/extracted/veil <clé>       # affiche 13 lignes puis "access granted"
```

## Premier regard

- `file` : ELF64 statique strippé ; `strings` : seulement usage (`--quiet`, `--steps N`, `--seed HEX`), les messages `access granted/denied` sont obfusqués.
- `README.txt` : « 128 hex = clé », « The last line is not a password. It is a descendant », « The machine wants a beginning, and the middle is watching ». → c'est un **automate cellulaire** : la clé est l'état initial, la 13e ligne (la « descendante ») est l'état final, et le « milieu » est l'état intermédiaire.
- Affichage : 13 lignes de 64 cases (états 0..12).

## Flow

`main` = `0x4010c0` (trouvé via l'entry `0x4017e5` : `mov rdi,0x4010c0` avant le jump vers `__libc_start_main`).

1. Parse des options, clé (de argv ou stdin) : 128 caractères hex exigés (`0x40137b: cmp rax,0x80`).
2. Hex → 64 octets (`0x4013e1..`), puis dépliage en **512 octets valant 0/1**, MSB d'abord (`0x401440` : `bt esi, ~i & 7`) dans `[rsp+0x1ab0]`.
3. Boucle `0x4014b0` : 12 appels de la fonction de pas `0x4019a0(src,dst,step)`, avec échange de buffers. À `ebx==6` l'état est copié dans `[rsp+0x1eb0]` (« le milieu »).
4. À `ebx==12` : `0x401cd0(état12, état6)` ; accepté si le retour vaut `0x400`.

## Comment on trouve

### Le pas (`0x4019a0`)

```asm
movzx edx,[rdi+rcx-1]   ; old[i]        (rcx = i+1)
movzx eax,[rdi+rcx]     ; old[i+1]  (and 0x1ff : circulaire)
add edx,edx / or eax,edx
lea edx,[rcx+0x1fe] ; and 0x1ff ; movzx edx,[rdi+rdx] ; shl edx,2 ; or eax,edx  ; old[i-1]<<2
xor eax,5
movzx eax,[r8+rax]      ; r8 = 0x40b480 + (step&3)*8  → 4 tables de règle de 8 entrées
xor eax,1
mov [rsi+rcx-1],al
```

Donc `new[i] = RULES[step&3][ (old[i-1]<<2 | old[i]<<1 | old[i+1]) ^ 5 ] ^ 1`, anneau de 512 cellules. Les 4 tables (`0x40b480`) :
`[1,0,1,1,0,1,0,0] [1,0,1,0,0,1,1,0] [1,1,0,1,0,0,1,0] [1,0,0,1,1,0,1,0]`.

### Le prédicat (`0x401cd0`)

Deux boucles de 512 tours. Pour chaque cellule : `edx = état[i] ^ M[i]` ; `esi = (edx==0)` (`neg/or/sar 31/add 1`) ; `esi |= mask[i]` ; `eax += esi` (l'addition est déguisée en `(a^b)+2(a&b)`). Le reste (`r10`, shifts) est un hash inutile au verdict.
- Boucle 1 : état12 contre `M=0x410d60`, `mask=0x410960` ;
- Boucle 2 : état6 contre `M=0x410b60`, `mask=0x410760`.

Total `1024 = 0x400` ⇔ chaque cellule vérifie `état==M` **ou** `mask==1`. Les masques sont presque tous à 1 : **seulement 2 cellules contraintes à l'étape 6 et 504 à l'étape 12** (sur 512). On a donc 512 inconnues (la clé) et ~506 équations sur 12 pas d'automate → z3 (BitVec 1 bit, `If` sur les 8 entrées de table) en sort une solution immédiatement. Pas besoin d'inverser l'automate.

Assemblage : 512 bits du modèle z3 → paquets de 8 (MSB d'abord, comme `0x401440`) → 64 octets → 128 hex.

### Piège principal : tables leurre sous débogueur

Les tables `0x410760..0x410f60` sont en .bss, remplies à l'exécution. Le binaire lit **deux fois `/proc/self/status`** (`strace`) et, si `TracerPid` ≠ 0, charge d'**autres** valeurs (la partie `M_fin`, octets 0x600+ du dump, diffère). Conséquences observées :

- premier dump sous gdb → solveur → clé « granted » sous gdb/strace mais **`access denied` en natif** ;
- `strace` et gdb font afficher `access granted` à une clé fausse en natif.

Solution : `tools/veil-dump-tables.py` (gdb Python) : `catch syscall read`, après le `read` de `/proc/self/status` on réécrit les chiffres de `TracerPid` par `0`, puis breakpoint sur `0x401cd0` et dump de la .bss. Le solveur lit ce dump (`analysis/tables-410760.bin`).

## Debug GDB (pas à pas)

```bash
cd authors/memetic0/6a8f377348cda5a2aaa3db51
gdb -q -batch -x tools/veil-dump-tables.py analysis/extracted/veil   # VEIL_KEY=<hex> pour changer la clé d'amorce
```

- Binaire non-PIE (base `0x400000`) : adresses absolues. `b *0x401cd0` = fonction de comparaison ; à l'arrêt `rdi` = état 12, `rsi` = état 6 (512 octets 0/1 chacun, `dump binary memory`).
- Vérification du modèle : j'ai simulé en Python les 12 pas depuis la clé et comparé aux dumps de `rdi`/`rsi` : égalité exacte (`état12`, `état6`).
- Piège : sous gdb non masqué les tables sont celles du leurre (voir au-dessus) ; le contrôle de temps (`0x403fd0` / `comisd` en `0x401515`) n'a pas été déclenché avec les breakpoints utilisés.

## Vérification

```text
$ python3 tools/veil-solve.py --check
5070ed578e3ac5d1734d619f4b17b89181fe485b3c98b828d4aaeeff230ea624e7c729cf9eaa898526b645dd7ff01a642176700b4e416d7909a19f3ede9cf6d9
veil rc = 0 (0 = accepté)

$ ./analysis/extracted/veil <clé> | tail -1
access granted

$ ./analysis/extracted/veil --quiet $(printf 'ab%.0s' $(seq 64)); echo $?
access denied
1
```

(Exécution native, sans tracer.) Le binaire d'origine n'est pas modifié.

## Notes

- Pas de nom d'utilisateur (donc pas d'exemple `petik`).
- Le solveur dépend de `z3-solver` (`pip install z3-solver`) et du dump de tables ; régénérable avec le script gdb.
- Ce n'est pas un mot de passe : la clé n'est qu'une graine, des milliers de graines passent (seules 506 cellules sont contraintes).
