# crackmes.de's crackmev5 by logan

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c32a`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c32a) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | logan (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MFC 4.2, MSVC 6) + DLL export (`CrackmeV50DLL.DLL`), UPX 1.93 |
| **ZIP** | `original/CrackmeV50DLL.zip` (mot de passe site `crackmes.one`), contient un ZIP interne non chiffré |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/CrackmeV50DLL.zip` | archive d'origine (non modifiée) |
| `analysis/ex/` | contenu du ZIP : `CrackmeV50.2.exe` (= `CrackmeV50,2.exe`, identiques), `CrackmeV50DLL.DLL` |
| `analysis/exe.unp.exe`, `analysis/dll.unp.dll` | versions dépackées UPX (`tools/upx-3.96`) |
| `analysis/exe.dis.txt`, `analysis/dll.dis.txt` | `objdump -d -M intel` des deux PE |
| `tools/crackmev5-solve.py` | keygen (`--name`, `-q`, `--check`) |
| `tools/crap-harness.c` | harnais mingw : `LoadLibrary` de la DLL d'origine + appel de `crap(name, serial)` |

## Réponse

Deux champs : **Username de 5 caractères** exactement, **Password de 11 caractères** exactement (`XXXXX-YYYYY`).

| Username | Password |
|---|---|
| `petik` | **``tfzlo-n`tfi``** (le 8ᵉ caractère est un backtick `` ` ``) |

```bash
python3 -I tools/crackmev5-solve.py                # name = petik  serial = tfzlo-n`tfi
python3 -I tools/crackmev5-solve.py --name abcde -q
python3 -I tools/crackmev5-solve.py --check        # appelle le vrai crap() de la DLL sous Wine
```

## Premier regard

```bash
unzip -o original/CrackmeV50DLL.zip -d analysis/ex
file analysis/ex/*             # 2 PE32 GUI + 1 DLL, tous UPX
diec analysis/ex/CrackmeV50.2.exe   # MSVC 6, MFC 4.2, UPX 1.93
./tools/upx-3.96 -d -o analysis/exe.unp.exe analysis/ex/CrackmeV50.2.exe
./tools/upx-3.96 -d -o analysis/dll.unp.dll analysis/ex/CrackmeV50DLL.DLL
strings -n 5 analysis/exe.unp.exe
```

Les deux `.exe` du ZIP sont octet pour octet identiques. `strings` de l'exe dépacké : `Username`, `Password`,
`Wrong Username or Password`, `Good Job`, mais surtout dans l'import-table : `CrackmeV50DLL.dll` → `?crap@@YA_NQAD0@Z`
(= `bool crap(char *const, char *const)`). Le test n'est donc **pas dans l'exe** mais dans la DLL.

## Flow

1. Handler du bouton (exe, `0x4015c0`) : récupère les deux CString (`UpdateData`), exige `len(user) == 5`
   (`cmp eax,5` @0x4015d8) et `len(pass) == 0xb` (`cmp eax,0xb` @0x4015ef), sinon « Wrong Username or Password ».
2. Copie les deux chaînes dans des buffers `char*` et appelle `crap(user, pass)` (`call [0x402000]`, thunk d'import) ;
   `cmp al,1` → « Good Job » sinon « Wrong ».
3. `crap` est exportée par `CrackmeV50DLL.DLL` (export RVA `0x1090`).

## Comment on trouve le prédicat

**Ancrage** : table d'exports de la DLL (`objdump -x dll.unp.dll`) :
`?check@@YAHQAD@Z` @0x1030, `?crap@@YA_NQAD0@Z` @0x1090, `?fnCrackmeV50DLL` @0x1020 (renvoie 42), etc.
Image base `0x10000000`, donc `crap` = `0x10001090`, `check` = `0x10001030`.

### Anti-debug au début de `crap` (0x10001090..0x100010e1)

```asm
call IsDebuggerPresent          ; test eax,eax ; jne fail
push buf ; push 0 ; call FindWindowA   ; titre "OllyDbg - CrackmeV50.exe - [CPU - main thread, module CrackmeV]"
                                         ; fenêtre trouvée -> fail
push 0 ; push 0x10001180 ; call EnumWindows   ; callback = strcmp(GetWindowText, titre OllyDbg)
```

Trois détections (debugger présent, fenêtre OllyDbg au titre exact, enum des fenêtres). Hors debugger, rien à contourner :
la preuve Wine/Xvfb passe (aucune fenêtre OllyDbg).

### `check(name)` @0x10001030 — somme des chiffres décimaux

Lit `name[g]` avec `g` = variable globale `0x1000e138`, puis boucle `idiv 10` / somme des restes :
`digitsum(name[g])` (ex. `'p'`=112 → 1+1+2 = 4). Le `imul 0x66666667` est juste le `/10` suivant.

### Corps de `crap` (0x100010e7..0x10001169)

`esi` = user, `ebx` = serial. Pseudo-C (`c = name[i]`, `ds = digitsum(c)`, `movsx` signés) :

```c
for (g = 0; g < 5; g++) {                 // 0x100010f7
    ds = check(name);                     //  digitsum(name[g])
    if (serial[g] != ds + c - g) fail;    //  sub ecx,eax ; add edx,ecx ; cmp
}
if (serial[5] != '-') fail;               // cmp BYTE [ebx+5], 0x2d  @0x10001123
for (g = 0; g < 5; g++) {                 // 0x10001134
    ds = check(name);
    if (serial[6+g] != ds + c - g - 6) fail;   // lea eax,[eax+edx-6]
}
return edi == 0xb;                        // 5 + 1 + 5 comparaisons réussies
```

Piège : dans la 2ᵉ boucle `eax` est le retour de `check` (la digit-sum), pas l'index ; le `-6` est dans le `lea`.
Le second bloc vaut donc exactement « premier bloc − 6 ».

### Assemblage de la réponse (`petik`)

| i | c | code | ds | `c+ds-i` | char | −6 | char |
|---|---|---|---|---|---|---|---|
| 0 | `p` | 112 | 4 | 116 | `t` | 110 | `n` |
| 1 | `e` | 101 | 2 | 102 | `f` | 96 | `` ` `` |
| 2 | `t` | 116 | 8 | 122 | `z` | 116 | `t` |
| 3 | `i` | 105 | 6 | 108 | `l` | 102 | `f` |
| 4 | `k` | 107 | 8 | 111 | `o` | 105 | `i` |

Serial = `tfzlo` + `-` + ``n`tfi``.

## Vérification

```bash
$ python3 -I tools/crackmev5-solve.py --check
name = petik  serial = tfzlo-n`tfi
valide : crap = 1 | serial altéré : crap = 0
```

Le `--check` compile `tools/crap-harness.c` (mingw), charge sous `xvfb-run -a wine` la **DLL d'origine**
(`analysis/ex/CrackmeV50DLL.DLL`, UPX, non patchée) et appelle l'export `?crap@@YA_NQAD0@Z` avec le couple user/serial :
`1` pour `petik` / ``tfzlo-n`tfi``, `0` si le dernier caractère est modifié (cas KO).

Limite honnête : j'ai aussi tenté de piloter la vraie fenêtre (`xdotool` sous Xvfb, saisie + Entrée), mais sans outil de
capture fonctionnel (grab noir) je n'ai pas pu lire le message « Good Job » ; la preuve repose donc sur l'appel direct
de `crap` (la seule fonction qui décide, cf. §Flow).

## Notes

- Contraintes : nom de **5** caractères exactement, serial de **11**. Certains caractères (ex. `~`, `}`) donnent des
  valeurs > 0x7f (comparaison signée `movsx`) : pas de serial possible, le keygen le signale.
- Pas de GDB ni de debugger live : reverse 100 % statique (objdump) + exécution du `crap` réel via Wine.
- Ne pas confondre : l'exe n'a aucune logique de validation, tout est dans la DLL (il faut la garder à côté de l'exe).
