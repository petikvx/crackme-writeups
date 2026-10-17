# sudo0x18 — Level1

| | |
|---|---|
| **ID** | [`646627a933c5d439389131d9`](https://crackmes.one/crackme/646627a933c5d439389131d9) |
| **Auteur** | sudo0x18 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`checkPass`) |
| **SHA-256** | `f0d5c530a6b7ee5d87ce95d8e532917d7c60655f2223bf2a7b782d7956a01f99` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/level1` | binaire d'origine |
| `tools/level1-solve.py` | relit les 8 immediates comparés (`-q`, `--check`) |

## Réponse

**Mot de passe : `sudo0x18`**

```bash
echo sudo0x18 | ./original/level1      # You are correct :)
python3 tools/level1-solve.py --check
```

## Premier regard

`strings` : `Welcome to Easy Crack Me`, `What is the Secret ?`, `%64s`, `You are correct :)`, `Better luck next time. :(`. Le secret n'apparaît pas en clair, mais `strings` renvoie des fragments
`<supH`, `<uuhH`, `<duYH`, `<ouJH`… : ce sont des **opcodes** `cmp al,imm8` (`3c 73` = `<s`, `3c 75` = `<u`, …) collés à l'octet suivant, pas des chaînes. Lus à la suite : `s u d o`.

## Flow

`main` @ `0x11d5` : deux `printf`, `scanf("%64s", buf)`, `checkPass(buf)` @ `0x1149` ; retour non nul → « You are correct :) », sinon « Better luck next time. :( ».

## Comment on trouve

**Ancrage** : `nm original/level1 | grep checkPass` puis `objdump -d -M intel --no-show-raw-insn original/level1 --start-address=0x1149 --stop-address=0x11d5`.

```asm
1155: movzx eax,BYTE PTR [rax]      ; buf[0]
1158: cmp al,0x73 ; jne           ; 's'
1167: cmp al,0x75 ; jne           ; 'u'  (buf[1])
1176: cmp al,0x64 ; jne           ; 'd'
1185: cmp al,0x6f ; jne           ; 'o'
1194: cmp al,0x30 ; jne           ; '0'
11a3: cmp al,0x78 ; jne           ; 'x'
11b2: cmp al,0x31 ; jne           ; '1'
11c1: cmp al,0x38 ; jne           ; '8'
11c5: mov eax,1                   ; succès
```

Les huit comparaisons donnent **`sudo0x18`** (le pseudo de l'auteur). Piège : `checkPass` ne vérifie **ni la longueur ni l'octet suivant** : tout ce qui commence par `sudo0x18` est accepté (par exemple `sudo0x18XYZ`, vérifié). Les variantes de casse ou décalées (`Sudo0x18`, `xsudo0x18`) sont refusées.

## Vérification

```text
$ echo sudo0x18    | ./level1   -> You are correct :)
$ echo sudo0x18XYZ | ./level1   -> You are correct :)     (préfixe seul testé)
$ echo sudo0x1     | ./level1   -> Better luck next time. :(
$ echo Sudo0x18    | ./level1   -> Better luck next time. :(
```

## Notes

- Reverse statique + essais live ; pas de GDB.
