# qcrk_3 — qnix (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0f3
- Plateforme : Linux ELF32 (GCC 3.4.4 Gentoo) · difficulté 2.0 · publié le 2018-03-25 (réimport crackmes.de)
- Archive : `original/qcrk3.tgz` → binaire `qcrk3`

## Réponse

Exporter n’importe quelle variable d’environnement **`KEY`** (même vide) :

```bash
KEY=petik ./qcrk3
```

→ bannière `Qcrk-3 By Qnix`, écho de la valeur, puis `(+) CRACKED` sur stderr.

## Comment on trouve

1. `file` / `diec` : ELF32 stripped, GCC 3.4.4, imports `ptrace` + `getenv` + `fprintf`.
2. `strings` : `(+) Ptrace() detected`, `(-) Key Not Available`, `KEY`, `(+) CRACKED`.
3. `main` @ `0x8048448` (`analysis/objdump-main.txt`) :
   - `ptrace(PTRACE_TRACEME, …)` ; si échec → messages anti-debug et `return 1` ;
   - `getenv("KEY")` ;
   - impression de la bannière ;
   - si le pointeur est **NULL** → `(-) Key Not Available` ;
   - sinon `fprintf` de la chaîne puis `(+) CRACKED` — **aucune comparaison** de contenu.
4. Donc il suffit que `KEY` soit définie dans l’environnement. Exemple : `KEY=petik`.

## Vérification

```bash
python3 tools/qcrk_3-solve.py --check   # KEY=petik → OK
KEY=petik ./analysis/qcrk3              # live ELF32
```

## Fichiers

- `analysis/qcrk3` : ELF extrait du tgz
- `analysis/objdump-main.txt` : désassemblage
- `tools/qcrk_3-solve.py` : solveur + `--check`
