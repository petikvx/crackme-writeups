# Kryptos's Hecate (Windows)

| | |
|---|---|
| **ID** | [`6a50104508b99fa0d448cd96`](https://crackmes.one/crackme/6a50104508b99fa0d448cd96) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Kryptos |
| **Plateforme** | Windows PE64 console (MinGW, C++) |
| **SHA-256** | `f2a48babe5e60e139079f7afdae619bc6082d6b5c94cba22649167a4e6e22621` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/hecate.exe` | binaire d'origine (non modifié) |
| `tools/hecate-solve.py` | keygen (`-q`, `--check` via Wine) |

## Réponse

| name | serial |
|---|---|
| `petik` | **`82FE-6815-2A35`** |

```bash
python3 -I tools/hecate-solve.py --name petik        # -q pour le serial seul, --check pour tester sous Wine
```

## Premier regard

`file` : PE32+ console x86-64, MinGW/libstdc++. `strings` : `name: `, `serial: ` et surtout le format `%04X-%04X-%04X` dans `.rdata` (0x1400cc08c) → le serial attendu est calculé puis comparé, pas stocké.

## Flow

`name:` (getline) → `serial:` (getline) → serial passé en majuscules (`toupper` octet par octet) → calcul du serial attendu depuis le nom → comparaison → `Access granted.` / `Access denied.`

## Comment on trouve

Ancrage : `objdump -d -M intel original/hecate.exe`, recherche de la référence à l'adresse du format `%04X-%04X-%04X` → fonction de check à `0x1400c3ea0`.

```asm
1400c3fe2  cmp r9,3 ; jbe ...          ; nom de longueur <= 3 refusé
1400c4010  movzx ecx,[rbx]; call toupper ; serial saisi mis en majuscules
1400c4038  mov eax,0x811c9dc5          ; offset basis FNV-1a 32 bits
1400c4047  xor eax,ecx
1400c4049  imul eax,eax,0x1000193      ; prime FNV
1400c4054  imul r9w,r9w,0x1234         ; r9 = (len*0x1234) & 0xffff
1400c4066  xor r9d,eax                 ; r = r9 ^ h
1400c4069  shr eax,0xb                 ; h >> 11
1400c406c  lea edx,[r9+r9*2]           ; 3*r
1400c4070  add eax,edx                 ; e = (h>>11) + 3*r
1400c4079  xor edx,eax ; xor dx,0xc0de ; d = (r ^ e) ^ 0xc0de
1400c4093  call snprintf(buf,15,"%04X-%04X-%04X", r&0xffff, e&0xffff, d&0xffff)
```

Prédicat : `h = FNV1a32(name)`, `r = ((len*0x1234)&0xffff) ^ h`, `e = (h>>11) + 3r`, `d = (r ^ e) ^ 0xc0de` ; serial = `r16-e16-d16` en hexa majuscule (la comparaison se fait sur la saisie en majuscules, donc la casse est libre).

Exemple `petik` : h=0xd6f8d9fa, r=0xd6f882fe, e=0x85046815 → r16=`82FE`, e16=`6815`, d16=`2A35` → `82FE-6815-2A35`.

Pièges : `imul r9w` ne touche que les 16 bits bas (d'où le `& 0xffff`) ; `shr` s'applique à `h` (eax) et non à `r` ; le nom reste en casse d'origine pour le hash.

## Vérification (Wine)

```text
$ python3 -I tools/hecate-solve.py --check
name=petik serial=82FE-6815-2A35
82FE-6815-2A35 -> name:   serial: Access granted.
0000-0000-0000 -> name:   serial: Access denied.
```

Reverse 100 % statique (objdump) ; pas de session GDB/IDA (IDA indisponible sur cette machine).

## Notes

Même famille que la version Linux ([Hecate linux/unix](../6a5010dac630e9c9509785f6/)) : même idée FNV-1a + mélange.
