# code_linux (CodeLinux) — buga0205 (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5f33c5d40ad448c800 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **statique**, non strippé en partie (glibc incluse) ; anti-debug `ptrace`
- Archive : `original/CodeLinux.zip` → `CodeLinux`
- Usage : `- Enter The Code :` (stdin)

## Réponse

```
Rev5rS1ng_iS_FfUn!~
```

(19 caractères, « Reversing is Fun! » en leetspeak)

```bash
python3 -I tools/codelinux-solve.py --check
# code : Rev5rS1ng_iS_FfUn!~   (L = 19, shift = 20) / check: OK (ok=True, petik→rejeté=True)
echo 'Rev5rS1ng_iS_FfUn!~' | ./analysis/CodeLinux       # You are a Code Linux Memeber!!
```

## Premier regard

```text
$ echo petik | ./analysis/CodeLinux
*****This is Code Linux Agent!*****
- Enter The Code : You Are Not Code Linux Member!
$ strings -n 6 analysis/CodeLinux | grep -E "Code Linux|Alert|Unidentified"
*****This is Code Linux Agent!*****   - Enter The Code :   Alert! Unidentified User!   You are a Code Linux Memeber!!
```

Binaire statique de ~800 Ko : `bash -ic 'decc CodeLinux'` (180 000 lignes) ; seules ~6 fonctions comptent.

## Comment on trouve

**Ancrage** : les chaînes `"- Enter The Code : "` / `"You are a Code Linux Memeber!!"` mènent à `sub_80496CC` (main) et `sub_80495ED` (test final).

```c
// sub_80496CC
ptrace(TRACEME) < 0 -> "Alert! I hate debugging stuff,,,"
scanf("%s", code) ; L = strlen(code) ; dword_80F3F9C = L + 1
if ((L - 1) % 2 == 1) -> "Alert! Unidentified User!"          // L doit être impair
if (2 * ((L + 1) - 9) > 41)  -> "Alert! Unidentified User!"     // L <= 28
sub_80495A9(code)                                               // transformation
sub_80495ED(out)                                                // test
// sub_80495A9 -> sub_8049535 : sub_80492E6(code) = base64(code) dans unk_80F50A0 ; 128 x reverse() ; memcpy -> byte_80F4FA0
//               puis sub_8049058(byte_80F4FA0, L+1) : décalage César de (L+1) sur les lettres seulement
// sub_80495ED : for i < 28 : out[i] ^= 4 ; memcmp(out, "KcT6LV@JCU1lV6bJV4PcTU0f~e99", 28) == 0 -> "You are a Code Linux Memeber!!"
```

Étapes de la solution :
1. `v5 ^ 4` octet par octet : `OgP2HRDNGQ5hR2fNR0TgPQ4bza==` (28 caractères, avec `==` final : un base64 de longueur 28 se termine par `==` quand `L ≡ 1 mod 3`).
2. Inverser le César de `L + 1` : `L` impair, `4·⌈L/3⌉ = 28` ⇒ `L ∈ {19, 21}` ; seul `L = 19` donne un padding `==` cohérent. Décalage 20 : `UmV2NXJTMW5nX2lTX0ZmVW4hfg==`.
3. Base64 décodé : `Rev5rS1ng_iS_FfUn!~` (19 octets) ✓.

**Pièges :**
- `sub_8048E54` (inversion de chaîne) est appelée **128 fois** : nombre pair ⇒ identité ; c'est du bruit.
- Le décalage César dépend de la **longueur** de la saisie (`L + 1`) : il faut fixer `L` d'abord (impair, ≤ 28, `4·⌈L/3⌉ = 28`).
- `dword_80F3F9C = L + 1` sert de clé ; l'`ifunc` / `j_ifunc_*` de la glibc statique masque `memcpy`/`strlen` dans le pseudo-C.
- `ptrace(TRACEME)` : sous `gdb`/`strace` message « I hate debugging stuff ».

## Vérification

```text
$ echo 'Rev5rS1ng_iS_FfUn!~' | ./analysis/CodeLinux          # analysis/verify.txt
*****This is Code Linux Agent!*****
- Enter The Code :
You are a Code Linux Memeber!!
$ echo petik | ./analysis/CodeLinux
You Are Not Code Linux Member!
```

## Fichiers

- `analysis/CodeLinux`, `analysis/CodeLinux.i64.c` (Hex-Rays), `analysis/verify.txt`
- `tools/codelinux-solve.py` : inversion (base64 + César + XOR 4) + `--check` (sur copie)
