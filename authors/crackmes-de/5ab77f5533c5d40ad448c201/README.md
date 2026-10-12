# sams_crackme2 by samfisher9000 (crackmes.de)

« crackme#2 » de samfisher9000 (2005) : « keygen this and write a solution. of course, no patching. »

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c201>
- **Plateforme** : Windows **PE32** GUI, **Borland Delphi 7** — difficulté 2.0
- **Archive** : `original/samcrackme2.zip` → `crackme.exe` + `readme.txt`
- **SHA-256 zip** : `38a9df07aed23700b0cfaa52e7bfc55f97abbed8d26a13a93ab4146ec7f6b163`
- **Statut** : résolu (keygen), vérifié **sous wine** : ShowMessage « Correct »

## Solution

```
esi = acc = 0
pour chaque car. c du nom :
    v = Ord(c)
    si v < 0x6E : v += 0x0B
    si v > 0x6E : v -= 0x0D
    si v = 0x6E : v += 0x14
    v += 0x0B
    esi += v                      # somme cumulée
    acc += esi - 0x3F
t = IntToStr(acc + esi)
u = concat(IntToStr(Ord(x)) pour x dans t)      # codes ASCII décimaux de t
s = ''
pour i = 1 .. Length(t) : s = s + '-' + Copy(u, i, 4)   # fenêtres glissantes de 4
serial = IntToStr(Length(s)) + '13' + s
```

```
python3 tools/sams-crackme2-solve.py petik
2013-4957-9575-5750-7505
```

| Name | Serial |
|---|---|
| `petik` | `2013-4957-9575-5750-7505` |

Exemple `petik` : `acc + esi` = `1925` → `t` = `"1925"` → `u` = `49575053` ; 4 fenêtres `4957`, `9575`, `5750`, `7505`
→ `s` = `-4957-9575-5750-7505` (longueur 20) → serial = `20` + `13` + `s`.

## Comment on trouve

1. `diec` : Delphi 7. La ressource `RCDATA/TFORM1` (DFM) donne la fiche : `Button1` (*OK*, `Button1Click`),
   `Edit1`…`Edit4`, `Button2` (*Keygen*, `Button2Click`, le « keygen » intégré lit d’autres champs).
2. La table des méthodes publiées (`\x0cButton1Click` précédé de son adresse) donne
   `Button1Click = 0x45395c`, `Button2Click = 0x453b78`. Champs de la fiche : `+0x2fc` = `Edit1` (nom),
   `+0x300` = `Edit2` (serial).
3. `objdump -d -M intel --start-address=0x45395c` : helpers maison
   - `0x453808` = `Copy(s, idx, cnt)` ;
   - `0x453860` = `Ord` « à la main » (boucle `ebx++` jusqu’à `Chr(ebx) = s`) ;
   - `0x4538c8` = concatène `IntToStr(Ord(s[i]))` pour chaque caractère ;
   - RTL : `0x407ce0` `IntToStr`, `0x40410c` `Length`, `0x4041cc` `LStrCatN`, `0x404258` `LStrCmp`,
     `0x42736c` `ShowMessage`.
4. Boucle nom `0x4539d8..0x453a30` (ajustements autour de `0x6E` puis `+0x0B`, somme cumulée `esi`,
   `[ebp-0x14] += esi - 0x3F`), puis `IntToStr([ebp-0x14] + esi)`, codes décimaux, boucle
   `0x453a5b` : `s := s + '-' + Copy(u, i, 4)` (ordre des `push` avant `LStrCatN` = ordre de concaténation).
5. Dernier `LStrCatN` (`0x453abc`) : `push IntToStr(Length(s))`, `push IntToStr(13)`, `push s` →
   **`IntToStr(Length(s)) + '13' + s`** (premier essai raté en le lisant à l’envers : `Wrong`).
   Puis `LStrCmp(Edit2.Text, attendu)` → `Correct` / `Wrong`.

## Vérification

```
tools/verify-wine.sh petik 2013-4957-9575-5750-7505 /tmp/ok.png   # « Correct »
tools/verify-wine.sh petik -1234-5678 /tmp/ko.png                 # « Wrong »
```

Binaire original (non patché) sous wine/Xvfb le 2026-10-12, navigation clavier (TabOrder : OK, Edit1, Edit2),
texte tapé via `xdotool type --file -` (un serial qui commence par `-` serait pris pour une option).
Captures : [`analysis/correct-petik.png`](analysis/correct-petik.png), [`analysis/wrong.png`](analysis/wrong.png).
