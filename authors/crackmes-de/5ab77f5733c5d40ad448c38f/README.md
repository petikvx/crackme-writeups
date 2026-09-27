# ada_crackme_1 (DarKPhoeniX)

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c38f`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c38f) |
| **Auteur** | darkphoenix_, miroir [crackmes.de](https://crackmes.one/user/crackmes.de) |
| **Plateforme** | Linux ELF32, GNAT 3.4.3, packé UPX 1.24 |
| **Type** | username + serial (le serial ne dépend pas du nom) |
| **SHA-256 (`ADAcrkme.tar.gz`)** | `845f0c762645af285780bc0707d02f719ce39c5db03f963b8def46a716fb106d` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/ADAcrkme.tar.gz` | archive livrée (`hello` UPX + `README.htm`) |
| `analysis/hello` | ELF packé extrait du tar |
| `analysis/hello.unpacked` | `./tools/upx-3.96 -d` |
| `analysis/README.htm` | énoncé (libs `libgnat-3.4` / `libgnarl-3.4`) |
| `tools/ada-crackme-solve.py` | serial + `--check` du produit |

## Réponse

N’importe quel username de **5 à 30** caractères. Exemple `petik`, serial de 30 octets :

```text
>^f=`u^Roru`Qm^i`o&mds6^f0`u8`
```

```bash
python3 tools/ada-crackme-solve.py
python3 tools/ada-crackme-solve.py --check
```

Succès : le programme **ne** dit pas `HOLY SHIT!` et quitte 0. Échec : `HOLY SHIT!`.

Le message `Thanks For Registering` est dans le binaire juste après `exit` : le compilateur le laisse mort. `CRACKED! U R A GOOD BOY :)` est l’autre branche (nom ou serial de longueur ≤ 4, tâches Ada + `license.dat`).

## Premier regard

```text
original/ADAcrkme.tar.gz → hello + README.htm
hello : ELF32, UPX 1.24, pas de section headers
UPX 3.96 -d → ELF32 dynamique, /lib/ld-linux.so.2
NEEDED : libgnarl-3.4.so.1, libgnat-3.4.so.1, libpthread, libgcc_s, libc
```

Chaînes utiles une fois dépacké :

```text
Username :
Serial   :
DarKPhoeniX crackme
HOLY SHIT!
Thanks For Registering
fucker.adb  interface.adb  comput.adb  hello.adb:24
license.dat
```

`README.htm` demande GNAT 3.4 et interdit le patch. Ces libs ne sont plus dans la distro. L’algo se lit sur `hello.unpacked` ; la preuve live passe par un stub des symboles GNAT (voir GDB).

## Flow

`main` (`sub_804C834`, `0x804C834`) :

1. Bannière. `getenv("COLUMNS")` règle la largeur ; défaut 80.
2. Deux threads de garde (`0x804AC34` cherche un `0xCC` dans `main`, `0x804AC8E` somme des dwords). S’ils ne démarrent pas, `exit`.
3. Lecture caractère par caractère (`get_immediate`) jusqu’à un octet ≤ `0x1F` ou 30 caractères. Username en `record+4`, serial en `record+40`. Longueurs en `record+0` et `record+36`. Les buffers sont mis à zéro avant (`sub_804AD9C`).
4. `sub_804B5D0` vaut 1 si **l’une** des deux longueurs est ≤ 4.
   - 1 → `raise MAIN.WTH` (`0x804E5BC`) : tâches, `license.dat`, message XOR.
   - 0 → `raise MAIN.WTF` (`0x804E598`) : hash du serial.

Les deux branches **lèvent** toujours. Le handler GNAT reprend à `0x804C935` avec le sélecteur dans `edx`.

| `edx` | Handler | Effet |
|---|---|---|
| 3 | `0x804C972` | `sub_804B5F0` ; si `acc == 0xABCDEF` **et** longueurs > 4 → `exit(0)` ; sinon `HOLY SHIT!` |
| 2 | `0x804CA32` | tâches `thread1` / `thread2`, puis `CRACKED!…` ou `HOLY SHIT!` |
| 1 | `0x804CC47` | `HOLY SHIT!` |

## Comment on trouve le serial

### Ancrage

UPX, puis IDA (MCP `ida`, `open_database` sur `analysis/hello.unpacked`). Les xref des chaînes :

| Chaîne | VA | Site |
|---|---|---|
| `Username : ` | `0x804D014` | `sub_804AFCB` |
| `Serial   : ` | `0x804D028` | `sub_804B172` |
| `HOLY SHIT!` | `0x804D104` | handler |
| `Thanks For Registering` | `0x804D0E4` | juste après `exit`, mort |

`sub_804B5F0` (`comput.adb`) est le hash. Pour `i` de 1 à 30 :

```text
mix = serial[i-1] xor mem[0x804D05F + i]
facteur = 0 si mix == 0xFF, sinon mix
acc = (acc * facteur) mod 0x7FFFFFFF
```

`mem[0x804D060 ..]` est la chaîne `__gnat_install_handler\0__gnat_a` (30 octets). Le username est copié dans la fonction et **jamais lu**.

`acc` est `[ebp-0x60]`. Aucun `mov` ne l’initialise dans la fonction : au premier tour la case de pile vaut **1** (vu sous GDB, deux runs). Avec cette graine le produit reproduit le hash live (`hello-serial-1234567890` → `0x1D30C52F`).

Le test est `cmp eax, 0xABCDEF` à `0x804C9A2`.

### Assemblage

Facteur 1 ⇒ `serial[i] = table[i] xor 1`, imprimable partout sauf l’indice 22 (`table == 0` ⇒ octet `0x01`). On laisse 22 positions à 1 et on choisit 8 positions libres pour que le produit modulo `0x7FFFFFFF` tombe sur `0xABCDEF`. Une solution :

```text
>^f=`u^Roru`Qm^i`o&mds6^f0`u8`
```

D’autres 30-uplets marchent. Un serial plus court laisse des zéros : à l’indice 22 la table vaut 0, le facteur devient 0 et le hash aussi.

## Debug GDB (pas à pas)

Les `.so` GNAT 3.4 ne sont pas installées. Un stub `-m32 -nostdlib -shared` qui exporte les symboles UND suffit pour arriver au `raise` : `put` / `get_immediate` en `int 0x80`, `getenv` renvoie une chaîne vide (bannière à 80 colonnes), `__gnat_create_thread` renvoie 1, `__gnat_raise_exception` écrit `RAISE` et sort. `LD_LIBRARY_PATH` pointe sur `libgnat-3.4.so.1` et `libgnarl-3.4.so.1`.

Le `raise` ne revient pas : le handler est à l’instruction d’après, mais la pile n’est pas celle d’un `ret`. On y saute à la main, au `lea` qui prépare l’argument du hash (`0x804C990`), avant `__gnat_begin_handler`.

```bash
tar -xzf original/ADAcrkme.tar.gz -C analysis
cp analysis/hello analysis/hello.packed
./tools/upx-3.96 -d -o analysis/hello.unpacked analysis/hello.packed
printf 'petik\n%s\n' '>^f=`u^Roru`Qm^i`o&mds6^f0`u8`' > /tmp/in.txt
gdb -q -nx analysis/hello.unpacked
```

```gdb
set pagination off
set debuginfod enabled off
set env LD_LIBRARY_PATH /tmp/adalibs
break *0x804c930
commands
silent
set $eip = 0x804c990
cont
end
break *0x804b6f9
commands
silent
printf "acc0=%#x\n", *(unsigned*)($ebp-0x60)
disable 2
cont
end
break *0x804c99c
commands
printf "hash=%#x\n", $eax
cont
end
run < /tmp/in.txt
```

On lit `acc0=0x1`, `hash=0xabcdef`, puis l’inférieur quitte 0 **sans** `HOLY SHIT!`.

Mauvais serial (`hello-serial-1234567890`) : `hash=0x1d30c52f` puis `HOLY SHIT!`.

Username `ab` (longueur 2) : le `raise` est à `0x804C917` (`MAIN.WTH`), pas à `0x804C930`.

## Vérification

```bash
python3 tools/ada-crackme-solve.py --check
# check: acc == 0xabcdef
```

Live (stub + saut GDB ci-dessus) :

- `petik` + le serial de 30 octets → exit 0, pas de `HOLY SHIT!`
- `petik` + `hello-serial-1234567890` → `HOLY SHIT!`

## Notes

- Ne pas patcher `main` : le thread `0x804AC34` sort dès qu’il voit un `0xCC`.
- `license.dat` (XOR `0x45` des 11 octets à `0x804D0B5`) n’est lu que par la branche courte (`thread2`). Le hash du serial n’y touche pas.
- `Thanks For Registering` et le décodage XOR `0x45` → `CRACKED! U R A GOOD BOY :)` (`sub_804B320`) ne sont pas le chemin `petik`.
