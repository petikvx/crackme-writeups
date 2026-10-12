# codz_1 by codz30 (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1e1>
- **Plateforme** : Windows PE32 **VB.NET** (CLR 2.0) — difficulté 1.0
- **Archive** : `original/Codz_#1.zip` → `Password.exe`
- **Statut** : résolu (serial fixe), vérifié (`ilspycmd` → `Form1.Button1_Click`)

## Solution

```
python3 tools/codz1-solve.py          →  11223
python3 tools/codz1-solve.py --check
```

Serial unique (textbox `MaxLength = 5`) : **`11223`**.

`Button1_Click` : `Conversions.ToDouble(TextBox1.Text) == 11223.0` → MsgBox *Congrats You Did It!!* (sinon *Try Again*). Écrit aussi `C:\Real.txt` / `C:\This.txt` (sans effet sur le prédicat).

## Comment on trouve

1. `diec` : VB.NET. `ilspycmd` → `original/Password-src/`.
2. `Form1.cs` : un champ Serial + bouton Check It ; comparaison littérale `11223.0`.

## Vérification

- Présence du prédicat et du message de succès dans `Form1.cs` (`--check`).
