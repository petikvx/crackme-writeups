# michaelsrtsrt's Basics::AHardcodedKeyGoneWrong

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab56a1e95b976f8f1300b7a) · id `6ab56a1e95b976f8f1300b7a`

PE64 console **Mingw-w64**. La clé n'est pas encore connue (`status: pending`).

| Fichier | Rôle |
|---|---|
| [`original/keycheck.exe`](original/keycheck.exe) | binaire |
| [`analysis/NOTES.md`](analysis/NOTES.md) | où reprendre |

## État

Wine, mauvaise clé :

```text
printf 'testkey\n' | wine original/keycheck.exe
key: rejected
```

`main` (`0x140002a90`) est aplati. Deux coffres s'ouvrent (5 fiches + 614 couples) ; les textes `Accepted` / `Rejected` et le mot de passe ne sortent pas. Détail : [`analysis/NOTES.md`](analysis/NOTES.md).

## Status

- [x] premier regard
- [ ] prédicat / clé
- [ ] solveur
- [ ] write-up solved
