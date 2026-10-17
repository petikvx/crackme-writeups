# Yekong — Vending Machine

| | |
|---|---|
| **ID** | [`6454d06c33c5d43938912e8a`](https://crackmes.one/crackme/6454d06c33c5d43938912e8a) |
| **Auteur** | Yekong |
| **Plateforme** | Linux ELF64 PIE, **Rust** (4,2 Mo, symboles conservés) |
| **SHA-256** | `2dd63877c70e10161133da0b008b6b19339013fe7dcdbe984fd6532bb7d4538a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/vending_machine` | binaire d'origine |
| `analysis/vending_machine.i64` | base IDA (gitignorée) |
| `tools/vending-solve.py` | extrait le flag et rejoue l'exploit (`-q`, `--check`) |

## Réponse

**Flag : `flag{v3nd1ng_m4ch1n3_1s_4w3s0m3}`**, obtenu en entrant **une quantité négative** (≤ −18) de Coca-Cola pour gagner des pièces, puis en achetant le Flag.

```bash
printf '1\n-18\n3\n1\n4\n' | timeout 5 ./original/vending_machine | head -60 | grep -oE 'flag\{[^}]*\}|You have -?[0-9]+ coins'
# You have 10 coins / You have 100 coins / flag{v3nd1ng_m4ch1n3_1s_4w3s0m3} / You have 0 coins
python3 tools/vending-solve.py --check
```

Séquence (une entrée par ligne) : `1` (Coca) → `-18` (quantité) → `3` (Flag) → `1` (quantité) → `4` (Exit).
**Toujours borner la sortie** (`timeout`, `head`) : à la fin de l'entrée le programme reboucle indéfiniment sur le menu.

## Premier regard

Menu texte : « You have 10 coins », Coca-Cola (5, stock 10), Pepsi (5, stock 10), **Flag (100, stock 1)**, Exit. Avec 10 pièces, le flag est hors de portée : il faut trouver un défaut de logique.

## Flow

`vending_machine::main` @ `0x9080` (symboles Rust conservés : `print_item`, `get_buyer_details`, `show_flag` @ `0x9910`). Boucle : afficher le menu, lire un choix, puis une quantité (`get_buyer_details`).

## Comment on trouve

**Ancrage** : MCP `ida` (idalib + Hex-Rays), fonctions dont le nom contient `vending`, pseudo-code de `main` :

```c
v10 = 10;                                  // coins : i32
switch ( choix ) {
  case 1:                                  // Coca-Cola
    if ( v10 < 5 ) goto refus;             // SEUL contrôle : au moins le prix d'UNE unité
    get_buyer_details(&q);                 // quantité : i32 lu au clavier, signe non vérifié
    v20 -= q;                              // stock
    v10 -= 5 * q;                          // <-- q < 0 : AJOUTE des pièces
  case 3:                                  // Flag
    if ( v10 >= 100 ) {
        get_buyer_details(&q);
        if ( v0 == q ) { v10 += -100 * v0; show_flag(); v0 = 0; }   // quantité == stock (1)
    }
}
```

- La quantité est un entier **signé** (`i32::from_str`), jamais comparé à 0 ;
- le seul test pour Coca/Pepsi est `coins >= 5`, pas `coins >= 5 * qty` ;
- donc `qty = -k` augmente les pièces de `5k` et augmente le stock de `k`.

Pour le flag : `10 − 5·qty ≥ 100` ⇒ `qty ≤ −18`. Vérifié aux bornes : `−18` → 100 pièces → flag ; `−17` → 95 pièces → refus.
Piège : acheter le flag exige une quantité **exactement égale au stock restant** (1), pas n'importe quelle quantité.

## Vérification

```text
$ ... '1\n-18\n3\n1\n4\n'  -> You have 100 coins -> flag{v3nd1ng_m4ch1n3_1s_4w3s0m3} -> You have 0 coins
$ ... '1\n-17\n3\n1\n4\n'  -> You have 95 coins, pas de flag
$ ... '3\n1\n4\n'          -> pas de flag (10 pièces)
```

## Notes

- Reverse avec le MCP `ida` + essais live ; pas de GDB.
