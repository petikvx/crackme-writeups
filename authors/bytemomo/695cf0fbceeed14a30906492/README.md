# bytemomo's Pwn Flick

| | |
|---|---|
| **ID** | [`695cf0fbceeed14a30906492`](https://crackmes.one/crackme/695cf0fbceeed14a30906492) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | bytemomo |
| **Plateforme** | Web : WebAssembly (Odin + emscripten/raylib), ZIP `pwn-flick.zip` (mot de passe `crackmes.one`) |
| **SHA-256** | `98badd6e9e16992f41f547d596d5e91250bfea03676d251d3672b55350865ce0` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/pwn-flick.zip` | archive d'origine (non modifiée) : `index.html`, `index.js`, `index.wasm`, `index.data`, `odin.js` |
| `analysis/extracted/pwn-flick/` | ZIP extrait (travail) |
| `tools/pwn-flick-solve.py` | solveur : parse le wasm, résout les gardes |
| `tools/pwn-flick-live-check.js` | preuve live sous node : instancie le vrai `index.wasm` avec une licence donnée |

## Réponse

Pas de nom/utilisateur : une seule **licence i64** à saisir dans l'overlay « Initialize Game » :

> **`12297931375574707090`** (= `0xaaab076dc942eb92` ; équivalent signé `-6148812698134844526`)

```bash
python3 -I tools/pwn-flick-solve.py          # affiche licence u64 / i64
python3 -I tools/pwn-flick-solve.py -q       # licence seule
python3 -I tools/pwn-flick-solve.py --check  # vérifie les 154 gardes
node tools/pwn-flick-live-check.js analysis/extracted/pwn-flick/index.wasm 12297931375574707090
```

## Premier regard

- `index.html` : overlay « license » ; la saisie passe par `BigInt(valeur)` puis devient un `WebAssembly.Global({value:"i64"})` importé en `aegis.license_value`. Les messages « Key rejected » ne sont déclenchés que si l'instanciation lève une exception.
- `index.wasm` (4,3 Mo) : jeu Odin « Pawn Flick » (strings `/home/.../pawn-flick/src/...odin`). Seul import atypique : `(import "aegis" "license_value" (global i64))`.
- Aucun outil wasm installé : `npm i wabt` dans un dossier séparé (`/tmp`) puis `readWasm(...).toText()` → ~1,47 M lignes de WAT.

## Flow

Le global n'est lu que dans **154 fonctions** : chacune commence par la même garde. Si `f(L) != constante`, `unreachable` (trap) : la licence n'est donc pas « rejetée » à l'instanciation, c'est le jeu qui crashe dès que l'une de ces fonctions est appelée (`_start` déjà, avec une mauvaise clé).

## Comment on trouve

**Ancrage** : `grep -n 'license_value' index.wat` → 154 `global.get $aegis.license_value` (premier en `$f298`, ligne 446 du WAT), tous en tête de fonction.

**Lecture** (début de garde, identique partout) :

```wat
global.get $aegis.license_value   ;; L
i64.const 3
local.set $l1680                  ;; l1680 = 3
local.set $l1681                  ;; l1681 = L
local.get $l1681 ; i64.const 1988063022 ; i64.add ; i64.const 3748420980 ; i64.const -1 ; i64.xor ...
```

Suivent ~6000 opérations `i64.add/sub/xor/and/or/mul` avec constantes (obfuscation *Mixed Boolean-Arithmetic*), puis la fin :

```wat
i64.const 305979295481154
i64.eq
if (result i32) i32.const 1 else unreachable end
drop
```

**Décodage** : pas besoin de simplifier l'expression, on l'évalue. Un petit interpréteur de pile (`ev.js` en travail, repris en Python dans le solveur) donne `f(0)=16777208`, `f(1)=16777205`… mais **pas** affine globalement (`f(2^23)`, `f(2^62)` irréguliers) : un ajustement linéaire naïf échoue (piège).
Toutes les opérations (`+ - * ^ & |`) sont telles que **les k bits bas du résultat ne dépendent que des k bits bas de L** → on résout bit par bit : pour k=0..63 on teste `b∈{0,1}` et on garde les candidats dont `f(L) & (2^(k+1)-1) == c & (2^(k+1)-1)`. La solution est **unique** : `L = 12297931375574707090`.

**Cohérence** : `--check` évalue les 154 gardes (parsées directement dans le binaire : motif `23 00 42 03 21` = `global.get 0; i64.const 3; local.set`) avec cette valeur : 154/154 satisfaites (les constantes comparées et l'obfuscation varient d'un site à l'autre, la licence attendue est la même).

**Pièges** : `BigInt()` côté JS convertit modulo 2^64 vers l'i64 : la valeur non signée et sa forme signée `-6148812698134844526` sont équivalentes ; l'échec n'est pas à l'instanciation.

## Vérification

Instanciation du vrai `index.wasm` sous node (imports stubés, `aegis.license_value` = licence), appel de `_start` :

| Licence | Résultat |
|---|---|
| `12297931375574707090` | `_start ok`, puis `main_start` démarre (boucle sans fin faute de vrai GLFW/GL, volontairement stubé) |
| `-6148812698134844526` | idem (même i64) |
| `1234` | `_start TRAP unreachable` |

Pas de session GDB/x64dbg/IDA : reverse 100 % statique (WAT via wabt) + exécution node ; pas de screenshot du navigateur.

## Notes

- Ce n'est pas un keygen : une seule valeur valide.
- Le jeu lui-même (flick de pions) n'a pas été joué ; la licence ne sert qu'à ne pas trapper.
