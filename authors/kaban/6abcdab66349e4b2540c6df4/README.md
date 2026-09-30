# KAban's custom protector

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abcdab66349e4b2540c6df4) · id `6abcdab66349e4b2540c6df4`

PE64 console MSVC, **protecteur custom (VM + OLLVM)**. Diff. site **4.0**.  
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/0LLRi9C10LHQuCDQvNC10L3Rjw.exe`](original/0LLRi9C10LHQuCDQvNC10L3Rjw.exe) | binaire d’origine (ZIP) |
| [`tools/custom-protector-solve.py`](tools/custom-protector-solve.py) | extraire le message / `--check` live |

## Réponse

Pas de password, serial, ni username : le programme **ne lit pas stdin**. Le prédicat est une chaîne de 32 blobs VM sur un état 128 octets initialisé en dur. Si le check passe (il passe toujours avec ces constantes), `main` imprime :

```text
Reverse this shit, find where this message is printed.
```

Exit code **0**. Chaîne en clair à `0x1400370d7` (`.rdata`), xref unique depuis `sub_140001340` (`main`).

```bash
python3 tools/custom-protector-solve.py -q
# Reverse this shit, find where this message is printed.

python3 tools/custom-protector-solve.py --from-pe -q
python3 tools/custom-protector-solve.py --check
```

Preuve live (Windows) :

```text
Reverse this shit, find where this message is printed.
```

---

## 1. Premier regard

```text
PE32+ executable (console) x86-64, for MS Windows
sha256  269f66eb409a8076e60f9cf7402b6d5dba94a33331d19bd2cd49da220a769e53
md5     63809c874f7ca1de998cecf519a5fe95
size    269312
entry   RVA 0xcf80  imagebase 0x140000000  subsystem CONSOLE
```

Sections classiques MSVC : `.text` ~0x27442, `.rdata`, `.data`, `.pdata`, `.fptable`, `_RDATA`, `.reloc`. **Pas** d’UPX.

ZIP member : `0LLRi9C10LHQuCDQvNC10L3Rjw.exe` (ASCII ; c’est du base64 de UTF-8).

Imports : **uniquement** `KERNEL32.dll` (CRT statique). I/O console via `WriteFile` / `ReadFile` / `ReadConsoleW`. `IsDebuggerPresent` et `VirtualProtect` sont du CRT (`__scrt` / guard `.fptable`), pas un anti-debug du crackme.

`strings` montre surtout du bruit (bytecode VM pris pour des C-strings : motif `X<a+/`) plus la chaîne de succès en clair et les messages iostream (`ios_base::failbit set`, …).

Ancrage IDA (MCP `ida`, worker headless) :

```text
start           0x14000cf80   → cookie + CRT
sub_14000CE00                 → CRT startup, appelle main
sub_140001340   main          size 0x18a
sub_140002B80   wrapper VM-A  (prédicat opaque OLLVM)
sub_140002BD0   interpréteur VM-A   ~21 KiB  (Hex-Rays ~3200 lignes)
sub_140007DF0   interpréteur VM-B   ~2.8 KiB
```

---

## 2. Flow

1. `start` → `sub_14000CFA0` (security cookie) → `sub_14000CE00` (CRT).
2. CRT appelle `sub_140001340(argc, argv, env)` — **`main`**.
3. `main` alloue un `vector`-like 24 octets + buffer **128 octets** (4 slots de 32).
4. Initialise les 4 slots (constantes « crypto-looking » + padding zéro).
5. Chaîne de 5 wrappers VM, chacun avec `ctx[0] = buffer`, `ctx[1] = valeur` :
   - `sub_140001000(buf, 0x1337BEEFCAFE0000)` — 10 blobs **VM-A**
   - `sub_1400010E0(buf, v2)` — 1 blob **VM-B**
   - `sub_140001130(buf, v3)` — 10 blobs **VM-A**
   - `sub_140001210(buf, v4)` — 1 blob **VM-B**
   - `sub_140001260(buf, v5)` — 10 blobs **VM-A**
6. Si le dernier retour est **non nul** → `operator<<(cout, "Reverse this shit…\n")`, `return 0`.
7. Sinon `return 1` (pas de message). Pas d’autre I/O.

---

## 3. Comment on trouve le message

### 3.1 `main` en clair (Hex-Rays)

Le protecteur virtualise le **corps** du check, pas le glue C++. `sub_140001340` se lit directement :

```c
// sub_140001340 @ 0x140001340  (main)
v0 = operator new(24);
lpMem = v0;                 // vector {begin, end, cap}
v1 = operator new(128);
*lpMem = v1;
lpMem[1] = lpMem[2] = v1 + 128;

*(QWORD*)(v1 +  0) = 0x1020304050607080;
*(QWORD*)(v1 +  8) = 0x9E3779B97F4A7C15;   // φ·2^64
*(OWORD*)(v1 + 16) = 0;

*(QWORD*)(v1 + 32) = 0xA1B2C3D4E5F60718;
*(QWORD*)(v1 + 40) = 0x517CC1B727220A95;   // constante splitmix / Weyl
*(OWORD*)(v1 + 48) = 0;

*(QWORD*)(v1 + 64) = 0x00001337BEEFCAFE;
*(QWORD*)(v1 + 72) = 0x6A09E667F3BCC908;   // SHA-256 H0
*(OWORD*)(v1 + 80) = 0;

*(QWORD*)(v1 + 96) = 0xFEDCBA9876543210;
*(QWORD*)(v1 +104) = 0xBB67AE8584CAA73B;   // SHA-256 H1
*(OWORD*)(v1 +112) = 0;

v2 = sub_140001000(v1, 0x1337BEEFCAFE0000);
v3 = sub_1400010E0(*lpMem, v2);
v4 = sub_140001130(*lpMem, v3);
v5 = sub_140001210(*lpMem, v4);
if ( sub_140001260(*lpMem, v5) ) {
    std::operator<<(cout, "Reverse this shit, find where this message is printed.\n");
    return 0;
}
return 1;
```

La chaîne est un immediate / offset `.rdata` classique. Xref :

| | |
|---|---|
| String | `0x1400370d7` |
| Unique xref | `0x140001464` OFFSET dans `sub_140001340` |

Un `strings` / search IDA sur `Reverse this` suffit ; le VM n’enveloppe pas ce `operator<<`.

### 3.2 Wrappers = listes de blobs

Chaque `sub_140001000` / `1130` / `1260` pose un gros contexte stack (`_QWORD v3[645]`, `v3[0]=a1`, `v3[1]=a2`) puis enchaîne 10 appels :

```c
sub_140002B80(&unk_140029000, v3);
sub_140002B80(&unk_140029150, v3);
// … 8 autres pointeurs .rdata …
return sub_140002B80(&unk_140029C30, v3);
```

Les deux fonctions « courtes » (`10E0`, `1210`) appellent **VM-B** une fois (`unk_140029D70`, `unk_14002B8C0`).

**32 blobs** au total, tous dans `.rdata` à partir de `0x140029000`.

### 3.3 En-tête des blobs VM-A

Les 30 blobs VM-A commencent par :

```text
u32  checksum / clé   (varie)
u32  0x00000120       (taille utile typique ; parfois le gap au blob suivant est 0x130–0x180)
u32  0x2b613cXX       (corps ; IDA y voit des « strings » `b<a+/`, `c<a+/`, …)
```

Exemples (hex file-order LE) :

```text
140029000  79287d9e 20010000 623c612b …
140029150  039ec2b3 20010000 633c612b …
14002c750  607db016 20010000 623c612b …
```

Les deux blobs VM-B sont plus gros (`u32` taille `0x0dd7` / `0x0e83`) et un header différent (`… 00de2a17 58e24373`).

### 3.4 Wrapper OLLVM (VM-A)

```c
// sub_140002B80
while (1) {
    result = sub_140002BD0(bytecode, ctx, 0);
    // dword_140040244 < 10  ||  ((b*(b+1)) & 1) == 0
    if (dword_140040244 < 10 || (((BYTE)dword_140040248 * ((BYTE)dword_140040248 + 1)) & 1) == 0)
        break;
    sub_140002BD0(bytecode, ctx, 0);   // mort
}
```

`n*(n+1)` est toujours pair → `(n*(n+1)) & 1 == 0` **toujours**. La boucle sort dès le premier `sub_140002BD0`. Le second appel et le `while` sont du **control-flow mort** (OLLVM / bogus predicate), cohérent avec le label site.

L’interpréteur `sub_140002BD0` (~21 KiB, beaucoup d’alloca / SIMD) est le cœur du protecteur. Inutile de le lifter pour la réponse : `main` imprime déjà le message si le check (déterministe, constantes en dur) réussit.

### 3.5 Ce que ce n’est pas

- Pas de keygen name→serial, pas de maze, pas de HWID.
- `IsDebuggerPresent` : handler CRT (`sub_140017CC0`, unwind / fail-fast), pas un test du crackme.
- `VirtualProtect` : passage `.fptable` en PAGE_READONLY (`sub_140018C58`), CRT.

---

## 4. Prédicat consolidé

État initial 128 octets = 4 × `{q0, q1, 0, 0}` ci-dessus, graine `0x1337BEEFCAFE0000` pour le premier wrapper.

Check = composition

```text
VM-A×10  →  VM-B×1  →  VM-A×10  →  VM-B×1  →  VM-A×10  ≠  0
```

Succès → message ci-dessus, `exit 0`.

Le solveur relit la C-string dans le PE (`--from-pe`) et relance le binaire (`--check`).

---

## 5. Vérification

```text
> original\0LLRi9C10LHQuCDQvNC10L3Rjw.exe
Reverse this shit, find where this message is printed.
(exit 0)

> python tools/custom-protector-solve.py --check
Reverse this shit, find where this message is printed.
exit=0 → OK

> python tools/custom-protector-solve.py --from-pe -q
Reverse this shit, find where this message is printed.
```

KO utile : le binaire n’a pas de chemin « mauvais password » — le seul échec serait un retour VM nul (`exit 1`, stdout vide). Avec l’état hardcodé, ce chemin n’est pas pris.

---

## 6. Notes

- Description site : *custom protector VM and OLLVM* — confirmé (deux ISA, wrapper opaque, interpréteur massif).
- Le titre du challenge invite à « trouver où le message est imprimé » : `main` + `.rdata`, pas au fond de la VM.
- IDA headless a produit des `*.id0`/`*.nam` à côté de `original/` (gitignorés).
