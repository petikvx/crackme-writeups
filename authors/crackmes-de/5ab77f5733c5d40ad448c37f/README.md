# GTK_K3YG3NME — gtksor (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5733c5d40ad448c37f · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **GTK 2**, strippé, binaire de 10 Ko (2015), bourré d'**anti-debug `rdtsc`** et d'octets poubelle
- Archive : `original/GTK_K3YG3NME.zip` → `GTK_K3YG3NME` (extrait sous `analysis/`)

## Réponse

| Name | Serial (décimal, 64 bits) |
|---|---|
| `petik` | `1513675274255` |
| `admin` | `1784465983195` |
| `Zorro` | `1889838969732` |

```bash
python3 -I tools/gtk-k3yg3nme-solve.py petik --check
# name  : petik
# serial: 1513675274255
# check: OK (formule == émulation de 0x8048f50 …)
```

**Formule** : `serial = Σ_i  (signed char) name[i] ** (i + 2)`  (mod 2⁶⁴), écrit en décimal.
Contraintes : `len(name) ≥ 3`, serial non vide.

## Premier regard

```text
$ file analysis/GTK_K3YG3NME
ELF 32-bit LSB executable, Intel 80386, dynamically linked, stripped
$ strings analysis/GTK_K3YG3NME | grep -i -E "serial|less than|valid|winner"
Name is less than 3 characters !!!!
Length is invalid !
The Serial is not valid !!!! , Try hard!
The serial number is correct. You Are A winner !! :D
### GTK KeyGeN M3 !!!!!!
```

Le binaire ne se lance pas ici (GTK2 32 bits absent) : analyse statique + **émulation de la vraie fonction de hachage avec unicorn**.

## Flow

Le handler du bouton (`g_signal_connect_data` → @`0x8049200`) :

1. récupère les deux `GtkEntry` (`gtk_container_get_children` → `gtk_entry_get_text`) : name et serial ;
2. `strlen(name) <= 2` → « Name is less than 3 characters » ; `serial[0] == 0` → « Length is invalid ! » ;
3. `serial_val = strtoull(serial, NULL, 10)` (`edi:ecx = edx:eax`) ;
4. `h = f(name)` @`0x8048f50` (64 bits dans `edx:eax`) ;
5. `(h_hi ^ edi) | (h_lo ^ ecx) == 0` → « The serial number is correct. You Are A winner !! », sinon « The Serial is not valid !!!! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/GTK_K3YG3NME` ; les chaînes de succès/échec (`0x8049b50…0x8049c20`) sont référencées par le handler vers `0x8049440–0x80494b9`, qui lui-même appelle `0x8048f50` à `0x804947e`.

La fonction `0x8048f50` est noyée dans :
- des **`rdtsc` avec comparaison à `0x3000`** (`cmp eax,0x3000 ; ja`) : un débogueur ou l'émulation ralentit le code et fait basculer sur un chemin poubelle ;
- des `call $+5 / add esp,4 / jmp` qui masquent des octets de fausse instruction (« junk code »).

Le cœur propre (après filtrage) :

```asm
8049001: mov edx,[ebp+8]        ; name
8049004: mov edi,2              ; exposant initial
8049009: movzx eax,byte [edx]   ; premier caractère
804900c: acc(ebp-0x20:-0x1c) = 0 ; 64 bits
804901a: test al,al ; je fin
8049050: movsx eax,al           ; signed char -> 32 bits, puis cdq -> 64 bits
8049070: boucle ebx=1..edi : x(64) *= c(64)     ; imul/mul 32->64 bits => c ** edi
         ...                    ; acc += x
80490e5: movzx eax,[edx+edi-1]  ; caractère suivant ; edi += 1
```

Soit `acc = Σ c_i ** (i+2)` avec `c_i = (signed char) name[i]`, produit sur 64 bits.

**Démonstration sur de petits noms** (via l'émulation) :

| name | sortie de `0x8048f50` | décomposition |
|---|---|---|
| `a` | `9409` | 97² |
| `ab` | `950601` | 97² + 98³ = 9409 + 941192 |
| `abc` | `97010202` | … + 99⁴ = 950601 + 96059601 |
| `abcd` | `10097010202` | … + 100⁵ |

**Pièges :**
- Le `rdtsc` anti-debug empêche aussi l'émulation naïve (`unicorn`) : on patche **en mémoire** (copie) les `cmp eax,0x3000` en `cmp eax,0x7fffffff` ; le fichier d'origine n'est pas touché.
- `movsx` : les octets ≥ `0x80` (noms non ASCII) sont étendus en négatif, d'où `(signed char)` dans la formule (testé avec `héllo`).
- Résultat sur 64 bits (`mul`/`imul` 32→64) : le modulo 2⁶⁴ n'apparaît qu'avec des noms longs (`Zorro_2015`).

## Vérification

```text
$ python3 -I tools/gtk-k3yg3nme-solve.py petik --check
name  : petik
serial: 1513675274255
check: OK (formule == émulation de 0x8048f50 sur ['petik', 'abc', 'Zorro_2015', 'héllo'])
```

Le test GUI n'est pas possible ici (GTK2 i386 absent) : la preuve porte sur la fonction de hachage réelle émulée ; la comparaison `strtoull` / `xor` / `or` et le seuil de longueur sont lus dans le désassemblage (`0x8049324–0x8049492`).

## Fichiers

- `analysis/GTK_K3YG3NME`, `analysis/dis.txt` (objdump), `analysis/keygen-samples.txt`
- `tools/gtk-k3yg3nme-solve.py` : keygen + `--check` · `tools/gtk-k3yg3nme-emu.py` : émulation unicorn de `0x8048f50`
