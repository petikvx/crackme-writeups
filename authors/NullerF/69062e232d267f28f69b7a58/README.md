# NullerF's Simple_GUI_crackme

| | |
|---|---|
| **ID** | [`69062e232d267f28f69b7a58`](https://crackmes.one/crackme/69062e232d267f28f69b7a58) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | NullerF |
| **Plateforme** | Windows, .NET Framework (PE32 `gui-crackme.exe`, WinForms, AnyCPU) |
| **SHA-256 (`download.bin`)** | `efb26fe5d1127c79a8f7586187222e8eeadbeed1e05ddfd7f03bac21ba3fbec6` |
| **SHA-256 (`gui-crackme.exe`)** | `9915a03f93949e1eeeb5f198b0ed3d93f7c730490a9a93491ad4a4b63c526756` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`) contenant `gui-crackme.exe` — non modifié |
| `tools/simple-gui-solve.py` | solveur / vérificateur (`-q`, `--check`) |
| `analysis/gui-crackme-src/` | C# décompilé (ilspycmd) |
| `analysis/button1_Click.il` | IL complet de l'assembly |

## Réponse

**Activation key : `sk-189`**

```bash
python3 tools/simple-gui-solve.py        # Activation key : sk-189
python3 tools/simple-gui-solve.py -q     # sk-189
python3 tools/simple-gui-solve.py --check
```

Pas de login : un seul champ (« Activation »). L'exemple `petik` donne `incorret :/` — la clé est constante, pas dérivée d'un nom.

## Premier regard

```bash
python3 -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('/tmp/nf',pwd=b'crackmes.one')"
objdump -x /tmp/nf/gui-crackme.exe | head      # PE32, Subsystem 2 (GUI), import mscoree
strings -n 5 /tmp/nf/gui-crackme.exe           # "v4.0.30319", #Strings, Form1, button1, FormName…
strings -el -n 3 /tmp/nf/gui-crackme.exe       # chaînes UTF-16 (heap #US)
```

- `download.bin` n'est pas un exe mais un **ZIP chiffré** ; l'exe est un assembly **.NET** (`BSJB`, `v4.0.30319`).
- Chaînes UTF-16 (`strings -el`) : `sk-189`, `CORRECT!`, `incorret :/`, `Activation`, `Activate`, `enter the correct activation key`, `Maybe 123?`, `by NullerF`.
- Piège : `Maybe 123?` est un indice/leurre (texte d'un label), **pas** la clé — `123` est refusé.

## Flow

Fenêtre « Crackme » : un `TextBox` (`FormName`), un bouton **Activate**. Au clic, `button1_Click` compare le texte et affiche une `MessageBox` : `CORRECT!` ou `incorret :/`.

## Comment on trouve

Ancrage : décompilation .NET (équivalent de `decompiledotnet`, appelé ici via `ilspycmd -p`, le wrapper `bash -ic` n'étant pas disponible dans cette session) :

```bash
~/.dotnet/tools/ilspycmd -p -o analysis/gui-crackme-src /tmp/nf/gui-crackme.exe
```

`analysis/gui-crackme-src/gui_crackme/Form1.cs` :

```csharp
private void button1_Click(object sender, EventArgs e)
{
    if (((Control)FormName).Text == "sk-189")
        MessageBox.Show("CORRECT!");
    else
        MessageBox.Show("incorret :/");
}
```

Confirmation au niveau IL (`ilspycmd -il`, méthode à RVA `0x206c`, 55 octets) :

```
ldarg.0
ldfld  TextBox gui_crackme.Form1::FormName
callvirt string Control::get_Text()
ldstr  "sk-189"                                   ; token 0x70xxxxxx → heap #US
call   bool String::op_Equality(string,string)    ; comparaison ordinale, sensible à la casse
brfalse.s → MessageBox "incorret :/"
```

Aucune transformation : pas de hash, pas de XOR, la clé est un littéral en clair dans le heap `#US`. Le solveur relit donc directement ce littéral depuis l'exe d'origine (RVA → offset de section, décodage du token `ldstr`, lecture du blob UTF-16LE du `#US`).

## Debug GDB

Non utilisé (reverse 100 % statique, assembly managé).

## Vérification

`python3 tools/simple-gui-solve.py --check` (lit l'IL du binaire d'origine) :

```
'sk-189': CORRECT!
'petik': incorret :/
'123': incorret :/
```

**Limite honnête** : Wine/Mono n'étant pas installés dans l'environnement où ce write-up a été produit, l'exécution live de la GUI n'a pas pu être faite ; la preuve repose sur le C# décompilé + l'IL + la relecture automatique du littéral dans le binaire d'origine. À rejouer sous Windows / Wine+mono : saisir `sk-189` → MessageBox `CORRECT!`.

## Notes

- Aucun patch de `original/`.
- La clé est unique et statique (keygen trivial, pas de mécanisme user→serial).
