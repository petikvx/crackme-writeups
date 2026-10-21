# Keygenme v.1 by albertus (crackmes.de)

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c302`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c302) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur d'origine : albertus) |
| **Plateforme** | Windows PE32 console, MinGW (g++), symboles stabs présents |
| **SHA-256 (zip)** | `7d27c08a672c1e03bfa8b2f3d4ef4751c191f0f08c55d492c70d470e0d8f9400` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Keygenme.v.1.by.albertus.zip` | archive d'origine (mot de passe `crackmes.one`) → `Keygenme.v.1.by.albertus.exe` + `Readme.txt` |
| `analysis/Readme.txt` | readme de l'auteur (« Patching is not allowed. Please write tutorial and keygen. ») |
| `tools/albertus-keygenme-solve.py` | keygen / vérificateur (`-q`, `--check`) |

L'exe est extrait à la demande dans un dossier temporaire (`unzip -P crackmes.one`), jamais dans `original/`.

## Réponse

| Champ | Valeur d'exemple |
|---|---|
| Username | `ketiketiket` (11 car.) — **`petik` est refusé** : trop court (< 11) et `p` hors du jeu autorisé |
| Serial | `123456780` |

```bash
python3 -I tools/albertus-keygenme-solve.py                      # user=ketiketiket serial=123456780
python3 -I tools/albertus-keygenme-solve.py --serial-prefix 98765432109876 -q   # 987654321098769
python3 -I tools/albertus-keygenme-solve.py --check 123456780    # OK
```

Le serial est **indépendant** du nom : le nom ne sert qu'à passer un filtre (longueur + 1er caractère).

## Premier regard

- `file` : PE32 console i386, 7 sections ; `diec` : MinGW. Le binaire est livré avec sa table de symboles (`objdump -t`) : `_main`, `len_usr(char*)`, `check_usr(char)`, `check_srl(char)`, `out(int)`, `length(char*)`.
- `strings` ne montre aucun message en clair : les textes sont **décalés de +5** (Caesar) et `out()` soustrait 5 à chaque octet à l'affichage. Décodés : `Username`, `Serial`, `Good job! Now write keygen please`, `Maybe later?`.

## Flow (`main` @ `0x4016ac`)

1. `out(1)` → « Username », `cin >> buf1`.
2. `len_usr(buf1)` doit être vrai sinon `out(4)` « Maybe later? ».
3. `out(2)` → « Serial », `cin >> buf2`.
4. Boucle sur le nom avec `check_usr` (voir piège plus bas).
5. Boucle sur les `len(serial)-1` premiers caractères avec `check_srl` + accumulation d'une somme.
6. Le dernier caractère du serial est comparé à `somme % 10` ; égal ⇒ `out(3)` « Good job! », puis `getch()`.

## Comment on trouve

Ancrage : `objdump -d -M intel --start-address=0x401390 --stop-address=0x401960 *.exe` (le binaire a ses symboles), tables lues dans `.rdata` à `0x440000` (offset fichier déduit des en-têtes de section, script Python `-I`).

### Longueur du nom — `len_usr` @ `0x4013b4`

```asm
call length            ; n = strlen
cmp  n,0xa ; jle bad   ; n > 10
cmp  n,0x1d; jg  bad   ; n <= 29
and  n,1   ; je  bad   ; n impair
...imul 0x55555556...  ; n % 3 (division par magic number)
test ; jne ok          ; n % 3 != 0
```
⇒ **n ∈ {11, 13, 17, 19, 23, 25, 29}** (impair, non multiple de 3, 11..29).

### Tables et `check_usr` @ `0x40141c`

`.rdata:0x440000` contient deux chaînes copiées sur la pile :
`s1 = "8IR$@PB#NN1DD'LRDM)EJ?'=FABN"` (+NUL) et `s2 = "!&#$"`.
La fonction renvoie vrai si le caractère `c` vaut `s1[i] + s2[j]` pour un `i` de `0..len(s1)` (NUL inclus), `j` avançant en parallèle et repartant à 0 quand `j > len(s2)-1` (période 4).
Jeu obtenu : `! G H J L M T Y a e g h i k o r s t u v`.
(`'8'(0x38)+'!'(0x21)=0x59='Y'`, `'I'+'&'=0x49+0x26=0x6f='o'`, …)

### Piège : la boucle de `main` ne contrôle que le 1er caractère

```asm
4017a1: call check_usr
40178a: test al,al
40178c: jne  4017a9      ; <-- si VRAI on SORT de la boucle (4017a9 = suite)
40178e: out(4) ; ret -1  ; si FAUX : "Maybe later?"
```
L'auteur voulait vérifier tous les caractères, mais le `jne` saute *après* la boucle dès le premier succès. Donc seul `user[0]` compte (les suivants ne sont jamais testés). Vérifié en live : `Aetiketiket` → rejeté, `kAtiketiket` / `ketiketikeA` / `ketiketibzz` → acceptés.

### Serial — `check_srl` @ `0x401502` + boucle `main`

`check_srl(c)` : `c` doit apparaître dans `"1234567890"` (copié depuis `0x440022`) → chiffre ASCII. Ici la boucle `jne 40181a` **continue** si vrai et échoue si faux : tous les `len-1` premiers caractères doivent être des chiffres.

Pour l'indice `i` (0-based) et `d = c - '0'` :

```asm
; i impair : v = d                      (sub eax,0x30)
; i pair   : v = 2*c - 0x60 = 2*d       (add eax,eax ; sub eax,0x60)
;            si v > 9 : v = v / 2       (sar 1)   ; PAS « -9 » comme Luhn
sum += v
```
Fin : `last - '0' == sum % 10` (magic `0x66666667` = division par 10). Le dernier caractère n'est pas contrôlé comme chiffre mais doit égaler `'0'+sum%10`, donc c'est forcément un chiffre.

Exemple `12345678` : i=0 (pair) 2·1=2 ; i=1 → 2 ; i=2 → 6 ; i=3 → 4 ; i=4 → 10→5 ; i=5 → 6 ; i=6 → 14→7 ; i=7 → 8 ; somme = 40 → chiffre 0 ⇒ `123456780`.

## Vérification (Wine, binaire d'origine)

```bash
unzip -P crackmes.one -d /tmp/albertus original/Keygenme.v.1.by.albertus.zip
printf 'ketiketiket\n123456780\n' | WINEDEBUG=-all xvfb-run -a wine /tmp/albertus/Keygenme.v.1.by.albertus.exe
```

| Entrée | Résultat |
|---|---|
| `ketiketiket` / `123456780` | `Good job! Now write keygen please` |
| `Gxxxxxxxxxxxx` (13) / `987654321098769` | `Good job!` |
| `ketiketiket` / `123456781` (mauvais contrôle) | rien (pas de « Good job ») |
| `ketiketiket` / `12345678a0` | `Maybe later?` |
| `Aetiketiket` (1er car. interdit) | `Maybe later?` |
| `petik` / `123456780` (longueur 5) | `Maybe later?` |
| nom de 12 / 10 / 30 caractères | `Maybe later?` (longueur) |

Analyse **statique + Wine** uniquement (pas de GDB ni de debugger MCP).

## Notes

- Pas besoin de patch (l'auteur l'interdit) : le keygen suffit.
- Le message d'échec du dernier test (mauvais chiffre de contrôle) est **silencieux** : le programme attend seulement `getch()`.
- Contrainte `petik` : impossible à cause de la longueur minimale 11 et de `p` ∉ jeu autorisé ; exemple le plus proche utilisé : `ketiketiket`.
