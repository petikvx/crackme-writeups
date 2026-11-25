# Coder_90's Crack It!

| | |
|---|---|
| **ID** | [`697e6957e04ca145cd9d13b4`](https://crackmes.one/crackme/697e6957e04ca145cd9d13b4) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Coder_90 (`coder_90`) |
| **Plateforme** | Windows PE32 GUI, Borland C++ Builder (VCL), 3,7 Mo |
| **SHA-256** | `15a5eeb8eca7bb8cbe60a721bb259905445c434b20c1b90ff9bf16514aad4dfe` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Crack_It.exe` | binaire d'origine (non modifié) |
| `tools/crack-it-solve.py` | solveur (RSA : factorisation connue → déchiffrement) |
| `analysis/screenshot-typed.png` | mot de passe saisi |
| `analysis/screenshot-ok.png` | « ACCESS GRANTED » |
| `analysis/screenshot-ko.png` | « ACCESS DENIED » (mauvais mot de passe) |

## Réponse

**Mot de passe : `C0d3r_9O_Crack!T`** (16 caractères, le « 9O » est un neuf puis la lettre O majuscule)

```bash
python3 tools/crack-it-solve.py          # password = C0d3r_9O_Crack!T
python3 tools/crack-it-solve.py -q       # juste le mot de passe
python3 tools/crack-it-solve.py --check  # vérifie m^e mod n == c
```

Pas de champ user : un seul champ « Enter Password ».

## Premier regard

```bash
file original/Crack_It.exe      # PE32 GUI, i386
diec original/Crack_It.exe      # Borland C++ Builder, Turbo Linker
```

- Une seule fiche VCL `TForm1` (ressource RCDATA, lisible avec `pefile`) : `Label1` « Enter Password », `EditPassword` (`TEdit`), `BtnCheck` « Crack It » avec `OnClick = BtnCheckClick`.
- Dans `.data` (VA `0x6ea284`…) trois chaînes décimales ASCII qui se suivent :
  - `2630492240428669223384232383096338562137`
  - `65537`
  - `1601640017009476007754247816372425531056`
- Classes `BigInt` et `std::vector<int>` dans les RTTI : un bignum maison, limbes de 32 bits. `65537` = exposant RSA classique : on pense tout de suite à `m^e mod n == c`.
- Messages : `ACCESS GRANTED` / `ACCESS DENIED.\n\nThe password is incorrect.` (titre `Invalid Key`).

## Flow

1. `BtnCheckClick` (VA **`0x409398`**, trouvée via la table de méthodes publiée : `\rBtnCheckClick` en `.data` offset `0x2ea933`, précédée du pointeur `0x00409398`).
2. Texte vide → « Please enter a password. ».
3. Construction de 4 `BigInt` à partir de chaînes (`0x40609c` pour les chaînes décimales de `.data`, `0x402c4c` pour le texte saisi).
4. `0x40b398(res, pw, e, n)` : exponentiation modulaire (initialise des chaînes `"1"` et `"0"` en `0x6ea41b`…).
5. `0x40f9f4(res, c)` : comparaison limbe à limbe (taille égale puis boucle `cmp esi,[edx]`) → `al=1` : succès.

## Comment on trouve

**Ancrage** : table des méthodes → handler `0x409398`. Le code est très bruyant (tout `std::string` est inliné par le compilateur, des dizaines de `cmp [esp+0x24],0x10` pour le SSO), mais les appels significatifs se repèrent bien :

```asm
40a9c0  mov  edx,[ebp-4]          ; texte saisi
40a9cb  call 0x402c4c             ; BigInt pw(texte)          -> [ebp-0x84]
40a9f8  call 0x408280             ; copie par valeur de n [ebp-0x24]
40aa21  call 0x408280             ;                      e [ebp-0x44]
40aa44  call 0x408280             ;                      pw[ebp-0x84]
40aa6f  call 0x40b398             ; res = modpow(pw, e, n)     -> [ebp-0xa4]
40aa8b  lea  eax,[ebp-0xa4]
40aa92  call 0x40f9f4             ; res == c ([ebp-0x64]) ?
40aa9a  test al,al
40aa9c  je   0x40b10a            ; -> "ACCESS DENIED"
```

L'ordre des `push` (le dernier copié = 1er argument) donne `modpow(pw, e, n)` ; `[ebp-0x64]` (construit en `0x40a99f` depuis la 3ᵉ chaîne `0x6ea2b3`) est la cible `c`.

**Prédicat** : `pw^65537 mod n == c`, avec `n` sur 131 bits.

**Casser le RSA** : `n` est minuscule.

```bash
factor 2630492240428669223384232383096338562137
# 98317 5628631 189985006751 25019942076868181
```

Quatre premiers distincts → `phi = Π(p-1)`, `d = e⁻¹ mod phi`, `m = c^d mod n = 89309538283792098316791637877157732692`.

**Piège (première tentative ratée)** : j'ai d'abord supposé que `0x402c4c` parsait le texte comme un **nombre décimal** et saisi `89309538283792098316791637877157732692` → `ACCESS DENIED` sous Wine. Le constructeur lit en fait les **octets du texte comme un entier big-endian**. Il suffit de décoder `m` :

```python
m.to_bytes(16, 'big')  # b'C0d3r_9O_Crack!T'
```

Résultat ASCII lisible, ce qui confirme au passage la lecture big-endian (16 octets = 128 bits < 131 bits de `n`, donc la solution est unique et ≤ n).

## Vérification

Preuve live (Wine 10 sous Xvfb, saisie et clic pilotés avec `xdotool`, captures `PIL.ImageGrab`) :

```bash
export WINEPREFIX=$HOME/wp-crackit
xvfb-run -a -s "-screen 0 800x600x24" wine original/Crack_It.exe
# champ : C0d3r_9O_Crack!T  puis bouton « Crack It »
```

| Cas | Résultat |
|---|---|
| `C0d3r_9O_Crack!T` | [`ACCESS GRANTED`](analysis/screenshot-ok.png) (fenêtre verte, « Closing in 5… ») |
| `wrongpassword123` | [`ACCESS DENIED`](analysis/screenshot-ko.png), boîte « Invalid Key » |
| `89309538283792098316791637877157732692` (m en décimal) | `ACCESS DENIED` : le texte n'est pas lu comme un décimal |

Le solveur `--check` confirme aussi `pow(int.from_bytes(pw,'big'), 65537, n) == c`.

## Notes

- Pas de GDB ni de x64dbg : analyse 100 % statique (`objdump`, capstone, `pefile`) + preuve Wine ; pas d'IDA disponible sur cette machine.
- Le crackme n'a pas de protection anti-debug effective ; les `IsDebuggerPresent` croisés sont ceux de la RTL Borland.
- Ce n'est ni un hash, ni un keygen par utilisateur : le mot de passe est unique.
