# timotei

Série **timotei** sur [crackmes.one](https://crackmes.one) ([recherche](https://crackmes.one/search?name=timotei&sort_by=date&sort_order=desc)).

Slug local : `timotei` (alias site : `timotei`, `tim0tei`, `timotei_`).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 01 | [timotei crackme#1](5e5c14c333c5d4439bb2dd1f/) | [`5e5c14c3…`](https://crackmes.one/crackme/5e5c14c333c5d4439bb2dd1f) | Unix/linux etc. | PIN 777 ou 1509, puis +HCU |
| 02 | [timotei crackme#2](5e7a61ca33c5d4439bb2df60/) | [`5e7a61ca…`](https://crackmes.one/crackme/5e7a61ca33c5d4439bb2df60) | Unix/linux etc. | argv[1]: s[-8]=='3' et s[-1]=='P' (ex. 31337!!P) |
| 03 | [timotei crackme#3](5ecb902633c5d449d91ae615/) | [`5ecb9026…`](https://crackmes.one/crackme/5ecb902633c5d449d91ae615) | Unix/linux etc. | stdin: Defeat COVID! |
| 04 | [timotei crackme#4](5ecb906533c5d449d91ae616/) | [`5ecb9065…`](https://crackmes.one/crackme/5ecb906533c5d449d91ae616) | Unix/linux etc. | argv[1]: +ORC (EP leurre, FNV-1) |
| 05 | [timotei crackme#5](643ee71b33c5d439389129ef/) | [`643ee71b…`](https://crackmes.one/crackme/643ee71b33c5d439389129ef) | Windows | keyfile 22 o, checksum 8 bits |
| 06 | [timotei crackme#6](6452ba5533c5d43938912e35/) | [`6452ba55…`](https://crackmes.one/crackme/6452ba5533c5d43938912e35) | Windows | keyfile 13 o: A-B+C >= 12345678, buf[10]=='6' |
| 07 | [timotei crackme#7](64764cee33c5d439389134f2/) | [`64764cee…`](https://crackmes.one/crackme/64764cee33c5d439389134f2) | Windows | password console préfixe tI (SMC) |
| 08 | [timotei crackme#8](6490994f33c5d43938913a00/) | [`6490994f…`](https://crackmes.one/crackme/6490994f33c5d43938913a00) | Windows | quiz 2 2 1 3 1 2 + 42 |
| 09 | [timotei crackme#9](649dbf9f33c5d460c17f1ec2/) | [`649dbf9f…`](https://crackmes.one/crackme/649dbf9f33c5d460c17f1ec2) | Windows | serial CM + atoi>=2023 + sum%n==0 (ex. 2191CMCM) |
| 10 | [timotei crackme#10](64ac536033c5d460c17f221c/) | [`64ac5360…`](https://crackmes.one/crackme/64ac536033c5d460c17f221c) | Windows | name+serial: tri + (d²)>>32 (ex. timotei → eiim784527143) |
| 11 | [timotei crackme#11 1K-Edition :-)](64d93015b25df8732eebc87c/) | [`64d93015…`](https://crackmes.one/crackme/64d93015b25df8732eebc87c) | Windows | argv t62O3668101526 → MessageBox Good Work |
| 12 | [timotei crackme#12](64e275ead931496abf908ff7/) | [`64e275ea…`](https://crackmes.one/crackme/64e275ead931496abf908ff7) | Windows | serial amiable n1-n2 (ex. 220-284) |

Les ELF **#01–#04** ont une section **Debug GDB (pas à pas)** dans leur `README.md` (breakpoints, registres, pièges). Les #05–#12 sont Windows (Wine / x64dbg plutôt que GDB).

## Arborescence d’un challenge

```
<id-crackmes.one>/
  ORIGIN.yml      # id + urls + binary.sha256
  README.md       # write-up
  original/       # binaire d’origine
  analysis/       # IDA, screenshots
  tools/          # solveur, recon, serializers
```

## Ajouter un crackme

Doc complète : [README racine — Ajouter un crackme](../../README.md#ajouter-un-crackme-crackmesone).

```bash
# depuis la racine du repo
./scripts/add-crackme.sh --author timotei https://crackmes.one/crackme/<id>
# ou
./scripts/add-crackme.sh --author timotei <id>
```

ZIP crackmes.one protégé par le mot de passe **`crackmes.one`** (géré par le script via `7z -p…`).

Résultat : `authors/timotei/<id>/{ORIGIN.yml,README.md,original,analysis,tools}` + entrée dans [`catalog.yml`](catalog.yml).

Pour un challenge **hors** numérotation 01…12, laisser `series_index: null` dans `ORIGIN.yml` (déjà le cas par défaut du script).
