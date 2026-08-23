# Unlockme #9 by sharpe

> [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9e0) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | sharpe (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (ASM) |
| **Type** | unlock code → hash → SMC stub → secret string |
| **Date d’origine** | 20.12.2009 |

## Fichiers

| Chemin | Rôle |
|---|---|
| [`original/nine.exe`](original/nine.exe) | PE32 |
| [`original/nine.txt`](original/_u/nine.txt) | règles (no patching) |
| [`tools/unlockme9-solve.py`](tools/unlockme9-solve.py) | hash / decrypt / MITM |
| [`analysis/bitmap3000.png`](analysis/bitmap3000.png) | bitmap décoratif du dialogue |
| [`analysis/wine-note.txt`](analysis/wine-note.txt) | SEH loop vs Wine |

## Réponse

| Champ | Valeur |
|---|---|
| Unlock code (ex.) | **`TP6A002v`** |
| Hash | **`0x4DA8E6BB`** |
| Secret | **`Secret: Sylvester!`** |

Tout code de longueur 8–31 dont le fold-hash vaut `0x4DA8E6BB` convient (d’autres exemples alnum len=8 : `cR9M00Bx`, `zQhk00HQ`, …).

```bash
python3 tools/unlockme9-solve.py --check
python3 tools/unlockme9-solve.py -q --check
# Secret: Sylvester!
python3 tools/unlockme9-solve.py --mitm   # autres codes alnum
```

Live : saisir le code → **Unlock Code** → **Check**. Le stub déchiffré écrit le secret en `0x4031AC` (pas de MessageBox « good boy » : le secret *est* la chaîne construite).

## Premier regard

```text
PE32 executable (GUI) Intel 80386
imports: DialogBoxParamA, GetDlgItemTextA, MessageBoxA, …
ressources: bitmap 269×92 (paysage), dialogue « Unlockme #9 by sharpe »
```

Entry obfuscée (jmp courts + SEH/`int3` avec compteur `0x403175 = 0x22`). Sous Wine ce countdown SEH peut faire overflow de pile — voir [`analysis/wine-note.txt`](analysis/wine-note.txt) (`jmp 0x4010A9` pour bypass).

## Flow

1. **Unlock Code** (`BN=0x3F3`) : `GetDlgItemTextA` → buffer `0x403188`, longueur ∈ **(8..31)**.
2. Hash fold → `[0x4031A8]`.
3. SMC : pour chaque dword de `[0x4011F2, 0x401236)` : `xor` avec le hash puis `ror hash, 8`.
4. Active **Check** (`0x3EC`), désactive edit / Unlock.
5. **Check** : installe un SEH (handler = MessageBox d’erreur) puis `call 0x4011F2`. Mauvais hash → exception → *Unlock Code Error*. Bon hash → stub qui matérialise le secret.

## Prédicat / stub

Hash (identique à Unlockme #8) :

```text
edi = 0
for c in code:
    edi += c
    rol edi, cl    ; cl = c (mask 5 bits côté CPU)
```

Decrypt #9 (différent du #8) : **dwords alignés**, clé qui tourne de 8 bits à chaque dword — pas le XOR glissant octet par octet du #8.

Plaintext cible (style #8 : écriture par `mov dword ptr [esi+…], imm`) :

```text
push eax / add eax,ecx / ror eax,cl / pop eax / jmp $+6
mov esi, 0x4031AC
mov dword ptr [esi],     'Secr'
mov dword ptr [esi+4],   'et: '
mov dword ptr [esi+8],   'Sylv'
mov dword ptr [esi+0xC], 'este'
mov dword ptr [esi+0x10],'r!'
jmp $+2 / pop eax / jmp eax    ; retour vers le DialogProc
```

Contrainte known-plaintext sur le motif `C7 06 53 65 63 72 C7 46 04 65 74 3A 20` → clé unique **`0x4DA8E6BB`**, d’où le secret **Sylvester**.

Fausse piste : un code genre `0fcoaacf` (hash `0x1D856EBE`) donne un prologue `55 8B EC 83…` puis du bruit — pas un stub cohérent.

## Vérification

```bash
python3 tools/unlockme9-solve.py --check
# code=TP6A002v hash=0x4da8e6bb
# secret=Secret: Sylvester!
# check: OK
```

MITM alnum 4+4 retrouve `TP6A002v` et d’autres préimages de `0x4DA8E6BB` en fraction de seconde une fois la table avant construite.

## Notes

- Même famille que Unlockme #8 (hash + stub « Secret: Name! »), mais crypto du stub différente (ROR8 sur la clé).
- Le bitmap du dialogue est purement cosmétique (heightmap).
- Pas de username/login : uniquement l’unlock code.
- Pas de commit/push (demande utilisateur).
