# s4r — bitflip

> [crackmes.one](https://crackmes.one/crackme/5c5d89ce33c5d43fd9a9387f) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | s4r |
| **Plateforme** | Linux ELF32 statique, stripé |
| **Statut** | **solved** |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/bitflip` | binaire d'origine |
| `tools/bitflip-solve.py` | inverse le test et rejoue les 64 octets |

## Réponse

64 octets, sans saut de ligne dans le buffer :

**`It_w4s_h4rD_But_Obviously_you_kn0w_h0w_we1rd_M4ch1n3_R_DESIGNED!`**

```text
I knew that you were smart ! Just see how complex a bitflip machine can be. Well done.
```

```bash
python3 tools/bitflip-solve.py -q
python3 tools/bitflip-solve.py --check
python3 -c 'import pathlib,subprocess; p=pathlib.Path("tools/bitflip-solve.py"); pw=subprocess.check_output(["python3",p,"-q"]); subprocess.run(["./original/bitflip"], input=pw)'
```

## Premier regard

```text
original/bitflip : ELF32, statique, stripé
.text             : 0x110 octets à 0x8048080
.data             : 0xb4f3a octets à 0x8049000
```

Pas d'UPX. `strings` ne sort que le préambule :

```text
Hey, you're the incident response guy ?
This machine have been infected with a weird virus, it looks like there's a kind of demon inside of it, flipping all the bits of the drives.
I heard you have some reverse engineering skills, I'm sure you'll find the password, It must be somewhere inside !
Enter the password:
```

Le programme lit ensuite **exactement 64 octets** (`esi = 0x40`, `read` d'un octet, `ecx += 4`). Le reste de l'affichage (l'ASCII art « bitflip machine », puis le succès ou l'échec) n'est pas une chaîne du fichier.

## Flow

`0x8048080` écrit les `0x145` octets du préambule (`0x8049000`), puis dépose les 64 octets lus dans des dwords à `0x8049166`, pas de 4.

La suite est une machine à une instruction. Le compteur de programme est le dword `0x804913e` (un décalage en **bits**, au départ 0). La mémoire adressable en bits commence à `0x8049142`. Chaque instruction tient sur 8 octets (deux dwords `eax`, `ebx`) :

```asm
; eax == -1 : met le bit ebp de esp à 1, puis la suite de -2
; eax == -2 : ebp++, PC = ebx ; tous les 8 bits, write de l'octet bas de esp
; eax == -3 : exit(0)
; sinon     : xor du bit numéro eax
;             PC += 64
;             si ce bit vaut 1 après le flip, PC = ebx
```

`-1` et `-2` fabriquent les caractères affichés, bit à bit. Le flip est l'unique opération sur les données : il inverse un bit, et le bit résultant choisit le prochain morceau de programme. Le programme se modifie lui-même, puisque le flot et les opérandes vivent dans la même zone.

## Comment on trouve le mot de passe

### Ancrage

`objdump -d -M intel --start-address=0x8048080 --stop-address=0x8048190 original/bitflip`.

Le buffer mot de passe, en décalage de bits depuis `0x8049142`, commence à `0x120` (`0x24` octets, le premier `read`). Les caractères sont des dwords espacés de `0x20` bits, donc une case sur quatre.

Le flot se découpe en procédures qui impriment ou comparent. Deux comparent le buffer à une table de dwords :

1. Table à l'adresse de bit `0xa5140`. Pour chaque caractère `p` et chaque mot `d` :

   ```text
   (d xor (0xbeef + p)) & 0x7fffffff == 0
   ```

   Une seule chaîne de 64 octets satisfait toute la table, et elle est **refusée** (message « out of the box ») :

   ```text
   It_w4s_h4rD_But_Obviously_you_Ar3_Terr1bly_WRONG_GET_OUT_OF_HERE
   ```

   N'importe quel autre buffer continue.

2. Table à l'adresse de bit `0x226fe0`. Pour le caractère d'indice `i` (0-based) et le mot signé `d` :

   ```text
   t = (p << 17) xor 0xab4d1d34
   t = t - 0x17345168 + (i+1)*0xcafebabe
   (t xor d) & 0x7fffffff == 0
   ```

   `0xcafebabe` est ajouté à l'accumulateur à chaque caractère, d'où le facteur `(i+1)`. Inverser, en entiers :

   ```text
   p = ((d - (i+1)*0xcafebabe + 0x17345168) xor 0xab4d1d34) >> 17
   ```

   Les 64 octets sont le mot de passe. La table se termine par un mot dont les 31 bits bas sont nuls.

## Vérification

```bash
python3 tools/bitflip-solve.py --check
# ok
```

Le binaire, avec ces 64 octets sur stdin (le solveur les envoie sans octet en plus) :

```text
I knew that you were smart ! Just see how complex a bitflip machine can be. Well done.
```

`A` répété 64 fois :

```text
No I won't let you use this computer! Please just think out of the box.
```

La chaîne leurre de la première table produit le même échec. Elle ressemble au vrai mot de passe et s'arrête avant le second test.

## Notes

- Le `.text` fait 272 octets. Tout le crackme est la table de bits dans `.data`.
- Forcer le compteur de programme vers le bloc « Well done » affiche le message sans connaître le mot de passe. L'auteur l'écarte : le but est la chaîne de 64 octets.
- Le read ne s'arrête pas au saut de ligne. Le mot de passe fait exactement 64 caractères, le `\n` tapé ensuite n'est pas lu.
