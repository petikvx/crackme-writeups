# asm_keygen_me_1 by kkr_we_rule

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c222`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c222) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | KKR (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (keygenme de septembre 2010) |
| **Plateforme** | Windows PE32 GUI, assembleur (Win32 ASM), boîte de dialogue |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `3a0fa99c7e1b9c187844abad9eb4493b4e18518c79bc24936bae10f773fb2b25` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ASM_KeygenMe1.zip`, `original/KeygenMe1/KeyGen Me - 1.exe`, `original/KeygenMe1/Read Me.txt` | archive + binaire d'origine + consignes |
| `analysis/disasm.txt` | `objdump -d -M intel` de `0x401000..0x401400` (tout le code utile) |
| `tools/asm_keygen_me_1-keygen.py` | keygen (`-q` : les 4 nombres seulement) |
| `tools/drive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live (cas OK et KO) |

## Réponse

Le serial est fait de **4 nombres décimaux** (4 champs) dont la **somme des carrés** doit valoir une cible `T` (0..1023) calculée à partir du nom.

```
Nom    : petik
Serial : 0 / 0 / 0 / 0        (T = 0)

Nom    : am
Serial : 30 / 10 / 2 / 2      (T = 1008 = 900 + 100 + 4 + 4)
```

```bash
python3 tools/asm_keygen_me_1-keygen.py petik       # cible T : 0   -> 0 / 0 / 0 / 0
python3 tools/asm_keygen_me_1-keygen.py am          # cible T : 1008 -> 30 / 10 / 2 / 2
tools/verify-wine.sh petik 0 0 0 0                  # MessageBox « Bravo! / Well Done! Now Code a KeyGen. »
```

Pour beaucoup de noms (dont `petik`), `T` vaut 0 : voir § Notes.

## Premier regard

```
KeyGen Me - 1.exe: PE32 executable for MS Windows 4.00 (GUI), Intel i386, UPX compressed, 4 sections
upx -d : NotPackedException: not packed by UPX
```

Les sections s'appellent `UPX0`/`UPX1`/`.rsrc`/`.snaker`, mais le code est **déjà en clair** : c'est un dump après dépack (table d'imports reconstruite dans `.snaker`). `objdump` suffit, point d'entrée `0x401000`.

`Read Me.txt` : « *Keygen is the Only Soln.* … *The algo is very newbie like … but the check is bit complicated* ».

Chaînes utiles : `Well Done! Now Code a KeyGen.` / `Bravo!`, `Wrong Serial !` / `Try Harder ..`, `Enter a name !`, `Incomplete Serial !`. Imports : `DialogBoxParamA`, `GetDlgItemTextA`, `MessageBoxA`, `EndDialog`, `lstrlenA`, `StrToIntA` (shlwapi).

## Flow

1. `0x401000` : `GetModuleHandleA` puis `DialogBoxParamA(…, 0x65, …, DlgProc=0x401028)`.
2. `DlgProc` : `WM_COMMAND` avec `wParam == 0x3EB` (bouton) → `check(hDlg)` en `0x401064` ; `WM_CLOSE` → `EndDialog` + `ExitProcess`.
3. `check` lit 5 contrôles avec `GetDlgItemTextA` (256 car. max) :

| ID | Buffer | Contenu |
|---|---|---|
| `0x3E9` | `0x402000` | nom (vide → « Enter a name ! ») |
| `0x3EA` | `0x402100` | serial 1 |
| `0x3EF` | `0x402200` | serial 2 |
| `0x3F0` | `0x402300` | serial 3 |
| `0x3F1` | `0x402400` | serial 4 (un champ vide → « Incomplete Serial ! ») |

## Comment on trouve le prédicat

Tout tient dans `0x401064..0x40121D` (`analysis/disasm.txt`). Deux petits helpers :

- `0x401278(x, n)` : `esi = x ; répéter n-1 fois esi *= x` → avec `n = 2`, c'est simplement **`x*x` (32 bits)**. Effet de bord : il remet `esi`, `edi`, `edx` à 0 mais **ne touche pas `ecx`**.
- `0x401220(nom)` : le hash du nom, résultat dans `ecx`.

### Hash du nom (`0x401220`)

```asm
40123c: movzx ax, byte [esi]     ; ax = c (octet du nom)
401240: add   dx, ax             ; dx += c
401243: add   dx, dx             ; dx *= 2
401246: mul   dx                 ; dx:ax = ax * dx   (16 bits non signé)
401249: sub   dx, ax             ; dx = hi - lo
40124c: add   dx, dx             ; dx *= 2
40124f: add   dx, ax             ; dx += lo
401252: imul  dx, ax             ; dx *= lo
401256: inc esi / dec ebx / jne  ; pour chaque caractère
40125a: movzx ecx, dx            ; c = dx
401263: mov eax,ecx / imul eax,ecx   ; sq = c*c
401268: and ecx,eax / or eax,ecx / xor eax,ecx
                                 ; (sq | (c & sq)) ^ (c & sq) = sq & ~c
401270: mov ecx, eax             ; H = sq & ~c
```

### Cible `T` (`0x401107..0x401144`)

```asm
401107: push nom / call 0x401220 ; ecx = H
401111: push 2 / push ecx / call 0x401278   ; eax = H*H, ecx toujours = H
401119: xor ecx, eax             ; ecx = H ^ H²
40111b: and eax, ecx             ; eax = H² & (H ^ H²)
40111f: shl eax, 2               ; edi = eax << 2
401126: call lstrlenA            ; ecx = len(nom)
401138: cdq / idiv ecx           ; q, r = edi / len  (division SIGNÉE)
40113b: sub edi, eax             ; edi -= q
40113d: add edi, edx             ; edi += r
40113f: shr edi, 0x16            ; T = edi >> 22   → 0..1023
401144: push esi                 ; T est mis de côté sur la pile
```

### Serial (`0x40114B..0x4011B6`)

Chacun des 4 champs passe par `StrToIntA` puis `0x401278(v, 2)` (carré). Les carrés sont rangés dans `ebx`, puis empilés/dépilés ; l'ordre importe peu puisqu'on les additionne :

```asm
4011a3: add eax, ebx / add eax, ecx / add eax, edx   ; s4² + s1² + s3² + s2²
4011b3: pop esi                  ; esi = T
4011b4: cmp esi, eax
4011b6: jne 0x4011ce             ; → « Wrong Serial ! »
4011b8: MessageBoxA("Well Done! Now Code a KeyGen.", "Bravo!")
```

## Prédicat consolidé

```
H = hash16(nom) ; c = dernier dx ; H = c² & ~c
X = (H² & (H ^ H²)) << 2                       (mod 2^32)
q, r = divmod_signé(X, len(nom))               (troncature vers 0)
T = ((X - q + r) mod 2^32) >> 22
valide  ⇔  s1² + s2² + s3² + s4² == T          (mod 2^32, s_i = StrToIntA du champ i)
```

Comme `T ≤ 1023`, le **théorème des quatre carrés de Lagrange** garantit qu'une solution existe toujours : le keygen cherche simplement `a ≥ b ≥ c ≥ d ≥ 0` avec `a²+b²+c²+d² = T` par recherche exhaustive (instantanée). Les signes sont libres (`-30 10 2 2` marche aussi), et plusieurs décompositions sont valides : le crackme ne vérifie qu'une somme, pas un serial unique.

## Vérification

`tools/verify-wine.sh` lance l'exe d'origine sous `wine` dans un Xvfb, puis `tools/drive.c` (compilé avec `i686-w64-mingw32-gcc`) remplit les 5 champs par `SetDlgItemTextA`, envoie `WM_COMMAND(0x3EB)` et lit la MessageBox affichée (`analysis/wine-run.txt`) :

```
== petik 0 0 0 0
  boite : Bravo!
    [Well Done! Now Code a KeyGen.]
== petik 1 0 0 0
  boite : Try Harder ..
    [Wrong Serial !]
== am 30 10 2 2
  boite : Bravo!
    [Well Done! Now Code a KeyGen.]
== am 30 10 2 3
  boite : Try Harder ..
    [Wrong Serial !]
```

Les deux cas KO (somme décalée de 1 ou de 5) confirment que c'est bien la somme des carrés qui est comparée, avec une cible non nulle (`am`, `T = 1008`) comme nulle (`petik`).

## Notes

- **Pourquoi `T = 0` si souvent** : dans la boucle du hash, `dx` est doublé deux fois par caractère (`add dx,dx`) puis multiplié ; les facteurs 2 s'accumulent et, après quelques caractères, les bits de poids faible de `c` sont nuls. Alors `H = c² & ~c` a ses 16 bits bas à 0, `H² ≡ 0 (mod 2^32)`, donc `X = 0` et `T = 0`. Pour `petik`, `H = 0x55900000` → `T = 0` et le serial `0 0 0 0` passe. Ce n'est pas un bypass : c'est la vraie sortie de l'algorithme. Les noms courts (`ac`, `ak`, `am`…) donnent des cibles non nulles.
- Le check « un peu compliqué » annoncé dans le Read Me, c'est juste la pile : `T` est poussé tôt (`push esi` en `0x401144`) et récupéré par le dernier `pop esi`, après le mélange `push ecx / push edx / pop ecx / pop edx` des carrés.
- Pas de patch : l'exe d'`original/` n'est pas modifié.
