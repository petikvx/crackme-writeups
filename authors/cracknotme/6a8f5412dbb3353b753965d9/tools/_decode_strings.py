#!/usr/bin/env python3
"""Decode CFM #777 (The Stochastic Casino) UI strings from Hex-Rays decryptors.

Pattern (absolute index i):
  v = enc[i] ^ ((((i + ADD) & 0xffff) >> 8) + 90)
  out[i] = ((i + LEFT) & 0xff) ^ ((17 * i + MUL) & 0xff) ^ ROL8(v, 5)

Unrolled loops use block_base v2 with MUL offsets that match absolute i.
argc>999 honeypot flag is FAKE (not a real win).
"""
from __future__ import annotations

import struct
from pathlib import Path

HERE = Path(__file__).resolve().parent
# Prefer repo analysis/; if missing (e.g. script copied to Desktop), write beside the script.
_ANALYSIS = HERE.parent / "analysis"
OUT = (_ANALYSIS / "decoded-strings.txt") if _ANALYSIS.is_dir() else (HERE / "decoded-strings.txt")


def rol8(v: int, n: int = 5) -> int:
    v &= 0xFF
    return ((v << n) | (v >> (8 - n))) & 0xFF


def decode(enc: bytes, add: int, left: int, mul: int, length: int) -> str:
    out = bytearray(length)
    for i in range(length):
        v = enc[i] ^ ((((i + add) & 0xFFFF) >> 8) + 90)
        out[i] = (
            ((i + left) & 0xFF)
            ^ ((17 * i + mul) & 0xFF)
            ^ rol8(v, 5)
        ) & 0xFF
    return out.split(b"\x00", 1)[0].decode("utf-8", errors="replace")


def i32(*vals: int) -> bytes:
    return b"".join(struct.pack("<i", v) for v in vals)


def i16(v: int) -> bytes:
    return struct.pack("<h", v)


def i8(v: int) -> bytes:
    return struct.pack("<b", v)


def u64(*vals: int) -> bytes:
    return b"".join(struct.pack("<Q", v & 0xFFFFFFFFFFFFFFFF) for v in vals)


def main() -> None:
    entries: list[tuple[str, str]] = []

    def add(label: str, text: str) -> None:
        entries.append((label, text))

    # --- standalone decryptors (enc embedded) ---

    add(
        "sub_140003A10 (banner)",
        decode(
            i32(
                110552662,
                1154770325,
                43148243,
                -951000943,
                93775447,
                1137992853,
                26370771,
                -950542191,
                110552662,
                1087399831,
                43147729,
                -984292205,
                127329877,
                1104175255,
                59925201,
                -984226669,
                110552662,
                1087398289,
            )
            + i16(-30102),
            add=-1762,
            left=30,
            mul=-125,
            length=0x49,
        ),
    )

    add(
        "sub_140004470 (banner)",
        decode(
            i32(
                1754999738,
                781806072,
                -308334658,
                731638909,
                1922640570,
                1971675754,
                -560134955,
                1100709382,
                180030448,
                1184888274,
                1230964414,
                899540713,
                1864865286,
                697919736,
                -342152518,
                782101628,
                1755262910,
                714697208,
            )
            + i16(10987),
            add=10069,
            left=85,
            mul=18,
            length=0x49,
        ),
    )

    # sub_140003B10 → sub_140007850
    add(
        "sub_140003B10/sub_140007850 (banner)",
        decode(
            i32(
                -1236871353,
                -264187583,
                893571907,
                -163195580,
                -1337469114,
                -2017700032,
                2011222982,
                1440601454,
                -1157379012,
                -385256742,
                -1370503101,
                -197220851,
                909520578,
                -264122046,
                910677824,
                -196815547,
                -1304243389,
                -264187583,
                893835079,
            )
            + i16(-11243),
            add=28308,
            left=-108,
            mul=69,
            length=0x4D,
        ),
    )

    add(
        "sub_140003FB0 (banner)",
        decode(
            i32(
                412032879,
                445192616,
                478878698,
                512564652,
                1079189359,
                1367415106,
                1713281155,
                93204439,
                -1918628699,
                1743685575,
                1502681679,
                871004833,
                530916380,
                493241463,
                462101226,
                428415144,
                495853166,
                462167213,
            )
            + i16(7098),
            add=-18209,
            left=-33,
            mul=80,
            length=0x49,
        ),
    )

    add(
        "sub_140004250 (banner)",
        decode(
            i32(-1878937146)
            + i32(
                -767315200,
                -1796280935,
                -732052145,
                -1305861236,
                42508547,
                916911941,
                790048133,
                -396123208,
                2127151928,
                207562574,
                550878564,
                -362230822,
                -25781983,
                -464775345,
                432660285,
                177978282,
                -52089526,
                -1097343644,
                -934176330,
                -500508184,
                -63636163,
                -431085713,
                -1044784327,
                -22824024,
                1313709412,
                11001318,
                1790048712,
                -428076120,
                -1238493883,
                2035969605,
            )
            + i16(-19886),
            add=20994,
            left=2,
            mul=111,
            length=0x7D,
        ),
    )

    add(
        "sub_140004570 (banner)",
        decode(
            i32(
                1274546329,
                234506971,
                -813757283,
                158977630,
                1274742936,
                234703578,
                -829463308,
                587953116,
                -916424005,
                232150737,
                -820550019,
                158976088,
                1274743450,
                234704092,
                -931197282,
                226085208,
                1274809501,
                167398107,
            )
            + i16(2504),
            add=-13247,
            left=65,
            mul=-106,
            length=0x49,
        ),
    )

    add(
        "sub_140004730 (banner)",
        decode(
            i32(
                -213659070,
                910545988,
                1892112326,
                851530176,
                -196881598,
                910546244,
                1891653575,
                851595713,
                -179973566,
                910677060,
                1891717574,
                851661760,
                -196750014,
                910677828,
                1891652033,
                851596227,
                -146287034,
                843437124,
            )
            + i16(-5509),
            add=-30848,
            left=0x80,
            mul=-55,
            length=0x4A,
        ),
    )

    add(
        "sub_1400064A0 (prompt / rules)",
        decode(
            u64(
                0x8E33B5B97ECC6FD,
                0x8C04EE4614A979D8,
                0x133BA8588906FD14,
                0x359C94CE572612CA,
            )
            + i32(-1690071972, 147435898, -1903227230, -427956818)
            + i16(-28553),
            add=-32301,
            left=-45,
            mul=76,
            length=0x31,
        ),
    )

    add(
        "sub_140003EB0 (banner)",
        decode(
            i32(
                1546087248,
                -1251208098,
                -523671403,
                815900872,
                1554884584,
                84805492,
                450020267,
                1344840129,
                1456946583,
                -1157323691,
                1487610403,
                1434597704,
                1053129870,
                -804251730,
                308982137,
                504646579,
                648961413,
                -349663113,
            )
            + i16(-18086),
            add=2838,
            left=22,
            mul=-21,
            length=0x49,
        ),
    )

    add(
        "sub_140004670 (input prompt)",
        decode(
            i32(
                649993647,
                -892709379,
                290604003,
                1733566584,
                634158975,
                -489452300,
                844866408,
                -856310470,
                -199393308,
            )
            + i16(8884),
            add=29357,
            left=-83,
            mul=-102,
            length=0x25,
        ),
    )

    # --- phase strings (buffer decryptors) ---

    add(
        "sub_140006210 (phase)",
        decode(
            u64(
                0xDB23B49DFFE4CCD7,
                0xBF9CE49308210308,
                0xF00A58476FAE9664,
                0x6D45FC0433AAD279,
                0xBA5AEA7A8D37EE46,
            ),
            add=11060,
            left=52,
            mul=37,
            length=0x27,
        ),
    )

    add(
        "sub_140006B90 (phase)",
        decode(
            u64(
                0xE04FE78F84DC160D,
                0xCEB12B0A0AF1C0D2,
                0x49709F6F26AF4706,
                0x6D9D93901BFBE048,
                0x3079E95E16B646B4,
                0x64C5ADEA93F141E8,
                0x0EBA0B7B0CB4454C,
            )
            + i32(1438922149)
            + i8(-110),
            add=-27703,
            left=-55,
            mul=-114,
            length=0x3C,
        ),
    )

    add(
        "sub_140006F50 (phase)",
        decode(
            u64(
                0xD29A135A760D27DC,
                0xE4E45F5F78A0F083,
                0xD84303CADA6C77D7,
                0xDC476F6E16D073E8,
                0x388971B30AAAD50D,
                0x5494DFBFE7A47341,
                0x3871E1AAE26B739D,
            )
            + i32(664209392)
            + i8(-57),
            add=7695,
            left=15,
            mul=-64,
            length=0x3C,
        ),
    )

    add(
        "sub_140007620 (phase)",
        decode(
            u64(
                0x97DF747D770CC3F8,
                0x2821BB7879A197A4,
                0x7EC67D940C9497F0,
                0x2A2A8AE2E0E939D6,
                0xAFEF37E45DC59D3D,
                0xB653EBAAE9713820,
                0x323F3796DE9D0466,
            )
            + i32(-393508046, -967386760)
            + i16(-14761)
            + i8(-29),
            add=29374,
            left=-66,
            mul=99,
            length=0x42,
        ),
    )

    add(
        "sub_140003BC0 (phase)",
        decode(
            i32(
                1631393292,
                -2119556534,
                -685213333,
                -1083386121,
                -891126210,
                1372092459,
                1330104408,
                1422757446,
                1005132772,
                1347017186,
                -1653811599,
                1841595646,
                -1041636662,
                -1152708022,
                -1390572508,
            )
            + i16(-193),
            add=17912,
            left=-8,
            mul=-47,
            length=0x3D,
        ),
    )

    add(
        "sub_140007310 (phase)",
        decode(
            u64(
                0x6A23CB818AF0FB07,
                0xE4DD8784845D2C58,
                0xC89AD30AE281AB0C,
                0xEFD70FB7E48C85DC,
                0xAC531B138869D190,
                0xD99DAD36CE05DD54,
                0x66FEA983AA6A01A0,
            )
            + i32(-994834633, 413785453)
            + i8(-39),
            add=23554,
            left=2,
            mul=111,
            length=0x40,
        ),
    )

    add(
        "sub_140004170 (phase)",
        decode(
            i32(
                -1147041130,
                1530051280,
                890002761,
                1296955094,
                -251077990,
                1801689714,
                517842214,
                -666087833,
                326690817,
                -1926065453,
                1205706319,
                1634316006,
                -772181430,
                -1895339784,
                1025289790,
            ),
            add=27460,
            left=68,
            mul=117,
            length=0x3B,
        ),
    )

    add(
        "sub_140003CB0 (phase)",
        decode(
            i32(
                -1863538787,
                -256371813,
                -1639518013,
                1850138527,
                849082263,
                1501587579,
                -1907370407,
                2093865988,
                -2108976372,
                946354578,
                -292080187,
                1281656237,
                -122142399,
                629852859,
                -1789524811,
            ),
            add=20358,
            left=-122,
            mul=91,
            length=0x3B,
        ),
    )

    add(
        "sub_140006630 (success / reveal)",
        decode(
            u64(
                0x1906CE451D160C16,
                0x5F7850FB038808D9,
                0x090EB64EF5FEBEFF,
                0x2DCD506203EB38B0,
                0x5120DF456EDEADD5,
                0x47B6CCA35BEAC3C3,
            )
            + i32(-199916233),
            add=-19776,
            left=-64,
            mul=-119,
            length=0x33,
        ),
    )

    add(
        "sub_140006960 (fail)",
        decode(
            u64(
                0x90880432485B5BA0,
                0x89691D4DC4EC84F0,
                0xCD5C15318B7223F3,
                0x11F2A07F87341E15,
                0x954DCC54AB312289,
                0x10B8F829A5B58404,
                0xE427F645DD8A806B,
            ),
            add=16178,
            left=50,
            mul=31,
            length=0x37,
        ),
    )

    add(
        "sub_140006030 (fail)",
        decode(
            u64(0x239269C042DEEAC9, 0x856EDEFDA536143B, 0xEB7BE2D3E1F0A867)
            + i32(-966357444),
            add=21885,
            left=125,
            mul=-22,
            length=0x1B,
        ),
    )

    add(
        "sub_1400040B0 (fail / abort branch)",
        decode(
            i32(
                -1119967634,
                -71551955,
                -112504709,
                2145886248,
                -571157490,
                583671220,
                1908571131,
                -814844407,
                -1486553913,
            )
            + i16(20854),
            add=16011,
            left=-117,
            mul=20,
            length=0x25,
        ),
    )

    # trailing inline decrypt after game loop (ROR1(x,3) == ROL8(x,5))
    add(
        "inline (bye / footer)",
        decode(
            u64(0x62B9B2222129A9EB, 0x4A470E3C1D150C4C, 0x4FC959C8AAF1E990),
            add=-27032,
            left=104,
            mul=1,
            length=0x17,
        ),
    )

    # bad ticket length (!= 50)
    add(
        "sub_140003D90 (bad length)",
        decode(
            i32(
                1771673987,
                -142161901,
                633087199,
                -1027886185,
                435732689,
                1872200841,
                1163230372,
                -2082865000,
                -531539752,
                -950237729,
                196369623,
                -504755709,
                -2056728327,
                -310530425,
                601609372,
            )
            + i16(20960),
            add=4413,
            left=61,
            mul=42,
            length=0x3E,
        ),
    )

    add(
        "sub_140005E00 (bad length)",
        decode(
            u64(0x5BB20A00F1B19E1F, 0x019A703BEE0D223A)
            + i32(490620505)
            + i16(32493)
            + i8(-97),
            add=-18572,
            left=116,
            mul=-27,
            length=0x16,
        ),
    )

    # argc > 999 honeypot — FAKE flag (not the real jackpot)
    fake = "pwn{777_c4s1n0_j4ckp0t_ez_w1n}"
    add("argc>999 honeypot (FAKE)", f"{fake}  [FAKE — honeypot, not a real win]")

    lines = []
    for label, text in entries:
        lines.append(f"[{label}]")
        lines.append(text)
        lines.append("")
        print(f"[{label}]")
        print(text)
        print()

    OUT.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")


if __name__ == "__main__":
    main()
