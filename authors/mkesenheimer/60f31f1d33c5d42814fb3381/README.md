# MKesenheimer — Forest

| | |
|---|---|
| **ID** | [`60f31f1d33c5d42814fb3381`](https://crackmes.one/crackme/60f31f1d33c5d42814fb3381) |
| **Auteur** | MKesenheimer |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `3523080b6900152114639a8f15fda64f0336234258fb8d6d902f9f5eba842194` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/forest` | binaire d'origine |
| `tools/forest-solve.py` | fournit le flag (`-q`, `--check`) |

## Réponse

**Flag : `redridinghood`** (référence au Petit Chaperon Rouge, 13 caractères)

```bash
echo redridinghood | ./original/forest    # You escaped the forest. / Flag is correct.
python3 tools/forest-solve.py --check
```

## Premier regard

`strings` : `The forest is dark and dangerous. Be careful!`, `Please enter the flag:`, `%13s`, `You escaped the forest.`, `Flag is correct.`, `The forest is unforgiving.`, `Flag not correct.`. Import `sqrt`. Taille fixe de 13 caractères.

## Flow

`main` @ `0x1080` : `scanf("%13s", buf)`, puis une série de contraintes sur chaque octet de `buf` (longueur 13).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/forest | awk '/<main>:/,/ret/'`.

```asm
10c1: cmp  BYTE PTR [buf+0],0x72       ; buf[0] == 'r'
10c8: movsx ax,buf[1] ; idiv dl(=10) ; sub ah,1 ; je ...   ; buf[1] % 10 == 1   ('e'=101, 101%10=1 ✓)
1105: cvtsi2sd xmm0,buf[2] ; call sqrt ; mulsd *5.0 ; cmp 50.0   ; sqrt(buf[2])·5 == 50 -> sqrt(buf[2])==10 -> buf[2]==100='d'
112b: sub eax,1 ; cmp al,0x71 ; ja fail   ; buf[3]-1 <= 0x71 (quasi libre : 'r'=114 passe)
1137..1180: buf[4..12] == "idinghood" (littéral, comparaisons directes)
```

Assemblage : `r` + `e` (ou tout caractère ≡1 mod 10) + `d` (sqrt → 100) + `r` (ou tout octet libre ≤ 114) + `idinghood` = **`redridinghood`**, le nom du conte sans espaces.

## Vérification

```text
$ echo redridinghood | ./forest   -> You escaped the forest. / Flag is correct.
$ echo wrongwrongw    | ./forest   -> The forest is unforgiving. / Flag not correct.
```

## Notes

- Reverse statique + essais live ; pas de GDB.
- Les positions 1 et 3 ont des contraintes larges (pas une seule solution possible), mais `redridinghood` est la lecture naturelle.
