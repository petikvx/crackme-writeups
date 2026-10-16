# thedollar — Bingus

| | |
|---|---|
| **ID** | [`68a153668fac2855fe6fb67b`](https://crackmes.one/crackme/68a153668fac2855fe6fb67b) |
| **Auteur** | thedollar |
| **Plateforme** | Linux ELF64 PIE, **strippé** (pas de symboles, `main` retrouvé via l'entry point) |
| **SHA-256** | `0ad062baf9201b13c66b86e2bd73f8029dd1910a817fecdb1125dfff054c6a23` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/bingus` | binaire d'origine |
| `tools/bingus-solve.py` | calcule l'argument (`-q`, `--check`) |

## Réponse

**Argument : `pp`** (deux fois le caractère `p`, `0x70`)

```bash
python3 tools/bingus-solve.py --check
./original/bingus pp        # Bingus survived
```

## Premier regard

`file` : ELF64 PIE **stripped**. `strings` : `Bingus exploded`, `This is not a red herring`, `This is a red herring`, `Bingus survived`.
Les deux phrases « red herring » se contredisent : une seule est réellement lue (voir plus bas). Sans argument ou avec un mauvais :
`Bingus exploded` (code retour 1).

## Flow

Binaire strippé : `readelf -h` donne l'entry point `0x1060`, dont le `lea rdi,[rip+0xce]` juste avant l'appel de
`__libc_start_main` pointe sur `main` = `0x1149`.

1. `argc == 2` ;
2. `argv[1][0] == argv[1][1]` ;
3. `strlen(argv[1]) == 2` ;
4. `acc = 0x66 + Σ octets(chaîne @0x202e) + argv[1][0] + argv[1][1]` doit valoir `0x8c5` → `Bingus survived`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/bingus --start-address=0x1149 --stop-address=0x1270`.

```asm
1159: cmp  edi,2                     ; argc == 2
116a: movzx edx,[argv1]              ; argv[1][0]
117c: movzx eax,[argv1+1]            ; argv[1][1]
117f: cmp  dl,al ; jne exploded      ; les deux octets identiques
1196: cmp  rax,2 ; je 11b5           ; strlen == 2
11b5: lea rax,[rip+0xe58] -> 0x2014  ; [rbp-0x20] = "This is not a red herring"  (jamais relu)
11c0: lea rax,[rip+0xe67] -> 0x202e  ; [rbp-0x28] = "This is a red herring"
11cb: mov DWORD PTR [rbp-0x14],0x66  ; acc = 0x66
11db..120a: boucle acc += (signed char) s[i]  sur [rbp-0x28] (la chaîne @0x202e)
1232: add eax,edx / add [rbp-0x14],eax   ; acc += argv[1][0] + argv[1][1]
1237: cmp DWORD PTR [rbp-0x14],0x8c5 ; je survived
```

**Piège** : la première chaîne (`@0x2014`, « *not* a red herring ») est chargée dans une variable mais **jamais lue** : c'est le vrai
leurre. La somme porte sur la seconde (`@0x202e`, « This is a red herring », 21 octets).

Calcul : `Σ("This is a red herring") = 1919` ; `0x66 + 1919 = 2021` ; il manque `0x8c5 - 2021 = 2245 - 2021 = 224` = `2·c`
→ `c = 112 = 'p'` → **`pp`**.

## Vérification

```text
$ ./original/bingus pp   -> Bingus survived
$ ./original/bingus qq   -> Bingus exploded
$ ./original/bingus pq   -> Bingus exploded
```

## Notes

- Reverse statique + essais live, pas de GDB.
- La solution est unique : les deux octets sont forcés égaux, donc un seul `c` convient.
