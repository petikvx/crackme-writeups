# Coder_90's CrackMe4

| | |
|---|---|
| **ID** | [`6969e9e3e3ae2054ed59d494`](https://crackmes.one/crackme/6969e9e3e3ae2054ed59d494) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Coder_90 |
| **Plateforme** | Windows PE32, GUI VCL (Borland C++ Builder) |
| **SHA-256** | `ba5716bbcc8e35e287068d2da62b54abbb9fe5c8c35723d6e6ca8f230a105278` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/CrackMe4.exe` | binaire d'origine (non modifié) |
| `tools/crackme4-solve.py` | keygen name → serial |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine (cas OK / KO) |

## Réponse

| Name | Serial |
|---|---|
| `petik` | **`0359A047-FFE0CE68`** |

```bash
python3 tools/crackme4-solve.py --name petik     # petik -> 0359A047-FFE0CE68
python3 tools/crackme4-solve.py -q --name petik  # serial seul
```

## Premier regard

- `file` : PE32 GUI i386 ; `diec` : Borland C++ Builder, Turbo Linker. Pas de packer, `.text` de 2,9 Mo (RTL VCL).
- `strings` n'apporte presque rien (RTL). Les messages sont en UTF-16 : `Please enter both a Name and a Serial.`, `Correct! Well done.`, `Wrong Serial. Try again.`
- UI (ressource `RCDATA/TFORM1`, lue avec `pefile`) : deux `TEdit` (Name = `Edit1`, Serial = `Edit2`) et un bouton `Button1` (`OnClick = Button1Click`).

## Flow

`Button1Click` : lit Name et Serial → si l'un est vide, message d'erreur → calcule le serial attendu depuis le name → compare (`UnicodeString` equal) → « Correct! » ou « Wrong Serial » (sinon petite animation de la fenêtre).

## Comment on trouve

**Ancrage.** Pas d'IDA ici : la table des méthodes publiées du `TForm1` contient l'entrée `Button1Click`. En cherchant `\x0cButton1Click` dans le fichier (offset 0x2dc4cc), le dword juste avant donne l'adresse du handler : **`0x402fcc`**. Puis `objdump -d -M intel --start-address=0x402fcc`.

**Handler (0x402fcc), version courte :**

```asm
40308c push 0x55aa55aa      ; seed constante
403091 mov  ecx,[ebp-4]     ; name (Edit1)
403095 call 0x402c64        ; h(name, 0x55aa55aa)
40309d mov  esi,eax
40309f push esi             ; seed = résultat précédent
4030a3 push [ebp-4]
4030a4 call 0x402c64        ; h(name, esi)
4030ac mov  edi,eax
4030c8 call 0x50eb70        ; IntToHex(edi,8)  -> [ebp-1c]
4030e5 call 0x50eb70        ; IntToHex(esi,8)  -> [ebp-10]
4030fa mov  edx,0x6dd27c    ; "-"
40310f call 0x6db50c        ; concat : [18] = hex(esi) + "-"
403127 call 0x6db50c        ; concat : [c]  = [18] + hex(edi)
403178 call 0x6db590        ; compare([ebp-8]=serial saisi, [ebp-c])
```

Le sens de la concaténation vient des registres au 2ᵉ appel (`eax=&[18]`, `edx=&[1c]`, `ecx=&[c]` = résultat). **Piège** : ma première lecture donnait `HEX(edi)-HEX(esi)` ; Wine a répondu « Wrong Serial », l'ordre réel est `HEX(esi)-HEX(edi)`. IntToHex 8 chiffres, majuscules.

**Fonction de hash (0x402c64)** : écrite en machine à états (`switch` aplati, cf. `cmp ecx,3 / jg …`). Les états donnent :

```text
init : b = 0x97829737
pour chaque octet c du name :
    b ^= c
    b *= 0x5bd1e995          (imul, mod 2^32)
    b  = rol(b, 5)           (shl 5 | shr 27)
    b ^= seed                (arg 2)
retour b
```

**Assemblage de la réponse pour `petik`** : `esi = h("petik", 0x55AA55AA) = 0x0359A047`, `edi = h("petik", esi) = 0xFFE0CE68` → `0359A047-FFE0CE68`.

## Vérification

Wine sous `Xvfb` + `xfwm4` (sans WM les touches n'arrivent pas dans les `TEdit`), saisie par `xdotool` :

- `petik` / `0359A047-FFE0CE68` → « Correct! Well done. » ([`screenshot-ok.png`](analysis/screenshot-ok.png))
- `petik` / `0359A047-FFE0CE69` → « Wrong Serial. Try again. » ([`screenshot-ko.png`](analysis/screenshot-ko.png))
- 1ʳᵉ tentative `FFE0CE68-0359A047` → Wrong (ordre inversé, voir piège).

## Notes

- Le name est traité octet par octet (AnsiString) ; le solveur encode en latin-1 (ASCII identique).
- Ni GDB ni debugger live : reverse 100 % statique + preuve Wine.
