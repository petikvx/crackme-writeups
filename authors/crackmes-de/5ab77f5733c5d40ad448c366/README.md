# crackmes.de's eazy_peazy_crackme (SerialMe) by fego

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c366`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c366) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (fego) |
| **Plateforme** | Windows PE32 GUI (MASM32, « Dialog as main ») |
| **SHA-256 (zip)** | `25ea58dfa089308bbe54c0ff048e7c8a1eb48963d593ee2b65915ad868436a9d` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/SerialMe.zip` | archive d'origine (contient `SerialMe.exe` + `README.txt`) |
| `tools/serialme-solve.py` | solveur (cherche un serial valide, `--check` pour tester un serial) |
| `tools/serialme-unicorn-check.py` | émulation unicorn du vrai code du PE (preuve indépendante du solveur) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | captures Wine/xvfb (serial bon / mauvais) |

## Réponse

Pas de user : un **serial fixe de 8 caractères** (plusieurs serials valides existent, la vérification est non injective).

| Serial | Résultat |
|---|---|
| **`-Z8Z'K8#`** | « Right serial » |
| `,S]E'#8[` | « Right serial » |

```bash
python3 -I tools/serialme-solve.py          # serial = ,S]E'#8[ (--all N pour en lister N)
python3 -I tools/serialme-solve.py --check "-Z8Z'K8#"   # OK
```

## Premier regard

```bash
unzip original/SerialMe.zip -d /tmp/sm        # SerialMe.exe (4096 o) + README.txt
file /tmp/sm/SerialMe.exe                      # PE32 GUI, i386, 4 sections, MASM32
strings -n 4 /tmp/sm/SerialMe.exe
```

Le README.txt annonce « pure Assembly using MASM ». `strings` donne les messages
(`Wrong Serial`, `Right serial`, `Rules: Find the serial without patching!`) et les imports
user32 (`CreateDialogParamA`, `GetDlgItemTextA`, `MessageBoxA`…). Pas de packer.
La fenêtre : un Edit (ID `0x3e9`), un bouton CHECK (`0x3ea`), QUIT (`0x3eb`), ABOUT (`0x3ec`)
(dialog template dans `.rsrc`, offset fichier `0xe00`).

## Flow

`WinMain` @0x401036 enregistre la classe `DLGCLASS` et crée le dialogue avec la DlgProc @**0x401103**.
`WM_COMMAND` (0x111) avec l'ID `0x3ea` (CHECK) mène au check @0x40113c.

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --start-address=0x401000 --stop-address=0x40131a SerialMe.exe`
(le `.text` fait 0x31a octets, tout tient dans un écran). On repère le `cmp eax,0x3ea` @0x401131
puis l'appel `GetDlgItemTextA(hDlg, 0x3e9, 0x4030f0, 0x10)` @0x40114b :

```asm
40114b: call GetDlgItemTextA        ; buffer serial = 0x4030f0
401150: cmp  eax, 8                  ; longueur obligatoire = 8
401153: jne  0x40122f                ; -> "Wrong Serial"
```

Le résultat est construit dans un buffer `out` @0x403122 (8 octets) puis comparé à la
chaîne `8x@rtr25` stockée en `.data` @0x4030dc (on la voit dans `objdump -s -j .data` :
`38784072 74723235`).

**Étape 1 – premiers 4 octets** (0x40115d–0x40118f) :

```asm
mov  eax, [0x4030f0]        ; s[0..3] en dword LE
mov  edi, 0x310890
cdq / imul edi              ; eax = low32(signed(s[0..3]) * 0x310890)
xor  eax, 0x96547
mov  [out], eax
; pour i = 0..3 :
mov  al, [s+i] ; xor al,[out+i] ; shl al,2 ; mov [out+i], al
```

**Étape 2 – 4 derniers octets** (0x401191–0x4011cf) :

```asm
mov  eax, [0x4030f4]        ; s[4..7]
mov  edi, 0x666666 ; imul edi ; xor eax, 0x365799
ror  eax, 0x31              ; count masqué à 5 bits -> ror 17
mov  [out+4], eax
; pour i = 4..7 :
mov  al,[s+i] ; xor al,[out+i] ; xor al,0x31 ; ror al,0x12   ; (18 mod 8 = ror 2)
mov  [out+i], al
```

**Étape 3 – normalisation** (0x4011d5–0x4011fd) : pour chaque octet, comparaisons **signées** :
tant que `al > 0x7a` : `al -= 10` ; tant que `al < 0x30` : `al += 10` (les octets ≥ 0x80 sont négatifs
donc remontés par `+10`). Ça ramène chaque octet dans `[0x30..0x7a]`.

**Étape 4 – comparaison** octet à octet avec `8x@rtr25` (0x401203–0x401215) →
succès @0x401219 (`MessageBox` « Right serial »), échec @0x40122f.

**Résolution** :
- Dans la 1re moitié, `out[i]` ne dépend que de `s[0..i]` (la retenue du `imul` ne remonte que vers
  les octets de poids fort) → recherche en profondeur octet par octet, 94 candidats à chaque niveau.
- La 2e moitié est mélangée par le `ror 17` : recherche exhaustive vectorisée (numpy) sur 94⁴ ≈ 78 M
  combinaisons imprimables, filtrée octet par octet par la normalisation + comparaison.
- Le produit cartésien des deux moitiés donne les serials ; le solveur re-vérifie chacun avec un
  modèle Python complet du check (`check_bytes`).

Pièges : `ror eax,0x31` (le count x86 est masqué à 5 bits) et `ror al,0x12` (18 mod 8 =
2 pour une rotation 8 bits) ; comparaisons `jg/jl` **signées** dans la normalisation ; `cdq` + `imul edi`
en 64 bits dont seul `eax` est gardé ; l'`out` de l'étape 2 écrase `out[4..7]` après l'étape 1.

## Vérification

1. **Émulation du vrai code** (unicorn, exécute les octets de `.text` de 0x401159 à 0x401219/0x40122f) :

```bash
cd /tmp/sm && python3 /chemin/tools/serialme-unicorn-check.py "-Z8Z'K8#" ",S]E'#8[" "-Z8Z'K8@" AAAAAAAA
# -Z8Z'K8# True / ,S]E'#8[ True / -Z8Z'K8@ False / AAAAAAAA False
```

2. **Wine live** (`xvfb-run -a wine SerialMe.exe`, saisie et clic CHECK via `xdotool`) :
   - `-Z8Z'K8#` → MessageBox « **Right serial** » ([screenshot-ok.png](analysis/screenshot-ok.png))
   - `-Z8Z'K8@` (dernier octet modifié) → « **Wrong Serial** » ([screenshot-ko.png](analysis/screenshot-ko.png))

## Notes

- Aucun GDB ni debugger utilisé : reverse statique + émulation + Wine.
- Ce n'est **pas** un keygen name→serial : le serial est constant (mais non unique).
- `original/` est resté intact (le zip n'est pas patché ; l'exe a été extrait dans `/tmp`).
