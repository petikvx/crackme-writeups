# crackmes.de's the_xor_algorithm (ksydfius)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cbc5) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | ksydfius (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MASM32, Linker 5.12) |
| **Type** | cryptanalyse — clé XOR 32 octets (known-plaintext) |
| **Diff** | 1 |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/ksydfius2.zip` | archive site (sha256 catalogue) |
| `original/_u/the_xor_algorithm.exe` | PE32 GUI |
| `original/_u/ReadMe.txt` | énoncé (pas de brute 2²⁵⁶) |
| `tools/xor-algorithm-solve.py` | recovery KEY + `--check` |
| `analysis/wine-check.c` / `.exe` | même prédicat sous Wine |

## Réponse

| Champ | Valeur |
|---|---|
| **KEY** (dialog, 32 chars) | **`Tv8(@*a;FHBADIvhadyfgpar12Af5t[a`** |
| Tag dans le MessageBox | **`science_m00nlight`** |

Pas de username : un seul champ **KEY**.

```bash
python3 tools/xor-algorithm-solve.py -q
# Tv8(@*a;FHBADIvhadyfgpar12Af5t[a
python3 tools/xor-algorithm-solve.py --check
# check: OK
wine analysis/wine-check.exe
# OK key=Tv8(@*a;FHBADIvhadyfgpar12Af5t[a
```

Sous Windows / Wine+display : coller la KEY → **OK** → MessageBox *Nice one!* dont le corps clair se termine par *The answer is science_m00nlight*.

## Premier regard

```text
PE32 executable (GUI) Intel 80386, 4 sections
Linker: Microsoft Linker(5.12) · Compiler: MASM(6.14) / MASM32
Imports: DialogBoxParamA, GetDlgItemTextA, MessageBoxA, EndDialog, …
SHA-256 exe: 197a9d16c73d6b98c74295a4701820339adc0411b919fcaee1164b753809effa
```

`.data` commence par une citation de Hawking (clair), puis un blob « chiffré », titre `Nice one!`, et un second blob (MessageBox body).

## Flow

1. `DialogBoxParamA` (template `0x65`) — edit KEY id `0x3E9`, bouton OK `0x3EB`.
2. `GetDlgItemTextA` → buffer `0x403264` ; **eax = longueur doit être `0x20`**.
3. Routine `0x401041` : transforme in-place le buffer `0x403000` (citation) avec la KEY.
4. Compare 0xF0 octets avec la cible `0x4030F1` ; sinon `ExitProcess`.
5. Succès : `0x40100C` déchiffre le corps `0x4031EC` (100 octets) → `MessageBoxA("Nice one!", …)`.

## Prédicat

Index initial `idx = 0` ; pour chaque octet jusqu’au NUL (ici 240 octets de citation) :

```text
buf[i] ^= key[idx]
buf[i]  = (buf[i] + idx) & 0xFF
idx     = buf[i] % 32
```

(`div ebx` avec `ebx←32` après `add bl, buf[i]` — comme `ebx` est remis à 0 par le helper `0x401000`, l’index suivant est simplement `buf[i] % 32`.)

Known-plaintext : citation @ `0x403000` vs cible @ `0x4030F1` ⇒ chaque pas fixe `key[idx]` :

```text
key[idx] = plain[i] ^ ((target[i] - idx) & 0xFF)
```

Aucune collision sur les 32 octets → KEY unique. Le déchiffrement du MessageBox (ordre inverse : `sub` puis `xor`, index pris sur l’octet chiffré d’origine) donne :

```text
Great job if you can read this message then you are well deserved :) The answer is science_m00nlight
```

## Vérification

- Solveur : recovery + transform + message (`--check`).
- Wine (sans display) : `analysis/wine-check.exe` relit le PE et rejoue le prédicat — **OK**.
- x32dbg MCP : pas de session active sur cet exe (hôte debug / chemin Linux) ; reverse 100 % statique + harness.

## Notes

- Le ReadMe annonce ~2²⁵⁶ possibilités : longueur 32 **octets**, mais le known-plaintext casse la clé en une passe (pas de brute).
- Ce n’est **pas** un keygen name→serial.
- Ne pas patcher `original/` ; le harness vit sous `analysis/`.
