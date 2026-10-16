# toasterbirb — shellcoding

| | |
|---|---|
| **ID** | [`6869167eaadb6eeafb398fb4`](https://crackmes.one/crackme/6869167eaadb6eeafb398fb4) |
| **Auteur** | toasterbirb |
| **Plateforme** | Linux ELF64 PIE, **strippé** |
| **SHA-256** | `ab8e3dcc3f3efa7348ad27d766d2ebb95f5e12567dbcb6e02a3adc1a412cd2ac` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/shellcoding` | binaire d'origine |
| `tools/shellcoding-solve.py` | génère le fichier attendu (`-o`, `-q`, `--check`) |
| `analysis/get_number.png` | le fichier généré (10 octets de shellcode) |

## Réponse

Ce n'est pas un mot de passe : il faut fournir **un fichier `get_number.png`** (dans le répertoire courant) contenant du shellcode :

```text
90 89 f8 83 e0 01 83 c0 02 c3
nop ; mov eax,edi ; and eax,1 ; add eax,2 ; ret
```

```bash
cd analysis && ../original/shellcoding           # lit ./get_number.png -> Correct! Awesome file you got there
python3 tools/shellcoding-solve.py --check
```

## Premier regard

`strings` : `get_number.png`, `File could not be opened`, `The file was empty :(`, `Loading...`, `Processing...`,
`I'm not happy with the first byte`, `Correct! Awesome file you got there`, imports `fopen`, `fread`, `mmap`, `time`, `sleep`.
Le nom du fichier est codé en dur ; sans lui : `File could not be opened`. Le binaire est strippé, `main` est à `0x1120` (cible du `lea rdi` de `_start` @ `0x11e8`).

## Flow

1. `puts("Loading...")`, puis **loader** @ `0x12f0` : `fopen("get_number.png","r")`, `mmap(0, 0x10, PROT_RWX=7, MAP_PRIVATE|MAP_ANON=0x22)`,
   préremplit 0x20 octets avec `0f 0b` (**`ud2`**), puis `fread(buf, 1, 0x10, f)` (16 octets max). Fichier vide → « The file was empty :( ».
2. Check @ `0x1390` : `buf[0] == 0x90` (**nop**) sinon « I'm not happy with the first byte ».
3. `puts("Processing...")`, puis (@ `0x1150`) :
   `t1 = time(0); r1 = buf(t1)` ; `sleep(1)` ; `t2 = time(0); r2 = buf(t2)` ; test final.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/shellcoding --start-address=0x1120 --stop-address=0x1400`.

```asm
132f: call mmap                  ; mmap(0, 0x10, 7, 0x22, -1, 0) : page RWX
1344: mov eax,0xb0f0b0f ; ... movups [rbx],xmm0 ; movups [rbx+0x10],xmm0   ; 32 octets de "0f 0b" (ud2)
135c: call fread                 ; fread(buf, 1, 0x10, f)
1394: cmp BYTE PTR [rdi],0x90 ; jne "not happy"        ; premier octet = NOP

1162: mov rbx,rax                ; rbx = t1
1168: call rbp                   ; rbp = buf  -> f(t1), rdi = t1
116a: not rbx ; and ebx,1        ; e1 = ~t1 & 1  (1 si t1 est pair)
1175: lea r12d,[rax+rbx]         ; r12 = f(t1) + e1
1179: call sleep(1)
...   call rbp                   ; f(t2)
1193: add eax,ebx ; add eax,r12d ; cmp eax,6 ; je "Correct!"
```

Le fichier est donc appelé comme `int f(long t)` avec `t` dans `edi`, résultat dans `eax`, et il faut
`f(t1) + (~t1&1) + f(t2) + (~t2&1) == 6`.

**Idée** : prendre `f(t) = 2 + (t&1)`. Alors `f(t) + (~t&1) = 3` pour tout `t` (si `t` impair : `3 + 0` ; si pair : `2 + 1`).
La somme fait donc toujours `3 + 3 = 6`, **même si `sleep(1)` dérive** et que `t2 = t1 + 2` (une version « f(t1)+f(t2) = 5 » ne marcherait que si les deux
secondes sont consécutives).

Assemblage (10 octets, rentre dans les 16 lus) :

```asm
90          nop
89 f8       mov eax, edi
83 e0 01    and eax, 1
83 c0 02    add eax, 2
c3          ret
```

Pièges :
- les octets non lus restent des `ud2` : un shellcode qui « tombe » après son `ret` ou dépasse 16 octets plante en `SIGILL` ;
- le fichier s'appelle `get_number.png` mais n'est **pas** une image ; le premier octet `0x90` est imposé ;
- `main` ne lit que 16 octets : pas de gros shellcode.

## Vérification

```text
$ python3 tools/shellcoding-solve.py --check
get_number.png = 90 89 f8 83 e0 01 83 c0 02 c3 (10 octets)
OK x3: Correct! Awesome file you got  | KO: I'm not happy with the first byte | That doesn't seem right... You need to w | File could not be opened
```

(3 exécutions réelles de 2 s chacune ; KO : premier octet `0x91` ; fonction qui renvoie toujours 0 ; fichier absent.)

## Notes

- Reverse statique (objdump) + tests live ; pas de GDB.
- Le binaire n'est pas modifié : seul le fichier `get_number.png` est fourni.
