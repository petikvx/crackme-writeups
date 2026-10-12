# korbut_keygen_me_1 by korbut (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5433c5d40ad448c1b8>
- **Plateforme** : Windows PE32 GUI, MASM32 (groupe RIF 2k3) — difficulté 1.0
- **Archive** : `original/sn1_skor.zip` (mot de passe `crackmes.one`) → `skor SN.exe`
- **Statut** : résolu (keygen), vérifié **en live sous wine**

## Solution

Le serial dépend du **nom** et du **nom d'ordinateur** (`GetComputerNameA`), formaté `.(%lu).`.

```
python3 tools/korbut-keygen-me-1-solve.py petik PETIK-PC          ->  .(1885434985).
python3 tools/korbut-keygen-me-1-solve.py petik GROK-BOT-VM-411   ->  .(1717687401).   (testé sous wine)
```

## Comment on trouve

1. `diec` : MASM32, pas de packer. `strings` : `NAME ?`, `SERIAL ?`, `GOOD S/N`, et l'import `GetComputerNameA` (suspect pour un keygenme).
2. Dans `objdump -d`, la routine du bouton (`0x401000`) commence par `GetComputerNameA(0x40314e, &size)` puis `GetDlgItemTextA(id 0x7d0)` pour le nom (→ `0x4030b8`, longueur dans `eax`).
3. Boucle `0x40103d` (extrait dans `analysis/check.asm.txt`), exécutée `len` fois avec `eax` qui part de `len` :
   ```
   ebx = dword [nom]                 ; 4 premiers octets du nom, rechargés à chaque tour
   ebx += movsx(comp[eax])           ; eax = len + i
   ebx = ror(ebx, 5) ^ 0x20
   esi = ror(bswap(ebx), 0xeb)       ; 0xeb mod 32 = 11
   ```
   Comme `ebx` est rechargé à chaque tour, seul le **dernier** tour compte : caractère `comp[2*len-1]` (0 au-delà du nom de machine, le buffer de 32 octets en `.data` est à zéro).
4. La chaîne de format est construite octet par octet en `0x403180` (`0x2e, -6, -3, +0x47, +9, -0x4c, +5`) → `".(%lu)."`, puis `wsprintfA(0x4030ea, fmt, esi)`.
5. Le serial saisi (id `0x7d1`) est comparé par `lstrcmpA` → `GOOD S/N` / `BAD S/N!`.

## Vérification

Sous `xvfb-run` + wine (ComputerName `GROK-BOT-VM-411`), saisie au clavier via `xdotool` : `petik` / `.(1717687401).` → boîte **GOOD S/N** ; contre-test `.(123).` → **BAD S/N!**.
