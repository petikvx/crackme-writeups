# crackmes.de's keygenme_2 by boonz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c32c`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c32c) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de *Boonz*, 08/12/2006) |
| **Plateforme** | Windows PE32 console, MSVC 6 C++ (build *Debug*, `KeygenConsole.pdb`) |
| **SHA-256 (zip)** | `8a42ff4b76f3eb2b428687da4eaecf71dd144f2fa5f8b2faece3df24ddcc7c1b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/KeyGenMe2.zip` | archive d'origine (non touchée) : `readme.txt` + `KeygenMe2.exe` |
| `analysis/ex/` | contenu extrait du zip (`KeygenMe2.exe`, `readme.txt`) |
| `analysis/exe.dis.txt` | `objdump -d -M intel` complet |
| `tools/keygenme2-solve.py` | keygen (`-q`, `--name`, `--check EXE` via Wine) |

## Réponse

Le crackme demande *username* puis *serial* (entier décimal signé 32 bits).

| Username | Serial |
|---|---|
| `petik` | **`1208120`** |

```bash
python3 -I tools/keygenme2-solve.py --name petik        # name=petik serial=1208120
python3 -I tools/keygenme2-solve.py --check analysis/ex/KeygenMe2.exe   # lance wine et vérifie
```

Formule (S = somme des octets du nom, L = longueur) :

```
serial = (445·S + 999 − L!) · ⌊ L! / ((L−4)! · 4!) ⌋      (mod 2^32, signé ; fact(x≤0)=1)
```

## Premier regard

```text
$ file KeygenMe2.exe   → PE32 executable (console), Intel i386, 5 sections
$ diec KeygenMe2.exe   → Microsoft Linker 5.12 / Visual C/C++ 12.00 (C++)
$ strings -n 5 …       → "This is a scrimping-nag. Please remove it!"
                         "Please input your desired username:" / "...serial:"
                         "Processing......" / "Nah, that one ain' so good..."
```

`readme.txt` : retirer le « nag », mettre son nom à la place de `<Name>`, retirer la « special protection », coder un keygen. Ici on ne patche rien : on code le keygen (la « special protection » est un `IsDebuggerPresent`, voir plus bas).

## Flow

`main` @ `0x401fd0` (build debug, linkage incrémental : tous les appels passent par des thunks `jmp` en `0x4010xx`) :

1. `IsDebuggerPresent` (`call [0x43e180]` @0x402049) → si ≠ 0, retourne 0 immédiatement (la « special protection »).
2. Affiche la bannière + le nag (`call 0x4010b4`).
3. `cin >> char[]` (username, `0x404d90`), `cin >> int` (serial, `0x404740`).
4. `Sleep(0x5dc)` (« Processing... »).
5. `computed = f(name)` (thunk `0x40102d` → `0x401d40`), puis `cmp(computed, serial)` (`0x401073` → `0x401eb0`) : égalité ⇒ `Nice one!`, sinon `Nah, that one ain' so good...`.

## Comment on trouve

**Ancrage** : les chaînes sont dans `.rdata` (VA = offset fichier + 0x400000, sections alignées 0x1000/0x400 → `.rdata` VA `0x436000` = offset `0x36000`). `Please input your serial:` est en `0x4360a8` ; `grep 0x4360a8 exe.dis.txt` mène à `main` (`0x40215f`). Juste après la saisie :

```asm
4021a1: push eax                 ; serial (int)
4021a2: lea  ecx,[ebp-0x164]     ; &name
4021a8: push ecx
4021a9: lea  ecx,[ebp-0x12c]     ; this (objet "Keygen")
4021af: call 0x40102d            ; computed = f(name)   (ret 4 : ne dépile que name)
4021b4: push eax                 ; computed ; serial est resté sur la pile
4021bb: call 0x401073            ; cmp(computed, serial) : ret 8, al=1 si égaux
4021c5: cmp  eax,1  → "Nice one!" (0x436080) sinon "Nah..." (0x436058)
```

Le `ret 4` de `f` laisse le serial sur la pile, d'où `cmp(computed, serial)` (`0x401eb0` : `cmp [ebp+8],[ebp+0xc]` → `al=1`).

**`f(name)` @ `0x401d40`** — petites méthodes appelées via thunks :

| Thunk → cible | Rôle (lu dans le désassemblage) |
|---|---|
| `0x4010af` → `0x401b30` | `S` : boucle `sum += (char)name[i]` (`movsx`) sur `strlen` |
| `0x401014` → `0x401520` | `L` = `strlen(name)` (`call 0x407040`) |
| `0x401037` → `0x4012c0` | `fact(x)` double : `x<=0 → 1.0`, sinon `x·fact(x−1)` |
| `0x40107d` → `0x401480` | `C(n,k)` = `fact(n)/(fact(n−k)·fact(k))` (k=0 → 1) |
| `0x40716c` | `_ftol` (troncature double → int) |

Corps de `f` (`this+0x0c..0x1c` = champs de l'objet) :

```asm
401d6b: imul esi,S,0x1bc ; lea edx,[esi+S+0x3e7]    ; A = 445·S + 999        (this+0x0c)
401da4: S*0x21 + S*0xb + L*0x16                      ; = 44·S + 22·L
401dcf: v = A − (44·S + 22·L)                        ; B = 401·S − 22·L + 999 (this+0x10)
401de6: fild B ; + fact(L)  → _ftol                  ; C = B + L!             (this+0x14)
401e26: push 4.0 (0x40100000:0) ; push (double)L ; call 0x40107d
        → _ftol                                      ; D = ⌊C(L,4)⌋           (this+0x18)
401e67: (A + B − C) * D  → eax                       ; retour
```

Comme `C = B + L!`, `A + B − C = A − L!` : d'où la formule finale `(445·S + 999 − L!) · D`, avec `D = ⌊L!/((L−4)!·4!)⌋` (pour `L<4`, `fact(L−4)=1` ⇒ `D=⌊L!/24⌋`, souvent 0 → serial 0).

**Exemple `petik`** : `S = 112+101+116+105+107 = 541`, `L = 5`, `L! = 120`.
`A = 445·541 + 999 = 241744` ; `A − L! = 241624` ; `D = 120/(1!·24) = 5` ; **serial = 241624 · 5 = 1208120**.

**Pièges**
- Thunks en cascade (build debug incrémental) : on lit les cibles réelles derrière chaque `jmp`.
- `cin >> int` : le serial est un entier signé ; le produit est calculé en 32 bits (wrap) — le solveur le reproduit.
- `_ftol` hors plage (L ≥ 13 : `L!` > 2^31) donne `0x80000000` ; émulé dans le solveur, mais non testé au-delà de noms courts.
- Le username est lu par `cin >>` : pas d'espace dans le nom.
- `IsDebuggerPresent` : ne pas lancer sous débogueur sans le contourner.

## Vérification

Binaire d'origine (extrait du zip) sous Wine :

```bash
$ python3 -I tools/keygenme2-solve.py --check analysis/ex/KeygenMe2.exe
name=petik serial=1208120
… Processing...
Nice one!
CHECK: OK

# autres noms (OK) : abcd, Hello, boonz
# cas KO : serial erroné
$ echo -e "petik\n1234" | xvfb-run -a wine analysis/ex/KeygenMe2.exe
… Processing......
Nah, that one ain' so good...
```

## Notes

- Aucune session GDB / x64dbg : reverse 100 % statique (`objdump`) + preuve live Wine ; pas de section GDB.
- Le nag n'est qu'un message + délai, sans incidence sur le serial ; on ne patche pas `original/`.
