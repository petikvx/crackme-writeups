# Ulevel's rsame_v2

| | |
|---|---|
| **ID** | [`699af49ac2d74fe054b1c31d`](https://crackmes.one/crackme/699af49ac2d74fe054b1c31d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Ulevel (local : `ulevel`) |
| **Plateforme** | Windows PE64 console, C++ MSVC (« rsa-64 crackme ») |
| **SHA-256 (zip)** | `6f82aac64a60e6e325933a746aa67e17a049f0541770abcff117576392a94c97` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/rsacrackme2.zip` | archive d'origine (mot de passe `crackmes.one`) : `rsacrackme2.exe` + `readme.txt` |
| `tools/rsame-v2-solve.py` | solveur : factorise N, calcule d, sort le serial (`-q`, `--check`) |

## Réponse

Serial (décimal, unique crackme sans nom d'utilisateur donc pas de `petik`) :

```
4048192110296323912
```

```bash
python3 tools/rsame-v2-solve.py -q
python3 tools/rsame-v2-solve.py --check <chemin>/rsacrackme2.exe   # preuve sous Wine
```

## Premier regard

- `file` : PE32+ x86-64 console. `readme.txt` : « this is simple rsa-64 crackme — patching is not solution ».
- `strings` : `Enter serial (decimal): `, `Correct serial, access granted!`, `Wrong serial, access denied.`, chemin PDB `rsa_cme1.pdb`.
- Pas de dialogue ni de crypto lib : tout tient dans une seule fonction (`0x140001000`).

## Flow

`cout << "Enter serial (decimal): "` → `cin >> unsigned long long` → exponentiation modulaire → comparaison à une constante → message OK/KO.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn rsacrackme2.exe` ; la fonction utilisateur démarre en `0x140001000` (le reste est CRT/iostream).

1. Lecture du serial puis réduction modulo N :

```asm
mov   rax,[rsp+0x20]          ; serial (u64)
movabs rsi,0x954338b7d20e11fd ; N
mov   edi,0x10001             ; e = 65537
div   rsi                     ; rdx = serial mod N  -> r10 (base)
mov   ebx,1                   ; résultat
movabs rbp,0x6abcc7482df1ee03 ; 2^64 - N
```

2. Square-and-multiply (right-to-left sur les bits de `edi`, `test dil,1` / `shr rdi,1`). Il n'y a pas de `mul` 128 bits : chaque produit modulaire est fait par **double-and-add** (boucle `0x140001090` et `0x1400010e0`). Le piège est le débordement 64 bits : `rbp = 2^64 - N` est ajouté quand la somme/doublement déborde (`jae` / `cmovb` sur `x >= N - y`), ce qui équivaut à `(a+b) mod N`. Donc c'est bien `r = serial^65537 mod N`.

3. Comparaison finale :

```asm
movabs rax,0x16069c61de505bd6
cmp    rbx,rax        ; rbx == C ?
je     -> "Correct serial, access granted!"
```

4. Prédicat : `serial^65537 ≡ 0x16069c61de505bd6 (mod 0x954338b7d20e11fd)`. N est sur 64 bits, donc factorisable instantanément (Pollard rho) :

`N = 10755502697245184509 = 3673858757 × 2927576537`

`phi = (p-1)(q-1)`, `d = 65537⁻¹ mod phi`, `serial = C^d mod N = 4048192110296323912`.

Aucun nom n'est saisi : pas d'exemple `petik`.

## Vérification

Sous Wine (`xvfb-run -a wine rsacrackme2.exe`, serial sur stdin) :

| Entrée | Sortie |
|---|---|
| `4048192110296323912` | `Correct serial, access granted!` |
| `4048192110296323913` | `Wrong serial, access denied.` |

## Notes

- Pas de GDB/x64dbg/IDA : reverse 100 % statique (objdump) + preuve Wine.
- Serial lu comme `unsigned long long` : `serial` et `serial + N` donnent le même résultat tant que `serial + N < 2^64` (N ≈ 1,08e19 < 2^64 ≈ 1,84e19), donc `4048192110296323912 + N` est aussi accepté ; le solveur donne la plus petite valeur.
- « Patching is not solution » : le crackme est une vraie inversion RSA, pas un `cmp` à contourner.
