# Eilay_Yosfan's 3OutOf6

| | |
|---|---|
| **ID** | [`690210a42d267f28f69b7980`](https://crackmes.one/crackme/690210a42d267f28f69b7980) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Eilay_Yosfan |
| **Plateforme** | Windows PE64 console, GCC 13.4 sous **Cygwin** (`cygwin1.dll`) |
| **SHA-256 (`original/download.bin`)** | `aeebc13c742d5bab8e5377db9d1c0fa126661393bfb97e647886d9326cd69468` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP (mot de passe `crackmes.one`) contenant `3outof6.exe` — laissé intact |
| `analysis/3outof6.exe` | exécutable extrait du ZIP (reverse) |
| `tools/3outof6-solve.py` | solveur + `--check` (émulation Unicorn de `main`) |

## Réponse

**Clé : `68`** (décimal, `0x44`).

```bash
python3 -I tools/3outof6-solve.py -q      # 68
python3 tools/3outof6-solve.py --check    # 68 -> Correct!  /  69 -> Bad key!
```

Pas de username : pas de variante `petik`, la clé est une constante.

## Premier regard

- `download.bin` est en fait un **ZIP chiffré** (`PK`, flag bit 0) : `3outof6.exe`, 68 975 octets, extrait avec `crackmes.one`.
- `strings` : `Please enter the key: `, `%d`, `Correct!`, `Bad key!`, imports `scanf`/`printf` via `cygwin1.dll`. Le « 3 out of 6 » du titre n'a pas d'incidence sur le code.

## Flow

`main` affiche l'invite, lit un entier avec `scanf("%d")` et le compare à une constante locale.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn analysis/3outof6.exe`, fonction `main` à `0x100401080` (`.text` fichier `0x600`).

```asm
100401084: sub  rsp,0x30
100401088: call __main                  ; init Cygwin
10040108d: mov  DWORD PTR [rbp-0x4],0x44   ; <-- la clé attendue, 0x44 = 68
100401094: lea  rax,[rip+0x1f65]        ; "Please enter the key: "
10040109e: call printf
1004010a3: lea  rax,[rbp-0x8]           ; &saisie
1004010aa: lea  rax,[rip+0x1f66]        ; "%d" (.rdata+0x17)
1004010b4: call scanf
1004010b9: mov  eax,DWORD PTR [rbp-0x8]
1004010bc: cmp  DWORD PTR [rbp-0x4],eax ; 0x44 == saisie ?
1004010bf: jne  bad                     ; sinon "Bad key!" (.rdata+0x23)
1004010c1: ... printf("Correct!")        ; .rdata+0x1a
```

Le prédicat est donc `saisie == 0x44` ; la lecture `%d` impose de taper `68` en décimal (piège : pas `44`, ni `0x44`, que `%d` ne parserait pas en hex).

## Vérification

- Pas de Wine ni de `cygwin1.dll` sur la machine d'analyse : **pas de run natif du `.exe`**. Aucun GDB/x64dbg utilisé → pas de section Debug GDB.
- Preuve par **émulation Unicorn** de la vraie `main` du PE (code et `.rdata` mappés depuis l'exe, `printf`/`scanf`/`__main` stubbés) :
  - saisie `68` → `Correct!`
  - saisie `69` → `Bad key!`

## Notes

- Le ZIP du site est ce qui est stocké dans `original/` ; ne pas l'écraser.
- Crackme trivial (constante en dur) ; la difficulté tient à l'emballage Cygwin.
