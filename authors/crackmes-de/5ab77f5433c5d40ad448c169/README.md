# linux_crackme_v1 (CM11) — veneta//MBE (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c169 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, écrit en NASM (973 octets, en-têtes ELF « maison »)
- Archive : `original/cm11.zip` → `cm1` + `info.nfo` (extraits sous `analysis/`)

## Réponse

Plusieurs mots de passe sont valides (4 dwords seulement sont comparés pour 8 octets d'entrée). Celui trouvé par le solveur :
soit ~2⁶⁴ / 2¹²⁸ au mieux de solutions « presque uniques », mais seuls 4 dwords partiels contraignent). Celui trouvé par le solveur :

```
Mudvay(!
```

```bash
python3 -I tools/cm11-solve.py --check     # → Mudvay(!  puis check: OK
echo 'Mudvay(!' | ./analysis/cm1           # OK Cracked Now mail me :)
```

Pas de nom d'utilisateur : un simple mot de passe (8 caractères utiles).

## Premier regard

```text
$ file analysis/cm1
ELF 32-bit LSB executable, Intel 80386, dynamically linked, corrupted section header size
$ strings analysis/cm1 | head
… getchar write veneta//mbe12345678.v
Write Your Password:   BAD PASSWORD :P   OK Cracked Now mail me :)
```

Pas de `main` ni de section headers : on désassemble en mode binaire avec `--adjust-vma=0x08048000` à partir de l'entry `0x0804819f`.

## Flow

1. Affiche la bannière, puis `Write Your Password:`.
2. Lit jusqu'à **18 (0x12)** caractères avec `getchar` (`call [ebx+8]`), en ignorant les blancs (`0x20`, `0x09..0x0d`).
3. Appelle la routine `0x8048242` sur ce tampon.
4. `repz cmpsb` de 16 octets : `[0x80482fe..]` (zone modifiée par la routine) contre `[0x8048312..]` (constante).
5. Egal → `OK Cracked Now mail me :)`, sinon `BAD PASSWORD :P`.

## Comment on trouve

**Ancrage** : `objdump -D -b binary -m i386 -M intel --adjust-vma=0x08048000 --start-address=0x0804819f analysis/cm1`.

La routine `0x8048242` charge `ecx = dword[buf]`, `ebx = dword[buf+4]` (les 8 premiers caractères `p0..p7`)
et XOR dans la zone `[0x80482fe]` (initialement `"veneta//mbe12345678."`) quatre dwords calculés :

```asm
mov al,bl ; mov ah,cl ; rol eax,16 ; mov al,bh ; mov ah,ch   ; eax = p5|p1<<8|p4<<16|p0<<24
xor eax,0xa589ca11 ; shl eax,5      ; xor [0x80482fe],eax        ; w0
rcr ebx,0x13 ; and ebx,0x211333 ; xor edx,ebx ; xor edx,0x87654321 ; xor [+4],edx   ; w1
and ebx,0x2f13af92 ; add ebx,0x12623345 ; ror esi,0x39 ; xor [+8],esi               ; w2
and ebx,0x2113ff98 ; add ebx,0x5623a5ff ; rol ecx,0x56 ; ror ebx,7 ; xor ecx,ebx
rcl ecx,0x32 ; mov [+0xc],ecx                                                         ; w3
```

Il n'y a donc **aucun hash non inversible** : seulement des rotations, `and`/`add` avec constantes, et deux
rotations à travers la retenue (`rcr`/`rcl`). Plutôt que d'inverser à la main, on modélise le tout en
bit-vectors 32 bits avec **z3** (`tools/cm11-solve.py`), on pose `w_i == cible_i` (octets `0x312..0x321`)
et `0x21 ≤ p_i ≤ 0x7e`.

**Pièges :**
- `rcr`/`rcl` sur 32 bits tournent sur **33 bits** (retenue incluse) et le compteur est d'abord réduit modulo 32
  (`0x32 & 31 = 18`) — c'est ce qui rendait mon premier modèle `unsat`.
- La retenue d'entrée est `0` (précédée de `add edi,4` / `xor`).
- `w3` est une **écriture** (`mov [edi],ecx`) et non un XOR avec la constante initiale.
- Seuls 4 dwords sur 5 sont comparés (16 octets) : le 5ᵉ mot écrit à `0x80483 0e` n'intervient pas.

## Vérification

```text
$ echo 'Mudvay(!' | ./analysis/cm1       # voir analysis/ok.txt
	OK Cracked Now mail me :)
$ echo petik | ./analysis/cm1            # voir analysis/ko.txt
	BAD PASSWORD :P
```

## Notes

- Pas de GDB (statique + preuve native).
- Le binaire n'a ni canari ni anti-debug ; le nfo de l'auteur est dans `analysis/info.nfo`.

## Fichiers

- `analysis/cm1`, `analysis/info.nfo` : extraits de `original/cm11.zip` ; `analysis/ok.txt`, `analysis/ko.txt` : preuves
- `tools/cm11-solve.py` : modèle z3 + vérif native
