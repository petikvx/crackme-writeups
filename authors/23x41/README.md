# 23x41

Auteur local : **`23x41`** (site : [23x41](https://crackmes.one/user/23x41)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Secure Vault](6a59d79ba27dfa335e4c8597/) | [`6a59d79b…`](https://crackmes.one/crackme/6a59d79ba27dfa335e4c8597) | ELF64 RISC-V static | ret2win `win@0x10476` → `FLAG{0x8A7_RISCV_ROP_WIN}` (statique) |
| 2 | [DPRK Loyalty Evaluation](6a5995410b25d281a656896f/) | [`6a599541…`](https://crackmes.one/crackme/6a5995410b25d281a656896f) | ELF64 x86-64 C++ | format leak + ret2grant → `FLAG{0x8A7_JUCHE_FORMAT_STRING_MASTERY}` |
| 3 | [0x8A7 Maze](6a597d7f0691b3daf2a3f2a0/) | [`6a597d7f…`](https://crackmes.one/crackme/6a597d7f0691b3daf2a3f2a0) | ELF64 x86-64 PIE | canary+PIE leak → ret2open → `FLAG{0x8A7_P1E_L34K_4SLR_BYP4SS}` |

Les trois challenges ont une section **Debug GDB (pas à pas)** dans leur `README.md` (x86-64 natif pour Maze / Loyalty ; RISC-V via `qemu-riscv64` + `gdb-multiarch` pour Secure Vault).

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
./scripts/add-crackme.sh --author 23x41 <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
