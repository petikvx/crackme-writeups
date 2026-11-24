# hwenzy's c++ crackme 6/10

| | |
|---|---|
| **ID** | [`6a42f1446840520e01b21fc6`](https://crackmes.one/crackme/6a42f1446840520e01b21fc6) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | hwenzy |
| **Plateforme** | Windows PE32+ x86-64, console (C++) |
| **SHA-256** | `89c05787c314c249147958425ad4f9f3374c7e0ded8d52c1636fa9e4eb6fe9ef` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme_6_10.exe` | binaire d'origine (non modifié) |
| `analysis/crackme.asm` | `objdump -d -M intel` complet |
| `tools/hwenzy-solve.py` | vérificateur / licence connue / lanceur Wine |
| `tools/hwenzy-bf.c` | brute-force C (OpenMP) du prédicat 32 bits |

## Réponse

Pas de username : le crackme prend une **licence de 12 caractères** (argument ou stdin). `petik` n'est donc pas applicable.

| Licence | Résultat |
|---|---|
| **`i9aaaaaaus91`** | `[+] VALID` |
| `2gcaaaaad7r3` | `[+] VALID` |
| `AAAAAAAAAAAA` | `[-] FAIL` |

```bash
python3 -I tools/hwenzy-solve.py -q                          # licence connue
python3 -I tools/hwenzy-solve.py --check i9aaaaaaus91        # prédicat Python
python3 -I tools/hwenzy-solve.py --run original/crackme_6_10.exe   # preuve Wine
python3 -I tools/hwenzy-solve.py --search                    # régénère des licences (gcc + OpenMP)
```

Le prédicat n'impose que **32 bits** de contrainte sur 96 bits d'entrée : il existe ~2^64 licences valides, elles se trouvent par force brute (~20 s sur 8 cœurs).

## Premier regard

- `file` : PE32+ console x86-64, 6 sections (`.text .rdata .data .pdata .fptable .reloc`).
- `strings` : `Press Enter to exit...`, `[+] VALID`, `[-] FAIL`. Les chaînes `uespemosH`, `modnarodI`, `arenegyl3`, `setybdetL3` sont des immediates `movabs` collés à leur opcode (`H`, `I`, `3`, `L3`) : en LE ce sont `somepseu`, `dorandom`, `lygenera`, `tedbytes`, soit les constantes d'init de **SipHash**.
- Prompt `License: ` si aucun argument ; sinon `argv[1]`. Lecture de 63 caractères max, `\r\n` retiré.

## Flow

`main` = `0x140001590` :

1. `0x140001960` : lit le PEB (`BeingDebugged` à `+2`, `NtGlobalFlag` à `+0xbc` & 0x70) → `[0x140029d38]` vaut 0 hors débogueur.
2. Licence copiée sous `rbp+0x50`, pointeur stocké en `[0x140029d10]`.
3. Un `AddVectoredExceptionHandler` (appel `[0x14001c000]`, handler `0x140001350`) puis un appel protégé par SEH vers `0x1400013c0` (la routine de calcul).
4. `0x140001b90` compare : `v40 ^ v44 ^ v48 ^ v4c == 0xd390a0ba` (globaux `0x140029d40/44/48/4c`, écrits par les petits setters `0x140001bc0/bd0/be0/bf0`) → `al` = valide → affiche `[+] VALID` / `[-] FAIL`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/crackme_6_10.exe > analysis/crackme.asm` (IDA headless `decc` indisponible dans l'environnement). Prédicat dans `0x1400013c0`, hash en `0x140001070`, comparaison finale en `0x140001b90`.

**1. La fonction de hash `0x140001070(buf, len, k0, k1)`** : init `v0=k0^"somepseu"`, `v1=k1^"dorandom"`, `v2=k0^"lygenera"`, `v3=k1^"tedbytes"`, rotations `ror 0x33/0x20/0x30/0x2f/0x2b` (= `rotl 13/32/16/21/17`), un `xor rcx,0xff` en finalisation, boucle de 2 rondes par bloc de 8 octets et tail `len<<56 | octets` (jump table `0x14000132c`) : c'est **SipHash-2-4** standard (reimplémenté en Python, accord avec le binaire).

**2. `0x1400013c0`** vérifie `strlen(L) == 12` (`cmp rax,0xc`) puis calcule 5 hash de la licence (len 12) :

```asm
; H1 : k0=0x0f0e0d0c0b0a0908  k1=0x0102030405060708 -> v40 = hi32 ^ lo32   (call 0x140001bc0)
; H2 : k0=0xdeadbeefcafebabe  k1=0x0102030405060708 -> rbp
; H3 : k0=0xfeedc0deaabbccdd  k1=0x0807060504030201 -> rsi
; H4 : k0=0xa5b4c3d2e1f00011  k1=0x1122334455667788 -> clé XTEA [29d28],[29d2c]
; H5 : k0=0x8877665544332211  k1=0x01100ffeeddccbba -> clé XTEA [29d30],[29d34]
v44 = lo32(H3) ^ lo32(H2) ^ [29d38](PEB) ^ r15d(anti-debug) ^ rdtsc_delta   ; call 0x140001bd0
```

Les termes anti-debug valent 0 hors débogueur : `NtSetInformationThread(ThreadHideFromDebugger)` retourne 0 (`0x1400019b0`, API retrouvées par hash djb2 `*33+c` dans la PEB, d'où l'absence d'imports parlants), delta `rdtsc` ≤ 1 000 000 (`0x140001990`).

**3. L'`ud2` (`0x140001523`)** lève `0xc000001d` → handler `0x140001350` : `CheckRemoteDebuggerPresent` (`0x140001b50`, 0 si non débogué), puis `0x140001c00` (XTEA-like déroulé qui déchiffre 128 bits de `.data` `0x140029000` avec la clé H4/H5 et compare à `(H3,H2)` ; si égalité `v48 = 0x5e4d3c2b`, sinon 0 — `0x14000266f`), puis `v4c = dbgflag ^ 0x11223344 = 0x11223344`, `RIP += 2`.

**4. Le piège** : le chemin « XTEA » est une égalité 128 bits sur H2/H3 (≈ preimage), infaisable ; mais `0x140001b90` accepte aussi `v48 = 0`. Il reste donc seulement :

```
fold(H1) ^ lo32(H2) ^ lo32(H3) ^ 0x11223344 == 0xd390a0ba
<=> fold(H1) ^ lo32(H2) ^ lo32(H3) == 0xc2b293fe
```

(`fold(h) = (h>>32) ^ (h & 0xffffffff)`). Contrainte de 32 bits sur une licence de 96 bits → force brute. `tools/hwenzy-bf.c` fixe un préfixe de 8 caractères (état SipHash après le 1er bloc précalculé pour les 3 clés) et énumère les 4 derniers (`[a-z0-9]`, 36^4 = 1,7 M) ; 3000 préfixes (~19 s, 8 threads) donnent `i9aaaaaaus91`, `2gcaaaaad7r3`.

## Debug GDB (pas à pas)

Non utilisé (PE sous Wine, analyse statique + preuve live). Pas de debug x64dbg actif sur ce binaire.

## Vérification

```text
$ xvfb-run -a wine original/crackme_6_10.exe i9aaaaaaus91   -> [+] VALID
$ xvfb-run -a wine original/crackme_6_10.exe 2gcaaaaad7r3   -> [+] VALID
$ xvfb-run -a wine original/crackme_6_10.exe AAAAAAAAAAAA   -> [-] FAIL
$ python3 -I tools/hwenzy-solve.py --check AAAAAAAAAAAA     -> KO
```

Le SHA-256 de `original/` est inchangé.

## Notes

- Les licences trouvées ne sont **pas** la licence « prévue » par l'auteur (celle qui déchiffre le bloc XTEA et met `v48 = 0x5e4d3c2b`) : elles exploitent le fait que la compare finale tolère `v48 = 0`. Cette licence d'origine n'a pas été retrouvée (preimage 128 bits).
- Sous débogueur, `v44`/`v4c` changent (flags PEB, `CheckRemoteDebuggerPresent`, `rdtsc`) et aucune licence ne valide : lancer sans debugger pour la preuve.
- Un décalage `rdtsc` > 1e6 cycles (machine très chargée) peut faire échouer un essai valide ; relancer.
