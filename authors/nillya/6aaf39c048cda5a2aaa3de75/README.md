# Nillya's Pass CrackMe

| | |
|---|---|
| **ID** | [`6aaf39c048cda5a2aaa3de75`](https://crackmes.one/crackme/6aaf39c048cda5a2aaa3de75) |
| **Auteur (site)** | [Nillya](https://crackmes.one/user/Nillya) |
| **Auteur (local)** | nillya |
| **Plateforme** | Windows PE32 Prefer32Bit · .NET Framework 4.7.2 WinForms |
| **Protecteur** | **ArmDot** (JIT typé + VM + strings AES + section PE AES-GCM) |
| **SHA-256** | `b14dda928150e7f16145dd56f3c99cf3db6283d2afc4a6b4214cda2f34ba5a82` |
| **Statut** | **pending** — password pas encore trouvé |

## Origine

- Page : https://crackmes.one/crackme/6aaf39c048cda5a2aaa3de75
- ZIP password : `crackmes.one`
- Description site : C# / JIT Compiler|Framework — obtenir le password

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/crackme.exe
original/crackme-src/_---------/----.cs          # parts de clé VM (entrée du solveur)
original/crackme-src/_---------/----_-----.cs    # table de strings ArmDot (entrée du solveur)
analysis/vm-programs/*.bin      # 20 programmes VM AES-GCM déchiffrés
analysis/screenshot-ui.png
analysis/screenshot-wrong.png   # MessageBox « Wrong! »
analysis/notes.md
tools/nillya-pass-solve.py      # --dump-strings / --dump-vm
```

## Réponse

**Pas encore.** Fausse piste : `U_AZ` (immediates ASCII du programme VM `1945528862`) → MessageBox **Wrong!** en live.

```bash
python3 tools/nillya-pass-solve.py --dump-strings
python3 tools/nillya-pass-solve.py --dump-vm
```

## UI

TextBox **Password** + bouton **Check** → MessageBox titre `crackme` :
- échec : **`Wrong!`**
- succès : (attendu **`Correct!`**, non capturé)

## Avancée reverse

1. **Protecteur ArmDot** confirmé (pas Confuser / Reactor).
2. Table de strings AES-128-CBC + HMAC : 227 messages runtime uniquement (`VmAesGcmDecryptor`, …) — **pas** le password.
3. Section PE custom **`~-=&`** : schéma parsé, **20** programmes VM AES-256-GCM déchiffrés sous `analysis/vm-programs/`.
4. Form / click = wrappers vers `IntPtr` Module → logique password **dans la VM**.
5. Fish DeObfuscator (`-p armdot`) : peu d’effet sur la virtualisation (4 méthodes).
6. `U_AZ` invalidé en live.

## Suite possible

- Interpréter le bytecode typed-VM (magic `c6178a78`, …) jusqu’au prédicat compare.
- Dump dynamique sous Wine / x32dbg au moment du `MessageBox` (string + buffer password).
- Ne pas retraiter les immediates ASCII de `1945528862` comme un password littéral.
