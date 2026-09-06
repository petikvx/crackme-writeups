# jenya

Auteur local : **`jenya`** (site : [Jenya](https://crackmes.one/user/Jenya)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [math_crackme](659ffe1beef082e477ff59d0/) | [`659ffe1b…`](https://crackmes.one/crackme/659ffe1beef082e477ff59d0) | Linux ELF64 | `12→6` (mod 6/2) |
| 2 | [linux_asm_jenya](655b43750f4238b24302bc42/) | [`655b4375…`](https://crackmes.one/crackme/655b43750f4238b24302bc42) | Linux ELF64 | palindrome `aba` |

Les deux challenges ont une section **Debug GDB (pas à pas)** (palindrome / longueur ; `check` branchless + piège `read(20)`).

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author jenya <id>
```
