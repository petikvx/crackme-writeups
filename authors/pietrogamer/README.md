# pietrogamer

Auteur local : **`pietrogamer`** (site : [pietrogamer](https://crackmes.one/user/pietrogamer)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Embrace RSA](6ab95f87cdee6e086a1734a9/) | [`6ab95f87…`](https://crackmes.one/crackme/6ab95f87cdee6e086a1734a9) | Java (jar, Swing) | **solved** — RSA-2048 : `serial = SHA256(name)^d mod N` (hex), `d` cachée après l'IEND du PNG ; keygen `tools/embrace-rsa-solve.py` (petik→`a95e8ed3…26`) |

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author pietrogamer <id-ou-url>
```
