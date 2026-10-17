# Oxymore — Password

| | |
|---|---|
| **ID** | [`65c926c6eef082e477ff6b5a`](https://crackmes.one/crackme/65c926c6eef082e477ff6b5a) |
| **Auteur** | Oxymore |
| **Plateforme** | Linux ELF64 PIE, **Rust** (4,2 Mo, avec symboles et DWARF) |
| **SHA-256** | `365bef1fbeaea4cbea092d0c04f78a8631f2d591ad63ba1aec6dd5ba37c8f332` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `analysis/crackme.i64` | base IDA (gitignorée) |
| `tools/password-solve.py` | lit la constante et vérifie le piège du `\n` (`-q`, `--check`) |

## Réponse

**Mot de passe : `NoiCe`, envoyé SANS retour à la ligne.**

```bash
printf 'NoiCe' | ./original/crackme      # Noice !! You did it
printf 'NoiCe\n' | ./original/crackme    # Nah, try again.   <- le \n fait échouer la comparaison
python3 tools/password-solve.py --check
```

## Premier regard

`strings` : `Input THE password : `, `Nah, try again.`, `Noice !! You did it`, et — collé juste avant l'invite dans `.rodata` — `NoiCe`. Saisir `NoiCe` au clavier (avec Entrée) est **refusé** : c'est le piège du challenge.
Le binaire pèse 4 Mo (libstd Rust) ; le code utile tient dans une seule fonction.

## Flow

`crackme::main` @ `0x9730` (350 octets) : affiche l'invite, `String::new()`, `stdin().read_line(&mut s).expect("Failed to read line ")`, puis `"NoiCe" == s` (`PartialEq<String> for &str`) → « Noice !! You did it » sinon « Nah, try again. ».

## Comment on trouve

**Ancrage** : MCP `ida` (idalib + Hex-Rays) : `open_database` sur `original/crackme`, recherche des fonctions dont le nom contient `crackme` (une seule : `_ZN7crackme4main17hcf660215df24c231E` @ `0x9730`), pseudo-code :

```c
v2[0] = aNoice; v2[1] = 5;                       // &str "NoiCe", longueur 5
std::io::stdio::_print(...);                      // "Input THE password : \n"
String::new(v4);
Stdin::read_line(...);                            // remplit v4
Result::expect(.., "Failed to read line ", 20, ..);
if ( <&str as PartialEq<String>>::eq(v2, v4) )    // "NoiCe" == lu
    print("Noice !! You did it\n");
else
    print("Nah, try again.\n");
```

**Le piège** : `Stdin::read_line` ajoute la ligne **avec son `\n`** à la `String` (contrairement à `gets`/`fgets` retirés par `strcspn` ailleurs). Le programme n'appelle ni `trim()` ni rien d'équivalent : la comparaison est donc entre `"NoiCe"` (5 octets) et `"NoiCe\n"` (6 octets) pour une saisie normale — **jamais égal**.
Pour que `read_line` rende exactement `"NoiCe"`, l'entrée doit se terminer **sans** saut de ligne (fin de flux). Au pipe : `printf 'NoiCe' | …`.

## Vérification

```text
$ printf 'NoiCe'   | ./original/crackme -> Noice !! You did it
$ printf 'NoiCe\n' | ./original/crackme -> Nah, try again.
$ printf 'noice'   | ./original/crackme -> Nah, try again.   (casse)
$ printf 'NoiCe\r' | ./original/crackme -> Nah, try again.
```

## Notes

- Reverse avec le MCP `ida` + essais live ; pas de GDB.
- Je n'ai pas testé d'envoi interactif sur un terminal (par exemple Ctrl-D) : seule la voie par pipe est vérifiée.
