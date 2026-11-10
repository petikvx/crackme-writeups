# maxpsger's Easy crackme

| | |
|---|---|
| **ID** | [`695b957ad7c572e88f5433f6`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/695b957ad7c572e88f5433f6) |
| **Auteur** | maxpsger |
| **Plateforme** | Windows PE64 console, C++ (MSVC, `MSVCP140`/`VCRUNTIME140`) |
| **SHA-256 (`download.bin`)** | `69c69d2ea5c5168206ac0e54ea6646ec1c82d9ff0dcf3e8ee4561711219200a8` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré d'origine (mot de passe `crackmes.one`), contient `crackme.exe` |
| `analysis/x/crackme.exe` | `crackme.exe` extrait (copie de travail, `unzip -P crackmes.one`) |
| `analysis/crackme.asm` | `objdump -d -M intel` complet |
| `tools/maxpsger-easy-solve.py` | solveur + vérification par émulation Unicorn |

## Réponse

| Champ | Valeur |
|---|---|
| Username | **`crackme`** |
| Password | **`Rickroll`** |

Ce sont des constantes : il n'y a pas de calcul à partir du nom, donc pas d'exemple `petik` (`petik` + `Rickroll` est refusé, voir Vérification).

```bash
python3 tools/maxpsger-easy-solve.py -q        # crackme:Rickroll
python3 tools/maxpsger-easy-solve.py --check   # émulation du check réel (OK + 2 KO)
```

## Premier regard

- `download.bin` commence par `PK\x03\x04` avec le flag « chiffré » (`0x09`) : c'est le ZIP du site, pas un PE. `unzip -P crackmes.one original/download.bin -d analysis/x` donne `crackme.exe` (18 432 octets, `MZ`).
- `objdump -p` : PE64, imports `MSVCP140.dll` (iostream), `memcmp`/`strlen`/`memcpy` via l'UCRT. Pas de packer, pas d'anti-debug.
- `.rdata` contient les chaînes en clair mais `strings` ne les distingue pas bien de la table d'imports ; il faut suivre les `lea rdx,[rip+…]` du code (voir plus bas). Elles se lisent tout de même en dumpant `.rdata` vers `0x3380` :
  `false`, `Enter username: `, `Enter password: `, `crackme`, `Rickroll`, `congrats ??`, `start https://youtu.be/dQw4w9WgXcQ?si=…`.

## Flow

`main` = fonction à `0x140001290` (frame `0x78`, cookie `__security_cookie` @ `0x140005040`) :

1. `cout << "Enter username: "` (`0x1400015a0` = `operator<<`), `cin >> s1` (`0x140001770` = `operator>>(istream&, string&)`).
2. Idem pour `"Enter password: "` → `s2`.
3. Check, puis `congrats ??` + `system("start https://youtu.be/dQw4w9WgXcQ…")` (rickroll) ou `false`.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn crackme.exe`, lecture de `0x140001290` après le deuxième `operator>>`.
(Pas de session GDB ni IDA : Wine/GDB indisponibles sur la machine d'analyse, lecture statique + émulation.)

```asm
140001323: mov  r8,[rsp+0x30]        ; s1.size
140001328: mov  rbp,[rsp+0x38]       ; s1.capacity (SSO si <= 0xf)
14000132d: lea  rcx,[rsp+0x20]       ; s1.buf (SSO)
140001337: cmp  rbp,0xf
14000133b: cmova rcx,rbx             ; si capacité > 15 → pointeur heap
140001349: cmp  r8,0x7               ; len(s1) == 7 ?
14000134d: jne  0x1400013b9          ; sinon → "false"
14000134f: lea  rdx,[rip+0x20ba]     ; → 0x140003410 = "crackme"
140001356: call 0x1400028f3          ; thunk → memcmp(s1, "crackme", 7)
14000135d: jne  0x1400013b9
140001371: cmp  r8,0x8               ; len(s2) == 8 ?
140001377: lea  rdx,[rip+0x209a]     ; → 0x140003418 = "Rickroll"
14000137e: call 0x1400028f3          ; memcmp(s2, "Rickroll", 8)
140001385: jne  0x1400013b9
140001387: lea  rdx,[rip+0x209a]     ; 0x140003428 = "congrats ??"
...        call [0x1400031b8]        ; system("start https://youtu.be/dQw4w9WgXcQ?si=…")
1400013b9: lea  rdx,[rip+0x2014]     ; 0x1400033d4 = "false"
```

Décodage : `0x1400028f3` n'est qu'un `jmp [0x140003138]` = import `memcmp`. Les littéraux sont lus à leur adresse dans `.rdata` (RVA `0x3410` → offset fichier `0x2410`) : `63 72 61 63 6b 6d 65 00` = `crackme\0` et `52 69 63 6b 72 6f 6c 6c 00` = `Rickroll\0`. Longueurs 7 et 8 cohérentes avec les `cmp r8,7` / `cmp r8,8`.

Pièges : le texte « congrats ?? » est le message de succès (pas de flag) ; la chaîne `crackme` ressemble au nom du binaire mais est bien le username attendu ; la comparaison est stricte (casse, pas de `\n`).

## Vérification

Wine n'est pas installé sur la machine → preuve par **émulation Unicorn du code réel** de `crackme.exe` (extrait du ZIP d'origine, `original/` jamais modifié) : on exécute la vraie fonction `0x140001290`, en hookant seulement les E/S C++ (`operator<<`, `operator>>`, `memcmp`, `system`) :

```text
$ python3 tools/maxpsger-easy-solve.py --check
username = crackme
password = Rickroll
OK  : Enter username: |Enter password: |congrats ??|system:start https://youtu.be/dQw4w9WgXcQ?si=-WxzNHuzQt6O116t
KO  : Enter username: |Enter password: |false          # crackme / wrong
KO2 : Enter username: |Enter password: |false          # petik / Rickroll
```

Le solveur relit aussi les deux littéraux directement dans l'exe (`extract_from_binary`) et vérifie qu'ils valent bien `crackme` / `Rickroll`. Preuve Wine possible ailleurs : `python3 tools/maxpsger-easy-solve.py --check --wine` (`xvfb-run -a wine`).

## Notes

- Aucune transformation du nom/mot de passe : comparaison `memcmp` directe avec des constantes.
- Le « succès » lance un rickroll via `start` (cmd Windows) — sans effet sous l'émulation.
