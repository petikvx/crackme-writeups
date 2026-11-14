# Feliz's crackme by feliz

| | |
|---|---|
| **ID** | [`6a37ed2539dd6183d62b9da3`](https://crackmes.one/crackme/6a37ed2539dd6183d62b9da3) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Feliz |
| **Plateforme** | Windows PE32 console, MSVC 2022 (C++, Release) |
| **SHA-256 `original/download.bin`** | `c2c1a0e508ca5cd07cb64408639c88927dfb27f65894b96878df8ff9852ab6da` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré tel que téléchargé (⚠ le scaffold a stocké le ZIP, pas l'exe) |
| `analysis/extracted/prorevers.exe` | exe extrait (SHA-256 `a324af14…e035`) |
| `analysis/prorevers.asm` | `objdump -d -M intel` |
| `tools/feliz-solve.py` | solveur + `--check` (Wine) |

## Réponse

**Password : `sperma2281488`** (constant, pas de username — donc pas de `petik` ici).

```bash
python3 -I tools/feliz-solve.py -q                                   # sperma2281488
python3 -I tools/feliz-solve.py --check analysis/extracted/prorevers.exe
```

En cas de succès le programme affiche `prorevers228` (la chaîne `prorevers228` en `.rdata` est donc le message de victoire, pas le mot de passe ; `sperma` seul non plus).

## Premier regard

```bash
python3 -I -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('analysis/extracted',pwd=b'crackmes.one')"
diec analysis/extracted/prorevers.exe     # PE32, MSVC 14.44, LTCG, CRT dynamique
strings -n 6 analysis/extracted/prorevers.exe
```

Strings utiles : `sperma`, `Enter pass: `, `prorevers228`, `Incorret, try left: `, `fail`, `chcp 1251 > nul`, `press Enter to exit`. Pas de packer. Le ZIP est protégé par le mot de passe du site (`crackmes.one`).

## Flow

`main` (0x401510) : `system("chcp 1251 > nul")` (appel via IAT 0x4030f4), puis construit sur la pile une structure `{tries=3, seed=0x1cdf}` et appelle `check` (0x401170, `ecx` = ptr structure). Retour → `press Enter to exit`.

`check` : calcule la chaîne attendue, puis boucle tant que `tries > 0` : affiche `Enter pass: `, lit une ligne (`getline`), compare à la chaîne attendue (égalité de longueur puis comparaison dword/octets), sinon décrémente et affiche `Incorret, try left: N`. À 0 : `fail`. Si égal : affiche `prorevers228`.

## Comment on trouve le prédicat

Ancrage : xrefs sur `.rdata` (`0x4031f0` = `"sperma"`), un seul site dans `check` en 0x401170 (`objdump -d` → `analysis/prorevers.asm`, lignes autour de 0x4011d3–0x401296).

1. Calcul du nombre (seed = `[edi+4]` = 0x1cdf = 7391) :
```asm
mov eax,[edi+4]            ; 7391
lea ecx,[eax*8]; sub ecx,eax ; 7*seed
add ecx,0x43               ; 51804
mov eax,0x4ec4ec4f; imul ecx ; edx = hi32(ecx*0x4ec4ec4f)
sar edx,4                  ; division magique par 52  -> 996
mov eax,edx; shr eax,31; add eax,edx ; +bit de signe (=0)
imul edx,eax,0xb9a         ; *2970 = 2958120
sub  edx,0xa5318           ; -676632  -> 2281488
call 0x401560              ; int -> std::string (itoa maison, mul 0xcccccccd = /10)
```
`0x4ec4ec4f / 2^36 ≈ 1/52` : c'est la réduction de force d'un `/52`.

2. Insertion de `sperma` **en tête** : 0x401264 `memmove(buf+6, buf, len+1)` puis 0x401273 `memcpy(buf, "sperma", 6)` → `std::string::insert(0, "sperma", 6)`. Résultat : `sperma2281488`.

3. La boucle compare ensuite l'entrée de l'utilisateur à cette chaîne.

**Piège** : première tentative avec `2281488` seul, puis `2281488sperma` (j'avais lu un append) — tous deux KO ; c'est le `memmove` avant le `memcpy` qui trahit un préfixe. Autre piège : le « mot de passe » apparent `prorevers228` en strings est le message de succès.

## Debug GDB / x64dbg

Non utilisé (reverse statique + preuve Wine ; aucun debugger MCP actif sur ce binaire).

## Vérification

```text
$ python3 -I tools/feliz-solve.py --check analysis/extracted/prorevers.exe
Password: sperma2281488
Enter pass: prorevers228
press Enter to exit
CHECK: OK
```
KO (`echo 123 | xvfb-run -a wine prorevers.exe`) : `Incorret, try left: 2` → `1` → `fail`. Idem pour `2281488` et `2281488sperma`.

## Notes

- Le mot de passe est une constante : tout est calculable statiquement (seed et nombre de tentatives en immédiats).
- Wine sans display : `xvfb-run -a wine …`.
