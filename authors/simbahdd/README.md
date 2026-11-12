# simbahdd

Auteur local : **`simbahdd`** (site : [SimbaHDD](https://crackmes.one/user/SimbaHDD)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [CRACKME](6a160c2a2b3df128c1df5cc1/) | [`6a160c2a…`](https://crackmes.one/crackme/6a160c2a2b3df128c1df5cc1) | Windows PE32+ MinGW | password `simba123` (strcmp clair) |
| 2 | [very easy crackme](6a1604d22b3df128c1df5cbc/) | [`6a1604d2…`](https://crackmes.one/crackme/6a1604d22b3df128c1df5cbc) | Windows .NET (ZIP imbriqué) | password `crackme12345ez` (littéral C#) |
| 3 | [SimbaHDD's first golang crackme](6a1608d1d7ff92e1214c01f5/) | [`6a1608d1…`](https://crackmes.one/crackme/6a1608d1d7ff92e1214c01f5) | Windows PE32+ Go (ZIP imbriqué) | password `simba123` (qword LE comparé dans `main.main`) |
| 4 | [easy crackme](6a160789d7ff92e1214c01f1/) | [`6a160789…`](https://crackmes.one/crackme/6a160789d7ff92e1214c01f1) | Windows .NET PE32 (ZIP imbriqué) | password `crackme12345simba` (littéral base64 décodé) |
| 5 | [SimbaHDD's CRACKME (2)](6a36d8a4a4b247348ae80623/) | [`6a36d8a4…`](https://crackmes.one/crackme/6a36d8a4a4b247348ae80623) | Windows PE32+ MinGW (ZIP) | clé non imprimable hex `3c0f553c2422ac30aeafac55` (`((c^0x55)+7)^0x33` == `CR4CKM3_1234`) |

## Arborescence d’un challenge

```
<id-crackmes.one>/
  ORIGIN.yml
  README.md
  original/
  analysis/
  tools/
```

## Ajouter un crackme

```bash
./scripts/add-crackme.sh https://crackmes.one/crackme/<id>
# ou forcer le slug :
./scripts/add-crackme.sh --author simbahdd <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
