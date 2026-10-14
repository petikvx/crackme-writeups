# easy_math_keygenme — cyrex (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d5 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **statique**, packé UPX 1.25 (2006)
- Archive : `original/easy_math_keygenme.tgz` → `keygenme` ; dépaqueté : `analysis/keygenme.unpacked`

## Réponse

| Name | Serial |
|---|---|
| `petik` | `0x78-20-20-0xfffffff2` |
| `abcdefg` | `0xffffff8e-42-42-0x74` |
| `hello` | `0xffffffec-ffffffac-ffffffac-0xffffffde` |

```bash
python3 -I tools/easy-math-solve.py petik --check
# name  : petik
# serial: 0x78-20-20-0xfffffff2
# check: OK (bon=True, altéré=False)
echo -e 'petik\n0x78-20-20-0xfffffff2' | ./analysis/keygenme.unpacked   # Registered Successfully
```

Name : au moins 4 caractères (le `\n` de `fgets` compte comme 5ᵉ octet), au plus 14.

## Premier regard

```text
$ ./tools/upx-3.96 -d -o analysis/keygenme.unpacked analysis/keygenme    # UPX 1.25
$ ./analysis/keygenme.unpacked
 | Easy Math Keygenme  by cyrex   Good Luck!
-=[ Enter Name: -=[ Enter Serial: Try Again!
```

Binaire statique strippé : pas de symboles. Les chaînes `-=[ Enter Name: `, `%p-%x-%x-%p`, `Try Again!`, `- Registered Successfully -` sont dans `.rodata` (`0x80965cd`…).

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/keygenme.unpacked` ; `main` @`0x8048214` repéré par les `push 0x80965d0` (« Enter Name ») / `0x80965e1` (« Enter Serial »).

```asm
8048272: fgets(name   @ebp-0x28 , 0x10 , stdin)
80482b0: fgets(serial @ebp-0xf8 , 0xc8 , stdin)
80482df..8048350: compacte serial en place (retire ' ' (0x20) et '\n' (0xa))
8048369: boucle 1   (i < strlen(name)) :
   80483af  al  = name[i]
   80483b1  mul   BYTE [name+i]          ; al = name[i]*name[i] (octet bas)
   80483b3  xor   al, [name+i]
   80483b5  xor   al, [ebp-0x299]        ; constante 0xc0  (= octet bas de 0x80964c0)
   80483bb  buf[i] = al                  ; buf @ebp-0x1c8
80483d1: boucle 2   (i < strlen(buf), re-évalué à chaque tour) :
   8048409  al = buf[2]                  ; ebp-0x1c6
   804840f  mul BYTE [ebp-0x25]          ; * name[3]
   8048412  xor al,buf[i] ; xor al,0xc0 ; buf[i] = al        ; buf[2] évolue en cours de boucle
8048426: sprintf(key, "%p-%x-%x-%p", movsx buf[1], movsx buf[2], movsx buf[2], movsx buf[4])
804846e: strcmp(key, serial) -> 0 : "Registered Successfully"
```

Formules :

```
buf[i]  = (n_i*n_i & 0xff) ^ n_i ^ 0xc0                (n = name + "\n")
buf[i] ^= (buf[2]*n_3 & 0xff) ^ 0xc0                   (i croissant, buf[2] déjà modifié pour i >= 2)
serial  = "%p-%x-%x-%p" % (s8(buf[1]), s8(buf[2]), s8(buf[2]), s8(buf[4]))
```

Exemple `petik\n` = `70 65 74 69 6b 0a` :

| i | `n_i` | boucle 1 | boucle 2 | sortie |
|---|---|---|---|---|
| 1 | `0x65` | `0x7c` | `0x7c ^ (0x24*0x69 & ff) ^ c0` = `0x78` | `%p` → `0x78` |
| 2 | `0x74` | `0x24` | `0x24 ^ (0x24*0x69 & ff) ^ c0` = `0x20` | `%x` → `20` (×2) |
| 4 | `0x6b` | `0x12` | `0x12 ^ (0x20*0x69 & ff) ^ c0` = `0xf2` | `movsx` → `0xfffffff2` |

(`n_3 = 0x69` ; `buf[2]` vaut `0x20` pour `i ≥ 2`, `0x24` au moment de calculer `buf[2]`.)

**Pièges :**
- `movsx` : les octets ≥ `0x80` sont étendus en 32 bits (`0xffffff8e`), et `%p` d'une valeur non nulle = `0x…` (glibc), `(nil)` pour 0.
- `fgets` conserve le `\n` : il fait partie de `name` dans les deux boucles (donc de `strlen`).
- `strlen(buf)` est ré-appelé à chaque tour : si un octet calculé vaut 0 la boucle 2 s'arrête là. Le buffer n'est pas initialisé mais retombe sur des zéros dans un frame frais (confirmé sous GDB).
- Le serial saisi est « compacté » (espaces supprimés) avant `strcmp`.

## Debug GDB (pas à pas)

Binaire dépaqueté, non-PIE, adresses fixes (pas de `starti` nécessaire) :

```gdb
gdb -nx -batch ./analysis/keygenme.unpacked \
    -ex 'break *0x804845d' \
    -ex 'run < in.txt' \          # in.txt = "petik\nx\n"
    -ex 'x/s $ebp-0x298' \        # clé attendue (résultat du sprintf)
    -ex 'x/12xb $ebp-0x1c8'       # buf après les deux boucles
```

```text
Breakpoint 1, 0x0804845d in ?? ()
0xffffc490:  "0x78-20-20-0xfffffff2"
0xffffc560:  0xb4 0x78 0x20 0x58 0xf2 0x4e 0x00 0x00 ...
```

`break *0x804845d` est l'instruction qui suit le `sprintf` : la clé attendue est lisible en clair à `ebp-0x298`, et `buf[1]=0x78`, `buf[2]=0x20`, `buf[4]=0xf2` valident le modèle (octets suivants : `00` → `strlen(buf)=6`).

## Vérification

```text
$ printf 'petik\n0x78-20-20-0xfffffff2\n' | ./analysis/keygenme.unpacked | tail -2
 - Registered Successfully -
$ printf 'petik\n0x78-20-20-0xfffffff0\n' | ./analysis/keygenme.unpacked | tail -2
Try Again!
```

(sorties dans `analysis/verify.txt` ; `--check` valide aussi `abcdefg` et `hello`.)

## Notes

- Le programme plante (`SIGSEGV`) à la sortie sous un noyau récent (binaire statique 2006) : sans incidence sur le résultat affiché.

## Fichiers

- `analysis/keygenme` (UPX), `analysis/keygenme.unpacked`, `analysis/verify.txt`, `analysis/dis.txt` (objdump)
- `tools/easy-math-solve.py` : keygen + `--check` natif
