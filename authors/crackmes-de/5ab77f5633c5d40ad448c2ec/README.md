# crackmes.de's anonimoser_crackme_iii by anonimoser

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2ec`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ec) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows x86 (Delphi, UPX 1.21) |
| **Difficulté** | 1.0 |
| **SHA-256** | `9ee0311a25b399e523f4aa73afa360c52987a1c8d5ba11c991c4c723846f181c` |
| **Type** | keyfile (`clave.txt`) |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ec
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2ec
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Solution

Fichier `clave.txt` à côté de l'exécutable :

```
petik
541
```

Ligne 1 : un nom quelconque ; ligne 2 : la somme décimale des codes ASCII
du nom (`p`+`e`+`t`+`i`+`k` = 112+101+116+105+107 = **541**).
Keygen : [`tools/crackmes-de-anonimoser_crackme_iii-solve.py`](tools/crackmes-de-anonimoser_crackme_iii-solve.py).

## Reconnaissance

Le ZIP contient `AnonimoSer CrackME III.exe` (190 Ko) et `web.exe` (2 Ko,
petit lanceur sans intérêt pour la protection).

- `diec` : Borland Delphi, Turbo Linker 2.25, **UPX 1.21** → `upx -d` suffit.
- Chaînes utiles : `clave.txt`, `NO REGISTRADO`, `Este Crackme no esta registrado!`,
  `Registrado`, `Ok, lo lograste!`, plus quelques faux messages d'erreur
  (« VXD cargado dinamico con error critico »…) pour impressionner.

Il n'y a aucun champ de saisie : c'est un **keyfile**. Sans `clave.txt`, la
fenêtre affiche « NO REGISTRADO » (`analysis/ko-sans-clave.png`).

## Reverse (binaire décompressé, routine à `0x457530`)

1. `FileExists('clave.txt')` (`0x407d84`) ; si absent → affichage
   « NO REGISTRADO » (`0x457330` / `0x45743c`).
2. `AssignFile` / `Reset` puis lecture **octet par octet** jusqu'à EOF :
   - `0x0D` est ignoré ;
   - `0x0A` fait passer l'index de ligne `esi` de 0 à 1 (définitivement) ;
   - tout autre octet est concaténé à `lignes[esi]`
     (`[ebp-0x14]` = ligne 1, `[ebp-0x10]` = ligne 2).
3. Somme des octets de la ligne 1 :

   ```asm
   45763e: mov    ecx,[ebp-0x14]
   457641: movzx  ecx,byte ptr [ecx+edx-1]
   457646: add    [ebp-0xc],ecx      ; somme += ligne1[i]
   ```
4. `IntToStr(somme)` (`0x407bc8`) puis `LStrCmp` (`0x403c90`) avec la
   ligne 2. Égalité → le label passe à `Registrado` et une `MessageBox`
   « Ok, lo lograste! » s'affiche ; sinon retour à « NO REGISTRADO ».

En pseudo-code :

```python
l1, l2 = clave.replace(b"\r", b"").split(b"\n", 1)
ok = str(sum(l1)).encode() == l2.replace(b"\n", b"")
```

Remarque : `0x0A` n'étant jamais ajouté, un saut de ligne final après le nombre
est sans effet ; en revanche d'éventuelles lignes supplémentaires seraient
concaténées à la ligne 2 et feraient échouer la comparaison.

## Vérification

Sous Wine + Xvfb (`tools/wine-xdotool-check.sh`) :

- sans `clave.txt` : fenêtre `NO REGISTRADO` ;
- avec `petik\r\n541` : boîte « Ok, lo lograste! » (`analysis/ok-registrado.png`).

## Status

- [x] reverse
- [x] write-up
- [x] solveur
