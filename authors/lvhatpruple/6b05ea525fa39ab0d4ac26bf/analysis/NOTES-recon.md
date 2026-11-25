# Neural Net (LvHatpruple) — notes de recon (non résolu)

## Identité
- `original/NNcrackme-t.exe` — PE32+ **GUI**, x86-64, stripped to external PDB,
  **3 sections à noms aléatoires**, 756 KB
- sha256 `835c30b97ab531d48c01ce9b720220835e4e99566cec056bf533afb38cf69ead`

## Layout
| section | taille | flags |
|---|---|---|
| `.vdaxlh` | 0x25000 | CODE, READONLY |
| `.96tdy7` | 0x7b000 | DATA |
| `.ihrw35` | 0x1b04a | CODE, READONLY |

Noms de sections aléatoires + aucune string lisible + DIE « Unknown » →
**packer custom**. Ce n'est pas UPX (pas de `UPX0`/`UPX1`), donc
`tools/upx-3.96 -d` ne s'applique pas.

Binaire GUI : la preuve live passera par `xvfb-run -a wine` + capture, pas par
la console.

## Reste à faire
1. Trouver le stub de dépaquetage (entry dans `.vdaxlh`), dumper l'image
   dépaquetée sous `analysis/`.
2. Reverse du réseau de neurones annoncé par le titre (poids probablement dans
   `.96tdy7`) et inversion du prédicat.
