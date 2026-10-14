# RR7's Secret key

| | |
|---|---|
| **ID** | [`6a46f20c8a86e4c2c5525631`](https://crackmes.one/crackme/6a46f20c8a86e4c2c5525631) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | RR7 |
| **Auteur (local)** | rr7 |
| **Plateforme** | Windows, PE32+ x86-64 console, MinGW-w64 (GCC 16.1.0 MSYS2) |
| **Difficulté** | 1.0 |
| **SHA-256** | `f444f0ef793db4e9320b04d618aff6fcda7cf1502b4c3ce5f4bf0b71c72e2273` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/code.exe` | binaire d'origine (non patché) |
| `analysis/main.objdump.txt` | désassemblage de `main` (objdump, Intel) |
| `analysis/check.txt` | sortie de `secret-key-solve.py --check` (Wine) |
| `tools/secret-key-solve.py` | solveur + vérification Wine (`-q`, `--check`) |

## Réponse

| Prompt | Entrée |
|---|---|
| `Enter Your Number :` | **`33`** (`0x21`) |
| `Enter The Secret Key :` | **`102`** (`0x66`) |

```bash
python3 tools/secret-key-solve.py          # affiche les deux valeurs
python3 tools/secret-key-solve.py --check  # preuve Wine (cas OK + KO)
printf '33\n102\n' | WINEDEBUG=-all wine original/code.exe
```

Pas de username ici (deux entiers fixes), donc pas d'exemple `petik`.

## Premier regard

```text
$ file original/code.exe
PE32+ executable for MS Windows 5.02 (console), x86-64, 19 sections
$ diec original/code.exe
PE64  Compiler: MinGW
```

`strings` donne directement les trois messages utiles :

```text
Enter Your Number :
Enter The Secret Key :
Congratulations, you have completed the challenge!
```

Aucun message d'échec : sur une mauvaise entrée le programme quitte simplement en silence.
Le binaire n'est **pas strippé** (19 sections, table de symboles COFF présente) : `objdump -t` donne `main` à `0x1400014b0`.

## Flow

1. `printf("Enter Your Number : ")` puis `scanf("%i", &n)` ;
2. si `n != 0x21` → `return 0` (silence) ;
3. `printf("Enter The Secret Key : ")` puis `scanf("%i", &k)` ;
4. si `k != 0x66` → `return 0` ;
5. sinon `printf("Congratulations, you have completed the challenge!")`.

## Comment on trouve la réponse

**Ancrage** : `objdump -t original/code.exe | grep main` → `main` à `0x1400014b0`, puis
`objdump -d -M intel original/code.exe | awk '/<main>:/,/ret/'` (dump complet dans `analysis/main.objdump.txt`).

```asm
1400014bd: lea  rax,[rip+0x2b3c]      ; .rdata+0x00 "Enter Your Number : "
1400014c7: call printf
1400014cc: lea  rax,[rbp-0x4]         ; &n (int local)
1400014d0: lea  rcx,[rip+0x2b3e]      ; .rdata+0x15 "%i"
1400014da: call scanf
1400014df: mov  eax,DWORD PTR [rbp-0x4]
1400014e2: cmp  eax,0x21              ; n == 33 ?
1400014e5: jne  main+0x70             ; non -> return 0
1400014e7: lea  rax,[rip+0x2b2a]      ; "Enter The Secret Key : "
1400014f1: call printf
1400014f6: lea  rax,[rbp-0x8]         ; &k
1400014fa: lea  rcx,[rip+0x2b14]      ; "%i" (même chaîne)
140001504: call scanf
140001509: mov  eax,DWORD PTR [rbp-0x8]
14000150c: cmp  eax,0x66              ; k == 102 ?
14000150f: jne  main+0x70
140001511: lea  rax,[rip+0x2b18]      ; "Congratulations, ..."
14000151b: call printf
140001520: mov  eax,0x0               ; return 0
```

**Décodage** :

- la chaîne de format est à `.rdata+0x15` ; `objdump -s -j .rdata` montre `25 69 00` = **`%i`** (et pas `%d`) ;
- les deux constantes sont des immediates dans les `cmp` : `0x21 = 33`, `0x66 = 102` (au passage `0x21 = '!'` et `0x66 = 'f'` en ASCII, mais ici ce sont bien des entiers lus par `scanf`).

Pseudo-C équivalent :

```c
int main(void) {
    int n, k;
    printf("Enter Your Number : ");      scanf("%i", &n);
    if (n == 33) {
        printf("Enter The Secret Key : "); scanf("%i", &k);
        if (k == 102)
            printf("Congratulations, you have completed the challenge!");
    }
    return 0;
}
```

## Vérification (Wine)

```text
$ python3 tools/secret-key-solve.py --check
Your Number   : 33 (0x21)
Secret Key    : 102 (0x66)
[OK] 33 / 102     -> Congratulations
[OK] 0x21 / 0x66  -> Congratulations
[OK] 33 / 101     -> (rien)
[OK] 32 / 102     -> (rien)
```

Un mauvais nombre (`32`) coupe avant même le second prompt ; une mauvaise clé (`101`) quitte sans message.

## Notes

- **`%i` vs `%d`** : `%i` interprète aussi l'hexadécimal (`0x21`) et l'octal (`041`), donc `0x21` / `0x66` ou `041` / `0146` sont aussi acceptés (vérifié pour l'hexa sous Wine).
- Pas d'anti-debug, pas de packer, pas de calcul : les valeurs sont en clair dans les `cmp`. 100 % statique (ni GDB ni x64dbg).
- Le binaire tourne directement sous `wine` (console), pas besoin de `xvfb-run`.
