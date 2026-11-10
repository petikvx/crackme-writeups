# qpdudusydi's Rust Crackme Very Easy

| | |
|---|---|
| **ID** | [`6af1cc355fa39ab0d4ac22b6`](https://crackmes.one/crackme/6af1cc355fa39ab0d4ac22b6) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | qpdudusydi |
| **Plateforme** | Windows PE64 console (Rust, MSVC) |
| **SHA-256** | `65ec9c8933d4fa03c18a67a533906733f7b571b4a5a529f03209eed5de9b7813` |

| Fichier | Rôle |
|---|---|
| `original/rustcrackme.exe` | binaire d'origine |
| `tools/rustcrackme-solve.py` | extraction de la réponse + `--check` Wine |

## Réponse

**`Cr4ckme_Rus7`** (mot de passe fixe, pas de user/serial dérivé : `petik` → `Wrong!`).

```bash
python3 -I tools/rustcrackme-solve.py -q
python3 -I tools/rustcrackme-solve.py --check   # OK + KO via xvfb-run wine
```

## Premier regard

- `file` : PE32+ console x86-64 ; chemins `.rustup\toolchains\stable-x86_64-pc-windows-msvc` → binaire Rust.
- Lancé sous Wine : bannière `Crackme (Rust)`, `Put in the your answer`, prompt `Your answer : `, puis `Correct!` / `Wrong!`.
- `strings` montre la concaténation (en `.rdata`, sans NUL) : `Crackme (Rust)\n` `Cr4ckme_Rus7` `Put in the your answer\n` `read line Failed` ... — Rust n'utilise pas de chaînes terminées par NUL, ce sont des `&str` (ptr, len) : il faut les longueurs données en argument.

## Flow

`main` de `src\main.rs` à `0x140002180` :

1. affiche la bannière (`0x14001b9a7`, len `0xf`) ;
2. charge `rax = 0x14001b9b6`, `[rbp+0x28] = 0xc` : le `&str` secret de 12 octets ;
3. affiche l'invite, lit stdin (`read_line`, `0x1400059a0`), `trim` (`0x1400029b0`) ;
4. `0x140002430` = comparaison de slices (`Ord::cmp`) : `memcmp` (`0x1400198f1`) sur `min(len)`, sinon différence de longueurs → retour -1/0/1 ;
5. `0x1400022e5` : `sub al,0xff / je` → Wrong (Less) ; `test al,al / je 0x140002314` → `Correct!` (Equal) ; sinon `Wrong!`.

## Comment on trouve

- Ancrage : `objdump -d -M intel --no-show-raw-insn original/rustcrackme.exe`, recherche des `lea rcx,[rip+..] # 0x14001ba10/23/2c` (les messages `Correct!`/`Wrong!` repérés par `objdump -s -j .rdata`).
- Juste avant l'appel de comparaison :

```asm
1400021b4: lea rax,[rip+0x197fb]   # 0x14001b9b6
1400021bb: mov [rbp+0x20],rax      # ptr secret
1400021bf: mov qword [rbp+0x28],0xc # len = 12
...
1400022c7: mov r8,[rbp+0x20] ; mov r9,[rbp+0x28]   # secret
1400022cf: mov rcx,[rbp+0x50] ; mov rdx,[rbp+0x58] # saisie trimée
1400022d7: call 0x140002430                        # cmp
```

- `objdump -s --start-address=0x14001b9a0 --stop-address=0x14001ba00` :
  `...Crackme (Rust)\n` puis `43 72 34 63 6b 6d 65 5f 52 75 73 37` = `Cr4ckme_Rus7`.
- Piège : le dernier caractère est le **chiffre `7`** (leet pour `t`), pas `t` : `Cr4ckme_Rust` donne `Wrong!` ; le `7` colle visuellement avec `Put in...` dans `strings` (`Cr4ckme_Rus7Put in the you...`), et la longueur 12 (`0xc`) délimite la chaîne.

## Vérification (Wine, binaire d'origine)

```text
$ echo Cr4ckme_Rus7 | xvfb-run -a wine original/rustcrackme.exe
Crackme (Rust)
Put in the your answer
Your answer : Cr4ckme_Rus7
Correct!
```

KO : `petik`, `Cr4ckme_Rust`, `cr4ckme_rust`, `Cr4ckme_Rus` → `Wrong!`. Un espace final est accepté (trim).

## Notes

Pas de GDB / x64dbg / IDA utilisés : reverse 100 % statique (objdump) + preuve Wine.
