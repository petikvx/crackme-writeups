# ithawk — Find password

| | |
|---|---|
| **ID** | [`64e91b92d931496abf9091e3`](https://crackmes.one/crackme/64e91b92d931496abf9091e3) |
| **Auteur** | ithawk |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`encrypt`), **anti-debug `ptrace`** |
| **SHA-256** | `4d06bf4ad020303d0debaeb57b28b73f20d88793294dcff08803171cf8644ce0` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/P@ssw0rd` | binaire d'origine (le nom contient un `@` : quoter dans le shell) |
| `tools/p4ssw0rd-solve.py` | calcule le mot de passe depuis le code (`-q`, `--check`) |

## Réponse

**Mot de passe : `CTF{Gh1Dr4-4nD-5Tr4C3-15-H31L}`**

```bash
echo 'CTF{Gh1Dr4-4nD-5Tr4C3-15-H31L}' | './original/P@ssw0rd'     # Congrats, Access Granted!!
python3 tools/p4ssw0rd-solve.py --check
```

## Premier regard

`strings` : `Debugger Detected`, `Enter a Password: `, `Congrats, Access Granted!!`, `Try Harder and Debug More!`, imports `ptrace`, `strlen`, `strcmp`, et un bloc illisible `9J<q=^':H…` (le secret, XORé/décalé).
Le message d'échec « Try Harder and Debug More! » invite à déboguer, mais le binaire se défend contre le débogage.

## Flow

`main` @ `0x11e6` :

1. `ptrace(PTRACE_TRACEME, 0, 0, 0)` : renvoie `-1` si le processus est déjà tracé → « Debugger Detected » et sortie ;
2. monte une constante de 30 octets sur la pile (4 `movabs`, NUL implicite) ;
3. `scanf("%s", buf)`, `encrypt(buf)`, `strcmp(buf, constante)` → « Congrats, Access Granted!! ».

## Comment on trouve

**Ancrage** : `nm` donne `encrypt` @ `0x1189` et `main` @ `0x11e6` ; `objdump -d -M intel --no-show-raw-insn --start-address=0x1189 --stop-address=0x12bb`.

```asm
; encrypt @0x1189
11ac: movzx eax,BYTE PTR [rax]
11af: lea   ecx,[rax-0xa]          ; octet - 10
11c1: mov   BYTE PTR [rax],dl      ; en place, sur toute la chaîne (strlen)

; main @0x11e6
1207: call ptrace                  ; PTRACE_TRACEME
122a: movabs rax,0x3a275e3d713c4a39   ; `9 J < q = ^ ' :`
1234: movabs rdx,0x2b233a642a232a68   ; `h * # * d : # +`
1246: movabs rax,0x2b272329392a684a   ; `J h * 9 ) # ' +`
1250: movabs rdx,0x734227293e23       ; `# > ) ' B s` puis NUL
12a0: call encrypt                 ; saisie -= 10
12bb: call strcmp                  ; strcmp(saisie_transformée, constante)
```

La saisie est transformée par `-10` puis comparée à la constante : le mot de passe est la constante `+10` octet par octet.
`9J<q=^':h*#*d:#+Jh*9)#'+#>)'Bs` + 10 = **`CTF{Gh1Dr4-4nD-5Tr4C3-15-H31L}`** (30 caractères).
Le texte joue sur « Ghidra and strace is hell » ; ironiquement, `strace` et `gdb` déclenchent justement l'anti-debug.

Pièges :
- l'anti-debug `ptrace` : sous `gdb` comme sous `strace`, le programme affiche « Debugger Detected » (vérifié) ; la solution statique n'a pas besoin de débogueur ;
- les `movabs` sont little-endian ; le dernier `qword` ne contient que 6 octets utiles, la chaîne s'arrête au NUL ;
- le nom du fichier contient `@`.

## Vérification

```text
$ echo 'CTF{Gh1Dr4-4nD-5Tr4C3-15-H31L}' | './P@ssw0rd'   -> Congrats, Access Granted!!
$ echo 'CTF{Gh1Dr4-4nD-5Tr4C3-15-H31}'  | './P@ssw0rd'   -> Try Harder and Debug More!
$ gdb -batch -ex run './P@ssw0rd'                         -> Debugger Detected
```

## Notes

- Reverse statique + essais live. GDB n'a servi qu'à constater l'anti-debug, pas à résoudre.
