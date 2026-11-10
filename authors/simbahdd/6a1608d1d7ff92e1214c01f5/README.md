# SimbaHDD's first golang crackme

| | |
|---|---|
| **ID** | [`6a1608d1d7ff92e1214c01f5`](https://crackmes.one/crackme/6a1608d1d7ff92e1214c01f5) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | SimbaHDD (`simbahdd`) |
| **Plateforme** | Windows PE32+ x86-64, **Go 1.26.2** (console) |
| **SHA-256** (`download.bin`) | `a46f4f472b2825a58cf35edd9fe68050eac36eee0fc95c1b3315045517f043d7` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive d'origine (ZIP ZipCrypto, mot de passe `crackmes.one`) contenant `veryeasycrackme.exe` — non modifiée |
| `analysis/extracted/veryeasycrackme.exe` | exe extrait (2 604 032 octets) |
| `tools/simbahdd-golang-solve.py` | solveur + `--check` (émulation unicorn de `main.main` sur le vrai exe) |

## Réponse

**Mot de passe : `simba123`** — pas de notion d'utilisateur (donc pas de `petik` ici : `petik` donne `WRONG!`).

```bash
python3 tools/simbahdd-golang-solve.py          # password = simba123
python3 tools/simbahdd-golang-solve.py -q       # simba123
python3 tools/simbahdd-golang-solve.py --check  # 'simba123': CORRECT! ; 'petik': WRONG!
```

## Premier regard

- `download.bin` est un ZIP (`PK\x03\x04`, flag chiffré) : `unzip -P crackmes.one -d analysis/extracted original/download.bin`.
- `go version -m veryeasycrackme.exe` → `go1.26.2`, `GOOS=windows GOARCH=amd64`, chemin source `C:/Users/Simba/Desktop/Go/ckrackme/main.go`.
- `strings` : la table de symboles Go est restée (non strippé) → `main.main` repérable. Chaînes utiles (littéraux Go, **non** NUL-terminés, collés les uns aux autres dans `rodata`) : `Enter password: `, `CORRECT!`, `WRONG!`.
- Le piège classique Go : `strings` ne montre pas `simba123` isolé, car le mot de passe n'est **pas** une chaîne en mémoire mais une **immediate 64 bits** dans le code.

## Flow

`main.main` (`0x1400b0780`) : `fmt.Fprint("Enter password: ")` → `fmt.Fscanln(os.Stdin, &s)` → si `len(s)==8 && *(u64*)s.ptr == 0x33323161626d6973` → `Fprintln("CORRECT!")`, sinon `Fprintln("WRONG!")` → second `Fscanln` (pause avant de quitter).

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn veryeasycrackme.exe`, symbole `main.main` (seule fonction « utilisateur », ~0x140 octets).

```asm
1400b0807: call fmt.Fscanln            ; saisie dans le *string alloué par newobject (rdx = &s)
1400b080c: mov  rdx,[rsp+0x68]         ; rdx = &s  (s.ptr en [rdx], s.len en [rdx+8])
1400b0811: cmp  QWORD PTR [rdx+0x8],0x8 ; len(s) == 8 ?
1400b0816: jne  WRONG
1400b0818: mov  rdx,[rdx]              ; rdx = s.ptr
1400b081b: movabs r8,0x33323161626d6973
1400b0825: cmp  [rdx],r8               ; les 8 octets d'un coup (le compilateur Go fusionne s == "xxxxxxxx")
1400b0828: jne  WRONG
```

Décodage de l'immediate en little-endian : `0x33323161626d6973` → octets `73 69 6d 62 61 31 32 33` → ASCII `s i m b a 1 2 3` = **`simba123`**. (Longueur 8 ⇒ une seule comparaison qword suffit, d'où l'absence de `strcmp`/`memequal`.)

Les messages : les deux `Fprintln` pointent sur des `string` headers `{ptr,len}` en `.rdata` (`0x1400e49e0` → ptr `0x1400d9179` len 8 = `CORRECT!` ; `0x1400e49f0` → ptr `0x1400d8e62` len 6 = `WRONG!`).

## Vérification

Environnement : **pas de binaire `wine` disponible** sur la machine (seuls des préfixes `.wine*` traînent), donc pas d'exécution native du PE. Preuve faite autrement : `--check` charge l'exe réel (extrait du ZIP d'origine), mappe ses sections dans **unicorn**, exécute `main.main` instruction par instruction en n'interceptant que les `call` vers le runtime/fmt (`Fprint`, `newobject`, `Fscanln`, `Fprintln`), et relève le message qui serait affiché :

```
$ python3 tools/simbahdd-golang-solve.py --check
'simba123': CORRECT! ; 'petik': WRONG!
```

La comparaison (`cmp`/`jne` ci-dessus) est donc bien exécutée depuis le binaire d'origine ; seuls les I/O sont simulés. Pas de GDB ni de debugger live utilisés (reverse statique + émulation).

## Notes

- Ce n'est pas un keygen : un seul mot de passe fixe, aucune dérivation.
- Même mot de passe que le [CRACKME #1 de l'auteur](../6a160c2a2b3df128c1df5cc1/) (`simba123`).
