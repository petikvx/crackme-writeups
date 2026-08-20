# CrackNotMe

Auteur local : **`cracknotme`** (site : [CrackNotMe](https://crackmes.one/user/CrackNotMe)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [CFB #1](6a1547f42b3df128c1df5ca5/) | [`6a1547f4…`](https://crackmes.one/crackme/6a1547f42b3df128c1df5ca5) | Windows x86-64 | `petik` → serial `3D513B4748` (hex par char) |
| 2 | [CFB #2 Maze Runner](6a15496417539b5175d12386/) | [`6a154964…`](https://crackmes.one/crackme/6a15496417539b5175d12386) | Windows x86-64 | path WASD `SDDSSASSDDSSDDDSSDDD` |
| 3 | [CFB #3 Mini VM](6a154aca8fab7bbca27302a2/) | [`6a154aca…`](https://crackmes.one/crackme/6a154aca8fab7bbca27302a2) | Windows x86-64 | password `pwn_vm_3` |
| 4 | [CFB #4 Custom rotors](6a154cab17539b5175d1238a/) | [`6a154cab…`](https://crackmes.one/crackme/6a154cab17539b5175d1238a) | Windows x86-64 | password `rotors_spin_9` |
| 5 | [CFB #5 Game of Life](6a1569de2b3df128c1df5cb1/) | [`6a1569de…`](https://crackmes.one/crackme/6a1569de2b3df128c1df5cb1) | Windows x86-64 | password `LifeGame` |
| 6 | [CFB #6 Quantum State](6a537448a27dfa335e4c8518/) | [`6a537448…`](https://crackmes.one/crackme/6a537448a27dfa335e4c8518) | Windows x86-64 | flag `pwn{6_st4g3_m3m0ry_p4tch_g0d}` |
| 7 | [CFB #7 Shattered Mirror](6a5374710b25d281a65688e6/) | [`6a537471…`](https://crackmes.one/crackme/6a5374710b25d281a65688e6) | Windows x86-64 | password `Pwn.By_SMC_2026` |
| 8 | [CFB #8 Concurrently Yours](6a537490055757d3df60fcc3/) | [`6a537490…`](https://crackmes.one/crackme/6a537490055757d3df60fcc3) | Windows x86-64 | token hex dynamique PID⊕TID0..2 vs `deadbeef…4242` |
| 9 | [CFB #9 The Impostor](6a5374be6f511264ea482525/) | [`6a5374be…`](https://crackmes.one/crackme/6a5374be6f511264ea482525) | Windows x86-64 | side-load `validator.dll` / `VerifyLicense` → `0x1337C0DE` |
| 10 | [CFB #10 The Keymaster's Sigil](6a5375046f511264ea482529/) | [`6a537504…`](https://crackmes.one/crackme/6a5375046f511264ea482529) | Windows x86-64 | RSA-1024 key-replacement · user `keymaster` + sig PKCS1/SHA256 |
| — | [ASMe (ASM CrackMe)](69ff482c8fab7bbca273011e/) | [`69ff482c…`](https://crackmes.one/crackme/69ff482c8fab7bbca273011e) | Windows PE32 FASM | serial `pXi8` / `5PDx` (hash `0x350721c5`) |

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
./scripts/add-crackme.sh --author cracknotme <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
