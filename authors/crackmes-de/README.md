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
| 173 | [keygenning4newbies_crackme_2 by analyst](5ab77f5533c5d40ad448c1db/) | analyst | Windows PE32 GUI (Borland C++) | keygen sprintf 8 champs (nom+frame), `petik` → `1E29E126845-10107B90-42544815431080209-A3172A4` (Unicorn EBP=0x108000) |
| 174 | [keygenning4newbies_crackme_3 by analyst](5ab77f5533c5d40ad448c1dc/) | analyst | Windows PE32 GUI (MSVC) | keygen hash+stream A-Z xor EXPECTED ; `petik` → `A9OE24A8<7ªE;H27=?` (Unicorn hash) |
| 175 | [keygenning4newbies_crackme_5 by analyst](5ab77f5533c5d40ad448c1dd/) | analyst | Windows PE32 GUI (MSVC) keyfile | key.dat plain `K4N <label>` ; shellcode@405030 ; `petik` → hex `167000624d2236542c` → « Registered to: petik » |
| 176 | [pushpushme by synfo](5ab77f5533c5d40ad448c1de/) | synfo | Windows PE32 ASM tiny | patchme jmp esp → MessageBoxA « Well d0ne! » (`analysis/PushPushMe.patched.exe`) |
| 177 | [crackme1 by adamziaja](5ab77f5533c5d40ad448c1df/) | adamziaja | Linux ELF64 C++ | keygen ASCII stream ; `petikpet` → `11269116` |
| 178 | [codz_1 by codz30](5ab77f5533c5d40ad448c1e1/) | codz30 | Windows PE32 VB.NET | serial **`11223`** |
| 179 | [crackme_2 by thefox](5ab77f5533c5d40ad448c1e0/) | thefox | Windows PE32 MASM GUI | keygen stubs auto-modifiants ; `petik` → `C4CP-Z3DP` (Unicorn) |
| 180 | [damos_crackme_1_for_linux by damo2k](5ab77f5533c5d40ad448c1e6/) | damo2k | Linux ELF32 C | contraintes linéaires ; serial **`POFKPPEZAS`** |
| 181 | [damos_crackme_1_for_solaris by damo2k](5ab77f5533c5d40ad448c1e7/) | damo2k | Solaris ELF32 SPARC C | jumeau Linux ; serial **`POFKPPEZAS`** (Unicorn SPARC) |
| 182 | [damos_crackme_1_for_win32 by damo2k](5ab77f5533c5d40ad448c1e8/) | damo2k | Windows PE32 C (MSVC) | jumeau Linux ; serial **`POFKPPEZAS`** (wine) |
| 183 | [crackmehardestshell20110404 by xiayuanzhong](5ab77f5533c5d40ad448c1ef/) | xiayuanzhong | Windows PE32 C++ (MinGW) | déjà dépaqueté ; `reverse(name)+"_xyz"` ; `petik` → `kitep_xyz` |
| 184 | [xyz_keygenme20110505 by xiayuanzhong](5ab77f5533c5d40ad448c1f0/) | xiayuanzhong | Windows PE32 C++ (MinGW) | keygen `X3_` + `name[i%L]±i`, longueur Fibonacci ; `petik_` → `X3_pfvlo` |
| 185 | [xyz_keygenme20110405 by xiayuanzhong](5ab77f5533c5d40ad448c1f1/) | xiayuanzhong | Windows PE32 C++ (MinGW) | keygen caps@j·reps + non-maj + cycle xyz ; `Petik` → `Petikxyzxyzxyzx` |
| 186 | [babylon_keygenme by haiklr](5ab77f5533c5d40ad448c260/) | haiklr | Windows PE32 C (MinGW) | keygen spaced⊕(key+1)+rev ; `petik` → `1^66/` |
| 187 | [just_a_little_crackme by bratalarm](5ab77f5533c5d40ad448c251/) | bratalarm | Windows PE32 MASM32 GUI | complex keygen ; `petik` → `0000496D-…-01D0C35A` |
| 188 | [drpepur_6 by drpepur](5ab77f5533c5d40ad448c1fa/) | drpepur | Windows PE32 MASM32 GUI | keygen fsin ; `AA7NE3JT7Q` |
| 189 | [keygenme_drpepur_2 by drpepur](5ab77f5533c5d40ad448c1fb/) | drpepur | Windows PE32 MASM32 GUI | keygen CRC32 forge + nom PC + nom ; `petik` → `vtAgIIxM-8A8E9386-4873003B` |
| 190 | [drpepur_5 by drpepur](5ab77f5533c5d40ad448c1fc/) | drpepur | Windows PE32 MASM32 GUI | keyfile INI, Σ s[i]·3^(i+2) 64 bits ; `IIHIIGGGGIGHIGHHHGIHHHIHHHI820` (licence 15) |
| 191 | [enforcer039s_keygenme_1__arteam_cra by enforcer](5ab77f5533c5d40ad448c1fd/) | enforcer | Windows PE32 MASM32 GUI | keygen rol32(edx+c,i) + leurre anti-debug/CRC ; `petik` → `47730` |
| 192 | [crackme_2.0_by_c0de0f by c0de0f](5ab77f5533c5d40ad448c1ff/) | c0de0f | Windows PE32 VB6 natif | serial date `jj×mm×1440+aaaa` ; 2026-10-12 → `174826` |
| 193 | [crackme_1.0_by_c0de0f by c0de0f](5ab77f5533c5d40ad448c200/) | c0de0f | Windows PE32 VB6 natif | keygen : `Decrypt(serial) == nom`, serial = 3 clés + `Chr(Asc(c)+clé)` + clé ; `petik` → `@@@°¥´©«@` |
| 194 | [sams_crackme2 by samfisher9000](5ab77f5533c5d40ad448c201/) | samfisher9000 | Windows PE32 GUI (Delphi 7) | keygen : somme cumulée ajustée autour de `0x6E`, codes ASCII décimaux, fenêtres de 4 ; `petik` → `2013-4957-9575-5750-7505` |
| 195 | [sams_keygenme by samfisher9000](5ab77f5533c5d40ad448c202/) | samfisher9000 | Windows PE32 VB6 natif | keygen : `P` produit/carré des car. ajustés, `Q = Int(5v)·P/15`, fenêtres de 3 chiffres ; `petik` → `968-682-826-11-380-808-084-11` |
| 196 | [keygenme_0.72 by bswap](5ab77f5533c5d40ad448c203/) | bswap | Windows PE32 MASM, FSG 1.33 | keyfile registre : `Key 2 = f(Key 1)` (xadd/shrd) ; `petik` → `0x69746570` / `0xC8639391` (unpack Unicorn ; GOLD inatteignable) |
| 197 | [morgana_1.49 by bswap](5ab77f5533c5d40ad448c204/) | bswap | Windows PE32 MASM | serial 10 car. `AQ?6509???` (table XOR constante + `sub/bswap/sub`) ; `petik` → `AQp6509eti` |
| 198 | [ribbere_1.4 by bswap](5ab77f5533c5d40ad448c205/) | bswap | Windows PE32 MASM | clé auto-validante : `g(n[i],16-i) == g(n[i+4],12-i)` (i=1..4, `g = c+k`, bornes 0x21/0x7B) ; `petik` → `petiki7mo` |
| 199 | [crackme_0.68 by bswap](5ab77f5533c5d40ad448c20c/) | bswap | Windows PE32 MASM, FSG 1.31 | code d’entrée `c0=c11,c2=c9` ; key[3]=`r` ; key lavée → T constant, `repne cmpsw` : name[12:14]=`Tl` ; `petik` → `petikabcdtep` / `petik_petik_Tl` / `petr` |
| 200 | [super_funky_0.82 by bswap](5ab77f5533c5d40ad448c210/) | bswap | Windows PE32 MASM | keyfile glissé-déposé `Bswap.2003` (60 o : `Cool?Dude` + 8 octets de code + masques + checksum auto-référent) ; `petik`/`Paris` → « Registered!, Unlock code: AABSWAZPP » |
| 201 | [keygenme_0.51 by bswap](5ab77f5533c5d40ad448c211/) | bswap | Windows PE32 MASM, FSG 1.0 | moulinette du buffer nom (restes `iTisgrEattoby…` compris, émulée Unicorn) → 12 bits `0xc1<b<0xf0` ; clé = 1 car. + `'1'`/`'a'` ; `petik` → `xaa11111aa11a` |
| 202 | [little_man_1.45 by bswap](5ab77f5533c5d40ad448c213/) | bswap | Windows PE32 MASM | clic Register leurre (`or al,1`) ; test dans `WM_TIMER` : `key[5]=='-'` et (`key[6]=='8'` ou `key[7]=='S'`) ; `petik` → `petik-8S` |
| 203 | [assassination by bswap](5ab77f5533c5d40ad448c215/) | bswap | Windows PE32 MASM, packé (stub type FSG) | `serial[1..]-=4` puis même hash 30 tours que le nom avec `dword0−4` ⇒ `serial = le32(n0+4)‖name[4:]`, +4 sur les octets 1.. ; `petik` → `tixmo` |
| 204 | [a_small_crackme by bswap](5ab77f5533c5d40ad448c216/) | bswap | Windows PE32 MASM, FSG | nom = `GetUserNameA` ; `R = u0²+u1−u0` (FPU, dwords signés du nom) ; code 8 hex MAJ = `[L1, L0^4, L3, L2^4]` (L = 4 octets bas de R) ; `petik` → `2BFF8C39` |
| 205 | [sacredcrackme_5.0 by sacredlamat](5ab77f5533c5d40ad448c217/) | sacredlamat | Windows Win16 NE, Turbo Pascal (WinCrt) | `s = nom + 'Sorry, wrong!'` (sel caché) ; `serial = 0x15D + Σ(UpCase(c)+0x381)` en Integer ; `petik` → `17797` |
| 206 | [crackme_nop_vm by opcode0x90](5ab77f5533c5d40ad448c21a/) | opcode0x90 | Windows PE32 asm, mini-VM | VM 12 opcodes (nops sinon) ; `0x1337C0DE + Σ le32(buf[i..])` jusqu'au `\n` == `0x0A4F4CAB` ; poids `1/0x101/0x10101/0x01010101` ⇒ 3e octet = espace ; `Et petikfZ` (CRLF) |
| 207 | [crackme_nop by opcode0x90](5ab77f5533c5d40ad448c21b/) | opcode0x90 | Windows PE32 asm, stub copié + XOR | `XOR_{i=1..15} le32(buf[i..])` == `0x4D3E5732` ⇒ `XOR(b1..b15)=0x32`, `b16=b1^0x65`, `b17=b2^0x69`, `b18=b3^0x73` ; `XPPApetikAAAAAa0592` (vérif Unicorn, wine refuse le PE) |
| 208 | [fatmikes_crackme_2 by fatmike](5ab77f5533c5d40ad448c21c/) | fatmike | Windows PE32 MSVC6 GUI, UPX | `%X` de `Σ(nom)*0xDEADBEEF` → `serial[1,2,6,7,11,12,16,17]` ; 8 car. libres = `KEWL`+`SHIT`, clés XOR du code caché `0x409148` ; `petik` → `K95E-W2CL-S7FH-I13T` (wine) |
| 209 | [fatmikes_crackme1___fixed_version by fatmike](5ab77f5533c5d40ad448c21d/) | fatmike | Windows PE32 MSVC6 GUI, UPX, auto-modifiant | serial 13 car. = clé XOR de 48 octets écrits par `WriteProcessMemory` sur les NOP de `0x40141F` ; crib `MessageBoxA("Well done!")` ; hash ELF ne couvre que `dec[0..5]` ; `cip-kicks-ass` (wine) |
| 210 | [fatmikes_crackme1 by fatmike](5ab77f5533c5d40ad448c21f/) | fatmike | Windows PE32 MSVC6 GUI, UPX, auto-modifiant | version originale de la fixed version (seul `add esp,8` en `0x40141C` diffère) ; serial = clé XOR des 48 octets écrits sur les NOP de `0x40141F` ; `cip-kicks-ass` (wine) |
| 211 | [shortcut by kkr_we_rule](5ab77f5533c5d40ad448c220/) | kkr_we_rule | Windows PE32 Delphi 7 GUI, LockBox MD5/SHA-1 | serial `A-B` en base32 ; chaque moitié déchiffrée avec une clé tirée de `hex(nom)` doit valoir `H(SHA1(nom))` / `H(MD5(nom))` ; keygen par inversion octet par octet ; `petik` -> `5LZOX3PT535P6-7XWP36HM6P7PQ` (wine) |
| 212 | [asm_keygen_me_1 by kkr_we_rule](5ab77f5533c5d40ad448c222/) | kkr_we_rule | Windows PE32 ASM GUI (dump dépacké) | 4 champs décimaux ; `s1²+s2²+s3²+s4²` doit valoir `T = f(nom)` sur 10 bits (Lagrange) ; `petik` -> `0 0 0 0`, `am` -> `30 10 2 2` (wine) |
| 213 | [asm_keygen_me_2 by kkr_we_rule](5ab77f5533c5d40ad448c223/) | kkr_we_rule | Windows PE32 ASM GUI | serial `A-B` ; `A+B == K(nom)` (`g = h³-h` sur deux hashs 16 bits) et ni `A` ni `B` multiple de 3 (PGCD `idiv` signé) ; `petik` -> `2--2` (wine) |
| 214 | [red_crew_kgm1_by_kkr by kkr_we_rule](5ab77f5533c5d40ad448c22b/) | kkr_we_rule | Windows PE32 Delphi 2009 GUI | serial `A+B` (19 + 20 chiffres 1-9) ; `H(B)² mod H(nom) == H(A) mod H(nom)`, `H` = hash 64 bits par PGCD soustractifs (dernier car. ignoré) ; `petik` -> `7377844815588622487+47137769329314998558` (wine) |
| 215 | [kgm1 by kkr_we_rule](5ab77f5533c5d40ad448c22d/) | kkr_we_rule | Windows PE32 MASM32 GUI | serial hexa `w0-w1-w2` ; système linéaire 3×3 mod 499 sur `s1 = Σc`, `s2 = Σ(c·i)^i`, `s3 = s1+s2` ; `petik` -> `5-1DD-1BD` (wine) |
| 216 | [cyclone by double_zer0](5ab77f5533c5d40ad448c22e/) | double_zer0 | Windows PE32 ASM console | anti-debug callback TLS `0x401070` (`CloseHandle(0x3039)` sous SEH) ; `scanf("%d")` puis `ror(v,17) == 0x554F0000` → `v = rol(0x554F0000,17)` ; `43678` (wine) |
| 217 | [flatlines_crackme_1 by flatline](5ab77f5533c5d40ad448c22f/) | flatline | Windows PE32 Delphi 2010 GUI | `h = sha1_hex(nom)` privé de chaque car. du nom (`StringReplace`, `rfIgnoreCase`) ; `Trim(serial) == AnsiUpperCase(h)` ; `petik` -> `CA5DF7F105D63588C60ABB69A52014FCF927C95` (wine) |
| 218 | [ncn by eslimasec](5ab77f5533c5d40ad448c230/) | eslimasec | Linux ELF32 C (GCC 3.4) | chiffreur : `SEMILLA = rand()%62` en clair dans `cifred[1]`, case suivante = 1re libre à `newpos+3` (circulaire), `min[(SEMILLA+idx(c)+5k)%62]` ; Readme -> `Esto no es una contrasena cifrada cualquiera, sino una especial` (binaire, `rand()` figé) |
| 219 | [renascense_crackme by skapunky](5ab77f5533c5d40ad448c233/) | skapunky | Windows PE32 VB6 natif GUI | `On Error Resume Next` ; `a(i)=Asc(Mid(ID,i+1,1))` i=0..7 (manquants = 0) ; password = `"ska" & Σa(i) & a(0)*3 & a(7)*5` ; `petik` → `ska5413360` (wine) |
| 220 | [crackme_and_eatme_1 by mghty_kng](5ab77f5533c5d40ad448c235/) | mghty_kng | Windows PE32 AutoIt v3 (EA06) | script via `autoit-ripper` ; serial = `Σc & "-" & UPPER(nom[:3]) & -Σc & "-" & 1/Πc` (double `%.15g` MSVC, exposant 3 chiffres) ; `petik` → `541-PET-541-6.78312058319816e-011` (wine) |
| 221 | [knights_crackme1 by knight](5ab77f5533c5d40ad448c245/) | knight | Windows PE32 MSVC 6 GUI (UPX 1.25) | serial `HHHH-HHHH-HHHH`, `A > B > C >= 0x1000` ; `h = Σ ((c^0xAA)*(c>>4)²) << 4*(i&1)` ; récursion `0x401022` : `h` atteignable par multiples de `{A,B}` et `{B,C}` (B diviseur de h suffit) ; `petik` → `FFFF-32CB-1000` (wine) |
| 222 | [crackme_7 by fr1c](5ab77f5533c5d40ad448c247/) | fr1c | Windows PE32 Delphi GUI (UPX 0.94) | nag + Register grisé (réactivation tolérée) ; pour chaque c : `chr((c*99^6)+s1+s3)` + `chr(c+4n+s1+s2+s3-4)`, puis `chr((s2^n)+3+GetForegroundWindow())` ; `petik` → `24C2D7B7A8C66BBB35BD` + `0x74+hwnd` (keygen live, wine) |
| 223 | [crackme_2 by fr1c](5ab77f5533c5d40ad448c248/) | fr1c | Windows PE32 VB5 natif GUI | `Form_Load` : `m_serial = "988535"` ; `Command1_Click` : `__vbaStrCmp(Text2.Text, m_serial)`, nom ignoré ; `petik` → `988535` (wine) |
| 224 | [crackme_5 by fr1c](5ab77f5533c5d40ad448c249/) | fr1c | Windows PE32 VB5 natif GUI | 10 CheckBox, `Command1_Click` = ET de 10 tests `Value == 1/0` (piège `xor eax,eax` avant le dernier) ; cocher **3 4 7 8 10** (pas de nom ; wine : REGISTERED) |
| 225 | [crackme_8 by fr1c](5ab77f5533c5d40ad448c24a/) | fr1c | Windows PE32 MFC/VC++6 GUI, UPX 1.02 | keygen : `upx -d`, serial = `%d` de `(rol32(((sum+len)^len)>>1 - 74990, 1) >> 2) - 50000000 + sum - 0x41` + `Q_W65` ; **petik → 1023704942Q_W65** (wine : Nice, you done it!) |
| 226 | [crackme_6 by fr1c](5ab77f5533c5d40ad448c24b/) | fr1c | Windows PE32 VB5 natif GUI | nag + bouton grisé ; clé = `Hex(Asc(c))` concaténés (majuscules, 1er clic seulement) ; **petik → 706574696B** (wine : Very good!) |
| 227 | [crackme_1_1 by fr1c](5ab77f5533c5d40ad448c24c/) | fr1c | Windows PE32 C++ Builder GUI | serial constant `LStrCmp(Edit1.Text, "F988f91")` ; nom non demandé ; **petik (ignoré) → F988f91** (wine : Very good!) |
| 228 | [crackme_3 by fr1c](5ab77f5533c5d40ad448c24d/) | fr1c | Windows PE32 VB5 natif GUI | `Open "crackme3.key"` + `Input #1` + `__vbaVarTstEq` vs `98765432112345` ; **fichier → REGISTERED** (wine) |

| 229 | [fjlj_crackme_2 by fjlj](5ab77f5533c5d40ad448c252/) | fjlj | Windows PE32 MinGW console, SMC | SMC @ `0x43F200+sum8(name)` ; `checksum(serial)+0x4D6 == SMC` ; **petik→UM** (wine) |
| 230 | [fjlj_crackme_3 by fjlj](5ab77f5533c5d40ad448c253/) | fjlj | Windows PE32 MinGW console | serial = weird_hex(`0x401404+Σname`) ‖ alphabet_index ; **petik→1612BDBE** (wine) |
| 231 | [nev_crackme by nevyn](5ab77f5533c5d40ad448c258/) | nevyn | Windows PE32 Delphi 7 GUI | `Edit1^0x17 == C1` puis re-XOR `== "htContext"` ; **htContext** (wine: Well done!) |
| 232 | [xdstylas_crackme_1 by xdstyla](5ab77f5533c5d40ad448c25a/) | xdstyla | Windows PE32 MSVC2008 console (pas VB) | `cin>>s ; s^0x14 == "loludiditcongratz"` ; **x{xap}p}\`w{zsfu\`n** (wine: Right) |
| 233 | [crackme_delphi_1.0 by defc0n1](5ab77f5533c5d40ad448c25b/) | defc0n1 | Windows PE32 Delphi 2009 GUI | `Insert1.Text == "burninhell"` (_UStrEqual, UnicodeString) ; **burninhell** (wine: Contraseña aceptada) |
| 234 | [crackme_delphi_2.0 by defc0n1](5ab77f5533c5d40ad448c25c/) | defc0n1 | Windows PE32 Delphi 2009 GUI | `Edit2Change` k=809, Submit k-=9 ; `"Kevin"` / `"kevin"+IntToStr(k)` ; **Kevin / kevin800** (wine: Hello Kevin) |

| 235 | [impostors_crack_me_0.5 by impostor](5ab77f5533c5d40ad448c25d/) | impostor | Windows PE32 Delphi 6–7 console | patchme : `mov eax` @`0x404229` `0x40446c`→`0x404290` (Unregistered→Registered), 5 octets @fichier `0x3629` ; wine : `[*] Registered ...` |

| 236 | [hysteria_crackme by haiklr](5ab77f5533c5d40ad448c25e/) | haiklr | Windows PE32 MASM32 GUI | keyfile `hex((CRC32&~0xFF)|name[0])` + A/B/C vs P=(CRC%99,(CRC%99)^0x2007) ; **petik→eafb870** (wine: Congratz) |
| 237 | [baby_crackme_2 by haiklr](5ab77f5533c5d40ad448c261/) | haiklr | Windows PE32 MASM32 GUI | keyfile `BC#2` : `0a..0e` (10²+11²+12²=13²+14²) + `CD` + `#S` (carré parfait FPU) (wine: Winneur !) |
| 238 | [baby_crackme_1 by haiklr](5ab77f5533c5d40ad448c262/) | haiklr | Windows PE32 MASM32 GUI | serial 29 car. `123490798638;1061110611203486` (N3=7·N1, N4=d4·N1, N5=d7·N1, N6=N5+10·N3+1000·N4) (wine: Winneur !) |

| 239 | [gloops_crackme by haiklr](5ab77f5533c5d40ad448c263/) | haiklr | Windows PE32 MASM32 GUI | keyfile `gl00ps.nas` 12 octets `(0,34,15)(12,2,35)(6,18,25)+parfait 8128` (wine: GOOD BOY) |

| 240 | [mms_crackme by haiklr](5ab77f5533c5d40ad448c264/) | haiklr | Windows PE32 MASM32 GUI | serial `_!Q$` → hash `0x80D1F55F` (%X) (wine: M&M's owned !) |

| 241 | [old_keygenme_2010 by zaas](5ab77f5533c5d40ad448c267/) | zaas | Windows PE32 MSVC6 GUI | `petik` / `QQRR` + Shift+3 (`#`) : Σs[:4]+4n0+3n1+2n2+n3=0x586 → div/0 sous SEH (wine: Well done!) |
| 242 | [hades by j](5ab77f5533c5d40ad448c26f/) | j | Windows PE32 MinGW GUI (UPX) | `petik` / `be8dec23-682dfa20-d668b0ce-d1c13067` : RC5-32/10 ×4 (clés+cible dérivées du nom via pow x87/3-Way/GOST) (wine: Solved!) |
| 243 | [mayhems_crackme_3 by mayhem](5ab77f5633c5d40ad448c272/) | mayhem | Windows .NET WinForms | `petik` / `107108637445` : ord(name[-1]) ‖ 9·len+63 ‖ 63 ‖ Σ ASCII(SHA512(name) hex MAJ) (wine: Good boy!) |
| 244 | [c_crackme_2 by mayhem](5ab77f5633c5d40ad448c274/) | mayhem | Windows PE32 MSVC2010 MFC GUI | `petik` / `5h25` : hash(nom)=Σ 60·c·T[i]+0x699 mod 2^32 écrit en base 62 `a-z0-9A-Z`, poids faible en tête (wine: Valid Serial! Well Done.) |
| 245 | [mishka_tribute by zart](5ab77f5633c5d40ad448c277/) | zart | Windows PE32 MSVC6 console (+musique XM) | `petik` / `3649375339` : nom = Σ append(i, c) (`ettiiikkkk`), hash a=a·m+c, m·=0x6E6FA (m0=0x43BA) mod 2^32, serial décimal (wine: Serial checked out) |
| 246 | [zi___crakme by zionz](5ab77f5633c5d40ad448c278/) | zionz | Windows PE32 Blitz3D GUI | serial `AX943` : constante `__bbStrConst` + `__bbStrCompare` dans le code Blitz en `.rsrc` (wine: WELL DONE!) |
| 247 | [zi___crakme_v2 by zionz](5ab77f5633c5d40ad448c279/) | zionz | Windows PE32 Blitz3D GUI | keygen 5 chars : `((((a+b+d)*c)+e)+a+e)*e+d` ; **petik→3982003** (wine: SERIAL CORRECT!) |
| 248 | [hypercrackme by thehyper](5ab77f5633c5d40ad448c27f/) | thehyper | Windows PE32 Win32ASM GUI (UPX modifié) | serial unique **1348781387** = 23·29·31·37·41·43, somme des chiffres 50 = ID du menu « Register » |
| 249 | [hypercrackme6 by thehyper](5ab77f5633c5d40ad448c281/) | thehyper | Windows PE32 VC++6 (code chiffré en couches, SEH, checksums) | serial lu dans le presse-papiers ; keygen srand/rand MSVC → `G......c` + hash 0xd780 ; ex. **PETI-KPET-IKPE-eQpY-RDVV** |
| 250 | [hypercrackme2 by thehyper](5ab77f5633c5d40ad448c285/) | thehyper | Windows PE32 Win32ASM GUI (UPX, routine XOR 0xFF) | boutons 0..9 ; exactement 3 diviseurs Armstrong dans [300,1000] (370/371/407) → serial **1509970** = lcm ; menu « Register » ID 50 |
| 251 | [hypercrackme3 by thehyper](5ab77f5633c5d40ad448c286/) | thehyper | Windows PE32 Borland C++ (ASPack, dump mémoire wine) | keygen : serial = code ASCII décimal de chaque car. du nom (maj.), lu par paires ; **petik→8069847375** |
| 252 | [crackme_2 by cobrasniper555](5ab77f5633c5d40ad448c288/) | cobrasniper555 | Windows PE32 MinGW C++ GUI (registre HKCU\Software\Cobra) | keygen `REG-%X-%X-KEY` de (A, A+C), mix(t)=((t^0x12c)*5)&0xf0f0f0f0 ; **petik→REG-D0-190-KEY** |
| 253 | [keygenme_1 by cobrasniper555](5ab77f5633c5d40ad448c289/) | cobrasniper555 | Windows PE32 MinGW C++ GUI | keygen `c0-%X(A)-%X(B)`, A=0x87654321−Σc·66·(c^5), B=A·((c0·650)^0xC) ; **petik→p-8729D38D-6C55AB7C** (le binaire ne teste que le 1er octet ; Source.zip = `43`) |
| 254 | [keygenme_1 by chaak](5ab77f5633c5d40ad448c28a/) | chaak | Windows PE32 MinGW GUI | labyrinthe 13×13 : `CKGM1<k1><k2>-` + 16 paires (A1'[x],A2'[y]) alphabets tournés, départ col. 0, pas ↑↓→ ; **CKGM1AB-ABCBEBGB-IBIDKDMD-MBOBQBSB-UBWBWDYD** |
| 255 | [keygenme_conflux1 by conflux](5ab77f5633c5d40ad448c28b/) | conflux | Windows PE32 MinGW C++ console | `abcdef-goodx` + lettre `'a'+rand()%26` après `srand(time(NULL))` (LCG msvcrt) → calculée à la seconde près |
| 256 | [crackme_1 by rammy](5ab77f5633c5d40ad448c28d/) | rammy | Windows PE32 MASM GUI, ASPack | keygen : code auto-modifiant (`lstrcmpA(gen(name), serial)`), `'R'` + map(octets de `4·Σ·(F(Σ)+1)+F(200)`), F = Fibonacci réduit ≤200 ; **petik→R8~9** |
| 257 | [easyone___nameserial by therapy](5ab77f5633c5d40ad448c28f/) | therapy | Windows PE32 MinGW C GUI | keygen `serial[i] = '0' + (c − isqrt(c)² + i²) % 10` (isqrt par dichotomie), longueur = nom ≥ 5 ; **petik→22043** |
| 258 | [therapy039s_crackme_1 by therapy](5ab77f5633c5d40ad448c290/) | therapy | DOS COM 16 bits (code chiffré + junk jumps) | mot de passe = multiensemble : h×2 T×3 q×1 %×2 7×4 6×2 2×1, ordre libre (≤19 car.) ; ex. **hhTTTq%%7777662** (DOSBox: correct password) |
| 259 | [password_check by therapy](5ab77f5633c5d40ad448c291/) | therapy | Windows PE32 MinGW C GUI (crackme #2 FindMe) | 3 conversions hex (alphabet `0-9@A-E`), `0xFF−H3[i]` = table 120 octets @0x40201a ; mot de passe unique **yeS yoU diD iT!** (wine: CORRECT) |
| 260 | [a_c_c_m by acid_crack](5ab77f5633c5d40ad448c29d/) | acid_crack | Windows PE32 VB6 natif GUI (A_C_Crack_me!) | clé = f(`Day(Date)`) : A=2d², B=2A, C=6A, D=C², `"31512"&D&"41610"&A&"24209"&C&"303711"&B` ; le 14 : **31512553190441610392242092352303711784** (wine: K.O.!!U WIN$) |
| 261 | [matrix_acid_crack by acid_crack](5ab77f5633c5d40ad448c29e/) | acid_crack | Windows PE32 VB6 P-code GUI (Matrix) | serial fixe = `CStr(LitI4 0x00024EA2)` (relay Wine : VarBstrFromI4 → VarBstrCmp) ; **151202** (wine: Nice job cracker...) ; `Acid_Crack` = easter egg |
| 262 | [andsoon_crackme1 by andsoon](5ab77f5633c5d40ad448c2a3/) | AndSoOn | DOS MZ Turbo Pascal 7 (CRT) | keygen `s=Σ UpCase(nom) ^ 0x31337 ; (s div 10)*20 + 0x5EFC051A` ; `petik`→**1593977262** (DOSBox: Good job cracker.) |
| 263 | [guys_first_crackme by guy_](5ab77f5633c5d40ad448c2a4/) | Guy | Windows PE32 C++/CLI mixed-mode (.NET 2.0 + natif) | keygen `getserial` natif 0x402410 : `((c^0x33)<<1)^0x89`, shl<'A', sar>'z', sinon '1' ; `petik`→**xJpzr**, `John`→`1b1f` (code original exécuté sous Unicorn ; GUI KO sous Wine) |
| 264 | [cryxenet_0.01a by tfb](5ab77f5633c5d40ad448c2a8/) | tfb | Windows PE32 VB.NET 1.1 (UnpackMe Cryxe, Dotfuscator) | unpack `cryxed.dll` : `((b-1)&0xFF)^0x25` ; keygen `Base64(AES-256-CBC(nom))`, clé = Customer ID + `X` jusqu’à 32, IV fixe ; `petik`/`1337`→**vZTpXAO4f3DA2UcpwcWRZg==** (prédicat vérifié sous .NET 8) |
| 265 | [gulcrackme_1 by gul](5ab77f5633c5d40ad448c2b0/) | gul | Windows PE32 MSVC 6 GUI (patchme + hash ELF de `.text`) | patch `0x40135E` `mov ecx,1`→`0` + recalcul `[0x402064]`=**0x0B8BA810**, `[0x402068]`=hash⊕`0x4011C1` → « Well done. Congratz! =D » (vérifié Wine relay) |
| 266 | [crack_me_01 by dynsym](5ab77f5633c5d40ad448c2b7/) | dynsym | Linux ELF32 C (GCC 3.3.5, ptrace TRACEME) | password argv[1] : `repz cmpsb` 10 octets vs `.rodata` 0x80485d4 = **`__gmon_sta`** (début de `__gmon_start__`) ; `./crackme1 __gmon_start__` → « [!] Solved! » (vérifié en natif) |
| 267 | [qhfs_crackme1 by qhf](5ab77f5633c5d40ad448c2bd/) | qhf | Windows PE32 MinGW C++ console | keygen alphabet 37 ; `petik`→**PPPEEETTTIII** (wine: Good job) |
| 268 | [full_patchme by qhf](5ab77f5633c5d40ad448c2be/) | qhf | Windows PE32 MinGW GUI (dialog) | patchme : 4 patches `.text` + 4 `.rsrc` (nags, Save activé/renommé, listbox, About, caption) (wine: chk.exe) |
| 269 | [asm_is_fun by qhf](5ab77f5633c5d40ad448c2bf/) | qhf | Windows PE32 NASM console | keygen (c±…)^k en `%x` + f→q 1→H 5→z ; `petik`→**7dz479z8zed** (wine: Thanks for registering!) |
| 270 | [qcrk_1](5ab77f5333c5d40ad448c0f7/) | qnix | Linux ELF32 (packé) | patch-me : `jne` @0x8048514 → NOP (aucune clé possible, skey 60 car. vs strncpy 10) |
| 271 | [linux_crackme_v1](5ab77f5433c5d40ad448c169/) | veneta | Linux ELF32 NASM | `Mudvay(!` (z3 sur 4 dwords, rcr/rcl 33 bits) |
| 272 | [linux_crackme_v2](5ab77f5433c5d40ad448c16b/) | veneta | Linux ELF32 GTK1 (UPX) | name `3474fb45…a23c` (hex), serial libre ≥3 (`petik`) |
| 273 | [easy_math_keygenme](5ab77f5633c5d40ad448c2d5/) | cyrex | Linux ELF32 statique (UPX) | keygen `petik`→`0x78-20-20-0xfffffff2` (%p-%x-%x-%p) |
| 274 | [linux_crackme](5ab77f5633c5d40ad448c2d6/) | cyrex | Linux ELF32 | `47ghf6fh37fbgbgj` (strcmp en clair) |
| 275 | [linux_crackme_02](5ab77f5633c5d40ad448c2d7/) | cyrex | Linux ELF32 (strippé) | `7gb5fjf8v4bg8fb34f` + fichier `/tmp/crackme_89nfnjfiefheufeue` existant |
| 276 | [drscm3](5ab77f5733c5d40ad448c307/) | drspliff | Linux ELF32 statique (MT19937) | ID `123` + licence `7sd9gwigE` |
| 277 | [first_keygenme](5ab77f5733c5d40ad448c363/) | twistedtux | Linux ELF32 (strippé) | keygen `petik`→`uipJXY` |
| 278 | [gtk_k3yg3nme](5ab77f5733c5d40ad448c37f/) | gtksor | Linux ELF32 GTK2 (anti-debug rdtsc) | keygen `petik`→`1513675274255` (Σ c^(i+2) 64 bits) |
| 279 | [1337_arm](5ab77f5733c5d40ad448c380/) | gtksor | Linux ARM ELF32 statique | `ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_` (retourne 0x539) |
| 280 | [exceptional](5ab77f5833c5d40ad448c39a/) | crp | Linux ELF32 C++ (exceptions) | keygen `petik`→`61450` (len(key)=len(name)>=4) |
| 281 | [bf](5ab77f5833c5d40ad448c39b/) | crp | Linux ELF32 (keyfile brainfuck) | keyfile `key.bf` BF imprimant 3·H(user) en décimal (+NUL) ; petik→8692167 |
| 282 | [cm1](5ab77f5833c5d40ad448c3f5/) | lagalopex | Linux ELF32 (fichier-clé ~/.key_user) | keyfile `~/.key_petik` : ops *+-/ sur accumulateur puis `,<octet>` par caractère |
| 283 | [facets](5ab77f5833c5d40ad448c411/) | monads | Linux ELF32 (code auto-modifiant) | argument `7` (tout n & 0xffff == 7) |
| 284 | [crackme_1](5ab77f5933c5d40ad448c48a/) | batman10 | Linux ELF32 C++ | keygen `petik`→`u`qln` (pass[i]=name[i]^5) |
| 285 | [easy_celen](5ab77f5a33c5d40ad448c4da/) | s4t4y | Linux ELF32 statique (ptrace) | flag `the_flag_is_arip_power` (22 mov byte sur la pile ; affiché si [esp+0x14]==0x400) |
| 286 | [crackmejenny](5ab77f5a33c5d40ad448c4ed/) | sraboy | Linux ELF64 (code auto-modifiant) | `./release jenny@8675309` → 13284645-2427364-104376652 |
| 287 | [infector_unpackme](5ab77f5a33c5d40ad448c4f6/) | macabre | Linux ELF32 KDE3/Qt3 (GUI) | mot de passe Infector `breed` (Π signed char == -1488344688, 5 car.) ; hôte = XOR clé répétée |
| 288 | [easy_crackme_1](5ab77f5a33c5d40ad448c507/) | stefanie | Linux ELF32 (sans sections) | fichier `LiuYiFei_143` (5 octets) + argv[1]≥10 car. avec s[0]+s[2]+s[4]=330 |
| 289 | [ps3crackme1](5ab77f5a33c5d40ad448c4f9/) | macabre | Linux PPC64 + SPU (PS3) | keygen `petik12`→`00f00o3` (serial[i]=T[Σ(2u^4u) mod 14], T=jxzilaoq013-fs) ; statique |
| 290 | [arm_crack1](5ab77f5a33c5d40ad448c52b/) | blankwall | Linux ARM Thumb-2 | mot de passe `this_is_flag` (littéral `TU_KU_KRXMS + 20 ; le littéral brut est un leurre) |
| 291 | [kde_enableme1](5ab77f5a33c5d40ad448c4fb/) | macabre | Linux ELF32 KDE3/Qt3 (GUI) | patch : NOP `call [eax+0x54]` (setEnabled(false)) @0x804cb5b et @0x804cddb |
| 292 | [k_genme](5ab77f5a33c5d40ad448c4fa/) | macabre | Linux ELF32 KDE3/Qt3 (GUI) | keygen `petik`→-2141864799 / -547 / -8189260 (3 champs, statique) |
| 293 | [jandepora](5ab77f5b33c5d40ad448c5c2/) | esn_min | Linux (source C, 8 processus/pipes) | keygen : mot de 43 car. {a,b,c} = chemin d'un DFA 8 états avec #b=n%17+1, #c=n%16+1 ; `petik`→a×37 b×3 c a b c |
| 294 | [pof_kgme_0x01](5ab77f5a33c5d40ad448c532/) | pof_es | Linux ELF32 (gzexe) | mot de passe `796666880` ((n>>8)==0x2f7c2c, n pair, somme chiffres == 56) |
| 295 | [sys_linux_crackme](5ab77f5c33c5d40ad448c637/) | syscalo | Linux ELF32 (strippé) | serial hexadécimal `731940` (scanf %x ; octet2=0x73, x&0x1f00=0x1900, q=7) |
| 296 | [var](5ab77f5b33c5d40ad448c5b3/) | unchapelierfou | Linux ELF64 statique | flag `Flag_Over_Here_Dude` (movabs 'Flag_Ove'+'r_Here_D'+'ude' ; strcmp) |
| 297 | [eyecandylocked](5ab77f5b33c5d40ad448c563/) | nexy | Linux ELF64 C++ (ptrace) | mot de passe `d00r1$m@licious` (14 premiers car. comparés à un tableau d'int) |
| 298 | [ritz_crackme_for_linux](5ab77f5c33c5d40ad448c638/) | nobody | Linux ELF32 NASM (fichier keykey) | fichier `keykey` (20 octets K) + serial `petikAAAA123456@AAA` (B^D=1) |
| 299 | [blaad](5ab77f5c33c5d40ad448c639/) | nobody | Linux ELF32 Qt 1.44 (GUI) | serial `219576501436587` (15 car., le 8e libre) ; émulé unicorn |
| 300 | [xrockmr](5ab77f5d33c5d40ad448c69f/) | synamics | Linux ELF32/64 (anti-debug killall) | mot de passe `hello` (fgets 8 ; password[4]=='o' ; _finit_ teste 'hell') |
| 301 | [kylix_crackme](5ab77f5e33c5d40ad448c728/) | warleyalex | Linux ELF32 Kylix (CLX) | mot de passe `warleyalex` (Pascal string ^0xff ; LStrCmp) |
| 302 | [keygen_1](5ab77f5e33c5d40ad448c744/) | tvk6843 | Linux ELF32 C++ (dépend de l'heure) | keygen horaire `petik` (4 mots 32 bits, alphabet qwE1tym5BvCX70fG) ; serial valable dans la minute |
| 303 | [keygen](5ab77f5e33c5d40ad448c745/) | tvk6843 | Linux ELF32 C++ (dépend de l'heure) | keygen horaire `petik` : 3 mots 32 bits (alphabet 0123456789AbCdEf) ; succès = « 6 + 29 = 35 » |
| 304 | [crackme04](5ab77f5e33c5d40ad448c78a/) | seveb | Linux ELF32/64 (auto-suppression) | serial concaténé de 7 valeurs %d (pid=1337, heure 13:37) ; l'échec supprime le binaire |
| 305 | [crackme1](5ab77f5e33c5d40ad448c78b/) | seveb | Linux ELF32/64 | nombre secret `69118105108122111110101` ('69' + ASCII décimaux de vilzone) |
| 306 | [crackme05](5ab77f5e33c5d40ad448c78c/) | seveb | Linux ELF32/64 | serial 19 car. `0zz0-bcda-aefb-0yy0` (rock/paper/scissors/cracker) |
| 307 | [crackme2](5ab77f5e33c5d40ad448c78d/) | seveb | Linux ELF32/64 | serial `da-1003-08X32-aaaa-da` (N∈{1003,1023,…,1983}) |

## Mis de côté (PARKED — y revenir)

| Titre | ID | Blocage / reprise |
|---|---|---|
| [bugger_v.7](5ab77f6633c5d40ad448cc25/) | [`…cc25`](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc25) | RC6 OK ; **clé** + wake shell `abcdefgh` — `analysis/notes.txt` |
| [meloquynthe](5ab77f5933c5d40ad448c46f/) | [`…c46f`](https://crackmes.one/crackme/5ab77f5933c5d40ad448c46f) | GUI déobfusquée ; **séquence boutons vs wave** (`sub_40507f`) — `analysis/notes.txt` |
| [ha_ck](5ab77f5733c5d40ad448c34a/) | [`…c34a`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c34a) | shc 3.8 : clé RC4 dérivée de `stat(/bin/bash)` de la machine d'origine (rlax=0) — `analysis/notes.txt` |
| [rbx_crackme_8](5ab77f5833c5d40ad448c41f/) | [`…c41f`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c41f) | FreeBSD 5.3 ; serials 1/2 = `sprintf("%f.%f", x)` avec 2ᵉ double lu sur la pile (non initialisé) — `analysis/notes.txt` |
