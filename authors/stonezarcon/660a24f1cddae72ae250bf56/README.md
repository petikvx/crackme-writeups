# stonezarcon — Getting started

| | |
|---|---|
| **ID** | [`660a24f1cddae72ae250bf56`](https://crackmes.one/crackme/660a24f1cddae72ae250bf56) |
| **Auteur** | stonezarcon |
| **Plateforme** | Linux ELF64 PIE, C (`getting_started.c`), non strippé |
| **SHA-256 (zip)** | `00b7841dca7e0494e15fcf01cf9912a6b097e6bed62369f358e8a083a08e0f2b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/getting_started.zip` | archive d'origine (chiffrée, mot de passe `crackmes.one`) |
| `analysis/x/getting_started` | binaire extrait (`7z x -pcrackmes.one -oanalysis/x original/getting_started.zip`) |
| `tools/getting-started-solve.py` | recalcule l'argument (`-q`, `--check`) |

## Réponse

**Argument : `secret`** (en minuscules)

```bash
./analysis/x/getting_started secret     # Welcome.
python3 tools/getting-started-solve.py --check
```

## Premier regard

`strings` : seulement `Welcome.` et `Denied.` (+ imports `malloc`, `strcmp`, `puts`). Aucun prompt : le programme lit `argv[1]`, sans argument il affiche `Denied.`.
Le mot de passe n'est pas dans `strings` : il est reconstruit par des entiers incrémentés.

## Flow

`main` @ `0x1189` : si `argc > 1` : construit un tableau de 6 `int`, l'incrémente en boucle, le recopie dans un buffer de 7 octets terminé par NUL, puis `strcmp(argv[1], buffer)` ; égal → « Welcome. », sinon « Denied. ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn getting_started | awk '/<main>:/,/ret/'`.

```asm
119c: mov edi,0x18 ; call malloc          ; 6 int (24 octets)
11b8: mov DWORD PTR [rax],0x6e            ; t[0]
11c6: ... [rax+4],0x60 ; [rax+8],0x5e ; [rax+0xc],0x6d ; [rax+0x10],0x60 ; [rax+0x14],0x6f   ; t[1..5]
120d..: boucle  t[k] += 1  pour k = 0..5
126b: cmp DWORD PTR [rbp-0x18],0x4 ; jle   ; i = 0..4  ->  5 itérations
1271: malloc(7) ; 1288: buf[i] = (char) t[i]  pour i = 0..6 ; 12bb: buf[6] = 0
12cd..: strcmp(argv[1], buf)
```

`0x6e 0x60 0x5e 0x6d 0x60 0x6f` + 5 = `0x73 0x65 0x63 0x72 0x65 0x74` = **`secret`**.

Pièges :
- l'incrément est répété **5 fois** (`jle` avec borne 4, indices 0 à 4), pas 1 ;
- la boucle de copie va jusqu'à l'indice 6 (7 itérations) et lit donc `t[6]`, au-delà des 24 octets alloués (valeur indéterminée), mais l'octet 6 du buffer est ensuite écrasé par le NUL : sans effet sur la chaîne ;
- la comparaison est sensible à la casse (`Secret` refusé).

## Vérification

```text
$ ./getting_started secret    -> Welcome.
$ ./getting_started Secret    -> Denied.
$ ./getting_started secre     -> Denied.
$ ./getting_started           -> Denied.
```

## Notes

- Reverse statique + essais live ; pas de GDB.
