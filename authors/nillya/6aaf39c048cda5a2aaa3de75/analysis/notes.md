# Nillya's Pass CrackMe — notes d’analyse

Crackme : [Nillya's Pass CrackMe](https://crackmes.one/crackme/6aaf39c048cda5a2aaa3de75)  
Binaire : `original/crackme.exe` (PE32 .NET Framework 4.7.2 WinForms, Prefer32Bit)  
Sources ILSpy gardées pour le solveur : `original/crackme-src/_---------/----.cs` et `----_-----.cs`

## Protecteur

**ArmDot** (JIT / virtualisation / strings / section PE chiffrée).

## Strings ArmDot

227 chaînes AES-CBC — messages runtime uniquement (`VmAesGcmDecryptor`, …).  
Outil : `tools/nillya-pass-solve.py --dump-strings`

## Section VM `~-=&`

- 20 programmes, AES-256-GCM par blocs.
- keyFactory = XOR de 4 shares ; puis HMAC double ; AAD 60 octets.
- Anti-tamper : masque déterministe hors whitelist `{1374365350, 1568416511, 1734831579}`.
- Dump : `analysis/vm-programs/` (`--dump-vm`).

## Password

**Inconnu.**  
Fausse piste : immediates ASCII du prog `1945528862` → `U_AZ` → **Wrong!** en live.  
MessageBox fail confirmée : **`Wrong!`**.

## Suite

Interpréter le bytecode typed-VM / dump dynamique au `MessageBox`.
