# longurara's decode me (hard)

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69424c290992a052ab2223bb)
- Auteur : longurara · Plateforme : Windows PE64 console (MinGW, symboles présents)

| Fichier | Rôle |
|---|---|
| `original/decode-password.exe` | binaire d'origine (non modifié) |
| `tools/longurara-decode-solve.py` | solveur (`-q`, `--check <exe>` via `xvfb-run wine`) |

## Réponse

**Password : `youhavedecodedit!`** (pas de user/login, donc pas de `petik` ici).

```bash
python3 -I tools/longurara-decode-solve.py -q
python3 -I tools/longurara-decode-solve.py --check original/decode-password.exe
```

## Premier regard

`file` : PE32+ console x86-64 ; `diec` : MinGW, GNU ld 2.33. Binaire **non strippé** : `main`, `init_data`, `security_check`, `calculate_entropy`, `verify_password`, `fail` sont visibles via `objdump -d -M intel`. Bannière « EXTREME CRACKME - LEVEL: IMPOSSIBLE », prompt `Enter the password:`, messages `ACCESS GRANTED/DENIED`. Les noms d'API anti-debug sont coupés en morceaux d'immediates (`IsDebug`+`gerPresen`…) et résolus dynamiquement (`init_apis`).

## Flow

`main` : `init_apis` → `init_data` → `security_check` (IsDebuggerPresent / CheckRemoteDebuggerPresent → `fail`) → `fgets` → retrait du `\n` → `calculate_entropy` (si == `0xdeadbeef` → `exit`, piège inatteignable en pratique) → timeout GetTickCount > 30 s → `verify_password(buf, len)`.

## Comment on trouve

1. **`init_data` (0x401560)** : remplit sur la pile 17 dwords puis les copie dans `secret_data` (0x4089c0) ; `decoy_data` (0x408a20) = chaque valeur `^ 0xff` (leurre) ; `g_state_1 = 0x1337`.
   `secret = 2c 3b 22 40 38 28 36 38 38 3f 44 3c 3c 3e 4a 30 84`.
2. **`verify_password` (0x401875)** : boucle de *control-flow flattening* (variable d'état `[rbp-4]`, dispatch par jump table à 0x405034, état final `0x3e7`). Mis à plat, pour chaque `i` de 0 à 0x10 :
   ```
   v = (uint8)password[i]        ; movzx/movsx
   v ^= 0x55                      ; état 0x28 : xor [rbp-0x10], [rbp-0x14]
   v += i                         ; état 0x2d
   if v != secret_data[i] -> ok = 0   ; état 0x32 (cmp à 0x4019f5)
   if v == decoy_data[i]  -> g_state_1 = 0   ; piège, ruine le check final
   ```
   Le bloc `shl 2 ; xor 0xaa ; g_check_sum += …` (0x401973) n'est qu'un leurre : `g_check_sum` n'est jamais testé.
3. **État final (0x1f4)** : `len == 0x11` et `g_state_1 == 0x1337` sinon échec.
4. **Inversion** : `password[i] = (secret[i] - i) ^ 0x55`. Exemple : `i=0` → `0x2c^0x55 = 0x79 = 'y'` ; `i=1` → `(0x3b-1)^0x55 = 0x6f = 'o'` ; … ; `i=16` → `(0x84-16)^0x55 = 0x21 = '!'` → `youhavedecodedit!`.
   Les valeurs obtenues ne sont pas égales à `secret^0xff` (le leurre), donc `g_state_1` reste `0x1337`.

Pièges : noms d'API fragmentés, CFF qui masque une simple boucle, leurre `decoy_data`, `g_check_sum` inutile. Analyse 100 % statique (pas de GDB, pas de debugger live).

## Vérification (Wine, binaire d'origine)

```bash
printf 'youhavedecodedit!\n\n' | xvfb-run -a wine original/decode-password.exe   # [+] ACCESS GRANTED. / Password accepted.
printf 'petik\n\n'            | xvfb-run -a wine original/decode-password.exe   # [-] ACCESS DENIED.
```

Les deux cas ont été exécutés : OK pour le mot de passe trouvé, KO pour `petik`.

## Notes

Pas de screenshot (preuve en console). `original/` non touché.
