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
| 02 | ELF64 Linux (stripped) | — | — |
| 03 | ELF64 Linux (`int 0x80`) | — | — |
| 04 | ELF64 Linux | — | — |
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

## Origine

Binaires téléchargés sur crackmes.one (ZIP protégés par le mot de passe habituel du site). Auteur : **timotei**.
