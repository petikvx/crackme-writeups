# MicrosoftStorage's ACrack

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/694013390992a052ab222338)
- Auteur : MicrosoftStorage (`t.me/Umno223`) · Plateforme : Windows PE64, console, MinGW-w64 (C)

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`) contenant `acrack.exe` |
| `analysis/acrack.exe` | exe extrait (jamais modifié) |
| `tools/acrack-solve.py` | solveur + `--check` (émulation unicorn de `main`) |

## Réponse

| Champ | Valeur |
|---|---|
| Nickname | `CrackMeOne` |
| Password | `t.me/Umno223` |

Le crackme ne dérive rien d'un nom : les deux valeurs sont constantes (donc pas d'exemple `petik` possible, la contrainte vient du binaire).

```bash
python3 tools/acrack-solve.py          # affiche les deux valeurs (lues dans le binaire)
python3 tools/acrack-solve.py -q
python3 tools/acrack-solve.py --check  # émule main() : cas OK + 2 cas KO
```

## Premier regard

- `download.bin` est un ZIP chiffré (`unzip -P crackmes.one`) → `acrack.exe` (383 745 o), PE64 MinGW avec sections `.debug_*`.
- `strings` : `Mini crackme by @microsoftstorage writed on C!`, `Nickname: `, `CrackMeOne`, `Password: `, `t.me/Umno223`, `Bad password, try again`, `bad nickname! try again`, `True!`, `%s[^\n]`.
- Ici les chaînes sont en clair, et le `%s[^\n]` du `scanf` (format `%s` collé à `[^\n]`) est trompeur : le format réel est `%s` seulement, la suite appartient à la chaîne suivante.

## Flow

`main` (`0x1400014f8`) : banner → `Nickname:` → `scanf` → `strcmp(nick, "CrackMeOne")` → si égal `True!` puis `Password:` → `scanf` → `strcmp(pass, "t.me/Umno223")` → `True!` sinon `Bad password…` ; nickname faux → `bad nickname!`.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/acrack.exe`, symbole `main` (le binaire n'est pas strippé).

```asm
140001534: call scanf                    ; scanf("%s", [rbp-8])   (fmt 0x14001103b)
140001539: mov  rax,[rbp-0x8]
14000153d: lea  rdx,[rip+0xfafe]         ; 0x140011042 -> "CrackMeOne"
140001544: mov  rcx,rax
140001547: call strcmp
14000154c: test eax,eax
14000154e: jne  1400015bd                ; != 0 -> "bad nickname!"
...
140001588: lea  rdx,[rip+0xfad0]         ; 0x14001105f -> "t.me/Umno223"
14000158f: mov  rcx,rax
140001592: call strcmp
140001597: test eax,eax
140001599: jne  1400015ac                ; != 0 -> "Bad password"
```

Les deux constantes se lisent dans `.rdata` (VA `0x140011000`, offset fichier `0xea00`) :
`objdump -s -j .rdata acrack.exe` → `…43 72 61 63 6b 4d 65 4f 6e 65 00` (`CrackMeOne`) puis `74 2e 6d 65 2f 55 6d 6e 6f 32 32 33 00` (`t.me/Umno223`).
Le solveur relit ces deux chaînes aux VA `0x140011042` / `0x14001105f` plutôt que de les recopier.

Pièges : aucun anti-debug ; le password est le lien Telegram de l'auteur, et le nickname n'a pas besoin d'être celui de l'utilisateur.

## Vérification

`wine` n'est **pas** installé sur la machine de résolution (`xvfb-run -a wine` impossible) ni `gdb` : preuve faite par émulation **unicorn** de `main` sur l'image PE réelle (sections mappées, `printf`/`scanf`/`strcmp`/`__main` interceptés, `strcmp` comparant les vrais octets). Résultats de `--check` :

```text
OK            : Nickname: True!  Password: True!
KO password   : Nickname: True!  Password: Bad password, try again
KO nickname   : Nickname: bad nickname! try again
```

Pas de screenshot live ; à rejouer sous Wine : `printf 'CrackMeOne\nt.me/Umno223\n' | xvfb-run -a wine analysis/acrack.exe` (non exécuté ici).

## Notes

- Pas de section GDB / x64dbg : reverse 100 % statique + émulation.
- Crackme trivial (strcmp en dur) ; la preuve est l'émulation, pas un run natif.
