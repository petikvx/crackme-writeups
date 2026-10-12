# rif_crackme_2 by korbut (crackmes.de / Dr. rED mEAT)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c1b4
- Plateforme : Windows PE32, MASM 6.14 — difficulté 2.0 — publié 2018-03-25
- Statut : **résolu** (keygen vérifié en live sous wine)

## Solution

| Nom | Serial |
|---|---|
| `petik` | `0XcXy` |

```
python3 tools/korbut_rif2-solve.py petik
petik -> 0XcXy
```

Message de réussite : le champ serial est remplacé par `- CONGRATULATIONS OLD RASCAL -`.

## Comment on trouve

1. `diec` : PE32 MASM, pas de packer. Le `rif.nfo` dit « You have to code a keygen ! No patching ».
2. La WndProc (`0x401375`) route `WM_COMMAND` id `0x3E8` (bouton *Check !*) vers `0x40148D`.
3. `0x40148D` lit deux champs via `GetDlgItemTextA` : `0x7D0` (nom, haut) et `0x7D1` (serial, bas), chacun **≥ 5 caractères**.
4. Il calcule (octets signés, `movsx`) :
   - `t1 = sx(N[0] ^ 0x3C ^ 0x09)`
   - `t2 = sx((S[0] ^ 0x09) ^ low8(t1))`
   - `t3 = sx(N[2] + S[2]) + sx(S[2])`
   - `t4 = sx(S[4]) + sx(N[4])`
   - succès si `(t1+t2+t3+t4) ^ 0x90 == 0x14F`, soit somme = `0x1DF` (479).
5. Seuls `S[0]`, `S[2]`, `S[4]` comptent : `S[1]`, `S[3]` sont libres (on met `X`). Le keygen brute-force les trois octets imprimables (`0x30..0x7A`).

Désassemblage de la routine : `analysis/check.asm.txt`.

## Vérification

`xvfb-run` + `wine crackme2.exe`, saisie via `xdotool` (`petik` / `0XcXy`), clic sur *Check !* : le serial devient « CONGRATULATIONS OLD RASCAL » (capture `analysis/wine-petik-ok.png`). Contre-test `1XcXy` : rien ne change.
