# skudo — Crack the algorithm

| | |
|---|---|
| **ID** | [`5d46d2bd33c5d444ad3018d3`](https://crackmes.one/crackme/5d46d2bd33c5d444ad3018d3) |
| **Auteur** | skudo |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `c44f9229728deee64c399a8dad0f5289eccfc0938c6182aa57df2327ecffeee3` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Encrypt` | binaire d'origine |
| `tools/crackalgo-solve.py` | génère le fichier-clé attendu (`--write`, `-q`, `--check`) |

## Réponse

Le programme demande le **chemin d'un fichier** contenant une chaîne de 49 octets précise (pas lisible en ASCII imprimable).

```bash
python3 tools/crackalgo-solve.py --write /tmp/keyfile.bin
printf '/tmp/keyfile.bin\n' | ./original/Encrypt
# -> Congratulations! You cracked the code!

python3 tools/crackalgo-solve.py --check
```

## Premier regard

```bash
file original/Encrypt     # ELF64 PIE, C++, not stripped
strings -n 5 original/Encrypt
```

Chaînes : `imsupersecur3`, `SvenJoergenIkeaBirdWaterSheepBoatCowPeePeePooPoo`, `Enter the path of the file containing the key: `, `Congratulations! You cracked the code!`. Symboles C++ : `createKey`, `encryptByte`.

## Flow

`main` : `Key = createKey("imsupersecur3")`, puis chiffre `"SvenJoergen...PooPoo"` octet par octet avec `encryptByte` (XOR), en **mode feedback** (la clé de chaque octet est l'octet chiffré précédent). Le résultat (49 octets) est comparé au contenu du fichier dont l'utilisateur donne le chemin.

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/Encrypt`, Hex-Rays sur `main`, `createKey` (`0x22a5`) et `encryptByte` (`0x2418`).

```c
int encryptByte(int c, int key) { return key ^ c; }   // XOR trivial

int createKey(string s) {
    int8_t sum = 0;
    for (c in s) sum += c;                     // checksum signe 8 bits
    int8_t k = 43 * (sum ^ (sum - 81) ^ 0x4C);  // transformation fixe
    int total = 0;
    for (i, c in enumerate(s)) {
        s[i] = c ^ k;                            // s est modifiee en place (jamais relue ensuite)
        total += (int8_t)s[i];
    }
    int r = total % 100;
    return r < 0 ? -r : r;
}
```

```c
// main
Key = createKey("imsupersecur3");
for (c in "SvenJoergenIkeaBirdWaterSheepBoatCowPeePeePooPoo") {
    enc = encryptByte(c, Key);   // = Key ^ c
    Key = enc;                    // feedback : la cle du prochain octet = cet octet chiffre
    ciphertext += (char)enc;
}
// compare(contenu_du_fichier, ciphertext)
```

Rien à deviner : chaque étape est un calcul déterministe, sans valeur aléatoire ni dépendance externe — il suffit de **réimplémenter exactement** `createKey` (en respectant l'arithmétique signée 8 bits de `char`, source de pièges si on utilise des entiers Python non bornés sans `& 0xFF` / `to_i8`) puis la boucle de chiffrement feedback.

### Résultat

```python
key = create_key("imsupersecur3")        # -> 11
ciphertext = xor_feedback(key, "SvenJoergen...PooPoo")
# -> bytes.fromhex("582e4b256f00651770157b32593c5d1f7604603756224735660e6b0e7e3c533246056a1d4d284d1d781d4d224d1d721d")
```

Ces 49 octets contiennent des caractères non imprimables (mais **aucun `\n`** — vérifié, sinon `getline()` tronquerait la lecture avant la fin) : il faut écrire un **fichier binaire exact**, pas une saisie clavier.

## Vérification

```bash
$ python3 tools/crackalgo-solve.py --write /tmp/keyfile.bin
$ printf '/tmp/keyfile.bin\n' | ./original/Encrypt
Enter the path of the file containing the key: Congratulations! You cracked the code!

$ echo /tmp/nonexistent | ./original/Encrypt
Enter the path of the file containing the key: Nope, it seems like you're not able to crack it eh?
```

## Notes

- Pas de GDB nécessaire : tout le calcul est statique et déterministe, entièrement reproductible en Python une fois l'arithmétique signée 8 bits respectée.
- Piège principal : `createKey` modifie la chaîne `s` en place (XOR avec `k`) puis **ne l'utilise plus jamais** — un détail de l'implémentation sans effet sur le résultat final, à ne pas confondre avec une étape nécessaire du calcul.
