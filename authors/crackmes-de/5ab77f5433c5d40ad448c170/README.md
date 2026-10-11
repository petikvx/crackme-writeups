# TinyAsm — promix17 (crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c170)
- **Plateforme** : Windows, PE32 GUI écrit en MASM, x86
- **Difficulté** : 1.0
- **But** (Readme.txt) : trouver le bon mot de passe.

## Solution

Mot de passe : **`Nrsisj{`** (fixe, 7 caractères ; pas de nom, donc rien à calculer pour `petik`).

```bash
python3 tools/tinyasm-solve.py      # -> Nrsisj{
```

## Comment on trouve

1. Pas de chaînes de message en clair : `.data` contient des blocs chiffrés. Le WndProc (`0x401126`), sur `WM_COMMAND` du bouton id 2 (« Check »), déchiffre deux chaînes de 10 octets par XOR avec l'octet `0x2F` (`0x403034`) : `0x40300d` devient `@Wrong_Code` et `0x403018` `Yes_Succes`.
2. Petit anti-patch : une somme de contrôle (xor/shl, graine `0x5daafcf2`) sur le code `0x40127e..0x40134a` doit égaler le dword `0x403009`, sinon « Wrong ». Sur le binaire intact elle passe.
3. `GetDlgItemTextA` lit 8 octets dans `0x40302c` ; les 7 premiers doivent être non nuls, puis pour `i = 0..6` :
   ```text
   (saisie[i] ^ 0x1A) == ((enc[i] + 1) ^ 0x2F)      enc = "zFE[E^M" à 0x403023
   ```
   (`0x1A` est l'octet `0x403035`). On inverse : `saisie[i] = ((enc[i]+1) ^ 0x2F) ^ 0x1A` → `Nrsisj{`.

Désassemblage : `analysis/wndproc_check.asm`.

## Vérification

GUI non pilotée : vérif par **émulation Unicorn du vrai code de vérification** du binaire (`0x4012c6`, comparaison + choix du message) avec `tools/tinyasm-emu.py` : `Nrsisj{` arrive sur la branche `Yes_Succes` (`0x401330`), `petik12` sur `Wrong_Code`.
