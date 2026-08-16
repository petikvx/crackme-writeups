# timotei-family (déplacé)

La série **timotei** a été réorganisée :

**→ [`authors/timotei/`](../authors/timotei/)**

Chaque challenge est un dossier nommé par son **ID crackmes.one**, avec :

- `ORIGIN.yml` — id, urls, `binary.sha256`
- `original/` — binaire d’origine
- `analysis/` — IDA, screenshots
- `tools/` — solveurs / recon

Ajouter un crackme :

```bash
./scripts/add-crackme.sh --author timotei https://crackmes.one/crackme/<id>
```
