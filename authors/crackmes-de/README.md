# crackmes-de

Auteur local : **`crackmes-de`** (site : [crackmes.de](https://crackmes.one/user/crackmes.de) — mirrors d’anciens crackmes.de).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

Série **rezk2ll** (NASM) importée depuis crackmes.de.

Sections **Debug GDB (pas à pas)** : rezk2ll (`CrackMe_ASM`, `BeatMe`, `KeygenmeNasm`, `f1nd_my_k3y5`) et josamont (`j333`…`j666`, PTY/`read` fd1).

Batch **E3** (GDB `-nx -batch`, debuginfod off) : `oxfoo1me`, `Crackme3` (sx0r), `fr0g_kgm1`, `basic_logic`, `staple`, `yyyyyyy1`, `easy_linux_crackme` / `easy_crackme_2` (lord), `crackme.03.32` (geyslan, ELF invalide → wrap gdbelf).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [f1nd_my_k3y5](5ab77f6533c5d40ad448cb74/) | [`5ab77f65…cb74`](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb74) | Linux ELF32 | keygen `AAAAAAAAAoy~!` |
| 2 | [KeygenmeNasm](5ab77f6533c5d40ad448cb73/) | [`…cb73`](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb73) | Linux ELF32 | `petik`→`uuu}k` |
| 3 | [BeatMe](5ab77f6533c5d40ad448cb72/) | [`…cb72`](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb72) | Linux ELF32 | `petik`→`5tshwln` |
| 4 | [CrackMe_ASM](5ab77f6533c5d40ad448cb71/) | [`…cb71`](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb71) | Linux ELF32 | `S3CrE+Fl4G!` |
| 5 | [easy_crackme_2](5ab77f6333c5d40ad448ca8b/) | [`…ca8b`](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca8b) | Linux ELF32 | `pucybut` |
| 6 | [easy_linux_crackme](5ab77f6333c5d40ad448ca8a/) | [`…ca8a`](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca8a) | Linux ELF32 | getgid==0xdead |
| 7 | [yyyyyyy1](5ab77f6233c5d40ad448c9c3/) | [`…c9c3`](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9c3) | Linux ELF32 | keygen 16-char hash |
| 8 | [staple](5ab77f6133c5d40ad448c924/) | [`…c924`](https://crackmes.one/crackme/5ab77f6133c5d40ad448c924) | Linux ELF32 | `bruceschneier` → secret ZIP |
| 9 | [basic_logic](5ab77f5f33c5d40ad448c7bd/) | [`…c7bd`](https://crackmes.one/crackme/5ab77f5f33c5d40ad448c7bd) | Linux ELF32 | pid\|\|time (PTY) |
| 10 | [j333](5ab77f5c33c5d40ad448c669/) | josamont | Linux ELF32 | `246581` |
| 11 | [j444](5ab77f5c33c5d40ad448c667/) | josamont | `247356` |
| 12 | [j555](5ab77f5c33c5d40ad448c665/) | josamont | `13303518` |
| 13 | [j666](5ab77f5c33c5d40ad448c666/) | josamont | `04919AB9` |
| 14 | [fr0g_kgm1](5ab77f5c33c5d40ad448c65b/) | fr0gsek | keygen petik→serial /var/tmp |
| 15 | [Crackme3](5ab77f5c33c5d40ad448c62e/) | sx0r | keygen petik→5C8E-D82D |
| 16 | [frogger](5ab77f5a33c5d40ad448c4f7/) | macabre | petik / 62-qqqqqv |
| 17 | [grainne](5ab77f5a33c5d40ad448c506/) | stefanie | `stefu!u|` |
| 18 | [grainne2](5ab77f5a33c5d40ad448c505/) | stefanie | `LOVE` |
| 19 | [CrackmeLinux](5ab77f5833c5d40ad448c3d2/) | nobz | `0bfu5c4t3D=-_-"` |
| 20 | [crackme1](5ab77f5533c5d40ad448c238/) | darius949 | Linux ELF32 | name→serial `petik`→`970` |
| 21 | [888](5ab77f5833c5d40ad448c397/) | crp | Linux ELF32 tiny | `./888 x y key` → OK |
| 22 | [tiny_crackme](5ab77f5833c5d40ad448c3ed/) | yanisto | Linux ELF32 tiny | `729040cd` |
| 23 | [naive_crackme](5ab77f5833c5d40ad448c3ee/) | yanisto | Linux ELF32 | `V7l$j^F;` |
| 24 | [oxfoo1me](5ab77f5c33c5d40ad448c5f3/) | 0xf001 | Linux ELF32 | `fucktheduck` |
| 25 | [de_kryptzo_2](5ab77f5833c5d40ad448c3e1/) | starzboy | Win PE32 | petik/2ZUGRLbN→4c2ed685 |
| 26 | [negligent_deobfuscate_1](5ab77f6633c5d40ad448cbf4/) | neon | Win PE32 | deob: dword 2→[0x40400C] |
| 27 | [dll_disaster](5ab77f5833c5d40ad448c3c1/) | issogoo | Win PE32 | inject_here.dll tick+0xCAFFEE |
| 28 | [b0rken_elgamal_keygenme](5ab77f5a33c5d40ad448c4ec/) | smilingwolf | Win PE32 | petik→65796CB3…662C (reused-k) |
| 29 | [epicurus](5ab77f6033c5d40ad448c84f/) | D4ph1 | Win PE32 | click+petik→EE0E-8AFF8715-EB04 |
| 30 | [unlockme_crackme_9_by_sharpe](5ab77f6233c5d40ad448c9e0/) | sharpe | Win PE32 | `TP6A002v` → Secret: Sylvester! |
| 31 | [keygenme_1](5ab77f5f33c5d40ad448c7f5/) | cauchy_htb | Win PE32 FSG | `-htbt!` + petik→CAC86F99…0CF080 |
| 32 | [crackme_1_by_amnon](5ab77f5333c5d40ad448c10f/) | amnon / HTB | Win PE32 | `Amnon^HTB Team` + serial `…BC17…` |
| 33 | [crackme_0x01_by_qfqe](5ab77f6033c5d40ad448c8a4/) | qfqe | Win PE32 py2exe | serial XOR `0x90` → **`qeavG1ZX`** |

| 34 | [abu_crackme_v1](5ab77f6633c5d40ad448cc10/) | gauri | Win PE32 VB6 | serial **`FFFFE84A`** |
| 35 | [crackme by twist](5ab77f6633c5d40ad448cc22/) | twist | Win PE32 VB6 | keygen `petik`→` 103.310…` |

| 36 | [keygencrackme_1 by zyen](5ab77f6633c5d40ad448cc6a/) | zyen | Win PE32 VB6 | serial **`3610`** (19²×10) |

| 37 | [crackmenx2final by arthi](5ab77f6633c5d40ad448cc2b/) | arthi | Win PE32 VB6 FSG | password **`havingfunyet`** |
| 38 | [shisms_keygenme_0.1](5ab77f6633c5d40ad448cc29/) | shism | Win PE32 VB6 Zastita | keygen `petik`→**`715231907`** (graine fixe) |
| 39 | [scarabee_crackme_5](5ab77f6133c5d40ad448c8fa/) | scarabee | Win PE32 Delphi ASPack | unlock `SerialCheck` ; `petik`→**`1723990`** |
| 40 | [keygenme_v1.8](5ab77f6033c5d40ad448c894/) | greedy_fly | Win PE32 MASM ASPack | `petikk`→**`17-00ABF0`** (Adler+CRC) |
| 41 | [sorting_server_ctf](5ab77f5e33c5d40ad448c79a/) | warsaw | Python2 HTTP | oracle pivot/LCG → seed uint32 (CRT) |
| 42 | [buggers_v.5](5ab77f6633c5d40ad448cc2a/) | shism | Win PE32 ASM | anti-Olly ; NOP TerminateProcess @4011CB |
| 43 | [deobfuscate_1](5ab77f6633c5d40ad448cc26/) | shism | Win PE32 ASM | deob `eb` chain ; ret@401000 last |
| 44 | [the_xor_algorithm](5ab77f6533c5d40ad448cbc5/) | ksydfius | Win PE32 MASM | KEY **`Tv8(@*a;FHBADIvhadyfgpar12Af5t[a`** → `science_m00nlight` |
| 45 | [tropes_safe_cracker_1](5ab77f6533c5d40ad448cb87/) | trope | Win PE32 MASM | combo **`435513`** → *Good Job.* |
| 46 | [znycuks_1_crackme](5ab77f6633c5d40ad448cbd2/) | znycuk | Win PE32 MASM | keygen `petik`/`PTK-LAB` seed `Ab12`→**`98BE-5573-73B5-4385`** |
| 47 | [slayers_crackme_1](5ab77f6533c5d40ad448cb6b/) | savage / Slayer | Win PE32 | clipboard+reg.key ; PTK-LAB→`0x1EB` |
| 48 | [clone](5ab77f6533c5d40ad448cb5b/) | haggar | Win PE32 | petik→**`AC1C7A6F`** |
| 49 | [crack_me](5ab77f6433c5d40ad448cb0f/) | hexic / cLoNeTrOnE | Win PE32 | petik→**`13-0000021D-Z7`** |
| 50 | [4n006135_level_4](5ab77f6433c5d40ad448cad1/) | borismilner | Win PE32 console | `THISWORLDISCRUEL` + argc=7 |
| 51 | [4n006135_forn00bies](5ab77f6433c5d40ad448cad0/) | borismilner | Win PE32 console ×4 | L0 `Easy` ; L1 petik→541 ; L2 rdtsc keygen ; L3 `-1879046653` |
| 52 | [fishing_with_dila_v0.5](5ab77f6433c5d40ad448cab4/) | dila | Win PE32 GUI | code **`3210123`** |
| 53 | [fishing_with_dila_v0.4](5ab77f6433c5d40ad448cab3/) | dila | Win PE32 GUI | code **`1337`** |
| 54 | [fishing_with_dila_v0.3](5ab77f6433c5d40ad448cab1/) | dila | Win PE32 GUI | code **`111`** |
| 55 | [fishing_with_dila_v0.2](5ab77f6433c5d40ad448cab2/) | dila | Win PE32 GUI | code **`921`** |
| 57 | [databus_keygenme1](5ab77f6333c5d40ad448ca70/) | databus | Win PE32 GUI | petikk→**`DDCCBE47-BB997C8E`** |
| 58 | [smple_unpackme_v0.1](5ab77f6333c5d40ad448ca2e/) | simple_re | Win PE32 GUI | restore IAT thunks → `UnpackMe.restored.exe` |
| 59 | [vazonezs_keygenme_1](5ab77f6333c5d40ad448c9ff/) | vazonez | Win PE32 GUI | petik→**`I[WcE[[Pb^jLbb`** |
| 60 | [crackme_1_by_sharpe](5ab77f6233c5d40ad448c9df/) | sharpe | Win PE32 GUI | petik→**`@tAvw,+*)('&%$#"`** |
| 61 | [injectme_1](5ab77f6233c5d40ad448c9ed/) | xylitol | Win PE32 GUI | MessageBoxA Injected by petik |
| 62 | [injectme_2](5ab77f6233c5d40ad448c9ee/) | xylitol | Win PE32 GUI | export-walk MessageBoxA |
| 63 | [crackme_3_by_sharpe](5ab77f6233c5d40ad448c9e1/) | sharpe | Win PE32 GUI | AAAAAAAA→**`$$$$$$$$mbc`afgd`** (GetVersion) |
| 64 | [connrs_crackme](5ab77f6233c5d40ad448c9aa/) | connr | DOS MZ UPX | code **`2813`** |
| 65 | [mars1](5ab77f6233c5d40ad448c967/) | mars | Win PE32 GUI | petik→**`\\x12S4i`** (jump→yes) |
| 66 | [leevions_first_crackme_with_assemby](5ab77f6233c5d40ad448c963/) | leevion | Win PE32 FASM | patch → **`Crackme cracked!!`** |
| 67 | [patchme_1](5ab77f6133c5d40ad448c93f/) | oxygen | Win PE32 MASM | nag + **`Good Boy [petik]`** |
| 68 | [nonzenzes_keygenme1](5ab77f6133c5d40ad448c933/) | nonzenze | Win PE32 MASM | petik→**`E4000156`** |
| 69 | [protreebrains_crackme_1](5ab77f6133c5d40ad448c915/) | protreebrain | Win PE32 MASM | serial **`20062007`** |
| 70 | [stigger](5ab77f6133c5d40ad448c8f5/) | stigger | Win PE32 MASM | petik→**`AAAAAYKKUN`** |
| 56 | [fishing_with_dila_v0.1](5ab77f6433c5d40ad448cab0/) | dila | Win PE32 GUI | code **`666`** |

| 71 | [crackme.03.32](5ab77f6533c5d40ad448cbc0/) | geyslan | Linux ELF32 tiny | patch → **`Omedetou`** |
| 72 | [crackme_1_by_huskyhusky](5ab77f5633c5d40ad448c27b/) | huskyhusky | Linux ELF64 VM | password **`uoiaefdcgkbhqrywsvtxpz`** |
| 73 | [cropta_1](5ab77f5f33c5d40ad448c7e1/) | cropta | Bochs MBR | password **`replicants`** |
| 74 | [timemachine](5ab77f5333c5d40ad448c0f6/) | qnix | Linux ELF32 VM | **`iWasteMyTime`** |
| 75 | [ada_crackme_1](5ab77f5733c5d40ad448c38f/) | darkphoenix_ | Linux ELF32 Ada UPX | petik → serial 30 octets, hash `0xABCDEF` |
| 76 | [collide](5ab77f5833c5d40ad448c399/) | crp | Linux ELF32 | `.key` mode `0400` ; MD5 `A\|\|TEA(B)` ; petik → custom `0x1ffa4ba4` |
| 77 | [encrypt](5ab77f6033c5d40ad448c8b3/) | rascal999 | Linux ELF32 FreeBASIC | pass1 **`756384985`**, pass2 **`999345234`** |
| 78 | [crackme_2.0_find_the_secret_text](5ab77f5333c5d40ad448c109/) | devoney | Win PE32 GUI auto-modifiant | password **`[_Crack_]`** → secret **`greed`** (input→shellcode MessageBoxA) |
| 79 | [recoded_keygenme_1](5ab77f5333c5d40ad448c10c/) | recoded | Win PE32 GUI MASM | petik→**`0C1D98B6-7D4A3072-07D08290-E41E90EA`** (ROR19 + seed `0x401284`) |
| 80 | [crackme2](5ab77f5333c5d40ad448c114/) | immortal_one | Win PE32 GUI ASM packé | petik→**`372E`** (ES_UPPERCASE + mix16 `*25`) |
| 81 | [keygenme_2_by_nicohogtag](5ab77f5333c5d40ad448c0d5/) | nicohogtag | Win PE32 console MinGW | petikpetik→**`608202596`** (somme/cumul 10 octets, nom 9–10 car.) |
| 82 | [k1](5ab77f5333c5d40ad448c0d8/) | xtfusion | Win PE32 console MinGW | petik→**`15476a`** (cumul `c*80`, `%x`, compare préfixe) |
| 83 | [skcrackme_1](5ab77f5333c5d40ad448c0d9/) | sknine9 | Java Swing (JAR) | petik→**`232 61 158 … 236 251`** (double DES ECB, octets +167) |
| 84 | [dailycracking_by_flipflop](5ab77f5333c5d40ad448c0e0/) | flipflop | Win PE32 console MinGW | **`Crack`+jour** (ex. `Crack10`, strftime `%d`) |
| 85 | [crackme2](5ab77f5333c5d40ad448c0df/) | midi | Win PE32 console MinGW + MessageBox | petik→**`03277`** (`(c+0x1e)%(2i+2)`, −i tant que >9) |
| 86 | [light_keygenme](5ab77f5333c5d40ad448c0e1/) | salazan | Win PE32 GUI Delphi 6 | petik→**`24`** (MD5(nom+serial) hex : 8 premiers = chiffres, StrToInt) |
| 87 | [salazans_keygenme_0003](5ab77f5333c5d40ad448c0e2/) | salazan | Win PE32 GUI Delphi 6 | petik→**`CCCABA0BC21A10-OOOOP-OOOOO-OOOOS-OOOOK-OOOOI`** (MD5 hex filtré 0-3/A-C + 5 blocs à somme ASCII fixe) |
| 88 | [salazans_keygenme_0001](5ab77f5333c5d40ad448c0e3/) | salazan | Win PE32 GUI Delphi 6 | serial **`OOOOQ-OOOOP-OOOOT-OOOOL-OOOOJ`** (nom ignoré, 5 blocs à somme ASCII fixe) |

| 89 | [qcrk_3](5ab77f5333c5d40ad448c0f3/) | qnix | Linux ELF32 | **`KEY=petik`** (getenv non-NULL) |

| 90 | [qcrk5](5ab77f5333c5d40ad448c0f4/) | qnix | Linux ELF32 static | password **`91867153`** |

| 91 | [qcrk_2](5ab77f5333c5d40ad448c0f5/) | qnix | Linux ELF32 | **stack overflow** → `crap()` (`argv[2]`=2060+&crap) |

| 92 | [CrackMe#1](5ab77f5333c5d40ad448c100/) | br0ken | Windows PE32 console | pass **`PaSSw0rD`** ; keygen `Σord−len−1` (petik→535) |

| 93 | [crackme_4](5ab77f5333c5d40ad448c101/) | br0ken | Windows PE32 console | pass **`yippee`** (XOR par char + `%X` vs `4D11628EBE1D`) |

| 94 | [serialkeygen_me](5ab77f5333c5d40ad448c102/) | br0ken | Windows PE32 console | keygen : len 7, `Σ(3c−40)·c` (6 premiers) ≡ 0 mod 10 (petik→`petiki!`) |

| 95 | [what_is_my_password](5ab77f5333c5d40ad448c103/) | br0ken | Windows PE32 console (MSVC) | pass **`95718t00w`** (système linéaire 5×5 + MD5) |

| 96 | [crackme_3](5ab77f5333c5d40ad448c105/) | br0ken | Windows PE32 console | keygen `br0-A-BC-ken` (table `@^*R$FVT%@`) ; petik→`br0-341111-293352267-ken` |
| 97 | [keygenme_by_d0min4ted](5ab77f5333c5d40ad448c0fd/) | d0min4ted | Windows .NET GUI | keygen `int(rev(hex(nom))[:9])*len^3` ; PETI→`6045145920` |
| 98 | [crackme_july_8th_2002_release](5ab77f5333c5d40ad448c106/) | junkcode | Windows PE32 GUI | key = premier ∈ [10000,20000] = cases (bit 0 en premier) ; ex. `19991` |
| 99 | [keygenme_n1](5ab77f5333c5d40ad448c108/) | xxlxdxx (LXD) | Windows PE32 GUI (MSVC) | keygen MD5(nom) HEX ^ octet `cpuid` ^ md5('') → 1er chiffre, 3 blocs permutés ; petik/0x34→`7671121155-6177616665-1569176451` |
| 100 | [hidewindow](5ab77f5333c5d40ad448c10b/) | devoney | Windows PE32 GUI (Dev-C++) | `GetDlgItemInt`=5560 **et** historique des derniers car. tapés = `55484560` (5,5,4,→8,→4,→5,→6,0) |
| 101 | [crackme_1](5ab77f5333c5d40ad448c111/) | rith | Windows PE32 GUI (MFC 4.2) | keygen `2·(nom[i] mod "3141592653…"[i])` + ajustements ; petik→`n\|jt€` (`6e7c6a7480`) |
| 102 | [crackme](5ab77f5333c5d40ad448c115/) | honestgamer | Windows .NET console | keygen `Code = ID·786·17 div 12 + 1991` ; ID 1234→`1376050` |
| 103 | [keygen_rivendel](5ab77f5333c5d40ad448c117/) | tryger | Linux ELF32 (GCC) | faux `main` (entry = 0x80487b6) ; keygen 3 passes `(c+0xF)`, `(0x12−c)`, `(c−0x4C)·2` ^ user ; petik→`7feb8ef468c42b931697081dd67d09` (hex) |
| 104 | [crackme_1_easy_timers](5ab77f5333c5d40ad448c118/) | anarchy2k3 | Windows PE32 GUI (Delphi 2009) | `Thom Collins` / `5694-5378` puis **Clear** avant Timer1 (2 s) |
| 105 | [learn_the_first_few_tricks_1](5ab77f5333c5d40ad448c11a/) | deibiz_xxl | Windows PE32 console (MinGW) | pass **`[DEIBIZ]`** = `ZCDHAHY\` (.data) + 1 par octet |
| 106 | [feo_crackme_12](5ab77f5333c5d40ad448c11b/) | shoulck | Windows PE32 GUI (MSVC) | file mapping nommé `Datos`=`"Crackme 12 "` ; Serial = reverse(Nombre) ; petikpetik→`kitepkitep` + 2e instance |
| 107 | [cesd_dvl_assessment_1](5ab77f5333c5d40ad448c11c/) | zero | Linux ELF32 (DVL) | **buffer overflow** `strcpy(buf[0x108],argv[1])` ; offset **268** → EIP (`A*268+BBBB`→eip=`0x42424242`) |
| 108 | [cesd_dvl_assessment_2](5ab77f5333c5d40ad448c11e/) | zero | Linux ELF32 (DVL) | **buffer overflow** `strcat(buf[0x88],argv[1])` ; préfixe 27 o ; offset **113** → EIP (`A*113+BBBB`→eip=`0x42424242`) |
| 109 | [cesd_dvl_assessment_5](5ab77f5333c5d40ad448c11f/) | zero | Linux ELF32 (DVL) | **buffer overflow** `gets(buf[0x138])` via stdin ; offset **316** → EIP (`A*316+BBBB`→eip=`0x42424242`) |
| 110 | [cesd_dvl_assessment_3](5ab77f5333c5d40ad448c120/) | zero | Linux ELF32 (DVL) | **buffer overflow** `strcpy(buf[0x108],argv[1])` sans préfixe ; offset **268** → EIP (`A*268+BBBB`→eip=`0x42424242`) |
| 111 | [cesd_dvl_assessment_4](5ab77f5333c5d40ad448c121/) | zero | Linux ELF32 (DVL) | **buffer overflow** `gets(buf[0x208])` via stdin dans `crackme()` ; offset **524** → EIP (`A*524+BBBB`→eip=`0x42424242`) |
| 112 | [sennin1](5ab77f5333c5d40ad448c12a/) | sennin | Windows PE32 GUI (MASM32) | serial 10 car. : `d0` point fixe `bswap/+0x6c6f7665/^0x111/>>2/+…/^…` = **`YES_`** ; `d1` `rol4/sar3 & 0x45F = 0x40E` ; fin `!!` → **`YES_G200!!`** |
| 113 | [4f.crackme_2](5ab77f5333c5d40ad448c12d/) | ximus | Windows PE32 GUI (MSVC, PELock + DLL) | `crackme.dll!Check` : len 15, `s[7]='-'`, `Σ(paires)^4+^3+^2+c` = `0x2722DCB0` / `0x3308239F` → **`020p99L-100J68z`** |
| 114 | [4f.crackme1](5ab77f5333c5d40ad448c12e/) | ximus | Windows PE32 GUI (MSVC) | keygen `ABCDE-HHHHH` : `C,D,E=name[0..2]%10`, `B=CDE%10`, `A=(B+C+D)%10`, `HHHHH=%X(Σname·0xFEAD & 0xFFFFF)` ; petik→**`52216-A3399`** |
| 115 | [lincrkme_01](5ab77f5333c5d40ad448c12f/) | digitalbyte | Linux ELF32 (gcc) | keygen : serial = **username inversé** (sans `\n`), len ≥ 6 ; anti-debug `ptrace(TRACEME)` avant `main` → faux « too short » ; petikvx→**`xvkitep`** |
| 116 | [cyclops](5ab77f5433c5d40ad448c149/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC 4.2) | serial en dur **`<BrD-SoB>`** (`lstrcmpA` vs `.data:0x403020`) — vérifié live wine (+ winetricks mfc42) |
| 117 | [nts_crackme5](5ab77f5433c5d40ad448c14b/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC 4.2) | keygen : `f1(nom)+f2(nom)` (2× `%08X-%08X`, accumulateurs xor/or/mod 7/5/11), nom ≥ 7 ; petikvx→**`8E15AE20-27A3073C+D2E8AF0E-7A9D4D14`** (live wine) |
| 118 | [nts_crackme4](5ab77f5433c5d40ad448c14d/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC 4.2) | brute force : 3 hachages du serial → `0CEAC848-A1F55297-18B3DD62` ; serial **`ycc`** (live wine) |
| 119 | [cyclops_crackme_4.0](5ab77f5433c5d40ad448c152/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC42D, UPX maquillé CYC) | keygen RC4(clé=nom) sur l'e-mail étendu à 32 octets, octets en décimal (1er = 0, bug) ; petik/petik@crackmes.one→**`0524521618623215216116723179118871202182331161383711910413093177491854185010817282`** (émulation unicorn) |
| 120 | [nts_crackme8](5ab77f5433c5d40ad448c156/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC 4.2) | keygen SHA-256(nom), serial `%08X%08X` des sommes des mots impairs/pairs ; petikpetik→**`4565D7C272B88E40`** (émulation unicorn) |
| 121 | [cyclops_crackme_5.0](5ab77f5433c5d40ad448c157/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC42D) | passcode tapé dans la fenêtre (OnChar + strstr), dérivé de 6 chaînes par `(A^~B^(C&D))|~E^F` ; **`CrAcKiNg Is CoOl`** (émulation unicorn) |
| 122 | [nts_crackme9](5ab77f5433c5d40ad448c158/) | cyclops | Windows PE32 GUI (MSVC 6 / MFC 4.2) | keygen P(8)+MD5_even(P+"Cyclops / REAL") (octets pairs) ; petik/petik000→**`petik00083A0BD58A9631228`** (émulation unicorn) |
| 123 | [nts_crackme1](5ab77f5433c5d40ad448c15a/) | cyclops | Windows PE32 GUI (MASM32) | patch 1 octet `0x40100d` jne→je (file `0x40d`) ; flag `.data`=0 → **Registered!!!** (émulation unicorn) |
| 124 | [crackme2](5ab77f5433c5d40ad448c15b/) | cyclops | DOS 16 bits (Borland C++) | keygen Σ 0x8E·(tolower(c)&0x7F + bonus) ; `petik` → `83496` (vérifié DOSBox) |
| 125 | [nts_crackme7](5ab77f5433c5d40ad448c15c/) | cyclops | Win32 GUI (MSVC 6 / MFC) | keygen double CRC32 via registre `HKCU\Software\Cyclops\Crackme7` ; `petik` → `0EAFB851-0DE144F8` (vérifié par émulation Unicorn) |
| 126 | [nts_crackme2](5ab77f5433c5d40ad448c15d/) | cyclops | Win32 GUI (MASM32) | serial en clair `Serial` (`lstrcmpA`) ; vérifié par émulation Unicorn de la DialogProc |
| 127 | [nts_crackme3](5ab77f5433c5d40ad448c15e/) | cyclops | Win32 GUI (MSVC 6 / MFC) | serial 8 car. testés un par un : `2:).+-M` + 1 car. libre (ex. `2:).+-MX`) ; vérifié par émulation Unicorn |
| 128 | [spear](5ab77f5433c5d40ad448c15f/) | cyclops | Win32 GUI (MSVC 6 / MFC) | keygen **Shamir mod 251** : 5 parts dont Lagrange en 0 donne `CyClOpS` ; anti-debug IsDebuggerPresent + rdtsc ; vérifié par émulation Unicorn |
| 129 | [nts_crackme6](5ab77f5433c5d40ad448c161/) | cyclops | Win32 GUI (MSVC 6 / MFC) | keyfile `Key.cyc` : nom + base64(nom répété sur 30 octets) ; `petik` → `cGV0aWtwZXRpa3BldGlrcGV0aWtwZXRpa3BldGlr` (vérifié live Wine) |
| 130 | [nts_crackme10](5ab77f5433c5d40ad448c162/) | cyclops | Win32 GUI (MSVC 6 / MFC) | keygen `%08X` du hash du nom (anti-debug NtGlobalFlag/rdtsc → key 0) ; `petik!` → `85CDB0E3` (vérifié Unicorn) |
| 131 | [crackme0x1](5ab77f5433c5d40ad448c16d/) | pickled | Win32 console (MSVC 2005) | clé fixe `pickled` = `secret[i] ^ i` sur `` phahh`b `` (vérifié live Wine) |
| 132 | [TinyAsm](5ab77f5433c5d40ad448c170/) | promix17 | Win32 GUI (MASM) | mot de passe fixe `Nrsisj{` = `((enc[i]+1)^0x2F)^0x1A`, checksum anti-patch du code (vérifié Unicorn) |
| 133 | [consoleinfinity](5ab77f5433c5d40ad448c176/) | promix17 | Win32 console (MSVC, 81 stubs `Packer`) | `Password!`+5+`Hacker!`+9+`Infinity!`+3+`!`, hash %0xFFFFFF = `0x209DD8` (brute) ; ex. `Password!WErUPHacker!I35mP5pygInfinity!LoL!` (vérifié Wine + Unicorn) |
| 134 | [crackme_13](5ab77f5433c5d40ad448c17c/) | FireWorx | Win32 GUI (Delphi + ASPack) | serial = `IntToStr(f(ebx))`, `ebx∈[2,len]` ; ex. `1774248000` (ebx=4) ; nom ignoré (vérifié sur dump Image2Click) |
| 135 | [crackme_12](5ab77f5433c5d40ad448c17e/) | FireWorx | Win32 GUI (Delphi + ASPack) | serial = `IntToStr(((123k div len(nom+société))<<5 + 0x5B1D54) xor 0x12)`, `k∈[1,len(serial)]` ; ex. `petik`/`petik` → `5971654` (vérifié Unicorn sur le vrai code dumpé) |
| 136 | [crackme_15](5ab77f5433c5d40ad448c17f/) | FireWorx | Win32 GUI (Delphi + ASPack) | serial = `"MU" + IntToStr(v(k)) + " "`, `k∈[2,len(nom)]` (seule la longueur du nom compte) ; ex. `petik` → `MU1373807 ` (vérifié Unicorn sur le vrai code dumpé) |
| 137 | [crackme_2](5ab77f5433c5d40ad448c182/) | FireWorx | Win32 GUI (Delphi 4, non packé) | serial = `nom + nom + "625g72"` ; ex. `petik` → `petikpetik625g72` (vérifié live Wine) |
| 138 | [crackme_5](5ab77f5433c5d40ad448c183/) | FireWorx | Win32 GUI (Delphi 4, non packé) | code fixe `Regcode` = caption de `Label1`, comparé à `Edit1` par un `TTimer` (1 ms), pas de bouton (vérifié live Wine) |
| 139 | [crackme_9](5ab77f5433c5d40ad448c186/) | FireWorx | Win32 GUI (Delphi 4, non packé) | keygen : serial = ((((n/1932)*921)<<17)>>>9)/12 sur le nombre affiché dans `Edit2` (vérifié par émulation Unicorn du vrai code) |
| 140 | [crackme_6](5ab77f5433c5d40ad448c188/) | FireWorx | Win32 GUI (Delphi 4, non packé) | keygen : hash xor/sar du nom (graines `0x49390305`/`0x48631220`) formaté `%.4x-%.4x-%.4x-%.4x` (vérifié par émulation Unicorn du vrai code) |
| 141 | [crackme_3](5ab77f5433c5d40ad448c189/) | FireWorx | Win32 GUI (Delphi 4, non packé) | mot de passe fixe `RIDERSINTHENIGHT` dans le DFM du `TAHMPasswordDlg` (vérifié sous wine) |
| 142 | [upxed](5ab77f5433c5d40ad448c18c/) | BlueOwl | Win32 PE FASM + UPX bidouillé | mot de passe **`DREAMING_ABOUT_PACKING`** (−imm sur zone nulle à l'OEP ; émulé Unicorn, ouvre `finish.zip`) |
| 143 | [firox_crackme_1](5ab77f5433c5d40ad448c190/) | firox | Win32 GUI VB6 natif | serial en dur **`DFT1-9CKS-BWD0-2VRF`** (`__vbaStrCmp`, vérifié sous wine) |
| 144 | [libertyordeaths_keygenme_3](5ab77f5433c5d40ad448c193/) | LibertyorDeath | Linux ELF32 (GCC) | keygen nom + **hostname** : `str(A+B)-host[0::2]` ; petik→`9200-go-o-m41262` sur la box (chaînes +5, anti-`ptrace`, GDB) |
| 145 | [libertyordeaths_linux_keygenme_2](5ab77f5433c5d40ad448c194/) | LibertyorDeath | Linux ELF32 (GCC) | keygen nom + **hostname** : `(0x13+Σhost)-((nom[-1]+len(host))*(len(host)+len(nom)))-nom[:2]host[:2]` ; petik→`1606-3328-pegr` sur la box (statique, vérifié en natif) |
| 146 | [libertyordeaths_asm_keygenme1](5ab77f5433c5d40ad448c195/) | LibertyorDeath | Win32 GUI MASM (code XOR 0x25) | keygen **`LOD-%lu-%lX`** : `esi += c+1+10·i!`, `edi = 10·n!·esi` ; petik→`LOD-886-103920` (émulé Unicorn) |
| 147 | [libertyordeaths_linux_keygenme_1](5ab77f5433c5d40ad448c196/) | LibertyorDeath | Linux ELF32 (GCC) | keygen numérique : `50·(2·nom[-1]·(len-1))²` (int32) ; petik→`36636800` (vérifié en natif) |
| 148 | [crackme4 by tcn30](5ab77f5433c5d40ad448c19c/) | tcn30 | Windows Delphi 2006 (GUI) | login `TURRICAN` / pass `NEWYEAR` déchiffrés (variante XTEA, émulation Unicorn de `0x455E98`) + UpperCase |
| 149 | [password_app by tcn30](5ab77f5433c5d40ad448c19d/) | tcn30 | Windows Delphi (GUI) | pass `Letmein97531` : Decrypt Delphi (clé 12345, C1 `0xCE6D`, C2 `0x58BF`) ; vérifié live wine |
| 150 | [crackme_9 by tcn30](5ab77f5433c5d40ad448c19f/) | tcn30 | Windows .NET 2.0 (console) | pass `Leteminman` : Rijndael-256 CBC + PasswordDeriveBytes MD5×1024 (Decrypt appelé par réflexion) ; vérifié natif dotnet |
| 151 | [crackmekeygenme1_breaker by brk12345](5ab77f5433c5d40ad448c1a4/) | brk12345 | Windows .NET 2.0 (VB.NET WinForms) | keygen `85·len-rev(nom[1:4])ata-(100+80·len)` ; petik→`425-iteata-500` (vrai code de vérif rejoué en dotnet) |
| 152 | [breakers_crackme_4 by brk12345](5ab77f5433c5d40ad448c1a5/) | brk12345 | Windows .NET 2.0 (VB.NET WinForms, obfusqué) | keygen MD5→base64 (UTF-16LE) imbriqué, ×3 ; petik→`IMygpr5v…RTIg==`×3 (vrai code de vérif rejoué en dotnet) |
| 153 | [crackmekeygen_breaker by brk12345](5ab77f5433c5d40ad448c1a6/) | brk12345 | Windows .NET 2.0 (VB.NET WinForms) | keygen `81·len+19350` ; petik→`19755` (vrai code de vérif rejoué en dotnet) |
| 154 | [crack_me_or_keygen_me by dragonpxx](5ab77f5433c5d40ad448c1a8/) | dragonpxx | Windows .NET 3.5 (C# WinForms + 3 DLL) | serial constant `4EC25C03-73D4-484C-AE78-20B3DC0A8457` (AES-ECB, clé MD5 ; `Check` leurre) ; vrai Crypto.dll appelé en dotnet |
| 155 | [yowmo_keygenme1 by yowmo](5ab77f5433c5d40ad448c1a9/) | yowmo | Windows PE32 GUI (asm) | Level I : XOR glissant `DEADBEEF` → `%X` ; petik→`DCDBC68E` (Unicorn) |
| 156 | [rif_crackme_5 by korbut](5ab77f5433c5d40ad448c1aa/) | korbut | Windows PE32 GUI (MASM) | sum `((c+1)^i)*i` (i=index+1) ; petik→`1631` (Unicorn) |
| 157 | [korbut_keyfile_1 by korbut](5ab77f5433c5d40ad448c1ab/) | korbut | Windows PE32 (keyfile MASM) | `skor.reg` = `[ R I F 2 k 2 ] ` (Unicorn) |
| 158 | [korbut_keyfile_3 by korbut](5ab77f5433c5d40ad448c1ac/) | korbut | Windows PE32 (keyfile #2 MASM) | `$KF2` = ComputerName ; GOOD CRACKER (Unicorn) |
| 159 | [rif_crackme_1 by korbut](5ab77f5433c5d40ad448c1ad/) | korbut | Windows PE32 (MASM, Dr. rED mEAT) | serial fixe `2F13` = `%lX` de `(6*0x6FD)^0x6FD` (Unicorn) |
| 160 | [your_first_crack by korbut](5ab77f5433c5d40ad448c1ae/) | korbut | Windows PE32 (MASM, Dr. rED mEAT) | keygen : somme signée `(b+1)^0x17` du 1er char à 255, `petik` → `4294960616` (Unicorn) |
| 161 | [korbut_misc._crackme_1 by korbut](5ab77f5433c5d40ad448c1b2/) | korbut | Windows PE32 (MASM32) | fichier `_KESKYA` + presse-papiers `²)='/+,:` + ComputerName `[ RIF 2k3 ]` (Unicorn) |
| 162 | [rif_crackme_2 by korbut](5ab77f5433c5d40ad448c1b4/) | korbut | Windows PE32 (MASM, Dr. rED mEAT) | keygen : `(t1+t2+t3+t4)^0x90==0x14F` sur octets 0/2/4, `petik` → `0XcXy` (wine live) |
| 163 | [keygenme_2 by korbut](5ab77f5433c5d40ad448c1b6/) | korbut | Windows PE32 (MASM, anti-SoftIce int 68h) | keygen : `ebx+=sx(c); bl+=0x30`, `petik` → `525` (Unicorn) |
| 164 | [keygenme_1 by korbut](5ab77f5433c5d40ad448c1b7/) | korbut | Windows PE32 (MASM, Dr. rED mEAT) | keygen : `serial[i] = nom[i]+1`, `petik` → `qfujl` (wine live) |
| 165 | [korbut_keygen_me_1 by korbut](5ab77f5433c5d40ad448c1b8/) | korbut | Windows PE32 (MASM32, RIF 2k3) | keygen nom + ComputerName : `ror(bswap(ror(dw(nom)+sx(comp[2len-1]),5)^0x20),11)` → `.(%lu).` (wine live) |
| 166 | [szi_keygenme by revme](5ab77f5433c5d40ad448c1c0/) | revme | Windows PE32 (MinGW C++) | keygen `XXX-XXX-XXX` : `f(n)=charset[n%34]`, `petik` → `spc-eyt-2ik` (prédicat+exemple auteur) |
| 167 | [c_crackme_1 by ultrasound](5ab77f5433c5d40ad448c1cc/) | ultrasound | Windows PE32 GUI (MSVC6 C++) | keygen `ULT-<15 chiffres>-0141` (swab + ror, `(s^t)+s*t`, `%9` ; suffixe `2413` leurre), `petik` → `ULT-824815863156375-0141` (Unicorn) |
| 168 | [rdg_simple_crackme_.net by rdgmax](5ab77f5433c5d40ad448c1d0/) | rdgmax | Windows PE32 (VB.NET, bourrage) | keygen `hex(Base64(DES(nom)))`, clé `SHA1("5167449")[:8]`, `petik` → `38396666356E424C31576F3D` (couple démo auteur) |
| 169 | [6_levels by typhoon](5ab77f5433c5d40ad448c1d7/) | typhoon | Windows PE32 console (MSVC 2013, PDB) | binary bomb 7 niveaux + secret (`9 guava` → `flame`, NOP-sleds en `.data`) (wine live) |
| 170 | [keygenning4newbies_crackme_6 by analyst](5ab77f5433c5d40ad448c1d8/) | analyst | Windows PE32 GUI (Delphi 5) | keygen nom+société : table `0x4459df`, produit + xor/ror/sar/`not ax` → entier, `petik/petik` → `156663586` (Unicorn) |
| 171 | [keygenning4newbies_crackme_7 by analyst](5ab77f5533c5d40ad448c1d9/) | analyst | Windows PE32 GUI (MSVC+UPX) | keygen MD5(name)+1 round TEA-like sur `keygenme` → hex16, `petik` → `8038CA6D3774F53D` (Unicorn) |
| 172 | [keygenning4newbies_crackme_1 by analyst](5ab77f5533c5d40ad448c1da/) | analyst | Windows PE32 GUI (Borland C++) | keygen Σ(name[i]^(i+1))<<7 + (last^len)*6 → hex, `petik` → `11794` (Unicorn) |

## Mis de côté (PARKED — y revenir)

| Titre | ID | Blocage / reprise |
|---|---|---|
| [bugger_v.7](5ab77f6633c5d40ad448cc25/) | [`…cc25`](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc25) | RC6 OK ; **clé** + wake shell `abcdefgh` — `analysis/notes.txt` |
| [meloquynthe](5ab77f5933c5d40ad448c46f/) | [`…c46f`](https://crackmes.one/crackme/5ab77f5933c5d40ad448c46f) | GUI déobfusquée ; **séquence boutons vs wave** (`sub_40507f`) — `analysis/notes.txt` |
