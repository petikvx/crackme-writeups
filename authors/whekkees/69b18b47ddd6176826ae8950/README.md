# whekkees's very easy crack me $$$ by whekkees

| | |
|---|---|
| **ID** | [`69b18b47ddd6176826ae8950`](https://crackmes.one/crackme/69b18b47ddd6176826ae8950) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | whekkees |
| **Plateforme** | Windows PE64 console (MSVC Release, C++ `iostream`) |
| **SHA-256** (zip `download.bin`) | `93268b86eac29badd9b36daa065f0455727212902356ac890d7e4737d7a7a8d3` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP (mot de passe `crackmes.one`) contenant `crackme4.exe` (19 968 octets) |
| `tools/whekkees-solve.py` | affiche la réponse ; `--check` émule le check du PE avec unicorn |

## Réponse

| Login | Password |
|---|---|
| **`whekkes`** (7 lettres, un seul « e » avant le « s » final de « whekkees ») | **`qwerty`** |

```bash
python3 tools/whekkees-solve.py        # login / password
python3 tools/whekkees-solve.py -q     # whekkes:qwerty
python3 tools/whekkees-solve.py --check
```

Le login est fixe (pas de keygen) : rien n'est dérivé de l'entrée, donc `petik` est refusé (le programme s'arrête après le prompt login, sans demander de password).

## Premier regard

- `download.bin` est un ZIP, pas un exe : `unzip -P crackmes.one original/download.bin -d /tmp/wk` → `crackme4.exe`.
- PE64 MSVC, imports `msvcp`/`vcruntime` (`cout`, `cin`, `memcmp`).
- `strings` : `Welcome to my so eazy crack me good luck by whekkees`, `Please enter ur login: `, `Please enter ur password: `, `Nice job bro`. Aucun secret en clair : ce sont des *immediates* dans le code.

## Flow

Fonction `0x1400012a0` (appelée depuis `0x140001fbb`) : bannière → prompt login → `cin >> std::string` → `strlen` de la constante + `memcmp` → prompt password → même chose → `Nice job bro`. Au moindre échec on saute à la libération des `std::string` et on quitte **sans message d'erreur**.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn crackme4.exe`, section `.text` à `0x140001000`. Les messages sont dans `.rdata` (`0x140003428` bannière, `0x140003460` « login », `0x140003480` « password », `0x1400034a0` « Nice job bro »). Le code qui les référence est `0x1400012a0`.

```asm
1400012ff: mov DWORD PTR [rbp-0x11],0x6b656877   ; 77 68 65 6b = 'w','h','e','k'
140001306: mov DWORD PTR [rbp-0x0d],0x73656b     ; 6b 65 73 00 = 'k','e','s',\0
14000130d: mov DWORD PTR [rbp-0x19],0x72657771   ; 71 77 65 72 = 'q','w','e','r'
140001314: mov WORD  PTR [rbp-0x15],0x7974       ; 74 79       = 't','y'
14000131a: mov BYTE  PTR [rbp-0x13],r12b         ; \0 (r12d = 0)
```

Décodage (little-endian) : `whek` + `kes` → **`whekkes`** ; `qwer` + `ty` → **`qwerty`**. Le second `mov` du login écrit 4 octets `6b 65 73 00` : le `00` est le terminateur, qui recouvre le début du buffer suivant ; c'est pourquoi la constante fait 7 caractères et non 8 comme on pourrait le croire en lisant « whekkees ».

Comparaison (login, idem pour le password) :

```asm
140001364: lea rcx,[rbp-0x11]
140001372: inc rax / cmp BYTE [rcx+rax],0 / jne   ; strlen de la constante -> rax
140001393: cmp r8,rax ; jne fail                   ; r8 = taille de la saisie
1400013a5: call 0x140002c67 (memcmp)               ; thunk -> vcruntime
1400013aa: test eax,eax ; jne fail
```

`cmp r15,0xf / cmova rcx,rsi` choisit le buffer inline ou heap de la `std::string` (SSO ≤ 15).

Pièges : `strings` ne montre pas les secrets (immediates `mov`) ; le `.bin` est un zip ; le login est un `0x73656b` sur 3 octets (pas un dword complet) — piège si on suppose « whekkees ».

## Debug GDB / live

Non utilisé : ni `gdb`, ni `wine`, ni debugger MCP disponibles sur cette machine. Reverse statique + émulation.

## Vérification

`--check` mappe le PE sous unicorn et exécute `0x1400012a0` en hookant `cout <<` (`0x140001630`, capture les messages), `cin >>` (`0x140001850`, injecte la saisie dans la `std::string`), `memcmp` (`0x140002c67`) et l'`endl` de l'IAT :

```text
whekkes:qwerty -> [..., 'Please enter ur password:', 'Nice job bro']
whekkes:wrong  -> [..., 'Please enter ur password:']            (pas de « Nice job »)
petik:qwerty   -> [..., 'Please enter ur login:']               (stop dès le login)
```

Limite : preuve par émulation uniquement (Wine non disponible ici), pas d'exécution du `.exe` réel.

## Notes

- Même auteur que [`my first simple crack me`](../69b18083ddd6176826ae8947/) (login `whekkees` / `qwert`) : ici le login est tronqué (`whekkes`) et le password allongé (`qwerty`).
- Aucun message d'erreur : seul « Nice job bro » indique le succès.
