# crackme-writeups

Write-ups de crackmes (surtout [crackmes.one](https://crackmes.one)). Reverse engineering éducatif, un dossier par auteur / série, un sous-dossier par épreuve.

Les binaires d’origine sont inclus. Ce ne sont **pas** des malwares, mais un AV peut quand même gueuler sur les ELF / PE.

## Arborescence

```
crackme-writeups/
├── README.md                 ← tu es ici
├── scripts/install-re-tools.sh
└── <famille>/
    ├── README.md             ← liste des épreuves de cette série
    └── <nom-du-crackme>/
        ├── binaire
        ├── write-up.md       ← quand c’est résolu
        └── solveur / dumps / sources reconstruits
```

Pour ajouter une série : un nouveau dossier à la racine, le même schéma à l’intérieur.

Outils Linux (file, objdump, gdb, nasm, wine32, diec, …) :

```bash
./scripts/install-re-tools.sh --dry-run
./scripts/install-re-tools.sh          # sudo / apt
```

## Familles

| Famille | Auteur | Épreuves | Résolues |
|---|---|---|---|
| [timotei-family](timotei-family/README.md) | timotei | 12 (4 ELF64 + 8 PE32) | 8 / 12 |

## Convention

- Nom de dossier = nom du crackme, stable, ASCII (`timotei-crackme-01`, pas `timo#1`).
- Le `.exe` reste pour les binaires Windows.
- Le write-up s’appelle comme le binaire + `.md`.
- On ne patche pas le binaire d’origine ; les reconstructions sont des fichiers à part.
- Sources assembleur en `*.asm` pour la colorisation : `*-nasm.asm`, `*-fasm.asm`, `*-masm.asm`, dumps IDA `*-idapro.asm`.

## Licence / origine

Les crackmes restent la propriété de leurs auteurs. Les write-ups et sources reconstruits de ce repo sont là pour apprendre, pas pour republier les challenges comme si c’était nous.
