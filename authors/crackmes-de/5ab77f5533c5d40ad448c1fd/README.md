# enforcer039s_keygenme_1__arteam_cra by enforcer (crackmes.de)

« KeyGenMe #1 By Enforcer/ARTeam » (2004).

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1fd>
- **Plateforme** : Windows **PE32** GUI, **MASM32** (site : Unspecified/other) — difficulté 2.0
- **Archive** : `original/keygenme_1.zip` → `keygenme #1.exe` (3,5 Ko)
- **SHA-256 zip** : `d7be68a33574de69419ce9b1bc5ab6302b2e82788e940141c5a6394cb753d23d`
- **Statut** : résolu (keygen), vérifié **sous wine** (MessageBox « Well done! Now make a keygen »)

## Solution

```
edx = 0
pour i, c dans nom :  edx = rol32(edx + c, i)
serial = "%X" % edx
```

```
python3 tools/enforcer-keygenme-1-solve.py petik --decoy
47730
leurre: 26D
```

| Nom | Serial |
|---|---|
| `petik` | **`47730`** |
| `Enforcer` | `5C18D90F` |

## Comment on trouve

Code minuscule (0x342 octets) : `objdump -d -M intel` suffit.

1. **Anti-debug** au démarrage (`0x40100c`) : `IsDebuggerPresent` → si 1, flag `ds:0x403084 = 1`.
2. Les edits nom (`0xbb8`) / serial (`0xbb9`) sont recopiés à chaque `EN_CHANGE` (`0x300`) dans
   `0x403088` / `0x4030ac`. Bouton `0xbba` → `0x401199`.
3. `0x401199` : si nom ou serial vide → « Enter a name and serial! ». Sinon :
   - flag debug = 1 → **leurre** `0x4012ba` : `eax = Σ(c + 0x10)`, `wsprintfA("%X")` ;
   - sinon `0x40123c`.
   Puis `lstrcmpA(serial, 0x4030d0)`.
4. `0x40123c` : **CRC32** (table construite en `0x40103c`, poly `0xEDB88320`, rangée en `0x403102`) du code
   `0x401199..0x4012ee` (`0x155` octets) comparé à `ds:0x403079 = 0x98DD61F6`. Un `int3` (breakpoint logiciel)
   dans cette zone casse le CRC → retour au leurre.
5. Boucle `0x40126a` : deux accumulateurs, `eax` (du bruit : `or/inc/not/add al,[0x4030d4]`) et
   `edx += c ; rol edx, cl` (`cl` = index). Second CRC32 du code : s’il est bon, c’est **`push edx`** qui part dans
   `wsprintfA("%X")` ; `eax` n’est utilisé que si le code a été patché. Le bruit sur `eax` sert juste à noyer `edx`.

## Vérification

```
tools/verify-wine.sh petik 47730      # MSGBOX_OnInit L"Well done! Now make a keygen"
tools/verify-wine.sh petik 26D        # MSGBOX_OnInit L"OOPS! Wrong serial."  (le leurre ne marche pas sans débogueur)
tools/verify-wine.sh Enforcer 5C18D90F  # Well done!
```

Binaire original (non patché) sous wine/Xvfb ; xdotool tape nom et serial puis clique *Register* ; le texte de la
MessageBox est lu via `WINEDEBUG=+msgbox`.
