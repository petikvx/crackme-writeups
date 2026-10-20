# crackmes.de's lafarges_crackme_1 by lafarge

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2f1`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2f1) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (LaFarge) |
| **Plateforme** | Windows PE32 GUI (MASM32, `DialogBoxParamA`), packé **Yoda's Crypter 1.2** |
| **SHA-256 (zip)** | `ecc4af4416300dac78c7400b8aed647ab0ecad497cee52bfbd67f256fe4fdd63` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/lafarge-crackme1.zip` | archive d'origine (`crackme.exe`, `readme.1st` : « Write the damn keygen :) ») — mot de passe zip `crackmes.one` |
| `analysis/crackme.unpacked-dump.bin` | image mémoire 0x400000–0x41a000 du process **après** décompactage (dump `/proc/<pid>/mem` sous Wine) |
| `analysis/code-disasm.txt` | désassemblage capstone de `.text` du dump (0x401000…) |
| `tools/lafarge-crackme1-solve.py` | keygen (`--name`, `-q`, `--check SERIAL`) |
| `tools/lafarge-crackme1-emu.py` | preuve : exécute la **vraie** routine du binaire sous unicorn et compare au keygen |

## Réponse

Keygen nom → serial `XXXXX-XXXXX-XXXXX` (nom de 4 à 84 caractères) :

| Nom | Serial |
|---|---|
| **`petik`** | `_!^ E-\%^SA--'SNC` (les espaces et ponctuations font partie du serial) |
| `abcd` | `VL!BX-"]@ --Y_AF&` |
| `lafarge` | `&^(DC-FMSG&-!IAF&` |

```bash
python3 tools/lafarge-crackme1-solve.py --name petik        # name='petik' serial=_!^ E-\%^SA--'SNC
python3 tools/lafarge-crackme1-solve.py --name petik -q
python3 tools/lafarge-crackme1-solve.py --name petik --check "_!^ E-\%^SA--'SNC"
python3 tools/lafarge-crackme1-emu.py                        # routine réelle (unicorn) == keygen
```

## Premier regard

```bash
unzip -P crackmes.one original/lafarge-crackme1.zip -d /tmp/lf
diec crackme.exe     # PE32, MASM 6.14 / Linker 5.12, Cryptor: Yoda's Crypter 1.2
objdump -x crackme.exe | head   # entry 0x419000, dernière section (0x419000, 0x1000) = stub
strings -n 5 crackme.exe        # imports user32 / kernel32 / winmm (waveOut*) — musique en ressource
```

Les imports visibles (`DialogBoxParamA`, `GetDlgItemTextA`, `lstrcmpA`, `waveOut*`…) sont ceux de l'exe d'origine, mais l'entry point (`0x419000`) est le stub de Yoda's Crypter : `.text`/données sont chiffrées sur disque. Les chaînes de messages sont en plus obfusquées en clair par l'auteur (XOR `0x15`).

## Flow

Dialogue : champ **nom** (ID `0x3ea`), champ **serial** (ID `0x64`), boutons `0x3ec` (check), `0x3ee` (quit), `0x3ed` (about). Au check : le nom est lu, `len <= 3` → message d'erreur ; sinon un serial de 15 octets est calculé, formaté `5-5-5` et comparé par `lstrcmpA` au serial saisi.

## Comment on trouve

### 1. Ancrage : décompacter

Sous Wine, l'exe se plante dans le stub après avoir déchiffré le code (`EXCEPTION_ACCESS_VIOLATION` à `eip=0`, au moment de résoudre les imports, `WINEDEBUG=+seh`) — donc pas de GUI utilisable, mais le code est déjà en clair en mémoire. On lance l'exe sous `xvfb-run -a wine`, puis on dumpe le process :

```python
f = open(f'/proc/{pid}/mem','rb'); f.seek(0x400000); open('dump.bin','wb').write(f.read(0x1a000))
```

(le pid du `crackme.exe` Wine ; piège : ne pas faire `pkill -f crackme.exe`, ça tue aussi le shell appelant). Un décompactage sous unicorn échoue vite : le stub parcourt le PEB (`fs:[0x30]`) pour trouver kernel32 et `GetProcAddress`.

`capstone` sur `dump[0x1000:]` donne `analysis/code-disasm.txt`. Le dialogue est à `0x4010b4` (`DlgProc`) ; le `WM_COMMAND` du bouton `0x3ec` démarre en `0x401122`.

### 2. Lecture de la routine (0x401142…0x4012da)

```asm
call GetDlgItemTextA        ; nom -> 0x40631b ; eax = n
cmp eax, 3 / ja ok          ; n <= 3 -> MessageBox erreur
call lstrcpyA(0x406343, 0x40631b)
; ecx = 15 * (n/15 + 1)  : longueur complétée (imul 0x88888889 = division par 15)
401190: mov dl,[eax+0x406000] / mov [eax+0x406343],dl   ; pour i in n..L-1 : buf[i] = T0[i]
4011b0: movzx edx,[esi+buf] / mov dl,[edx+T0] / xor [eax+buf],dl   ; boucle double
4011f0: xor [buf+eax..+4], [ecx-1+eax..]  ; repliement des blocs
401238: mov dl,[ecx+0x406100] ...          ; substitution T1
4012b0: rep movsb x3 + '-' en 0x406334 et 0x40633a
4012f0: lstrcmpA(0x40636b = serial saisi, 0x40632f = serial calculé)
```

Algorithme consolidé (n = len(nom), L = 15·(n//15+1) > n) :

1. `b = nom + [T0[i] for i in n..L-1]` (padding par la table T0 @ `0x406000`, 256 octets) ;
2. pour `i` de 0 à L-1, pour `j` de 0 à L-1 : `b[j] ^= T0[b[i]]` — **`b[i]` est relu à chaque `j`**, y compris quand `j == i` (piège : une version « `t = T0[b[i]]` précalculé » donne un résultat faux) ;
3. bloc 0 (15 octets) `^=` chaque bloc suivant (`b[j] ^= b[15k+j]`, k = 1..L/15-1) — le nombre d'itérations vient de `L/15` recalculé par le même `imul 0x88888889` ;
4. `out[j] = T1[b[j]]` pour j < 15 (table @ `0x406100`, uniquement des caractères imprimables `0x20–0x5f`, d'où un serial toujours tapable) ;
5. serial = `out[0:5]-out[5:10]-out[10:15]`.

### 3. Exemple `petik`

n = 5, L = 15 : `b = "petik"` + `T0[5..14]` ; double boucle `T0` ; un seul bloc (pas de repliement) ; substitution `T1` ⇒ 15 octets `_!^ E` · `\%^SA` · `-'SNC` ⇒ `_!^ E-\%^SA--'SNC` (le « `--` » vient du `-` séparateur suivi d'un `-` réel, premier octet du 3ᵉ groupe, sorti de `T1`).

> Les tables `T0`/`T1` sont reprises du dump (`0x406000`/`0x406100`) et embarquées en hex dans le solveur ; elles sont identiques à celles de l'image PE mappée (non modifiées à l'exécution).

## Vérification

- **Routine réelle sous unicorn** : `tools/lafarge-crackme1-emu.py` charge le dump et exécute l'asm d'origine de `0x401170` à `0x4012da` (nom pré-copié en `0x406343`/`0x40631b`) puis lit le serial en `0x40632f` :

```text
'petik'                  binaire="_!^ E-\\%^SA--'SNC" keygen="_!^ E-\\%^SA--'SNC" OK
'abcd'                   binaire='VL!BX-"]@ --Y_AF&' keygen='VL!BX-"]@ --Y_AF&' OK
'lafarge'                OK
'a_much_longer_name_over_15' (26 car., 2 blocs)  OK
'0123456789abcde' (15 car., L=30)                OK
'x'*44 (3 blocs)         OK
```

- La comparaison finale `lstrcmpA` (`0x4012f5`) est une égalité stricte avec le serial saisi : le serial calculé *est* le serial valide.
- **Limite** : pas de capture GUI. Le binaire d'origine plante sous Wine (stub Yoda's Crypter, `eip=0` pendant la résolution des imports), donc la preuve « live » porte sur le code déchiffré exécuté sous unicorn, pas sur le dialogue.
- KO : un serial ≠ calculé (ou nom ≤ 3 caractères, ou > 84) → `MessageBox` d'erreur ; `--check` renvoie `KO (attendu …)`.

## Notes

- Pas de GDB ni de debugger MCP utilisés (analyse statique + dump mémoire + unicorn).
- Le « packer » est un faux ami pour DIE seul : les chaînes visibles sont les imports, les messages restent XOR `0x15`.
- Le serial contient des espaces, `\`, `'`, `"` selon le nom : à copier tel quel.
