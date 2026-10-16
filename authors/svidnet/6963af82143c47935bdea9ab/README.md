# svidnet — ZEXOR-v1 (Linux version)

| | |
|---|---|
| **ID** | [`6963af82143c47935bdea9ab`](https://crackmes.one/crackme/6963af82143c47935bdea9ab) |
| **Auteur** | svidnet |
| **Plateforme** | Linux ELF64 PIE, C++/GTK3, non strippé |
| **SHA-256** | `af3ee10e8a9c7c88892fbcd37c4a9549af25ed9eee265d5bd9950c7d699005c8` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ZEXORv1_wayland` | binaire d'origine (fenêtre GTK3 « ZEXOR v0.1 ») |
| `tools/zexor-solve.py` | extrait la licence depuis l'ELF (`-q`, `--check` sous gdb) |

## Réponse

**License key : `AEXORRBSHA36325S33`**

```bash
python3 tools/zexor-solve.py          # licence
python3 tools/zexor-solve.py -q
python3 tools/zexor-solve.py --check  # valid(key)=1, valid("x")=0 sous gdb
```

À saisir dans le champ « Enter License Key: » puis bouton **Check License** → message vert `NICE! You cracked it!`
et boîte de dialogue `Congrats! You actually did it!`.

## Premier regard

```bash
file original/ZEXORv1_wayland   # ELF64 PIE, dynamically linked, not stripped
strings -n 5 original/ZEXORv1_wayland
nm -C original/ZEXORv1_wayland  # valid(char const*), btn_clicked(...), main
```

GUI GTK3 (`gtk_entry_new`, `gtk_button_new_with_label`, `gtk_dialog_run`…). Les chaînes d'UI sont en clair
(`Enter License Key:`, `Check License`, `YOU FAILED`, `Wrong key dude…`) mais **la licence n'apparaît pas
dans `strings`** : elle est dans `.rodata` collée à d'autres octets (voir plus bas).

## Flow

- `main` @ `0x152a` : crée la fenêtre, un `gtk_entry` (`gtk_entry_set_max_length(entry, 0x100)` @ `0x16bc`) et un bouton qui appelle `btn_clicked`.
- `btn_clicked` @ `0x1345` : `gtk_entry_get_text` → `valid(text)` @ `0x1319` → si vrai, label vert + `gtk_message_dialog_new("Congrats! …")`, sinon label rouge `YOU FAILED`.
- `valid` @ `0x1319` : un simple `strcmp` avec un **pointeur global**.

## Comment on trouve

**Ancrage** : `nm -C` donne directement `valid(char const*)`. Désassemblage :

```bash
objdump -d -M intel --no-show-raw-insn original/ZEXORv1_wayland | awk '/<_Z5validPKc>:/,/ret/'
```

```asm
1325: mov   rdx,QWORD PTR [rip+0x2ddc]   # 4108 <UH>   ; rdx = *(char**)0x4108
132c: mov   rax,[rbp-0x8]                ; rax = saisie
1330: mov   rsi,rdx
1333: mov   rdi,rax
1336: call  strcmp@plt
133b: test  eax,eax
133d: sete  al                           ; return strcmp(saisie, UH)==0
```

`UH` est un `char*` en `.data` @ `0x4108`. Son contenu dans le fichier est 0 : c'est une relocation
**`R_X86_64_RELATIVE`** (`readelf -r`) dont l'addend est `0x2008` :

```text
000000004108  000000000008 R_X86_64_RELATIVE   2008
```

Donc `UH = base + 0x2008`. Dans `.rodata` (`objdump -s -j .rodata`) :

```text
 2000 01000200 00000000 4145584f 52524253   ........AEXORRBS
 2010 48413336 33323553 33330000 ...        HA36325S33..
```

`0x2000` : `01 00 02 00` (`_IO_stdin_used`) + 4 octets de padding ; la chaîne commence à `0x2008` :
`41 45 58 4f 52 52 42 53 48 41 33 36 33 32 35 53 33 33 00` = **`AEXORRBSHA36325S33`**.

**Piège** : la chaîne est collée juste après `_IO_stdin_used` (`01 00 02 00`) et le padding ; `strings` ne la
signale pas comme une licence. Le symbole s'appelle simplement `UH` (nom court, sans sens apparent).
Aucun `.init_array` ne modifie la chaîne (seul `frame_dummy` @ `0x1310`) : pas de XOR au runtime malgré le nom « ZEXOR ».

## Debug GDB (pas à pas)

Pas besoin d'écran pour tester le prédicat : on s'arrête à l'entrée de `main` (avant `gtk_init`) et on
appelle `valid()` à la main. PIE : GDB charge à `0x555555554000`, donc `main = 0x55555555552a`, `valid = 0x555555555319`.

```bash
gdb -q -batch \
  -ex 'break *0x55555555552a' -ex 'run' \
  -ex 'call (int)((int(*)(const char*))0x555555555319)("AEXORRBSHA36325S33")' \
  -ex 'call (int)((int(*)(const char*))0x555555555319)("x")' \
  ./original/ZEXORv1_wayland
```

```text
Breakpoint 1, 0x000055555555552a in main ()
$1 = 1        <- bonne licence
$2 = 0        <- "x"
```

Piège : s'arrêter **après** le chargement (au `main`, pas au `starti`) sinon les relocations `RELATIVE` ne sont pas
encore appliquées et `UH` vaut encore 0.

## Vérification

- `python3 tools/zexor-solve.py --check` → `valid(key), valid('x') = ['1', '0'] OK`.
- GUI : non rejouée dans l'IDE (pas de `xvfb-run` sur cette machine) ; le prédicat est prouvé par l'appel direct de `valid()`.

## Notes

- Le nom du challenge évoque un XOR mais la licence est **en dur** dans `.rodata`.
- Version Linux (fichier `ZEXORv1_wayland`) ; titre de fenêtre `ZEXOR v0.1`.
