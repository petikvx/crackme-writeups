# alpmira — notes reverse (WIP / pending)

## Contexte

PE64 console ~51 KiB, même famille que [custom vmp](../6aa4b6d3585e8875bcbebf80/) (alpjs).  
Auteur : *Static recovery not intended — dynamic path only.*  
Commentaire public (ok, 2026-09-18) : VMP ~30 handlers, sponge 16 B / ~3000 rounds, 2× ARX finaux, tag 8 B ; clé flag = état **intermédiaire** entre les deux ARX (forcer le cmp → garbage). Rockyou KO ; inversion ARX en cours chez d’autres.

## Flow observé (`start` @ `0x14000BBA0`)

1. `sub_140001E00` init (API via PEB, pas d’IAT utile).
2. Gate PEB : `BeingDebugged==0` && `(NtGlobalFlag & 0x70)==0` sinon `sub_14000A930` (fail).
3. VEH (`AddVectoredExceptionHandler` résolu) + thread fond (intégrité / hash image).
4. Affiche UTF-16 `password : ` ; lit console (max ~63 wchar → ASCII si &lt;0x80).
5. Longueur password : **1..39** (`(len-1) > 0x26` → reject).
6. `sub_14000B640(pwd, len)` :
   - `sub_140007E50` : absorb / keystretch (marqueurs `KS_D0M_v6_dom_se…`, pad XOR).
   - Dispatch VM (bytecode XORé, table handlers `qword_14001E6F0`).
   - Succès ⇔ registre/flag VM `qword_14000E1A0[dword_14000E160+5] == 0`.
7. OK → écrit UTF-16 depuis `ctx+384 / +432 / +480` (flag) ; `ExitProcess(0)`.
8. KO → `ExitProcess(1)`.

## Anti-debug (labels + code)

PEB, timing, INT3/VEH counter, thread hash image, détection chaînes debugger/Frida, etc.  
Sous Wine : prompt visible puis process souvent mort avant saisie stable (anti-debug env).

## État

- [x] Scaffold + `decc` → `analysis/crackme.exe.i64.c`
- [x] Cartographie start / check / absorb
- [ ] Contournement anti-debug (x64dbg) + dump état sponge
- [ ] Inversion ARX finaux → password
- [ ] Solveur `-q` + `--check` Wine

Prochaine session : x64dbg MCP / dump après absorb ; calquer les outils `vmp_brute*` du sibling si le sponge est proche.

## Session x64dbg MCP (2026-09-20)

MCP `http://192.168.1.90:9094/` OK après ouverture firewall (80 tools).

### Anti-debug live (entry `crackme+0xBBA0`)

| Check | Contournement |
|---|---|
| `PEB.BeingDebugged` / `NtGlobalFlag&0x70` | WriteMem PEB+2=0, PEB+0xBC=0 |
| `NtQueryInformationProcess` (debug object) @ `+BC19` | forcer `eax=0` (HW BP) → `je +BC53` |
| Boucle 6× `int3` @ `+BC87` | si le debugger avale l’INT3 sans VEH, `ebx` s’incrémente ; fail si `ebx>=4` @ `+BCAA` |
| Patchs `.text` | **KO** — thread d’intégrité → exit rapide |

### État

Atteint plusieurs fois `+C0D7` → `sub_14000A930` (fail) avant le prompt password utile.
Prochaine piste : HW BP @ `+BCA7`/`+BCAA` forcer `ebx=0` ; options x64dbg « pass INT3 to debuggee » / plugin type ScyllaHide ; puis BP `+B640` (check password).


## Session x64dbg suite (stop demandé)

Bypass partiel validé :
- PEB dès system BP (`BeingDebugged=0`, `NtGlobalFlag=0`)
- Skip debug-object : `rip=start+0xBC53` après `+BC19`
- Skip boucle INT3 : après AddVEH, `ebx=0` + `rip=start+0xBC9E` (RemoveVEH conservé)
- Skip scan INT3 `AD50` : `rip=start+0xBCBF`

Bloqué ensuite sur `AEB0` / CreateThread / intégrité → process exit avant prompt stable.
Reprise : steper `AEB0`, suspendre le thread créé, HW BP `+B640`.

