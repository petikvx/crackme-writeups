# spear by cyclops (crackmes.de)

| | |
|---|---|
| Page | [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c15f) |
| Plateforme | Windows 32 bits, GUI MFC (MSVC 6.0, MFC lié statiquement) |
| Difficulté | 1.0 |
| Objectif | keygen (« Do not patch the Good Jump ») |

## Solution

Les 5 champs sont les 5 **parts d'un partage de secret de Shamir modulo 251**, aux abscisses
x = 1..5. Chaque champ contient 7 valeurs hexadécimales (une par caractère) séparées par un
caractère quelconque. L'interpolation de Lagrange en x = 0 de chaque colonne doit redonner
`CyClOpS`.

Keygen : pour chaque caractère c, tirer un polynôme P de degré 4 avec P(0) = c, puis mettre
P(k) dans le champ k. Exemple (graine `petik`, `tools/crackmes-de-spear-solve.py petik`) :

```
a-40-c3-66-a0-cb-13
4c-e1-75-4a-b7-f0-3e
89-1d-6b-3-ca-8e-99
f6-53-35-89-66-9b-10
87-a8-d2-f0-65-63-a2
```

(Il y a 251⁴ solutions par caractère : chaque graine donne un jeu de serials différent.)

## Comment on trouve

1. `strings` : `CyClOpS`, `%c`, `%x%c%x%c…%x` (7 `%x`), `IsDebuggerPresent`,
   `The serialz are correct!!!`. L'unique référence au message de succès est dans `0x401610`.
2. `0x401610` :
   - `LoadLibraryA("kernel32.dll")` + `GetProcAddress("IsDebuggerPresent")` : si débogueur → sortie ;
   - 5 `GetDlgItemText` (ids `0x3E8`..`0x3EC`, 20 car. max) ; chacun doit être non vide
     (comparé à une chaîne globale vide), sinon « Please input the serials!!! » ;
   - 5 `sscanf(champ, "%x%c%x%c%x%c%x%c%x%c%x%c%x", …)` dans 5 tableaux de 7 entiers
     pré-remplis à `0xFF` ; toutes les valeurs doivent être `< 0xFB` (= 251) ;
   - `rdtsc` / `rdtsc` : si l'écart dépasse `0xFFF` cycles (pas-à-pas), un drapeau global prend
     `0x1BADB002` et le calcul part sur une branche bidon ;
   - initialisation `x[] = {1,2,3,4,5}` (`[ebp-0xbc]..[ebp-0xac]`).
3. Pour chaque colonne j = 0..6 : double boucle i, k sur 5, qui calcule numérateur
   `∏(−x_k)` et dénominateur `∏(x_i − x_k)` mod 251 (le bloc `0x828cbfbf` / `shr 7` est une
   division par 251 pour remettre les négatifs dans [0, 250]), puis `0x4012b0` = inverse modulaire,
   et `somme += y_i · num · inv(den) mod 251` : c'est exactement **Lagrange en 0**.
   Le résultat est passé à `sprintf("%c")` et concaténé ; la chaîne finale est comparée à `CyClOpS`.
4. Donc le secret est fixe : il suffit de fabriquer 5 parts cohérentes. Le seuil vaut 5
   (5 points → polynôme de degré ≤ 4).

## Vérification

GUI MFC avec anti-debug : on exécute **le vrai handler `0x401610`** sous Unicorn
(`analysis/emulate_check.py`). Seuls les appels externes sont émulés (`GetDlgItemText`,
`MessageBox`, `sprintf("%c")`, `sscanf`, `IsDebuggerPresent` → 0) ; tout le calcul modulaire est
celui du binaire.

```
$ python3 analysis/emulate_check.py spear.exe $(python3 tools/crackmes-de-spear-solve.py petik)
MessageBox : ['The serialz are correct!!!\nNow make a KeyGen and send to me']
$ python3 analysis/emulate_check.py spear.exe $(python3 tools/crackmes-de-spear-solve.py autre)
MessageBox : ['The serialz are correct!!!\nNow make a KeyGen and send to me']
$ # dernière valeur du champ 1 modifiée (13 -> 14)
MessageBox : aucune
```
