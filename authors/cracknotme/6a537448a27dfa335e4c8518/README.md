# CrackmesForBeginners (CFB) #6 — Quantum State / Memory patch

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a537448a27dfa335e4c8518) · id `6a537448a27dfa335e4c8518`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a537448a27dfa335e4c8518/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB6.exe`](original/CFB6.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb6-solve.py`](tools/cfb6-solve.py) | flag + vérif wine (`--run`) |

## Réponse

| | |
|---|---|
| **Flag** | **`pwn{6_st4g3_m3m0ry_p4tch_g0d}`** |

```bash
python3 tools/cfb6-solve.py -q
# pwn{6_st4g3_m3m0ry_p4tch_g0d}

python3 tools/cfb6-solve.py --run   # optionnel : patch + wine live
```

Le nom du flag le dit : ce n’est **pas** un simple password offline — il faut manipuler l’**état mémoire** (et l’`argc`).

---

## 1. Premier regard

```text
file original/CFB6.exe
# PE32+ executable (console) x86-64
```

Strings UI **chiffrées** (stream `imul` / XOR, buffers TLS). À l’exécution :

```text
Crackme #6 - Quantum State
Stage 1: SEED_1 generated: ********
Stage 2: Amnesia Gate  — magic token (chars 3–6 of SEED_1)
Stage 3: Unreachable Gate — wormhole collapsed
… (chemin quantum) Stage 4 / 5 / 6 → ACCESS GRANTED + Flag
```

Hashes :  
MD5 `5426e7227b1c7e4c968359bcddaef1a9` · SHA-256 `4133e300c07b8728ab3059fbe2c7bfcc6c4ffc56c2c95207d2a85f2fe4a7fdc7`.

---

## 2. Flow (deux portes d’entrée)

### A. Chemin « normal » (argc quelconque)

```text
main (0x14000a2a0)
  cmp argc, 0x270f (9999) → si égal, saut quantum (voir B)
  Stage 1: BCryptGenRandom → SEED_1 @ 0x1400452c0 (alphabet 0-9A-Z, 8 chars)
  affiche SEED_1
  **wipe SEED_1** (rep stos 8 zéros)  ← « Amnesia »
  Stage 2: lit un token, le compare à SEED_1[2:6] **déjà effacé**
           → seule réponse qui marche : **chaîne vide**
  génère SEED_2, backup XOR 0x5A @ 0x1400452f0, wipe SEED_2
  Stage 3: cmp [stage4_unlocked], 0x1337
           stage4_unlocked @ 0x140045318 = **0 en .data, jamais écrit**
           → « Wormhole collapsed » (volontairement injoignable)
```

### B. Chemin « quantum » (`argc == 9999`)

```text
wine CFB6.exe $(python3 -c "print(' '.join(['x']*9998))")
# argc = 1 + 9998 = 9999 = 0x270f

main:
  je  → call real_stage_engine (0x140009230…)
  Stage 4: vérifie SEED_1 non nul + lock == 0x1337
  SEED_3 généré
  Stage 5: Fusion Key = f(SEED_2_buf, backup)
  Stage 6: re-saisir le master cipher affiché
  → Flag
```

---

## 3. Prédicats clés

### Amnesia (Stage 2)

Après affichage, **wipe** de `SEED_1` :

```text
lea  rdi, [SEED_1]
xor  eax, eax
mov  ecx, 8
rep  stosb
```

Le prompt parle encore de « characters 3 to 6 », mais la comparaison lit la zone déjà nulle → **token vide**.

### Wormhole / lock (Stage 3–4)

```text
mov  eax, [0x140045318]   ; stage4_unlocked
cmp  eax, 0x1337
je   continue
; sinon wormhole collapsed
```

Aucune instruction du binaire n’écrit `0x1337` à cette adresse (constante seulement en `cmp`).  
**Patch mémoire** (ou édition `.data` avant lancement) obligatoire.

### Quantum argc

```text
; main prologue
cmp  ecx, 0x270f        ; argc
je   quantum_entry
```

### Fusion (Stage 5)

```text
for i in 0..7:
  expected[i] = byte[0x1400452e0+i] XOR byte[0x1400452f0+i] XOR 0x5A
```

Sur le chemin quantum avec backup `0x452f0` à zéro :

```text
expected[i] = SEED_3[i] XOR 0x5A
```

(les octets résultants ne sont en général **pas** ASCII ; les envoyer bruts sur stdin.)

### Stage 6

Le master cipher (20 chars `0-9A-Z`) est **affiché** après la fusion ; le recopier débloque :

```text
[+] ACCESS GRANTED! … Memory State Master!
Flag: pwn{6_st4g3_m3m0ry_p4tch_g0d}
```

---

## 4. Solution pratique (reproductible)

1. Patcher le PE (ou la mémoire live) :
   - `*(uint32_t*)0x140045318 = 0x1337`
   - `memcpy(0x1400452c0, "ABCDEFGH", 8)` (tout non-zéro suffit)
2. Lancer avec **9998** arguments :
   ```bash
   wine original/CFB6.exe $(python3 -c "print(' '.join(['x']*9998))")
   ```
3. À « Fusion Key » : envoyer `bytes(c ^ 0x5A for c in SEED_3)`.
4. À « Final Secure Cipher » : coller la chaîne `--> … <--`.
5. Lire le flag.

Le solveur fait le patch fichier + automation wine :

```bash
python3 tools/cfb6-solve.py --run
```

---

## 5. Notes

- Les strings UI sont chiffrées (pas dans `strings` en clair) — reverse sur le code de stages / globals `.data`.
- SEED via **BCryptGenRandom** + alphabet `0-9A-Z` (mod 36).
- Ce n’est **pas** une mini-VM ni un maze : c’est un **state machine mémoire** + anti-chemin (wormhole) + porte `argc`.
- Série CFB : #1 serial · #2 maze · #3 VM · #4 rotors · #5 Life · **#6 memory patch**.
