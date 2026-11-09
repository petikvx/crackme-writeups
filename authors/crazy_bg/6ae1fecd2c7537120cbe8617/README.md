# crazy_bg's Keygen Me!

| | |
|---|---|
| **ID** | [`6ae1fecd2c7537120cbe8617`](https://crackmes.one/crackme/6ae1fecd2c7537120cbe8617) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | crazy_bg |
| **Plateforme** | Windows x86-64, console, MinGW (C++), ~2,7 Mo (libstdc++ liée statiquement) |
| **SHA-256** | `9015f7971c711d7305653d98cd34f01bea471e47030798f3ce8f610ba2dd2244` |

## Fichiers

```
original/Keygen.exe                  # binaire d'origine (non modifié)
tools/crazy-bg-keygen-solve.py       # keygen + --check via wine
```

## Réponse

Le « nom » n'est **pas saisi** : le programme lit la variable d'environnement `USER` (à défaut `USERNAME`, positionnée par Windows/Wine). Le serial est un **entier signé 32 bits**.

| USER | serial |
|---|---|
| `petik` | **`-376`** |

```bash
python3 tools/crazy-bg-keygen-solve.py                 # petik -> -376
python3 tools/crazy-bg-keygen-solve.py -q --user bob
python3 tools/crazy-bg-keygen-solve.py --check original/Keygen.exe   # preuve wine
```

## Premier regard

- `diec` : PE64, MinGW. `strings` : `USER`, `USERNAME`, `Hello! Interesting name! Please, type in your serial.`, `That serial is wrong, acess blocked!`, `Serial correct! You WIN!!!`.
- Le reste des strings (`basic_string::…`, `__gnu_cxx::…`) est du bruit libstdc++.
- Offsets `.rdata` : `USER\0` à `0x1400d8010`, `USERNAME\0` à `0x1400d8015` (le second `getenv` pointe 5 octets plus loin dans la même chaîne).

## Flow

`main` (`0x1400d1d40`) : affiche le bandeau, `cin >> int` dans `[rsp+0x2c]`, calcule le serial attendu depuis l'environnement, compare ; en cas d'égalité il rappelle `calculateSerial` (`0x1400015c0`) et recompare, puis affiche « Serial correct! ». Sinon « That serial is wrong ». Le programme se termine après un `nanosleep` de 3 s.

## Comment on trouve

Ancrage : `strings -n 6` puis `objdump -d -M intel original/Keygen.exe`. Les symboles C++ ne sont pas strippés : on voit directement `main`, `_Z4corev` (`core()`) et `_Z15calculateSerialv`. Les xrefs sur `0x1400d8010` (`USER`) mènent à ces fonctions.

Boucle de `main` (identique à `calculateSerial`) :

```asm
call getenv("USER")            ; si NULL -> getenv("USERNAME") ; si NULL -> ecx = 1
movsx edx, BYTE PTR [rax]      ; caractère SIGNÉ
...
lea  ecx,[rcx+rdx*1+0x539]     ; ecx += c + 1337
...
imul ecx,ecx,0x1e              ; *30
mov  eax,ecx
xor  eax,0x37
sub  ecx,eax                   ; ecx = t - (t ^ 0x37)
shl  ecx,3                     ; *8
cmp  [rsp+0x2c], ecx           ; serial saisi (int)
```

Soit : `s = Σ(c + 0x539)`, `t = 30·s`, `serial = ((t − (t ⊕ 0x37)) << 3)` en arithmétique 32 bits.

Exemple `petik` : octets 0x70 0x65 0x74 0x69 0x6B (somme 541) → s = 541 + 5·0x539 = 7226 ; t = 30·7226 = 216780 ; `t ^ 0x37` = 216827 ; `t − (t^0x37)` = −47 ; ×8 = **−376**. (Le solveur refait ce calcul en masquant sur 32 bits.)

Pièges :
- Le nom n'est pas demandé : le résultat dépend de l'environnement où tourne le crackme. Sous Wine, `USER` (nom Unix) est utilisé s'il est défini, sinon `USERNAME`. Pour reproduire, on force `USER=petik`.
- `movsx` : un caractère ≥ 0x80 compte négatif (géré dans le solveur).
- Si ni `USER` ni `USERNAME` n'existent, `main` part de `ecx=1` alors que `calculateSerial` part de valeurs différentes : les deux comparaisons ne peuvent alors pas être satisfaites ensemble (cas ignoré).
- `core()` (`0x140001560`) est du code mort : même somme sans le `*30/xor`.

## Vérification

Preuve live (binaire d'origine, Wine sous Xvfb), `USER=petik` :

```bash
USER=petik WINEDEBUG=-all bash -c 'echo -376  | xvfb-run -a wine original/Keygen.exe'  # Serial correct! You WIN!!!
USER=petik WINEDEBUG=-all bash -c 'echo 12345 | xvfb-run -a wine original/Keygen.exe'  # That serial is wrong, acess blocked!
```

Le `--check` du solveur fait la première commande et retourne 0 sur succès (testé : OK). Pas de GDB / x64dbg / IDA : reverse 100 % statique + preuve Wine.
