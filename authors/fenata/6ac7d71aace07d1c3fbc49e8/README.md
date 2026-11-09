# fenata's Easiest_my_first

| | |
|---|---|
| **ID** | [`6ac7d71aace07d1c3fbc49e8`](https://crackmes.one/crackme/6ac7d71aace07d1c3fbc49e8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | fenata |
| **Plateforme** | Windows PE32+ x86-64, console, MSVC 2026 **debug** (C++) |
| **SHA-256** | `d38d81044fa32fe91d1aa9574dffb891199497d60df8c7d5c9eb078a09fda70f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/myfirst.exe` | binaire d'origine (non modifié) |
| `tools/myfirst-solve.py` | solveur + `--check` (émulation unicorn de `main`) |

## Réponse

**Mot de passe : `123456`**

```bash
python3 tools/myfirst-solve.py -q        # 123456
python3 tools/myfirst-solve.py --check   # OK (émule le main() du PE avec ce mot de passe)
```

Pas de username dans ce crackme, donc pas d'exemple `petik`.

## Premier regard

- `diec` : PE64, Microsoft Linker 14.51, Visual C/C++ 19.51 (C++), Visual Studio 2026, debug data CodeView.
- `strings` : `Enter ur password:`, `123456`, `Congratulations!` — se suivent dans `.rdata` (`0x14001f040`, `0x14001f058`, `0x14001f060`).
- Imports : `MSVCP140D.dll`, `VCRUNTIME140D.dll`, `ucrtbased.dll` → build **Debug** (RTC, `__CheckForDebuggerJustMyCode`, remplissage `0xcccccccc`).

## Flow

`main` en `0x140014e30` :

1. `VirtualAlloc(NULL, 0x2004, MEM_COMMIT|MEM_RESERVE, PAGE_READWRITE)` → buffer `[rbp+0x98]`
2. `cout << "Enter ur password:"`
3. `cin >> buf_local` (`[rbp+0x10]`)
4. `strcpy(buffer_alloc, "123456")`
5. `strcmp(buf_local, buffer_alloc) == 0` → `cout << "Congratulations!" << endl`

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn original/myfirst.exe` ; la `lea rdx,[rip+…] # 0x14001f040` (prompt) mène directement à `main`.

```asm
140014e6e: mov  r9d,0x4        ; PAGE_READWRITE
140014e74: mov  r8d,0x3000     ; MEM_COMMIT|MEM_RESERVE
140014e7a: mov  edx,0x2004
140014e7f: xor  ecx,ecx
140014e81: call [VirtualAlloc]
140014e87: mov  [rbp+0x98],rax          ; buffer secret
140014e8e: lea  rdx,[0x14001f040]       ; "Enter ur password:"
140014e9c: call 0x1400111fe             ; cout <<
140014ea2: lea  rdx,[rbp+0x10]
140014ead: call 0x1400114e2             ; cin >> char*  (saisie)
140014eb3: lea  rdx,[0x14001f058]       ; "123456"
140014ec1: call 0x140011091             ; thunk -> ucrtbased!strcpy(buffer, "123456")
140014ec7: mov  rdx,[rbp+0x98]
140014ece: lea  rcx,[rbp+0x10]
140014ed2: call 0x14001106e             ; thunk -> ucrtbased!strcmp(saisie, buffer)
140014ed7: test eax,eax
140014ed9: jne  0x140014f0a             ; différent -> fin silencieuse
140014edb: lea  rdx,[0x14001f060]       ; "Congratulations!"
```

Les thunks `0x140011091` / `0x14001106e` sont des `jmp [IAT]` ; en résolvant les adresses IAT (`0x1400264c8`, `0x1400264d0`) avec `pefile` on obtient `strcpy` et `strcmp`. Le mot de passe est donc la constante `123456` copiée juste avant comparaison (le détour par `VirtualAlloc` est du bruit).

Pièges : en cas d'échec, le programme ne dit rien (il sort simplement) ; la chaîne `123456` est entre le prompt et le message de succès dans `.rdata`, donc un `strings` suffit à la deviner, mais on la confirme par le code.

## Vérification

- Wine 10 **ne peut pas lancer** le PE d'origine ici : `import_dll Library MSVCP140D.dll / VCRUNTIME140D.dll / VCRUNTIME140_1D.dll / ucrtbased.dll not found` (CRT debug de Visual Studio, non redistribuable et absente de la machine). Aucune exécution live native n'a donc été possible ; pas de session GDB non plus (pas de walkthrough inventé).
- Preuve de remplacement : `tools/myfirst-solve.py --check` charge le **vrai** `original/myfirst.exe` dans unicorn, exécute `main` (`0x140014e30`) en émulant seulement les appels CRT/IO (`cin >>`, `cout <<`, `strcpy`, `strcmp`, `VirtualAlloc`, RTC) et lit la sortie :
  - `--check` (`123456`) → sortie `['Enter ur password:', 'Congratulations!', …]` → **OK**
  - `--check --pw 654321` → seulement `['Enter ur password:']` → **KO**
- Limite : la comparaison réelle d'`strcmp` est émulée ; si on veut une preuve complète, installer le CRT debug VS dans le préfixe Wine et lancer `echo 123456 | wine original/myfirst.exe`.

## Notes

- Appeler le solveur sans `-I` pour `--check` (unicorn/pefile sont dans le site-packages utilisateur).
- Rien n'a été patché dans `original/`.
