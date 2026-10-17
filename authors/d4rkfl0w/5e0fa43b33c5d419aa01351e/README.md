# D4RKFL0W — Crackme-4

| | |
|---|---|
| **ID** | [`5e0fa43b33c5d419aa01351e`](https://crackmes.one/crackme/5e0fa43b33c5d419aa01351e) |
| **Auteur** | D4RKFL0W |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `19bfd34a5ed905de716117d565a8bcff8f95c11d59b906e3043ad1dd2b382b35` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme-4` | binaire d'origine |
| `analysis/Crackme-4.i64` | base IDA |
| `tools/crackme4-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `U6-:YL."+` (9 caractères) |

```bash
printf 'U6-:YL."+\n' | ./original/Crackme-4
python3 tools/crackme4-solve.py --check
```

## Premier regard

```bash
file original/Crackme-4     # ELF64 PIE, C++, not stripped
strings -n 5 original/Crackme-4
```

Chaînes : `Please enter the password: `, `Sorry that is incorrect.`, `That's CORRECT, Well Done.`. Symboles C++ démanglés : classes `Vault` et `PasswordGen` avec dix méthodes `c0()`…`c9()`.

## Flow

`main` → `Vault::prompt` (lit la saisie, max 19 octets) → `Vault::checkPassword` → `PasswordGen::buildPassword` (construit une chaîne de 10 octets **jamais utilisée pour la comparaison**, pur leurre) puis `PasswordGen::checkPassword` qui compare la saisie octet par octet à `c0()`…`c8()` — **jamais `c9()`** (indice 9 non vérifié).

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/Crackme-4`, Hex-Rays sur `checkPassword` révèle l'**ordre réel des appels**, différent de l'ordre numérique : `c3, c0, c1, c2, c4, c8, c5, c6, c7` — chaque octet faux déclenche un `exit(-1)` immédiat, avant les appels suivants.

Huit des neuf fonctions sont de simples boucles déterministes (lisibles directement, Hex-Rays ou désassemblage) :

```c
c0() { for (i=1; i+84<=32; ++i); return i+84; }   // boucle jamais executee (1+84>32) -> 85 'U'
c1() { return 54; }                                // '6'
c2() { return c1() - 9; }                          // 45 '-'
c3() { return 58; }                                // ':'
c4() { for (i=1; i+88<=32; ++i); return i+88; }    // meme piege que c0 -> 89 'Y'
c5() { v=1310655; for(i=1;;++i){ v=v%90+i; if(v>33) break; } return v; }  // i=1 -> v=1310655%90+1=76 'L'
c6() { for (i=0; i<=45; ++i); return i; }          // boucle simple -> 46 '.'
c8() { return 43; }                                // '+'
```

→ `c0 c1 c2 c3 c4 c5 c6 c8` = `U 6 - : Y L . +`, à replacer aux indices 0,1,2,3,4,5,6,8.

### Le piège : `c7()`

```c
c7() {
    int v2;              // JAMAIS INITIALISEE par c7 lui-meme !
    int i = 199292309 % v2;
    for (; i <= 33 || i > 89; ++i) ;
    return i;
}
```

En désassemblage brut, `v2` correspond à `[rbp-0x4]`, lu **avant** d'être écrit par `c7` — c'est la valeur laissée sur la pile par l'appel **précédent** dans la séquence réelle de `checkPassword`, c'est-à-dire `c6()` (dont la variable de boucle finit à 46, au même décalage de pile). Impossible à déterminer en relisant `c7` isolément : il faut observer l'exécution réelle, dans l'ordre réel des appels — voir § Debug GDB.

## Debug GDB (pas à pas)

Pour lire la valeur réellement calculée par `c7()` (dépendante de la pile laissée par `c6()`), on fournit un mot de passe dont les 8 octets connus sont déjà corrects (sinon le programme `exit()` avant même d'appeler `c7`), avec un octet factice en position 7, et on casse juste après le `call PasswordGen::c7` :

```bash
objdump -d -M intel --no-show-raw-insn original/Crackme-4 \
  | awk '/<_ZN11PasswordGen13checkPasswordEPc>:/,/^$/' | grep -n "call.*c7\|cmp.*bl,al"
#   call   149e <PasswordGen::c7>
#   13d1:  cmp    bl,al        <- casser ICI (juste apres le call, avant la comparaison)
```

PIE : base standard `0x555555554000` (confirmée via `starti` + `info proc mappings`), donc `0x555555554000 + 0x13d1 = 0x5555555553d1`.

```bash
gdb -q -batch \
  -ex 'break *0x5555555553d1' \
  -ex 'run' \
  -ex 'print/c $al' \
  --args ./original/Crackme-4 <<< 'U6-:YL.X+'
```

Observé :

```text
Please enter the password: 
Breakpoint 1, 0x00005555555553d1 in PasswordGen::checkPassword(char*) ()
$1 = 34 '"'
```

→ `c7() = 34 = '"'`. Mot de passe complet : `U6-:YL."+`.

## Vérification

```bash
$ printf 'U6-:YL."+\n' | ./original/Crackme-4
Please enter the password: 
That's CORRECT, Well Done.

$ printf 'wrong\n' | ./original/Crackme-4
Please enter the password: 
Sorry that is incorrect.
```

## Notes

- `PasswordGen::buildPassword()` construit bel et bien un mot de passe de 10 octets (incluant `c9()=10`, un retour chariot) sur le tas, mais ce buffer n'est **jamais comparé à rien** — pur leurre pour qui lirait seulement cette fonction en pensant y trouver la réponse.
- L'indice 9 de la saisie n'est jamais vérifié : seuls 9 caractères comptent réellement.
- `c7()` illustre un vrai comportement indéfini du C (lecture d'une variable locale non initialisée) exploité comme mécanisme de protection — büg du crackme lui-même, mais stable et reproductible tel que compilé ici.
