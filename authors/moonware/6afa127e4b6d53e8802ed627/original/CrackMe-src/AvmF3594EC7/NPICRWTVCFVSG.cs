using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace AvmF3594EC7;

internal static class NPICRWTVCFVSG
{
	public const byte XXEB617N = 167;

	public static int GFCBK142()
	{
		return unchecked((0xE7A32A5 ^ -1640531527) * 666578662);
	}

	public static void V5GSTFZX5(byte[] RWGN5DT7MKGW4F)
	{
		int num = GFCBK142();
		for (int i = 0; i < RWGN5DT7MKGW4F.Length; i++)
		{
			int num2 = (i & 3) * 8;
			RWGN5DT7MKGW4F[i] ^= (byte)((num >> num2) & 0xFF);
			RWGN5DT7MKGW4F[i] ^= (byte)(i * 13);
		}
	}

	public static byte[] A7OVJ3HNNY(byte[] WOE8LJ68ZR)
	{
		byte[] array = new byte[WOE8LJ68ZR.Length];
		Buffer.BlockCopy(WOE8LJ68ZR, 0, array, 0, WOE8LJ68ZR.Length);
		V5GSTFZX5(array);
		return array;
	}

	public static byte[] UH803SRB(byte[] BBHTIKBVF)
	{
		byte[] array = new byte[BBHTIKBVF.Length];
		Buffer.BlockCopy(BBHTIKBVF, 0, array, 0, BBHTIKBVF.Length);
		V5GSTFZX5(array);
		return array;
	}

	public static void G2ZUHF3O86Z(byte[] L38FHXSAZ5MQI4)
	{
		L38FHXSAZ5MQI4[1] ^= 46;
		L38FHXSAZ5MQI4[5] ^= 113;
		L38FHXSAZ5MQI4[8] ^= 180;
		L38FHXSAZ5MQI4[14] ^= 9;
	}

	public static void P0AHK2IJJ(byte[] Q0V9DTFR)
	{
		int isAttached = (Debugger.IsAttached ? 1 : 0);
		int num = DM2US77WS();
		int num2 = isAttached | num;
		Q0V9DTFR[1] ^= (byte)(0x2E ^ (isAttached * 255));
		Q0V9DTFR[5] ^= (byte)(0x71 ^ (num * 255));
		Q0V9DTFR[8] ^= (byte)(0xB4 ^ (num2 * 90));
		Q0V9DTFR[14] ^= (byte)(9 ^ (num2 * 167));
	}

	public static int ONUDDOCF1(int LILN7JX7YP, int FUZCV67A, byte JH9CJ3AW73HW)
	{
		return (int)RO8PYXYYKZ6I5((uint)(((LILN7JX7YP ^ -776648139) + JH9CJ3AW73HW * 16777619) ^ (FUZCV67A * 1821285621)));
	}

	public static int X24KNX0PVQC(byte[] J35ARSFF, int AJJIDEIBA)
	{
		uint num = (uint)(-960747626 ^ (AJJIDEIBA * -1640531527));
		int num2 = J35ARSFF.Length;
		for (int i = 0; i < num2; i++)
		{
			int num3 = (i * 7 + AJJIDEIBA * 3) % num2;
			num ^= (uint)(J35ARSFF[num3] << (i & 3) * 8);
			num *= 2246822507u;
			num ^= num >> 13;
		}
		return (int)RO8PYXYYKZ6I5(num);
	}

	public static void FQ1Y6IKTJJF106(int XAEWQKCR, int WTVCJTROVV, int QVF82H966BISMI, int DEPTUF8Q2, out uint QIJ010GFBN, out uint WF3ILFVJWA)
	{
		uint num = RO8PYXYYKZ6I5((uint)(XAEWQKCR ^ DEPTUF8Q2 ^ -1515870811));
		uint num2 = RO8PYXYYKZ6I5((uint)((WTVCJTROVV * 1818371886) ^ (QVF82H966BISMI * -2048144789) ^ DEPTUF8Q2));
		QIJ010GFBN = num ^ (num2 << 1);
		WF3ILFVJWA = RO8PYXYYKZ6I5(num + num2) ^ (uint)(QVF82H966BISMI * 668265261);
		if (QIJ010GFBN == 0)
		{
			QIJ010GFBN = 1831565813u;
		}
		if (WF3ILFVJWA == 0)
		{
			WF3ILFVJWA = 2654435769u;
		}
	}

	public static int VDPN9BAZX(int JVF90GEK, int JK44J8VL, int ZNHFMOOGK)
	{
		uint num = HUIQ55Q328Z(JVF90GEK, JK44J8VL);
		uint num2 = (uint)ZNHFMOOGK + num;
		num2 = (num2 << 7) | (num2 >> 25);
		return (int)num2 ^ ((int)(num * 668265261) + JK44J8VL);
	}

	public static int TFEL0HSTYJ(int ZQ8UW79IFOOZ, int SJ7HJ1UT50T7I, int CX0P7BYA6IVZQP)
	{
		uint num = HUIQ55Q328Z(ZQ8UW79IFOOZ, SJ7HJ1UT50T7I);
		uint num2 = (uint)CX0P7BYA6IVZQP;
		num2 ^= (uint)((int)(num * 668265261) + SJ7HJ1UT50T7I);
		num2 = (num2 >> 7) | (num2 << 25);
		return (int)(num2 - num);
	}

	public static void D9MPOVQKLK6YBD(byte[] KXO85UO9QXCZN, int PTLFV01HR4NX, int LEANX6G38L, int ON0951L6DVZ, int PTPN8HFTVHH94, int HP2G4XI4UIA)
	{
		if (LEANX6G38L > 0)
		{
			FQ1Y6IKTJJF106(ON0951L6DVZ, PTPN8HFTVHH94, LEANX6G38L, HP2G4XI4UIA, out var QIJ010GFBN, out var WF3ILFVJWA);
			int[] array = I0TQU1ZOQ3HTH(QIJ010GFBN, WF3ILFVJWA, LEANX6G38L);
			byte[] array2 = new byte[LEANX6G38L];
			byte zDWLTK7SZ = GCJW5JWMX9Y7Z4(QIJ010GFBN, WF3ILFVJWA);
			for (int i = 0; i < LEANX6G38L; i++)
			{
				byte b = CU9FN39P(QIJ010GFBN, WF3ILFVJWA, i, KXO85UO9QXCZN[PTLFV01HR4NX + i], zDWLTK7SZ);
				array2[array[i]] = b;
				zDWLTK7SZ = b;
			}
			for (int j = 0; j < LEANX6G38L; j++)
			{
				KXO85UO9QXCZN[PTLFV01HR4NX + j] = array2[j];
				array2[j] = 0;
			}
		}
	}

	public static int[] I0TQU1ZOQ3HTH(uint U25MG0FPQ6E6, uint BR08GMH5OAFXP, int L9RHI9H5Q)
	{
		int[] array = new int[L9RHI9H5Q];
		for (int i = 0; i < L9RHI9H5Q; i++)
		{
			array[i] = i;
		}
		uint num = U25MG0FPQ6E6 ^ (uint)((int)BR08GMH5OAFXP * -1640531527) ^ (uint)L9RHI9H5Q;
		if (num == 0)
		{
			num = 1u;
		}
		for (int num2 = L9RHI9H5Q - 1; num2 > 0; num2--)
		{
			num ^= num << 13;
			num ^= num >> 17;
			num ^= num << 5;
			int num3 = (int)(num % (uint)(num2 + 1));
			int num4 = array[num2];
			array[num2] = array[num3];
			array[num3] = num4;
		}
		return array;
	}

	public static byte GCJW5JWMX9Y7Z4(uint FA0N1ZY0, uint SQ9Z57TGB10)
	{
		return (byte)(RO8PYXYYKZ6I5(FA0N1ZY0 ^ (SQ9Z57TGB10 >> 3)) & 0xFF);
	}

	public static byte CU9FN39P(uint NKXGB8QRYJTL, uint YPK6Q0PR58D5D, int TIN6ZL5GFLS, byte ZDZMSG3KXU5RN, byte ZDWLTK7SZ)
	{
		uint num = PBAX3XOTAQ8Y(NKXGB8QRYJTL, YPK6Q0PR58D5D, TIN6ZL5GFLS, ZDWLTK7SZ);
		int num2 = (int)(num & 0xFF);
		int nPTM7NFRD = (int)(((num >> 8) & 7) | 1);
		int num3 = (int)((num >> 16) & 0xFF);
		int num4 = (int)((num >> 24) & 0xFF);
		return (byte)((L2HDHD2UAZU1SK((((ZDZMSG3KXU5RN & 0xFF) + (num4 ^ ZDWLTK7SZ)) & 0xFF) ^ num3, nPTM7NFRD) + num2) & 0xFF);
	}

	public static byte HM4960J8N(uint TM2TQ6C32GN6, uint LL2U42I6QNQ, int EM4N6K6D, byte MWLD5WIDZT5N2, byte REGPFFYL9L)
	{
		uint num = PBAX3XOTAQ8Y(TM2TQ6C32GN6, LL2U42I6QNQ, EM4N6K6D, REGPFFYL9L);
		int num2 = (int)(num & 0xFF);
		int tLLGI3WP = (int)(((num >> 8) & 7) | 1);
		int num3 = (int)((num >> 16) & 0xFF);
		int num4 = (int)((num >> 24) & 0xFF);
		return (byte)(((VXEW9DTGV(((MWLD5WIDZT5N2 & 0xFF) - num2) & 0xFF, tLLGI3WP) ^ num3) - (num4 ^ REGPFFYL9L)) & 0xFF);
	}

	private static uint HUIQ55Q328Z(int M8F9203VYN7, int G0507CGWA)
	{
		return RO8PYXYYKZ6I5((uint)(M8F9203VYN7 ^ (G0507CGWA * 2135587861) ^ -1028477387));
	}

	private static uint PBAX3XOTAQ8Y(uint MAF6UGZ27XBH, uint AZ5Z1CP4M, int ZF6FHEMQ, byte OBN02GVQK)
	{
		return RO8PYXYYKZ6I5(MAF6UGZ27XBH ^ (uint)(ZF6FHEMQ * -1640531527) ^ (uint)(OBN02GVQK << 16) ^ OBN02GVQK ^ (AZ5Z1CP4M >> (ZF6FHEMQ & 0xF)));
	}

	private static uint RO8PYXYYKZ6I5(uint XG0YASXU)
	{
		XG0YASXU ^= XG0YASXU >> 16;
		XG0YASXU *= 2146121005;
		XG0YASXU ^= XG0YASXU >> 15;
		XG0YASXU *= 2221713035u;
		XG0YASXU ^= XG0YASXU >> 16;
		return XG0YASXU;
	}

	private static int VXEW9DTGV(int ZYZBZHSSQ, int TLLGI3WP)
	{
		TLLGI3WP &= 7;
		ZYZBZHSSQ &= 0xFF;
		return ((ZYZBZHSSQ << TLLGI3WP) | (ZYZBZHSSQ >> 8 - TLLGI3WP)) & 0xFF;
	}

	private static int L2HDHD2UAZU1SK(int WQHEBQR9, int NPTM7NFRD)
	{
		NPTM7NFRD &= 7;
		WQHEBQR9 &= 0xFF;
		return ((WQHEBQR9 >> NPTM7NFRD) | (WQHEBQR9 << 8 - NPTM7NFRD)) & 0xFF;
	}

	[DllImport("kernel32.dll", EntryPoint = "IsDebuggerPresent")]
	private static extern int DM2US77WS();

	public static int XKIAHK2WROQ82(byte[] P1UPWWTC, int GF0C6ZHE39GK)
	{
		int num = GF0C6ZHE39GK * 73244475;
		for (int i = 0; i < P1UPWWTC.Length; i++)
		{
			num = (num * 31) ^ P1UPWWTC[i];
		}
		if (num == 0)
		{
			num = 1831565813;
		}
		return num;
	}

	public static int FSEXVTAZ3(byte[] O280MRA5K)
	{
		int num = O280MRA5K[0] | (O280MRA5K[1] << 8) | (O280MRA5K[2] << 16) | (O280MRA5K[3] << 24);
		if (num == 0)
		{
			num = 1369948382;
		}
		return num;
	}

	public static long R94RI57JJW9W0(int OBL9B9B7P8)
	{
		ulong num = (uint)OBL9B9B7P8;
		return (long)(num | (num << 32));
	}

	public static uint H785W3D6Q(byte[] FYXPZW1QGH8, int PGKGA4K2, int O6L788OW350K3)
	{
		uint num = 2166136261u;
		int num2 = PGKGA4K2 + O6L788OW350K3;
		for (int i = PGKGA4K2; i < num2; i++)
		{
			num ^= FYXPZW1QGH8[i];
			num *= 16777619;
		}
		return num;
	}
}
