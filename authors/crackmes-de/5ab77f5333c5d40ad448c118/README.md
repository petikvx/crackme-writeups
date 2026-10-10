# crackme_1_easy_timers — anarchy2k3 (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c118
- Plateforme : Windows PE32 GUI (Borland Delphi 2009), difficulté 2.0
- Statut : **résolu** (preuve statique : handlers Delphi désassemblés + DFM ; GUI non piloté)

## Résultat

```
Name   : Thom Collins
Serial : 5694-5378
```

Le couple est **fixe** (pas de keygen, donc pas d'exemple `petik`). Mais il ne suffit pas : il faut
cliquer **Check**, puis **.:Clear:** dans les **2 secondes**, avant que `Timer1` ne se déclenche.
Le timer affiche alors « It's Okey ! Good Job ;-) ».

```
python3 tools/easy-timers-solve.py CrackMe1Anarchy.exe
name   = Thom Collins
serial = 5694-5378
```

## Comment on trouve

### 1. Repérer les handlers

`strings -el` donne « It's Okey ! Good Job ;-) » et « No, no, no... », et `strings` montre `Timer1Timer`,
`Timer2Timer`, `Button1Click`... La table des méthodes publiées Delphi (`taille:u16, adresse:u32, nom:shortstring`)
juste avant chaque nom donne les adresses :

| Méthode | Adresse |
|---|---|
| Button1Click (Check) | `0x46ea30` |
| Button2Click (.:Clear:) | `0x46ecd8` |
| Timer1Timer | `0x46edec` |
| Timer2Timer | `0x46ee00` |

Le DFM (`TPF0`) indique pour les deux timers `Enabled = False`, `Interval = 2000`.

### 2. Button1Click (`analysis/handlers.asm`)

- `Edit1.Text == "Thom Collins"` (UnicodeString à `0x46eb34`) et `Edit2.Text == "5694-5378"` (`0x46eb5c`),
  et le flag global `[0x4781d0] != "oui"` → `call 0x46eb84` : `flag := "oui"` ; `Timer1.Enabled := True`.
- Sinon (nom ou serial faux) → `Timer2.Enabled := True` ; `Timer2Timer` se coupe et affiche « No, no, no... ».

### 3. Timer1Timer → `0x46ebbc`

Le timer se coupe, met `flag := "non"`, puis relit les champs :

```
if Edit1.Text <> '' then ShowMessage('No, no, no...')
else if Edit2.Text <> '' then ShowMessage('No, no, no...')
else ShowMessage('It''s Okey ! Good Job ;-)')
```

Donc le bon message n'apparaît que si les deux champs sont **vides** au moment où le timer tombe : c'est le rôle de
`Button2Click`, qui fait `Edit1.Text := ''` et `Edit2.Text := ''`. D'où la séquence : bon couple → Check → Clear en < 2 s.

## Vérification

GUI Delphi non piloté dans ce passage autonome : la vérification est **statique** (comparaisons et branche de succès
lues dans le désassemblage, intervalle lu dans le DFM, chaînes extraites par le solveur depuis le binaire).
