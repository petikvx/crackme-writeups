# keygenme_2 by korbut (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c1b6
- Plateforme : Windows PE32, MASM 6.14 — difficulté 1.0 — publié 2018-03-25
- Statut : **résolu** (keygen vérifié par **émulation Unicorn** de la vraie routine ; pas en live, voir plus bas)

## Solution

| Nom | Serial |
|---|---|
| `petik` | `525` |

```
python3 tools/korbut_keygenme2-solve.py petik
petik -> 525
```

## Comment on trouve

1. `diec` : PE32 MASM, pas de packer. Les chaînes (en français) : `U DID IT !`, `TRY AGAIN !`, `JOKER ?`, et un faux message « MSVB50.dll manquante… c'est juste SoftIce qui est détecté ».
2. Tout au début (`0x401000`) : `mov ah,0x43 ; int 0x68 ; cmp ax,0xF386` — détection SoftIce classique (Win9x). Si détecté → message « SoftIce » et sortie.
3. La DialogProc route `WM_COMMAND` id `0x6FD` vers `0x40107F` :
   - `GetDlgItemInt(0xC9, NULL, FALSE)` → serial **numérique** (poussé sur la pile) ;
   - `GetDlgItemTextA(0xC8)` → nom ; nom vide → `JOKER ?`.
4. Boucle `0x4010B6` sur chaque caractère du nom :
   ```
   ebx += movsx(c)
   bl  += 0x30        ; octet bas seulement, sans retenue vers bh
   esi  = ebx
   ```
   (la lecture de la table `0x40321D` et le `shr edx,cl` sont du bruit : résultats écrasés.)
5. `pop ecx ; cmp ecx,esi` → serial décimal = valeur finale de `ebx`.

Désassemblage : `analysis/check.asm.txt`.

## Vérification

Sous wine (xvfb), aucune fenêtre ne s'affiche (l'`int 0x68` anti-SoftIce du point d'entrée tue le process). On a donc émulé avec Unicorn **le vrai code** `0x4010AE..0x4010DF` mappé depuis le PE (`tools/korbut_keygenme2-emu.py`) : `petik/525`, `crackmes/969`, `Asma/322` → `ecx == esi` ; serial+1 → échec.
