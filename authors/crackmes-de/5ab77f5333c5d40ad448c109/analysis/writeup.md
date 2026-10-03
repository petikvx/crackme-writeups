# crackme_2.0 — find the secret text (Devoney)

crackmes.one `5ab77f5333c5d40ad448c109` · crackmes.de · Devoney · 2007 · PE32 GUI (i386, 3 KB)

## Answer

| | |
|---|---|
| **Password** | `[_Crack_]` |
| **Secret text** | `greed` |
| **Popup** | title `Check at http://members.lycos.nl/wietsite/fp.php?x=secret_text`, text `The Secret Text is: greed` |

Solver / verifier: [`../tools/solve.py`](../tools/solve.py) (`--emulate` drives the real
binary under Unicorn and captures the `MessageBoxA` call — no GUI needed).

## How it works

A dialog is built at runtime; the edit control (id `0x65`) is read with
`GetDlgItemTextA` into `0x403000`. Clicking **GO** (`WM_COMMAND`, id 1) runs a
byte-scatter transform over the first 9 input characters (indices 0–8). Each
input byte is shifted by a per-index constant and stored into:

* a **19-byte buffer at `0x403009`** (initial contents `"1234567890123456789"`), and
* the five `0`s of the `"The Secret Text is: 00000"` string at `0x403039..0x40303d`.

Then:

```asm
push [0x403021]            ; lpNumberOfBytesWritten
push [0x40301d]            ; nSize = 0x13 (19)
push 0x403009              ; lpBuffer  (the transformed 19 bytes)
push 0x401351              ; lpBaseAddress  (a NOP sled in .text!)
push [0x4030c8]            ; hProcess = GetCurrentProcess()
call WriteProcessMemory
```

i.e. the transformed input is written **over the NOP sled at `0x401351`** and
then executes inline (self-modifying code). `MessageBoxA` is never called by the
static code — it is called by the generated stub.

## Why the password is forced

The transform maps each of the 19 code bytes to exactly one input byte plus a
constant, and several code bytes share the same input byte (so they are equal).
A clean 19-byte `MessageBoxA` call is `push/push/push/push/call` = `2+5+5+2+5`,
which fits exactly and nails every byte:

```
offset  byte  meaning                 input constraint
 0      6a    push                    in1+0x0b = 0x6a -> in1 = '_'
 1      00    imm8 0                  in0-0x5b = 0x00 -> in0 = '['
 2      68    push imm32 (caption)    in2+0x25 = 0x68 -> in2 = 'C'
 3..6   caption ptr 0x0040303f        in6-0x2c = 0x3f -> in6 = 'k'
 7      68    push imm32 (text)       (= in2, consistent)
 8..b   text ptr 0x00403025          in7-0x3a = 0x25 -> in7 = '_'
                                      in3-0x42 = 0x30 -> in3 = 'r'
                                      in4-0x21 = 0x40 -> in4 = 'a'
 c      6a    push                    (= in1, consistent)
 d      00    imm8 0                  (= in0, consistent)
 e      e8    call rel32              in5+0x85 = 0xe8 -> in5 = 'c'
 f..12  rel32 = 0x32 (->0x401396)     in8-0x2b = 0x32 -> in8 = ']'
```

So the password is `[ _ C r a c k _ ]` = **`[_Crack_]`**, giving

```asm
0x401351: push 0
0x401353: push 0x40303f     ; "Check at http://members.lycos.nl/..."
0x401358: push 0x403025     ; "The Secret Text is: greed"
0x40135d: push 0
0x40135f: call 0x401396     ; MessageBoxA
```

The same input bytes fill the `00000` field with `g r e e d`, so the revealed
secret text is **`greed`**.

## Verification

```
$ ./solve.py --emulate
[+] secret text   : 'greed'
[+] EMULATED MessageBoxA:
      caption : 'Check at http://members.lycos.nl/wietsite/fp.php?x=secret_text'
      text    : 'The Secret Text is: greed'
```
