# CorpCons's EasyVM

| | |
|---|---|
| **ID** | [`69723bb7d735cd51e7a1aa78`](https://crackmes.one/crackme/69723bb7d735cd51e7a1aa78) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | CorpCons (local : `corpcons`) |
| **Plateforme** | Windows PE64 console, C++ MSVC (LTCG), pas de packer |
| **SHA-256 (zip)** | `7cb0dc8ec0933fd6828ebae43701c527c9bdfec1441b623602737c96721702c1` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/EasyVM.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/extract/EasyVM.exe` | exe extrait du zip (copie de travail) |
| `tools/easyvm-solve.py` | keygen + `--check` (lance l'exe sous Wine) |
| `tools/corpcons-dump-bytecode.py` | recon : reconstruit le bytecode empilé par `main` (`python3 -I … EasyVM.exe dis.txt`, `dis.txt` = `objdump -d -M intel`) |

## Réponse

Pas de user : une **clé de 10 caractères**. Seuls 7 caractères comptent :

```
k0 + k1 + k2 + k3 + k4 + k6 - k5  ≡  0x161  (mod 256)      (k7 s'annule, k8/k9 ignorés)
```

| Exemple | Clé |
|---|---|
| préfixe `petik` (défaut) | **`petik0t_42`** |

```bash
python3 -I tools/easyvm-solve.py                      # petik0t_42
python3 -I tools/easyvm-solve.py --prefix hello -q    # hello0}_42
python3 -I tools/easyvm-solve.py --check original/EasyVM.zip
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MSVC 19.50, pas de packer.
- `strings` utiles : `Please Enter 10-char License Key: `, `This license key is corrupted.`.
- Le message de succès n'apparaît **pas** en clair : `%)44#%2GGGGG` (`.rdata` 0x14002f7b0) est XORé à l'exécution avec `0x33*(al+2)` ; avec `al=0` → `0x66` → `CORRECT!!!!!`.

## Flow

`main` (0x140002190) : lit 10 caractères un par un (0x140002b00, `cin >> char`) dans `[rsp+0x20..]`, construit sur la pile un bytecode de 240 octets (80 instructions de 3 octets) où les caractères saisis sont insérés comme opérandes, appelle l'interpréteur `0x140001ec0`. Si le retour (`al`) vaut 0 → déchiffre et affiche `CORRECT!!!!!`, sinon `This license key is corrupted.` et reboucle.

## Comment on trouve

**Ancrage** : `objdump -s -j .rdata` → la chaîne du prompt en 0x14002f7c0 ; `grep` des xrefs dans `objdump -d` → `lea rdx,[rip+…] # 0x14002f7c0` en 0x140002290 (dans `main`).

**Interpréteur 0x140001ec0** (déroulé ×4, 20 tours, `rbx` va jusqu'à 0x50 = 80 instructions). Chaque instruction = `op, arg, flag`. `al` = accumulateur, `[rsp+0..15]` = 16 registres d'octets. Si `flag == 'A'` (0x41), `arg & 0xf` désigne un registre, sinon `arg` est un immédiat :

| op | sens |
|---|---|
| `I` (0x49) | `al = src` |
| `O` (0x4f) | `reg[arg&15] = al` |
| `A` (0x41) | `al += src` |
| `S` (0x53) | `al -= src` |
| `X` (0x58) | `al ^= src` |
| autre (`'0'`) | NOP (remplissage) |

**Bytecode** : il est écrit par morceaux (`mov BYTE/DWORD/movdqa` vers `[rsp+0x60…]`, constantes 16 octets lues en `.rdata` 0x14002f830–0x14002f8b0). `corpcons-dump-bytecode.py` rejoue ces stores. Piège : les constantes `dword` se chevauchent à des offsets impairs (ex. `49 <k> 30 | 4f 01 41`), donc `strings`/lecture naïve désalignent ; il faut découper par 3 octets. Les `<k>` sont remplis depuis `[rsp+0x20+i]`.

Désassemblé (clés `k0..k7`) :

```
bloc1: r1=k0; r2=k1; al=r1; al-='K'; r8=al; al=r2; al-='E'; r9=al; al=r8; al+=r9; r10=al
bloc2: r1=k2; r2=k3; al=r1; al-='Y'; r8=al; al=r2; al-='-'; r9=al; al=r8; al+=r9; al+=r10; r10=al
bloc3: r1=k4; r2=k5; al=r1; al+=k7; al-='K'; al-=r2; al+=r10; r10=al
bloc4: r1=k6; r2=k7; al=r1; al-=r2; al+=r10; r10=al      ; retour al = r10
```

Somme : `(k0-0x4b)+(k1-0x45)+(k2-0x59)+(k3-0x2d)+(k4+k7-0x4b-k5)+(k6-k7)` : `k7` s'annule, `k8`/`k9` ne sont jamais lus. Constantes : `0x4b+0x45+0x59+0x2d+0x4b = 0x161`. Valide ⇔ somme ≡ 0 mod 256 ⇔ `k0+k1+k2+k3+k4+k6-k5 ≡ 0x61`.

**Assemblage pour `petik`** : `p+e+t+i+k = 112+101+116+105+107 = 541`. Il faut `k6-k5 ≡ 0x61-541 ≡ 68 (mod 256)` : `k5='0'` (48) → `k6='t'` (116). `k7,k8,k9` libres : `_42`. D'où `petik0t_42`.

## Vérification

```text
$ printf 'petik0t_42\n' | xvfb-run -a wine EasyVM.exe
Please Enter 10-char License Key: CORRECT!!!!!
Press any key to continue...

$ printf 'AAAAAAAAAA\n' | xvfb-run -a wine EasyVM.exe     # KO (somme ≠ 0x61)
Please Enter 10-char License Key: This license key is corrupted.   (reboucle)

$ python3 -I tools/easyvm-solve.py --check original/EasyVM.zip
key = petik0t_42
wine: CORRECT
```

`petik0t_4` (9 caractères + EOF) passe aussi : seuls les 7 premiers comptent.

## Notes

- Pas de GDB ni de debugger MCP : reverse 100 % statique (`objdump`) + preuve Wine. IDA/`decc` indisponibles dans cet environnement.
- Beaucoup de clés valides (une seule équation modulo 256) ; ce n'est pas un schéma à solution unique.
- `original/EasyVM.zip` n'a pas été modifié ; l'exe extrait est sous `analysis/extract/`.
