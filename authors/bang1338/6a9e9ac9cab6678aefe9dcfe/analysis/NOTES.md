# Notes — Oops! All sarr (en cours)

## Surface

- `sar.exe <code>` → GUI class `OopsAllSARsClass`, titre **`sarr what are you saying?`**
- PE64, imports KERNEL32 minimales + résolution dynamique (`GetProcAddress`)
- ~60k instructions `sar` (obfusc opaque predicates / MBA)
- Bloc chiffré runtime : `VirtualProtect(0x140050eb0, 0x7110, RWX)` puis `FlushInstructionCache`

## Decryptor (statique, partiel)

Après `VirtualProtect` OK :

1. `rsi` = base `0x140050eb0`, `rdi` = fin, `r15 = rdi-rsi` (= `0x7110`)
2. `eax = 0x73617272` (`"sarr"` LE)
3. Boucle `rcx = 0 .. r15-1` :
   - `edx = eax`
   - `eax = (eax << 5) ^ edx`  (32-bit)
   - `eax ^= 0x9d`
   - `buf[rcx] ^= al`

La reconstruction pure de ce keystream **ne donne pas** encore du code x86 valide → il manque probablement un mix avec le `<code>` argv, ou une étape opaque mal simplifiée. Dump live (`/proc/pid/mem`, gdb+wine forks) bloqué ici (ptrace_scope=1, wine multi-process).

## APIs résolues (thread crackme)

GetCommandLineW, CommandLineToArgvW, WideCharToMultiByte, VirtualProtect,
FlushInstructionCache, RegisterClassExW, CreateWindowExW, ShowWindow,
GetMessageW/DispatchMessageW, BeginPaint/EndPaint, DrawTextW, GDI
(CreateSolidBrush/Pen, Ellipse, LineTo, SetTextColor, …), ExitProcess.

## Prochaine étape suggérée

- Dump `0x140050eb0..0x140057fc0` **après** Flush sous **x64dbg** (MCP) ou winedbg attach sur le bon PID
- Ou instrumenter le keystream avec le buffer ANSI du code (post `WideCharToMultiByte` sur argv[1])
