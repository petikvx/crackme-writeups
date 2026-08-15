# timotei-family

Série **timotei** ([crackmes.one](https://crackmes.one)), dans le repo [crackme-writeups](../README.md).

Un dossier par épreuve. Le binaire d’origine reste dans son dossier ; le write-up, le solveur et les sources reconstruits s’ajoutent au fur et à mesure.

## Arborescence

```
crackme-writeups/timotei-family/
├── README.md
└── timotei-crackme-XX/
    ├── timotei-crackme-XX[.exe]
    ├── timotei-crackme-XX.md
    └── …
```

## Progression

| # | Plateforme | Write-up | Solution |
|---|---|---|---|
| [01](timotei-crackme-01/timotei-crackme-01.md) | ELF64 Linux (asm, non strippé) | oui | PIN `777` ou `1509`, puis `+HCU` |
| [02](timotei-crackme-02/timotei-crackme-02.md) | ELF64 Linux (stripped) | oui | `argv[1]` : `s[-8]=='3'` et `s[-1]=='P'` (ex. `31337!!P`) |
| [03](timotei-crackme-03/timotei-crackme-03.md) | ELF64 Linux (`int 0x80`) | oui | stdin : `Defeat COVID!` |
| [04](timotei-crackme-04/timotei-crackme-04.md) | ELF64 Linux | oui | `argv[1]` : `+ORC` (EP leurre, FNV-1) |
| 05 | PE32 console | — | — |
| 06 | PE32 console | — | — |
| 07 | PE32 console (MASM) | — | — |
| 08 | PE32 console | — | — |
| 09 | PE32 GUI | — | — |
| 10 | PE32 GUI | — | — |
| 11 | PE32 GUI (Polink) | — | — |
| 12 | PE32 GUI | — | — |

## #01 en un coup d’œil

```bash
cd timotei-crackme-01
python3 timotei-crackme-01-solve.py
```

Détail : [timotei-crackme-01.md](timotei-crackme-01/timotei-crackme-01.md)  
Sources reconstruites : `.nasm` / `.fasm` dans le même dossier.

## #02 en un coup d’œil

Pas de prompt : le secret est `argv[1]`. Famille, pas un unique mot de passe.

```bash
./timotei-crackme-02/timotei-crackme-02 '31337!!P'
python3 timotei-crackme-02/timotei-crackme-02-solve.py
```

Détail : [timotei-crackme-02.md](timotei-crackme-02/timotei-crackme-02.md)

## #03 en un coup d’œil

UI ANSI + mix `int 0x80` / `syscall`. Le hint `Defeat COVID` est dans le `.data` ; le check impose le `!`.

```bash
printf 'Defeat COVID!\n' | ./timotei-crackme-03/timotei-crackme-03
python3 timotei-crackme-03/timotei-crackme-03-solve.py
```

Détail : [timotei-crackme-03.md](timotei-crackme-03/timotei-crackme-03.md)

## #04 en un coup d’œil

L’EP `push exit / ret` sort tout de suite. `./timotei-crackme-04 +ORC` et `./timotei-crackme-04 rt` sont identiques. Le script Python **n’est pas un lanceur** : il retrouve le FNV, puis montre la différence sur une copie (`e_entry` → `0x401007`).

```bash
python3 timotei-crackme-04/timotei-crackme-04-solve.py
```

Détail : [timotei-crackme-04.md](timotei-crackme-04/timotei-crackme-04.md)

## Origine

Binaires téléchargés sur crackmes.one (ZIP protégés par le mot de passe habituel du site). Auteur : **timotei**.
