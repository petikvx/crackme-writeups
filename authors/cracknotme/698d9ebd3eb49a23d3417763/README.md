# CrackNotMe's MCM 2.0

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/698d9ebd3eb49a23d3417763) · id `698d9ebd3eb49a23d3417763`

Crackme **PE32+ console** x86-64 (MSVC / LTCG).  
Auteur site : **CrackNotMe** · suite de [Monster CrackMe 1.0](../6989ed7dfb46458f1ef6cee4/).

Dossier : `authors/cracknotme/698d9ebd3eb49a23d3417763/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CrackMe.exe`](original/CrackMe.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/mcm2-solve.py`](tools/mcm2-solve.py) | password / seed FNV / residuals |
| [`analysis/wine-success.txt`](analysis/wine-success.txt) | Wine : `Z1Y` → SUCCESS |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`Z1Y`** |

Aussi accepté : **`z1y`** (même casse sur les lettres). Les casses mixtes (`Z1y`, `z1Y`) échouent.

```bash
python3 tools/mcm2-solve.py -q
# Z1Y

python3 tools/mcm2-solve.py --check Z1Y
# OK

printf 'Z1Y\n' | wine original/CrackMe.exe
# [+] SUCCESS! ACCESS GRANTED.
```

> L’auteur a indiqué sur crackmes.one que `Z1Y` n’est pas forcément le « pass original », mais il **fonctionne** (confirmé ici sous Wine et par d’autres). Patching du `jnz` final est une autre voie (autorisée).

---

## 1. Premier regard

```text
file original/CrackMe.exe
# PE32+ executable (console) x86-64
```

Banner :

```text
=== MCM v2.0 ===
Enter Password:
```

Succès : `[+] SUCCESS! ACCESS GRANTED.` · Échec : `[-] FAILED. ACCESS DENIED.`

Hashes :  
MD5 `232d6626307f4bfe5a67e9cb5c1de5e4` · SHA-256 `553996fbd290ebbd59a9c62d744df4c5d1dbb1920606080e1703e5754d0cf7e6`.

Labels (site) : anti-debug PEB/TLS/DRx, strings XOR, hash custom, VM, résolution d’API obfusquée.

---

## 2. Parent / enfant

Même idée que MCM 1.0, renforcée :

```text
sans args (ou args ≠ flag)  → PARENT  (sub ~0x140011400)
argv == "--3a1f9b"          → CHILD   (prompt + VM)
```

- APIs kernel32 résolues au runtime (hash FNV-1a + PEB walk), pas toutes dans l’IAT.
- TLS callback : exige `X_TOKEN=DEADBEEF1337`, check `BeingDebugged`, DRx.
- Parent : `CreateProcess(DEBUG_*)`, boucle `WaitForDebugEvent`.
- Sur `INT3` du stub `0x1400161F0` : écrit une valeur dérivée du PID, pose **`DR2=0x1337C0DE`**, **`DR3=0xDEAD1337`**, saute le `0xCC`.

Stub (29 octets, FNV-1a → seed matrice **`0x412DF8B0`**) :

```asm
nop / push rbx / mov rbx,1234 / add rbx,rbx / pop rbx
xor rax,rax / xchg r8,r8 / int3 / nop
mov rax,[rcx] / add rax,0 / ret
```

---

## 3. Matrice

`FUN_140010A70` :

1. Seed = FNV-1a des 29 octets du stub (`0x412DF8B0`).
2. Matrice 64×64 via LCG `u = u*0x19660D + 0x3C6EF35F`, cellules `& 0x3FF` (`FUN_1400104D0`).
3. Vecteur password : 64 DWORDs = octets (0-paddés) (`FUN_1400107B0`).
4. Pour chaque ligne `i` : `dp = Σ mat[i][j]*pwd[j]` avec masque `& 0x3FF` par blocs de 16.
5. `residual[i] = (expected[i] - dp) & 0xFF` — table `@ 0x140036C90`.

```bash
python3 tools/mcm2-solve.py --seed
python3 tools/mcm2-solve.py --matrix Z1Y
```

---

## 4. XOR bytecode + VM

Les residuals (et clés dérivées du parent : PID / `r13` / constante style `0xB3E192F8A4D5C6B7` si DRx OK) XOR le bloc VM.

Interpréteur custom (`FUN_140010020`, style RISC-V allégé) : retour dans **x10**.  
Check final :

```asm
; VA 0x14001439C
cmp eax, 1
jnz fail          ; patch possible : NOP / jz inversé
```

Si `eax == 1` → déchiffrement XOR du message SUCCESS (`~0x14000D680`).

---

## 5. Vérification

```bash
printf 'Z1Y\n' | wine original/CrackMe.exe
# === MCM v2.0 ===
# [+] SUCCESS! ACCESS GRANTED.
```

Preuve : [`analysis/wine-success.txt`](analysis/wine-success.txt).

```bash
python3 tools/mcm2-solve.py --check Z1Y   # OK
python3 tools/mcm2-solve.py --check nope  # FAIL
```

---

## 6. Notes

- Évolution de MCM 1.0 : TLS + env token, API hashing, DRx, VM plus riche, seed = hash du stub INT3.
- Sous Wine le flow parent/enfant **fonctionne** ici (contrairement à MCM 1.0 qui plantait souvent sur le debug API).
- Patch alternatif (communauté) : NOP du `jnz` @ `0x14001439F` (file off `0x1379F`) → succès pour tout password.
- Ne pas patcher `original/` dans ce dépôt ; le solveur documente le password live.
