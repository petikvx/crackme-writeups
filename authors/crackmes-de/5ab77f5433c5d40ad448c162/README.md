# nts_crackme10 — cyclops (crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c162)
- **Plateforme** : Windows, PE32 GUI (MSVC 6 / MFC 4.2), x86
- **Difficulté** : 2.0
- **But** (Readme10.txt) : écrire un keygen, comprendre les anti-debug.

## Solution

Le serial vaut `sprintf("%08X", h(nom))` ; nom et serial doivent faire **plus de 5 caractères** (donc `petik` seul est refusé) :

| Nom | Serial |
|---|---|
| `petik!` | `85CDB0E3` |
| `crackmesone` | `AF9C6021` |

```bash
python3 tools/nts-crackme10-solve.py petik!
```

## Comment on trouve

1. `strings` : `Serial is Correct!!!` à `0x4030a0`, format `%08X` à `0x403098`, `IsDebuggerPresent`.
2. Le gestionnaire du bouton (`0x401480`) lit les champs `0x3e8` (nom) et `0x3e9` (serial) via `GetDlgItemText`, exige `len > 5` pour les deux, puis appelle `check(nom, serial, key)` en `0x4013d0`.
3. **Anti-debug** : `key` démarre à 0 ; `+0x1234` si `PEB.NtGlobalFlag == 0x70` (lancé sous debugger), `+0x3025` si deux `rdtsc` successifs sont espacés de plus de `0xfff` cycles (pas à pas). Sans debugger, `key = 0` : c’est cette valeur que le keygen utilise.
4. Hash (`i` = index, `c` = octet signé) :

```text
h = 0
pour chaque c :
    t = ((c ^ 0xC0C0C0C0) - key + h) * i * 2
    h = t ^ (c*5)
    h <<= (c & 31)
    h ^= 0xBADDC001
serial attendu = "%08X" % h      (comparaison strcmp, majuscules)
```

## Vérification

GUI MFC non pilotée : vérif par **émulation Unicorn de la vraie routine** `0x4013d0` du binaire (sprintf stubé) — `tools/nts-crackme10-emu.py` renvoie 1 pour les serials du keygen et 0 pour un serial faux.
