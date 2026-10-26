# crackmes.de's evidence2 (EViDENCE trial crackme #2) by GiveMe5

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c362`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c362) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (crackme de *GiveMe5*, tuto de *HaQue*) |
| **Plateforme** | Windows PE32 GUI (asm pur, ~2 Ko de code, aucun CRT) |
| **SHA-256 du ZIP** | `198a60cc8034dd979afb7702aaa1e0b7af5c64d1c2e557b9eeefd0639470f7a3` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/haque_evd2.zip` | archive d'origine (mot de passe `crackmes.one`) : `evdcm2.exe`, `evd2.txt`, `evdcm2.html` (tuto HaQue), `evdcm2sc.c` |
| `analysis/x/` | contenu dézippé (le zip d'origine n'est pas modifié) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine : serial valide / invalide |
| `tools/evd2-solve.py` | keygen + `--check` (Wine/Xvfb/xdotool) |

## Réponse

Serial = fonction du **nom** (en décimal) :

| Nom | Serial |
|---|---|
| `petik` | **`600649`** |

```bash
python3 tools/evd2-solve.py --user petik        # name='petik' serial=600649
python3 tools/evd2-solve.py -q                  # 600649
python3 tools/evd2-solve.py --check             # lance evdcm2.exe sous Wine/Xvfb
```

## Premier regard

```text
$ file evdcm2.exe   → PE32 executable (GUI) Intel i386, 5 sections (CODE, DATA, .idata, .reloc, .rsrc)
$ strings -n5 evdcm2.exe
CrackMe (c) by GiveMe5 / Sorry, Serial not valid ! / Yep, Serial valid !
USER32: DialogBoxParamA, GetDlgItemTextA, SendDlgItemMessageA, MessageBoxA ...
```

Une dialog avec deux Edit (Name `0x65`, Serial `0x66`), boutons *check* (id 2) et *about* (id 1). Le champ Name est prérempli par `GiveMe5`.
Attention : l'archive contient aussi un tuto + un keygen C (`evdcm2sc.c`) ; ici le serial a été re-dérivé **depuis le binaire** et validé contre lui (voir plus bas, l'écart avec le source C).

## Flow

- `0x4010c2` : `WinMain` → `DialogBoxParamA` (dlgproc `0x40111b`).
- `WM_INITDIALOG` (0x110, `0x4011c2`) : `SetDlgItemTextA(0x65, "GiveMe5")` puis `0x40109b`.
- `0x40109b` (appelé aussi à chaque `WM_COMMAND` de l'id `0x65`) : `GetDlgItemTextA(0x65, 0x40200e, 0x29)` → nom dans `0x40200e`, longueur dans `[0x4020f7]` (donc 40 caractères max).
- *check* (`0x4011fb`, aussi sur `WM_CLOSE`) : lit le serial dans `0x402050`, puis le code est volontairement tortueux (appels à `0x401000` avec `ebp` détourné, `push 0x40121c ; ret`) avant d'arriver à la routine de contrôle.

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/x/evdcm2.exe` — la section `CODE` commence à `0x401000` et mélange deux fonctions imbriquées : un `atoi` décimal et le calcul du serial.

**1. Le parseur décimal (`0x401000`, si `[ebp] != 1`)** :

```asm
401016: sub bl,0x30          ; chiffre
401019: lea eax,[eax+eax*4]  ; eax*5
40101c: add eax,eax          ; *2  → eax*10
40101e: add eax,ebx          ; + chiffre         (32 bits, wrap, aucune validation)
```
→ le serial saisi est un entier décimal modulo 2³² (stocké dans `[0x4020ff]`).

**2. Le contrôle (`0x401028`, atteint quand `[ebp] == 1`)** — l'astuce : à `0x40124a` le programme met `ebp = 0x402107` et fait `inc byte [ebp]` ; `0x402107` valant 0 au départ, la 3ᵉ passe dans `0x401000` voit `[ebp]==1` et exécute la partie « check » au lieu du `atoi`. Anti-lecture, rien de plus.

```asm
401031: mov ecx,[0x4020f7]        ; longueur du nom
401037: mov esi,0x40200e          ; nom
40103e: mov edi,0x402103          ; total (dword, 0 au départ)
401043: lods al,[esi]             ; c
401044: add [edi],eax             ; total += c
401046: add dword [edi],0x2f      ; total += 47
401049: loop 0x401043
40104d: mov eax,[edi]             ; eax = total
401050: add eax,0x1a0b            ; total + 6667   → [0x402107]
40105d: imul eax                  ; total*total (32 bits bas) → [0x40210b]
401066: inc / inc                 ; +2
401076: xor [esi],eax             ; (total²+2) ^ (total+6667)
401078: sub dword [esi],0x309     ; -777
40107e: inc dword [esi]           ; +1  → net : -776 (0x308)
40108c: cmp edx,[0x4020ff]        ; == serial saisi ?  oui → ret (Yep) ; non → 0x40121c (Sorry)
```

**3. Formule consolidée**

```text
total  = Σ (name[i] + 47)           (tous les caractères, espaces compris)
serial = ((total² + 2) XOR (total + 0x1a0b)) − 0x308      (mod 2³²)
```

**4. Exemple `petik`** : `p=112 e=101 t=116 i=105 k=107` → Σ = 541 ; + 5·47 = 235 → `total = 776`.
`total² = 602176` ; `+2 = 602178 = 0x93042` ; `total+6667 = 7443 = 0x1D13`.
`0x93042 ^ 0x01D13 = 0x92D51 = 601425` ; `− 776` → **`600649`**.

**Pièges** :
- Le **source C du tuto** (`evdcm2sc.c`) **saute les espaces** (`if username[i] != 32`) ; le **binaire non** (aucun test de `0x20` dans la boucle `0x401043`). Le solveur suit le binaire : un nom avec espaces donne donc un autre serial que le keygen du tuto.
- Le serial est comparé en 32 bits : pas de signe, le décimal est celui de l'`uint32`.
- Le texte de départ du champ Name est `GiveMe5` : il faut **effacer** le champ avant de taper `petik`, sinon on teste `GiveMe5petik` (c'est ce qui a failli faire échouer la 1ʳᵉ vérification).
- Sur `WM_CLOSE` le crackme affiche aussi « Sorry » (pas de serial = erreur).

## Vérification

Binaire d'origine (`analysis/x/evdcm2.exe` = copie identique au zip) sous Wine + Xvfb, UI pilotée par xdotool (`tools/evd2-solve.py --check`) :

| Cas | Entrée | Résultat |
|---|---|---|
| OK | `petik` / `600649` | « Yep, Serial valid ! » — [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png) |
| KO | `petik` / `600650` | « Sorry, Serial not valid ! » — [`analysis/screenshot-ko.png`](analysis/screenshot-ko.png) |

## Notes

Pas de GDB ni de debug live utilisés (analyse statique + preuve Wine). Aucune protection : pas d'anti-debug, juste du code auto-référentiel.
