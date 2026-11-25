using System;
using System.IO;
using System.Reflection;
using System.Text;

namespace AvmF3594EC7;

internal static class XRBAXIFCLQGHN
{
	private sealed class DV13OEJJ
	{
		private byte[] Y02GPFDG6IHN;

		private int R8EGKRQH3;

		private int W704EF65TETL0;

		private uint FIBN1Z9V0573ZI;

		private uint U3QE97IYL8BAM;

		private int[] GZMHG8BPCPD0;

		private byte F57LQYC1L;

		private int F0A8UZP0;

		private string Q7RFUVSJ1M0B;

		private int GXB3OXVM;

		private int X7WFQGAR0;

		public bool SPDLYZMZ7OKO;

		public DV13OEJJ()
		{
			X7WFQGAR0 = -1;
		}

		public void BGSM60L1EMNB()
		{
			SPDLYZMZ7OKO = true;
			X7WFQGAR0 = -1;
		}

		public void NPELJKWDLVFM(VKX10TW32TH CC8X79RMU8)
		{
			Y02GPFDG6IHN = CC8X79RMU8.TVC0VIQWM;
			R8EGKRQH3 = CC8X79RMU8.L538NR5O;
			W704EF65TETL0 = CC8X79RMU8.M58ZXEXJN;
			FIBN1Z9V0573ZI = CC8X79RMU8.IM083WCP9MK;
			U3QE97IYL8BAM = CC8X79RMU8.XF04171FF8NK0M;
			GZMHG8BPCPD0 = ((W704EF65TETL0 > 0) ? NPICRWTVCFVSG.I0TQU1ZOQ3HTH(FIBN1Z9V0573ZI, U3QE97IYL8BAM, W704EF65TETL0) : null);
			F57LQYC1L = NPICRWTVCFVSG.GCJW5JWMX9Y7Z4(FIBN1Z9V0573ZI, U3QE97IYL8BAM);
			F0A8UZP0 = 0;
			GXB3OXVM = 0;
			X7WFQGAR0 = -1;
			SPDLYZMZ7OKO = false;
			Q7RFUVSJ1M0B = null;
		}

		public void VD0O6VC0KDG6VV(string A2R0VMAUX)
		{
			Q7RFUVSJ1M0B = A2R0VMAUX;
			Y02GPFDG6IHN = null;
			F0A8UZP0 = 0;
			GXB3OXVM = 0;
			X7WFQGAR0 = -1;
			SPDLYZMZ7OKO = false;
		}

		public void UQONUI8RF()
		{
			F0A8UZP0 = 0;
			GXB3OXVM = 0;
			X7WFQGAR0 = -1;
			F57LQYC1L = NPICRWTVCFVSG.GCJW5JWMX9Y7Z4(FIBN1Z9V0573ZI, U3QE97IYL8BAM);
		}

		public int ETHH0SOCI6F()
		{
			UQONUI8RF();
			int num = 0;
			char DDEYMZ5I;
			while (B29Y44MW2T(out DDEYMZ5I))
			{
				num++;
			}
			UQONUI8RF();
			return num;
		}

		public bool B29Y44MW2T(out char DDEYMZ5I)
		{
			if (X7WFQGAR0 >= 0)
			{
				DDEYMZ5I = (char)X7WFQGAR0;
				X7WFQGAR0 = -1;
				return true;
			}
			if (SPDLYZMZ7OKO)
			{
				DDEYMZ5I = '\0';
				return false;
			}
			if (Q7RFUVSJ1M0B != null)
			{
				if (GXB3OXVM >= Q7RFUVSJ1M0B.Length)
				{
					DDEYMZ5I = '\0';
					return false;
				}
				DDEYMZ5I = Q7RFUVSJ1M0B[GXB3OXVM];
				GXB3OXVM++;
				return true;
			}
			int num = LD8RUJAD78L();
			if (num < 0)
			{
				DDEYMZ5I = '\0';
				return false;
			}
			if (num <= 65535)
			{
				DDEYMZ5I = (char)num;
				return true;
			}
			num -= 65536;
			DDEYMZ5I = (char)(55296 + (num >> 10));
			X7WFQGAR0 = 56320 + (num & 0x3FF);
			return true;
		}

		private int LD8RUJAD78L()
		{
			if (F0A8UZP0 >= W704EF65TETL0)
			{
				return -1;
			}
			int num = CPPVO5NDETZXP();
			if ((num & 0x80) == 0)
			{
				return num;
			}
			int num2;
			int num3;
			if ((num & 0xE0) == 192)
			{
				num2 = 1;
				num3 = num & 0x1F;
			}
			else if ((num & 0xF0) == 224)
			{
				num2 = 2;
				num3 = num & 0xF;
			}
			else
			{
				if ((num & 0xF8) != 240)
				{
					return 65533;
				}
				num2 = 3;
				num3 = num & 7;
			}
			for (int i = 0; i < num2; i++)
			{
				if (F0A8UZP0 >= W704EF65TETL0)
				{
					return 65533;
				}
				int num4 = CPPVO5NDETZXP();
				if ((num4 & 0xC0) != 128)
				{
					return 65533;
				}
				num3 = (num3 << 6) | (num4 & 0x3F);
			}
			return num3;
		}

		private int CPPVO5NDETZXP()
		{
			byte b = Y02GPFDG6IHN[R8EGKRQH3 + GZMHG8BPCPD0[F0A8UZP0]];
			byte result = NPICRWTVCFVSG.HM4960J8N(FIBN1Z9V0573ZI, U3QE97IYL8BAM, F0A8UZP0, b, F57LQYC1L);
			F57LQYC1L = b;
			F0A8UZP0++;
			return result;
		}
	}

	private static readonly object AJVXQFJ5T8 = new object();

	private static volatile int NZTL1FAG;

	private static bool QVH24ZGL;

	private static byte[] X0C7AMDZL;

	private static byte[] GUB8C8FSW1TKG;

	private static int GZPB2309;

	private static QETT1OIHT[] SWI8VZHIC4J7TV;

	private static int[][] D3ZHTTVVTBXL;

	private static NM3RHB1PZQ2R71[] B6RAJWLL49T3OT;

	private static MethodInfo[] M6D0D278DTP;

	private static string DBY77OKGFM;

	public static object R7KLK4FOF(int DEX77IEE, object[] KQ4HGKFCWODMLE, RuntimeMethodHandle L22QWE8FKNA6, RuntimeTypeHandle AAGGCH83)
	{
		SDBE1T9BY2AAR();
		MethodBase methodFromHandle = MethodBase.GetMethodFromHandle(L22QWE8FKNA6, AAGGCH83);
		NM3RHB1PZQ2R71 nM3RHB1PZQ2R = B6RAJWLL49T3OT[DEX77IEE];
		XJ6LDH5TKDE xJ6LDH5TKDE = W8TZXLK2UTJ9(nM3RHB1PZQ2R, KQ4HGKFCWODMLE, methodFromHandle);
		try
		{
			return REPH5EZZWF(nM3RHB1PZQ2R, xJ6LDH5TKDE, methodFromHandle);
		}
		finally
		{
			DOWOLHR1Z0Y7(nM3RHB1PZQ2R, xJ6LDH5TKDE, KQ4HGKFCWODMLE);
		}
	}

	private static void SDBE1T9BY2AAR()
	{
		if (NZTL1FAG == 2)
		{
			return;
		}
		lock (AJVXQFJ5T8)
		{
			if (NZTL1FAG != 2)
			{
				LXR2QKT3();
				KECWI7KEG();
				NZTL1FAG = 2;
			}
		}
	}

	private static void LXR2QKT3()
	{
		int tickCount = Environment.TickCount;
		int num = 305419896;
		for (int i = 0; i < 20000; i++)
		{
			num = num * 1664525 + i;
		}
		if (Environment.TickCount - tickCount > 4000)
		{
			QVH24ZGL = true;
		}
		if (num == 286331153)
		{
			QVH24ZGL = !QVH24ZGL;
		}
	}

	private static void KECWI7KEG()
	{
		byte[] array = QDYORNOGJZH5A();
		if (array == null || array.Length < 68)
		{
			DO78FA91UGCJ();
		}
		int EWMMZAX31D8W = 0;
		uint num = UF7VOBTY7VL5O(array, ref EWMMZAX31D8W);
		ushort num2 = AFB9VSLDQ(array, ref EWMMZAX31D8W);
		AFB9VSLDQ(array, ref EWMMZAX31D8W);
		int num3 = BEAXET4RY8P(array, ref EWMMZAX31D8W);
		uint num4 = UF7VOBTY7VL5O(array, ref EWMMZAX31D8W);
		if (num != 2444743180u || num2 != 4)
		{
			DO78FA91UGCJ();
		}
		if (num3 <= 0 || EWMMZAX31D8W + 32 + 12 + num3 > array.Length)
		{
			DO78FA91UGCJ();
		}
		byte[] array2 = new byte[32];
		Buffer.BlockCopy(array, EWMMZAX31D8W, array2, 0, 32);
		EWMMZAX31D8W += 32;
		byte[] array3 = new byte[12];
		Buffer.BlockCopy(array, EWMMZAX31D8W, array3, 0, 12);
		EWMMZAX31D8W += 12;
		byte[] array4 = new byte[num3];
		Buffer.BlockCopy(array, EWMMZAX31D8W, array4, 0, num3);
		if (NPICRWTVCFVSG.H785W3D6Q(array4, 0, array4.Length) != num4)
		{
			DO78FA91UGCJ();
		}
		GUB8C8FSW1TKG = NPICRWTVCFVSG.UH803SRB(array2);
		if (QVH24ZGL)
		{
			GUB8C8FSW1TKG[1] ^= 60;
		}
		NPICRWTVCFVSG.P0AHK2IJJ(GUB8C8FSW1TKG);
		EQPIR3BG.GKVQ9NBLX(GUB8C8FSW1TKG, array3, 1u, array4, 0, array4.Length);
		KFLTB4Y49JU(array4);
		for (int i = 0; i < array4.Length; i++)
		{
			array4[i] = 0;
		}
		N49RR2TZE3PQI4();
	}

	private static byte[] QDYORNOGJZH5A()
	{
		Assembly assembly = typeof(XRBAXIFCLQGHN).Assembly;
		string[] manifestResourceNames = assembly.GetManifestResourceNames();
		for (int i = 0; i < manifestResourceNames.Length; i++)
		{
			W0SUPSSK67X(assembly, manifestResourceNames[i], out var KZYXLMH11SX);
			if (KZYXLMH11SX != null && KZYXLMH11SX.Length >= 4 && (KZYXLMH11SX[0] | (KZYXLMH11SX[1] << 8) | (KZYXLMH11SX[2] << 16) | (KZYXLMH11SX[3] << 24)) == -1850224116)
			{
				return KZYXLMH11SX;
			}
		}
		return null;
	}

	private static void W0SUPSSK67X(Assembly S71DOY4G4B0J9P, string DKE8RDS0, out byte[] KZYXLMH11SX)
	{
		KZYXLMH11SX = null;
		Stream manifestResourceStream = S71DOY4G4B0J9P.GetManifestResourceStream(DKE8RDS0);
		if (manifestResourceStream == null)
		{
			return;
		}
		try
		{
			KZYXLMH11SX = new byte[manifestResourceStream.Length];
			int num;
			for (int i = 0; i < KZYXLMH11SX.Length; i += num)
			{
				num = manifestResourceStream.Read(KZYXLMH11SX, i, KZYXLMH11SX.Length - i);
				if (num <= 0)
				{
					break;
				}
			}
		}
		finally
		{
			manifestResourceStream.Dispose();
		}
	}

	private static void KFLTB4Y49JU(byte[] MO918F6GGKZY9G)
	{
		int EWMMZAX31D8W = 0;
		uint num = UF7VOBTY7VL5O(MO918F6GGKZY9G, ref EWMMZAX31D8W);
		uint num2 = NPICRWTVCFVSG.H785W3D6Q(MO918F6GGKZY9G, EWMMZAX31D8W, MO918F6GGKZY9G.Length - EWMMZAX31D8W);
		if (num != num2)
		{
			DO78FA91UGCJ();
		}
		GZPB2309 = NPICRWTVCFVSG.FSEXVTAZ3(GUB8C8FSW1TKG);
		if (EWMMZAX31D8W + 256 > MO918F6GGKZY9G.Length)
		{
			DO78FA91UGCJ();
		}
		X0C7AMDZL = new byte[256];
		Buffer.BlockCopy(MO918F6GGKZY9G, EWMMZAX31D8W, X0C7AMDZL, 0, 256);
		EWMMZAX31D8W += 256;
		DBY77OKGFM = HXIYWOJN(MO918F6GGKZY9G, ref EWMMZAX31D8W);
		int num3 = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
		int num4 = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
		if (num3 < 0 || num4 < 0)
		{
			DO78FA91UGCJ();
		}
		SWI8VZHIC4J7TV = new QETT1OIHT[num4];
		D3ZHTTVVTBXL = new int[num4][];
		QETT1OIHT qETT1OIHT = default;
		for (int i = 0; i < num4; i++)
		{
			qETT1OIHT.XCV9583QJ = MO918F6GGKZY9G[EWMMZAX31D8W++];
			qETT1OIHT.UTRO6ZJEM1 = MO918F6GGKZY9G[EWMMZAX31D8W++];
			qETT1OIHT.DSX5XSDZXB1 = MO918F6GGKZY9G[EWMMZAX31D8W++];
			qETT1OIHT.BRCUK7QL5WMR = AFB9VSLDQ(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			qETT1OIHT.QFWCFD51 = UF7VOBTY7VL5O(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			qETT1OIHT.TU7EHPZ1WNB6 = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W) ^ GZPB2309;
			qETT1OIHT.X4F8H5QYSFG = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			qETT1OIHT.ANRXR855M0SWG = 0;
			int aNRXR855M0SWG = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W) ^ GZPB2309;
			qETT1OIHT.ANRXR855M0SWG = aNRXR855M0SWG;
			int[] array = new int[qETT1OIHT.BRCUK7QL5WMR];
			for (int j = 0; j < qETT1OIHT.BRCUK7QL5WMR; j++)
			{
				array[j] = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W) ^ GZPB2309;
			}
			SWI8VZHIC4J7TV[i] = qETT1OIHT;
			D3ZHTTVVTBXL[i] = array;
		}
		B6RAJWLL49T3OT = new NM3RHB1PZQ2R71[num3];
		for (int k = 0; k < num3; k++)
		{
			int num5 = NPICRWTVCFVSG.XKIAHK2WROQ82(GUB8C8FSW1TKG, k);
			NM3RHB1PZQ2R71 nM3RHB1PZQ2R = new NM3RHB1PZQ2R71();
			nM3RHB1PZQ2R.YG9QE6NTSXAQ = num5;
			nM3RHB1PZQ2R.IZ1Z32C5T7165A = NPICRWTVCFVSG.X24KNX0PVQC(GUB8C8FSW1TKG, k);
			nM3RHB1PZQ2R.KFFK2PFL52 = AFB9VSLDQ(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			nM3RHB1PZQ2R.YS2BWRBK9G = AFB9VSLDQ(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			int num6 = AFB9VSLDQ(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			ushort num7 = AFB9VSLDQ(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			uint num8 = UF7VOBTY7VL5O(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			int num9 = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
			nM3RHB1PZQ2R.A40NIE9Q8WPLT = (num7 & 1) != 0;
			nM3RHB1PZQ2R.HKRY2XHOHHKUG = new int[nM3RHB1PZQ2R.KFFK2PFL52];
			nM3RHB1PZQ2R.GEGTMNOYBKG0LJ = new int[nM3RHB1PZQ2R.YS2BWRBK9G];
			nM3RHB1PZQ2R.PUMOHSEH = new bool[nM3RHB1PZQ2R.YS2BWRBK9G];
			for (int l = 0; l < nM3RHB1PZQ2R.YS2BWRBK9G; l++)
			{
				nM3RHB1PZQ2R.PUMOHSEH[l] = ((num8 >> l) & 1) != 0;
			}
			for (int m = 0; m < nM3RHB1PZQ2R.KFFK2PFL52; m++)
			{
				nM3RHB1PZQ2R.HKRY2XHOHHKUG[m] = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W) ^ num5;
			}
			for (int n = 0; n < nM3RHB1PZQ2R.YS2BWRBK9G; n++)
			{
				nM3RHB1PZQ2R.GEGTMNOYBKG0LJ[n] = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W) ^ num5;
			}
			nM3RHB1PZQ2R.UQPVJHRBL8LV = new I8VGE8MM1T4TQ[num6];
			for (int num10 = 0; num10 < num6; num10++)
			{
				I8VGE8MM1T4TQ i8VGE8MM1T4TQ = new I8VGE8MM1T4TQ();
				i8VGE8MM1T4TQ.X5YO1IOIFI62X = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
				i8VGE8MM1T4TQ.U3N4E1YAHFJ3ZN = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
				i8VGE8MM1T4TQ.JAGE3MP9CZ9 = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
				i8VGE8MM1T4TQ.C3MKMKNU8F = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
				i8VGE8MM1T4TQ.KZD5XSE7TA22HZ = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W);
				i8VGE8MM1T4TQ.WXL3LFEOVH55 = BEAXET4RY8P(MO918F6GGKZY9G, ref EWMMZAX31D8W) ^ num5;
				nM3RHB1PZQ2R.UQPVJHRBL8LV[num10] = i8VGE8MM1T4TQ;
			}
			if (num9 < 0 || EWMMZAX31D8W + num9 > MO918F6GGKZY9G.Length)
			{
				DO78FA91UGCJ();
			}
			nM3RHB1PZQ2R.IKBEUYPZIF3 = new byte[num9];
			Buffer.BlockCopy(MO918F6GGKZY9G, EWMMZAX31D8W, nM3RHB1PZQ2R.IKBEUYPZIF3, 0, num9);
			EWMMZAX31D8W += num9;
			B6RAJWLL49T3OT[k] = nM3RHB1PZQ2R;
		}
	}

	private static void N49RR2TZE3PQI4()
	{
		Type type = MEFZG6MP3VVQKE(DBY77OKGFM);
		if (type == null)
		{
			DO78FA91UGCJ();
		}
		MethodInfo[] methods = type.GetMethods(BindingFlags.DeclaredOnly | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
		for (int i = 0; i < methods.Length; i++)
		{
			for (int j = i + 1; j < methods.Length; j++)
			{
				if (methods[j].MetadataToken < methods[i].MetadataToken)
				{
					MethodInfo methodInfo = methods[i];
					methods[i] = methods[j];
					methods[j] = methodInfo;
				}
			}
		}
		M6D0D278DTP = methods;
	}

	private static Type MEFZG6MP3VVQKE(string QU59FAA1CH7)
	{
		Type[] types;
		try
		{
			types = typeof(XRBAXIFCLQGHN).Assembly.GetTypes();
		}
		catch (ReflectionTypeLoadException ex)
		{
			types = ex.Types;
		}
		if (types == null)
		{
			return null;
		}
		for (int i = 0; i < types.Length; i++)
		{
			if (types[i] != null && types[i].FullName == QU59FAA1CH7)
			{
				return types[i];
			}
		}
		return null;
	}

	private static XJ6LDH5TKDE W8TZXLK2UTJ9(NM3RHB1PZQ2R71 EOF65LIUYG4UIZ, object[] MNCSJHRRK68EAM, MethodBase CK6B9V45H5YEG1)
	{
		XJ6LDH5TKDE xJ6LDH5TKDE = new XJ6LDH5TKDE();
		xJ6LDH5TKDE.F65ZUUHLXQQI = EOF65LIUYG4UIZ.A40NIE9Q8WPLT;
		xJ6LDH5TKDE.VKNS993LN1B = EOF65LIUYG4UIZ.PUMOHSEH;
		xJ6LDH5TKDE.UAY2QGUPINF680 = new Type[EOF65LIUYG4UIZ.YS2BWRBK9G];
		xJ6LDH5TKDE.RA1SKDQBDVMHHD = new Type[EOF65LIUYG4UIZ.KFFK2PFL52];
		xJ6LDH5TKDE.G7N19SD4 = new MF17QBDJ2XZN[EOF65LIUYG4UIZ.YS2BWRBK9G];
		xJ6LDH5TKDE.PFQJAWSLDAXI8T = new MF17QBDJ2XZN[EOF65LIUYG4UIZ.KFFK2PFL52];
		for (int i = 0; i < EOF65LIUYG4UIZ.YS2BWRBK9G; i++)
		{
			Type type = A6C3WIL3Y0P2GG(EOF65LIUYG4UIZ.GEGTMNOYBKG0LJ[i], CK6B9V45H5YEG1);
			xJ6LDH5TKDE.UAY2QGUPINF680[i] = type;
			object nZACAI1OO4OR = ((MNCSJHRRK68EAM != null && i < MNCSJHRRK68EAM.Length) ? MNCSJHRRK68EAM[i] : null);
			xJ6LDH5TKDE.G7N19SD4[i] = N5FOVNHH7R(nZACAI1OO4OR, type);
		}
		for (int j = 0; j < EOF65LIUYG4UIZ.KFFK2PFL52; j++)
		{
			Type type2 = A6C3WIL3Y0P2GG(EOF65LIUYG4UIZ.HKRY2XHOHHKUG[j], CK6B9V45H5YEG1);
			xJ6LDH5TKDE.RA1SKDQBDVMHHD[j] = type2;
			xJ6LDH5TKDE.PFQJAWSLDAXI8T[j] = HAMH0HRR3R(type2);
		}
		return xJ6LDH5TKDE;
	}

	private static void DOWOLHR1Z0Y7(NM3RHB1PZQ2R71 Z7GII2DUYH0KWR, XJ6LDH5TKDE QUDLZW1USVAYVT, object[] ILY95KZQ6)
	{
		if (ILY95KZQ6 == null)
		{
			return;
		}
		for (int i = 0; i < Z7GII2DUYH0KWR.YS2BWRBK9G && i < ILY95KZQ6.Length; i++)
		{
			if (Z7GII2DUYH0KWR.PUMOHSEH[i] || (i == 0 && Z7GII2DUYH0KWR.A40NIE9Q8WPLT))
			{
				ILY95KZQ6[i] = UILMDHEUWW(QUDLZW1USVAYVT.G7N19SD4[i], QUDLZW1USVAYVT.UAY2QGUPINF680[i]);
			}
		}
	}

	private static object REPH5EZZWF(NM3RHB1PZQ2R71 QMHJIMXWH, XJ6LDH5TKDE NBS5PVWV, MethodBase XDH8BRLNWRK8)
	{
		byte[] iKBEUYPZIF = QMHJIMXWH.IKBEUYPZIF3;
		byte[] x0C7AMDZL = X0C7AMDZL;
		int XLV6LHUYP0KXEP = 0;
		MF17QBDJ2XZN[] Y397NPHH = new MF17QBDJ2XZN[32];
		int L6TEQ9ZO2I = 0;
		Exception ex = null;
		int kCG8I48F8I = 0;
		bool flag = false;
		bool[] array = null;
		bool flag2 = false;
		int OK7JAX6TX36F = -1;
		int[] I67JYD8ACDF6Y = null;
		int KVEEFZ065YO0KH = 0;
		int UWEYM5YJ5W2FY = 0;
		bool flag3 = false;
		MF17QBDJ2XZN xJ1V5RII7XUE = default;
		Exception ex2 = null;
		int gZPB = GZPB2309;
		while (true)
		{
			if (flag)
			{
				int num = D7GSXRHQ(QMHJIMXWH, kCG8I48F8I, ex, array, XDH8BRLNWRK8);
				if (num < 0)
				{
					break;
				}
				I8VGE8MM1T4TQ i8VGE8MM1T4TQ = QMHJIMXWH.UQPVJHRBL8LV[num];
				if (i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 2 || i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 4)
				{
					array[num] = true;
					flag2 = true;
					flag = false;
					L6TEQ9ZO2I = 0;
					XLV6LHUYP0KXEP = i8VGE8MM1T4TQ.JAGE3MP9CZ9;
					continue;
				}
				Type type = ((i8VGE8MM1T4TQ.WXL3LFEOVH55 == 0) ? null : A6C3WIL3Y0P2GG(i8VGE8MM1T4TQ.WXL3LFEOVH55, XDH8BRLNWRK8));
				if (type == null || (ex != null && type.IsInstanceOfType(ex)))
				{
					flag = false;
					flag2 = false;
					ex2 = ex;
					ex = null;
					L6TEQ9ZO2I = 0;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(ex2));
					XLV6LHUYP0KXEP = i8VGE8MM1T4TQ.JAGE3MP9CZ9;
				}
				else
				{
					array[num] = true;
				}
				continue;
			}
			if (XLV6LHUYP0KXEP < 0 || XLV6LHUYP0KXEP >= iKBEUYPZIF.Length)
			{
				DO78FA91UGCJ();
			}
			int num2 = XLV6LHUYP0KXEP;
			byte b = x0C7AMDZL[iKBEUYPZIF[XLV6LHUYP0KXEP++]];
			try
			{
				switch (b)
				{
				case 55:
					DO78FA91UGCJ();
					break;
				case 2:
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.BOMPQ5YKVN(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ QMHJIMXWH.YG9QE6NTSXAQ));
					break;
				case 3:
				{
					long vCYGPCCLZ = XGUBFRX7GI(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ NPICRWTVCFVSG.R94RI57JJW9W0(QMHJIMXWH.YG9QE6NTSXAQ);
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.E6MQKQ3X5(vCYGPCCLZ));
					break;
				}
				case 4:
				{
					float num13 = VNZPILV8F(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP));
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.AETACUN9G(num13));
					break;
				}
				case 5:
				{
					double mGIP5UPX = YFP8XC5P58KA(XGUBFRX7GI(iKBEUYPZIF, ref XLV6LHUYP0KXEP));
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.AETACUN9G(mGIP5UPX));
					break;
				}
				case 6:
				{
					int num7 = KJ6IJU6JE1(iKBEUYPZIF, num2, QMHJIMXWH.YG9QE6NTSXAQ);
					int num8 = NPICRWTVCFVSG.TFEL0HSTYJ(num7, num2, BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP));
					if (num8 < 0 || num8 > 1000000 || XLV6LHUYP0KXEP + num8 > iKBEUYPZIF.Length)
					{
						DO78FA91UGCJ();
					}
					VKX10TW32TH vKX10TW32TH = new VKX10TW32TH
					{
						TVC0VIQWM = iKBEUYPZIF,
						L538NR5O = XLV6LHUYP0KXEP,
						M58ZXEXJN = num8
					};
					NPICRWTVCFVSG.FQ1Y6IKTJJF106(num7, num2, num8, QMHJIMXWH.IZ1Z32C5T7165A, out vKX10TW32TH.IM083WCP9MK, out vKX10TW32TH.XF04171FF8NK0M);
					XLV6LHUYP0KXEP += num8;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.O71P96GFEKG(vKX10TW32TH));
					break;
				}
				case 7:
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(null));
					break;
				case 8:
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, D9U7M8VRLJO(NBS5PVWV.G7N19SD4[AFB9VSLDQ(iKBEUYPZIF, ref XLV6LHUYP0KXEP)]));
					break;
				case 9:
					NBS5PVWV.G7N19SD4[AFB9VSLDQ(iKBEUYPZIF, ref XLV6LHUYP0KXEP)] = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					break;
				case 10:
				{
					XPW79CCA0Z7AM xPW79CCA0Z7AM4 = new XPW79CCA0Z7AM();
					xPW79CCA0Z7AM4.B6C7V8393N = 1;
					xPW79CCA0Z7AM4.MION9PHQ3H9MO = AFB9VSLDQ(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					xPW79CCA0Z7AM4.U4E9E36P4C = NBS5PVWV;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.VUJVHZV3TI8(xPW79CCA0Z7AM4));
					break;
				}
				case 11:
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, D9U7M8VRLJO(NBS5PVWV.PFQJAWSLDAXI8T[AFB9VSLDQ(iKBEUYPZIF, ref XLV6LHUYP0KXEP)]));
					break;
				case 12:
					NBS5PVWV.PFQJAWSLDAXI8T[AFB9VSLDQ(iKBEUYPZIF, ref XLV6LHUYP0KXEP)] = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					break;
				case 13:
				{
					XPW79CCA0Z7AM xPW79CCA0Z7AM3 = new XPW79CCA0Z7AM();
					xPW79CCA0Z7AM3.B6C7V8393N = 2;
					xPW79CCA0Z7AM3.MION9PHQ3H9MO = AFB9VSLDQ(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					xPW79CCA0Z7AM3.U4E9E36P4C = NBS5PVWV;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.VUJVHZV3TI8(xPW79CCA0Z7AM3));
					break;
				}
				case 14:
				{
					MF17QBDJ2XZN mF17QBDJ2XZN5 = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, mF17QBDJ2XZN5);
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, D9U7M8VRLJO(mF17QBDJ2XZN5));
					break;
				}
				case 15:
					W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					break;
				case 16:
					C2YDXY2WA0A2S(iKBEUYPZIF[XLV6LHUYP0KXEP++], ref Y397NPHH, ref L6TEQ9ZO2I);
					break;
				case 17:
					CUJ3J5RYE(iKBEUYPZIF[XLV6LHUYP0KXEP++], ref Y397NPHH, ref L6TEQ9ZO2I);
					break;
				case 18:
					EYQ8AMX0(iKBEUYPZIF[XLV6LHUYP0KXEP++], ref Y397NPHH, ref L6TEQ9ZO2I);
					break;
				case 19:
					XLV6LHUYP0KXEP = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					break;
				case 20:
				{
					int num11 = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					if (PTDIN02RT9CUKI(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I)))
					{
						XLV6LHUYP0KXEP = num11;
					}
					break;
				}
				case 21:
				{
					int num9 = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					if (!PTDIN02RT9CUKI(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I)))
					{
						XLV6LHUYP0KXEP = num9;
					}
					break;
				}
				case 22:
				{
					byte oDK7IJ13ME1R = iKBEUYPZIF[XLV6LHUYP0KXEP++];
					int num6 = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					MF17QBDJ2XZN dO0WEQH1EFX = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					if (YW18Z1KHDKND3(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I), dO0WEQH1EFX, oDK7IJ13ME1R))
					{
						XLV6LHUYP0KXEP = num6;
					}
					break;
				}
				case 23:
				{
					int num3 = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					int[] array2 = new int[num3];
					for (int i = 0; i < num3; i++)
					{
						array2[i] = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					}
					int num4 = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					int num5 = LFATGDD1N43(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					XLV6LHUYP0KXEP = ((num5 < 0 || num5 >= num3) ? num4 : array2[num5]);
					break;
				}
				case 24:
				case 25:
				case 26:
				case 36:
				case 37:
				case 38:
				case 39:
					F1ML3R8SZ0Q(b, BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ QMHJIMXWH.YG9QE6NTSXAQ, ref Y397NPHH, ref L6TEQ9ZO2I, XDH8BRLNWRK8);
					break;
				case 27:
				{
					MethodInfo methodInfo = XDH8BRLNWRK8 as MethodInfo;
					bool flag4 = methodInfo == null || methodInfo.ReturnType == typeof(void);
					MF17QBDJ2XZN mF17QBDJ2XZN = (flag4 ? default(MF17QBDJ2XZN) : W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					if (RJ898GTCYU3GL(QMHJIMXWH, num2))
					{
						flag3 = true;
						xJ1V5RII7XUE = mF17QBDJ2XZN;
						RWWX9XNW83M7XY(QMHJIMXWH, num2, int.MaxValue, ref XLV6LHUYP0KXEP, ref L6TEQ9ZO2I, ref OK7JAX6TX36F, ref I67JYD8ACDF6Y, ref KVEEFZ065YO0KH, ref UWEYM5YJ5W2FY);
						if (UWEYM5YJ5W2FY == 0 && XLV6LHUYP0KXEP != int.MaxValue)
						{
							return flag4 ? null : UILMDHEUWW(mF17QBDJ2XZN, methodInfo.ReturnType);
						}
						if (UWEYM5YJ5W2FY == 0)
						{
							return flag4 ? null : UILMDHEUWW(mF17QBDJ2XZN, methodInfo.ReturnType);
						}
						break;
					}
					return flag4 ? null : UILMDHEUWW(mF17QBDJ2XZN, methodInfo.ReturnType);
				}
				case 28:
				{
					Exception ex4 = GPKBCPT2(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I)) as Exception;
					if (ex4 == null)
					{
						ex4 = new InvalidProgramException();
					}
					ex = ex4;
					kCG8I48F8I = num2;
					flag = true;
					array = KAY8QZX7B4YIFD(QMHJIMXWH);
					flag2 = false;
					L6TEQ9ZO2I = 0;
					break;
				}
				case 29:
					if (ex2 == null)
					{
						DO78FA91UGCJ();
					}
					ex = ex2;
					kCG8I48F8I = num2;
					flag = true;
					array = KAY8QZX7B4YIFD(QMHJIMXWH);
					flag2 = false;
					L6TEQ9ZO2I = 0;
					break;
				case 30:
				{
					int iTSF04BA = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP);
					RWWX9XNW83M7XY(QMHJIMXWH, num2, iTSF04BA, ref XLV6LHUYP0KXEP, ref L6TEQ9ZO2I, ref OK7JAX6TX36F, ref I67JYD8ACDF6Y, ref KVEEFZ065YO0KH, ref UWEYM5YJ5W2FY);
					break;
				}
				case 31:
					if (UWEYM5YJ5W2FY > 0)
					{
						if (KVEEFZ065YO0KH < UWEYM5YJ5W2FY)
						{
							XLV6LHUYP0KXEP = I67JYD8ACDF6Y[KVEEFZ065YO0KH++];
							break;
						}
						int num10 = OK7JAX6TX36F;
						UWEYM5YJ5W2FY = 0;
						I67JYD8ACDF6Y = null;
						if (flag3)
						{
							MethodInfo methodInfo2 = XDH8BRLNWRK8 as MethodInfo;
							return (methodInfo2 == null || methodInfo2.ReturnType == typeof(void)) ? null : UILMDHEUWW(xJ1V5RII7XUE, methodInfo2.ReturnType);
						}
						XLV6LHUYP0KXEP = num10;
					}
					else if (flag2 && ex != null)
					{
						flag = true;
					}
					else
					{
						DO78FA91UGCJ();
					}
					break;
				case 32:
				{
					Type type2 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					MF17QBDJ2XZN mF17QBDJ2XZN2 = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					if (type2 != null && type2.IsValueType)
					{
						YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(UILMDHEUWW(mF17QBDJ2XZN2, type2)));
					}
					else
					{
						YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, (mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9) ? MF17QBDJ2XZN.Z9CM4XCRMKU75(UILMDHEUWW(KBCKWMUMXML(mF17QBDJ2XZN2), type2)) : mF17QBDJ2XZN2);
					}
					break;
				}
				case 33:
				{
					Type c0WNTOZ8VCOUZK = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					object aEHNEWX8HBPS = PAIRD4045LU(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, SZUF9DUE1ET(aEHNEWX8HBPS, c0WNTOZ8VCOUZK));
					break;
				}
				case 34:
				{
					Type type7 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					object obj3 = PAIRD4045LU(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					if (obj3 != null && type7 != null && !type7.IsAssignableFrom(obj3.GetType()))
					{
						throw new InvalidCastException();
					}
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(obj3));
					break;
				}
				case 35:
				{
					Type type6 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					object obj2 = PAIRD4045LU(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					if (obj2 != null && type6 != null && type6.IsAssignableFrom(obj2.GetType()))
					{
						YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(obj2));
					}
					else
					{
						YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(null));
					}
					break;
				}
				case 41:
				{
					Type elementType2 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					int num12 = LFATGDD1N43(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					if (num12 < 0)
					{
						throw new OverflowException();
					}
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.Z9CM4XCRMKU75(Array.CreateInstance(elementType2, num12)));
					break;
				}
				case 42:
				{
					Array array5 = (Array)GPKBCPT2(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.UTGMQIE8(array5.Length));
					break;
				}
				case 43:
				{
					XLV6LHUYP0KXEP++;
					int index2 = LFATGDD1N43(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					Array array4 = (Array)GPKBCPT2(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					object value = array4.GetValue(index2);
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, N5FOVNHH7R(value, array4.GetType().GetElementType()));
					break;
				}
				case 44:
				{
					XLV6LHUYP0KXEP++;
					MF17QBDJ2XZN xJ1V5RII7XUE2 = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					int index = LFATGDD1N43(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					Array array3 = (Array)GPKBCPT2(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					Type elementType = array3.GetType().GetElementType();
					try
					{
						array3.SetValue(UILMDHEUWW(xJ1V5RII7XUE2, elementType), index);
					}
					catch (ArgumentException)
					{
						throw new ArrayTypeMismatchException();
					}
					break;
				}
				case 45:
				{
					XLV6LHUYP0KXEP++;
					int n4XW1KZTS = LFATGDD1N43(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					Array iNFN96WI = (Array)GPKBCPT2(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					XPW79CCA0Z7AM xPW79CCA0Z7AM5 = new XPW79CCA0Z7AM();
					xPW79CCA0Z7AM5.B6C7V8393N = 3;
					xPW79CCA0Z7AM5.INFN96WI = iNFN96WI;
					xPW79CCA0Z7AM5.N4XW1KZTS = n4XW1KZTS;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.VUJVHZV3TI8(xPW79CCA0Z7AM5));
					break;
				}
				case 46:
				{
					byte jBM4CWEAXJNGZ = iKBEUYPZIF[XLV6LHUYP0KXEP++];
					MF17QBDJ2XZN jUV94GLYI9AJ = KBCKWMUMXML(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, X02MF32LS(jUV94GLYI9AJ, jBM4CWEAXJNGZ));
					break;
				}
				case 47:
				{
					XLV6LHUYP0KXEP++;
					MF17QBDJ2XZN eSF4GW5QWW6DZ = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					N7MWCC13TJYWVY(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I), eSF4GW5QWW6DZ);
					break;
				}
				case 48:
				{
					byte xXAPSRJX8O = iKBEUYPZIF[XLV6LHUYP0KXEP++];
					int u80YOU0LH = BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, K9L5LBS7MX(xXAPSRJX8O, u80YOU0LH, XDH8BRLNWRK8));
					break;
				}
				case 49:
				{
					Type vUDT2RW8RRAMB = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					N7MWCC13TJYWVY(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I), HAMH0HRR3R(vUDT2RW8RRAMB));
					break;
				}
				case 50:
				{
					Type type5 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					MF17QBDJ2XZN mF17QBDJ2XZN6 = KBCKWMUMXML(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					if (type5 != null && type5.IsValueType)
					{
						mF17QBDJ2XZN6 = N5FOVNHH7R(UILMDHEUWW(mF17QBDJ2XZN6, type5), type5);
					}
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, D9U7M8VRLJO(mF17QBDJ2XZN6));
					break;
				}
				case 51:
				case 56:
				{
					Type type4 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					MF17QBDJ2XZN mF17QBDJ2XZN3 = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					MF17QBDJ2XZN m2ZMY97D = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					MF17QBDJ2XZN mF17QBDJ2XZN4 = ((mF17QBDJ2XZN3.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9) ? KBCKWMUMXML(mF17QBDJ2XZN3) : mF17QBDJ2XZN3);
					if (type4 != null)
					{
						mF17QBDJ2XZN4 = N5FOVNHH7R(UILMDHEUWW(mF17QBDJ2XZN4, type4), type4);
					}
					N7MWCC13TJYWVY(m2ZMY97D, mF17QBDJ2XZN4);
					break;
				}
				case 53:
				{
					MethodBase nI0C5MCAVM23P = DS68XOTBRWOGT(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.QHEASAIM(nI0C5MCAVM23P));
					break;
				}
				case 40:
				{
					FieldInfo fieldInfo = P4IC1Y2IVRW(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					XPW79CCA0Z7AM xPW79CCA0Z7AM2 = new XPW79CCA0Z7AM();
					xPW79CCA0Z7AM2.B6C7V8393N = 5;
					xPW79CCA0Z7AM2.V8H14PQDYL29M = fieldInfo;
					if (!fieldInfo.IsStatic)
					{
						MF17QBDJ2XZN oXACTCMK3NFWH = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
						if (oXACTCMK3NFWH.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
						{
							xPW79CCA0Z7AM2.WTNPO3LS5GDW = (XPW79CCA0Z7AM)oXACTCMK3NFWH.TWKPQR6TSEL4JD;
						}
						else
						{
							xPW79CCA0Z7AM2.INFN96WI = ANM3SLBP(oXACTCMK3NFWH, fieldInfo.DeclaringType);
						}
					}
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.VUJVHZV3TI8(xPW79CCA0Z7AM2));
					break;
				}
				case 52:
				{
					Type type3 = A6C3WIL3Y0P2GG(BEAXET4RY8P(iKBEUYPZIF, ref XLV6LHUYP0KXEP) ^ gZPB, XDH8BRLNWRK8);
					object obj = PAIRD4045LU(W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I));
					if (obj == null)
					{
						throw new NullReferenceException();
					}
					if (type3 != null && type3.IsValueType && obj.GetType() != type3 && !type3.IsAssignableFrom(obj.GetType()))
					{
						throw new InvalidCastException();
					}
					XPW79CCA0Z7AM xPW79CCA0Z7AM = new XPW79CCA0Z7AM();
					xPW79CCA0Z7AM.B6C7V8393N = 4;
					xPW79CCA0Z7AM.INFN96WI = obj;
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, MF17QBDJ2XZN.VUJVHZV3TI8(xPW79CCA0Z7AM));
					break;
				}
				case 54:
				{
					MF17QBDJ2XZN xKTGGDACMM = W0SHY6ZB2T0(ref Y397NPHH, ref L6TEQ9ZO2I);
					double d = ((xKTGGDACMM.P7LCR721 == DV3CMNYZ.PSQWPP92) ? xKTGGDACMM.UX79V5QBV5 : ((double)xKTGGDACMM.BM5CYY368));
					if (double.IsNaN(d) || double.IsInfinity(d))
					{
						throw new ArithmeticException();
					}
					YQLYFR33PBGCY(ref Y397NPHH, ref L6TEQ9ZO2I, xKTGGDACMM);
					break;
				}
				default:
					DO78FA91UGCJ();
					break;
				case 1:
					break;
				}
			}
			catch (Exception ex5)
			{
				if (ex5 is BadImageFormatException)
				{
					throw;
				}
				ex = XANG3W8L(ex5);
				kCG8I48F8I = num2;
				flag = true;
				array = KAY8QZX7B4YIFD(QMHJIMXWH);
				flag2 = false;
				L6TEQ9ZO2I = 0;
			}
		}
		if (ex == null)
		{
			DO78FA91UGCJ();
		}
		throw ex;
	}

	private static bool[] KAY8QZX7B4YIFD(NM3RHB1PZQ2R71 IQTCEBHBPNG169)
	{
		if (IQTCEBHBPNG169.UQPVJHRBL8LV == null)
		{
			return new bool[0];
		}
		return new bool[IQTCEBHBPNG169.UQPVJHRBL8LV.Length];
	}

	private static int D7GSXRHQ(NM3RHB1PZQ2R71 X8X5JT06, int KCG8I48F8I, Exception H818AZ1CWQPD, bool[] KFFNM26XKMR74G, MethodBase IURT8548GZ5T)
	{
		if (X8X5JT06.UQPVJHRBL8LV == null)
		{
			return -1;
		}
		for (int i = 0; i < X8X5JT06.UQPVJHRBL8LV.Length; i++)
		{
			if (KFFNM26XKMR74G != null && KFFNM26XKMR74G[i])
			{
				continue;
			}
			I8VGE8MM1T4TQ i8VGE8MM1T4TQ = X8X5JT06.UQPVJHRBL8LV[i];
			if (KCG8I48F8I < i8VGE8MM1T4TQ.X5YO1IOIFI62X || KCG8I48F8I >= i8VGE8MM1T4TQ.U3N4E1YAHFJ3ZN)
			{
				continue;
			}
			if (i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 2 || i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 4)
			{
				return i;
			}
			if (i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 0)
			{
				if (i8VGE8MM1T4TQ.WXL3LFEOVH55 == 0)
				{
					return i;
				}
				Type type = A6C3WIL3Y0P2GG(i8VGE8MM1T4TQ.WXL3LFEOVH55, IURT8548GZ5T);
				if (type == null || (H818AZ1CWQPD != null && type.IsInstanceOfType(H818AZ1CWQPD)))
				{
					return i;
				}
				if (KFFNM26XKMR74G != null)
				{
					KFFNM26XKMR74G[i] = true;
				}
			}
		}
		return -1;
	}

	private static bool RJ898GTCYU3GL(NM3RHB1PZQ2R71 AVJBGTCZC86FEU, int ZYRJE9AOS)
	{
		if (AVJBGTCZC86FEU.UQPVJHRBL8LV == null)
		{
			return false;
		}
		for (int i = 0; i < AVJBGTCZC86FEU.UQPVJHRBL8LV.Length; i++)
		{
			I8VGE8MM1T4TQ i8VGE8MM1T4TQ = AVJBGTCZC86FEU.UQPVJHRBL8LV[i];
			if ((i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 2 || i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 4) && ZYRJE9AOS >= i8VGE8MM1T4TQ.X5YO1IOIFI62X && ZYRJE9AOS < i8VGE8MM1T4TQ.U3N4E1YAHFJ3ZN)
			{
				return true;
			}
		}
		return false;
	}

	private static void RWWX9XNW83M7XY(NM3RHB1PZQ2R71 S8G9C2C9, int S6M6H79H0CS6PB, int ITSF04BA, ref int GOB3OPFVX18DL, ref int LA3FGVGEK6E, ref int OK7JAX6TX36F, ref int[] I67JYD8ACDF6Y, ref int KVEEFZ065YO0KH, ref int UWEYM5YJ5W2FY)
	{
		LA3FGVGEK6E = 0;
		int num = ((S8G9C2C9.UQPVJHRBL8LV != null) ? S8G9C2C9.UQPVJHRBL8LV.Length : 0);
		int[] array = new int[num];
		int[] array2 = new int[num];
		int num2 = 0;
		if (S8G9C2C9.UQPVJHRBL8LV != null)
		{
			for (int i = 0; i < S8G9C2C9.UQPVJHRBL8LV.Length; i++)
			{
				I8VGE8MM1T4TQ i8VGE8MM1T4TQ = S8G9C2C9.UQPVJHRBL8LV[i];
				if (i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 2 || i8VGE8MM1T4TQ.KZD5XSE7TA22HZ == 4)
				{
					bool num3 = S6M6H79H0CS6PB >= i8VGE8MM1T4TQ.X5YO1IOIFI62X && S6M6H79H0CS6PB < i8VGE8MM1T4TQ.U3N4E1YAHFJ3ZN;
					bool flag = ITSF04BA >= i8VGE8MM1T4TQ.X5YO1IOIFI62X && ITSF04BA < i8VGE8MM1T4TQ.U3N4E1YAHFJ3ZN;
					if (num3 && !flag)
					{
						array[num2] = i8VGE8MM1T4TQ.JAGE3MP9CZ9;
						array2[num2] = i8VGE8MM1T4TQ.U3N4E1YAHFJ3ZN - i8VGE8MM1T4TQ.X5YO1IOIFI62X;
						num2++;
					}
				}
			}
		}
		for (int j = 0; j < num2; j++)
		{
			for (int k = j + 1; k < num2; k++)
			{
				if (array2[k] < array2[j])
				{
					int num4 = array2[j];
					array2[j] = array2[k];
					array2[k] = num4;
					int num5 = array[j];
					array[j] = array[k];
					array[k] = num5;
				}
			}
		}
		if (num2 == 0)
		{
			UWEYM5YJ5W2FY = 0;
			I67JYD8ACDF6Y = null;
			GOB3OPFVX18DL = ITSF04BA;
		}
		else
		{
			OK7JAX6TX36F = ITSF04BA;
			I67JYD8ACDF6Y = array;
			UWEYM5YJ5W2FY = num2;
			KVEEFZ065YO0KH = 1;
			GOB3OPFVX18DL = array[0];
		}
	}

	private static void F1ML3R8SZ0Q(byte KBJ5721I, int MAIM9ZMJR, ref MF17QBDJ2XZN[] OBPX6BORZ3, ref int XNIJQXA9Y, MethodBase KPH01E931VIHN6)
	{
		QETT1OIHT g7EGHJWC9W = SWI8VZHIC4J7TV[MAIM9ZMJR];
		int[] array = D3ZHTTVVTBXL[MAIM9ZMJR];
		int bRCUK7QL5WMR = g7EGHJWC9W.BRCUK7QL5WMR;
		MF17QBDJ2XZN[] array2 = new MF17QBDJ2XZN[bRCUK7QL5WMR];
		for (int num = bRCUK7QL5WMR - 1; num >= 0; num--)
		{
			array2[num] = W0SHY6ZB2T0(ref OBPX6BORZ3, ref XNIJQXA9Y);
		}
		MF17QBDJ2XZN mF17QBDJ2XZN = default;
		bool flag = (g7EGHJWC9W.UTRO6ZJEM1 & 1) != 0;
		if (flag)
		{
			mF17QBDJ2XZN = W0SHY6ZB2T0(ref OBPX6BORZ3, ref XNIJQXA9Y);
		}
		if (g7EGHJWC9W.DSX5XSDZXB1 != 0 && KLZRG7MSPUN(g7EGHJWC9W, MAIM9ZMJR, mF17QBDJ2XZN, flag, array2, KPH01E931VIHN6, out var V0DGNIBCWN))
		{
			if (g7EGHJWC9W.TU7EHPZ1WNB6 != 0)
			{
				Type type = A6C3WIL3Y0P2GG(g7EGHJWC9W.TU7EHPZ1WNB6, KPH01E931VIHN6);
				if (type != null && type != typeof(void))
				{
					YQLYFR33PBGCY(ref OBPX6BORZ3, ref XNIJQXA9Y, V0DGNIBCWN);
				}
			}
			return;
		}
		object[] array3;
		int num2;
		if (flag)
		{
			array3 = new object[bRCUK7QL5WMR + 1];
			Type xPY8HBZ = ((g7EGHJWC9W.ANRXR855M0SWG == 0) ? null : A6C3WIL3Y0P2GG(g7EGHJWC9W.ANRXR855M0SWG, KPH01E931VIHN6));
			array3[0] = ANM3SLBP(mF17QBDJ2XZN, xPY8HBZ);
			num2 = 1;
		}
		else
		{
			array3 = new object[bRCUK7QL5WMR];
			num2 = 0;
		}
		for (int i = 0; i < bRCUK7QL5WMR; i++)
		{
			Type b2LWDMBH9H = ((array[i] == 0) ? null : A6C3WIL3Y0P2GG(array[i], KPH01E931VIHN6));
			MF17QBDJ2XZN mF17QBDJ2XZN2 = array2[i];
			if (mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
			{
				array3[num2 + i] = UILMDHEUWW(KBCKWMUMXML(mF17QBDJ2XZN2), b2LWDMBH9H);
			}
			else if (mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.WJPEM36CYE0)
			{
				array3[num2 + i] = mF17QBDJ2XZN2.TWKPQR6TSEL4JD;
			}
			else
			{
				array3[num2 + i] = UILMDHEUWW(mF17QBDJ2XZN2, b2LWDMBH9H);
			}
		}
		object nZACAI1OO4OR = GQKXGFYMAH(g7EGHJWC9W.X4F8H5QYSFG, array3);
		for (int j = 0; j < bRCUK7QL5WMR; j++)
		{
			if (((g7EGHJWC9W.QFWCFD51 >> j) & 1) != 0 && array2[j].P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
			{
				Type pK0D46KX = ((array[j] == 0) ? null : A6C3WIL3Y0P2GG(array[j], KPH01E931VIHN6));
				N7MWCC13TJYWVY(array2[j], N5FOVNHH7R(array3[num2 + j], pK0D46KX));
			}
		}
		if (flag && mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9 && array3.Length != 0)
		{
			Type type2 = ((g7EGHJWC9W.ANRXR855M0SWG == 0) ? null : A6C3WIL3Y0P2GG(g7EGHJWC9W.ANRXR855M0SWG, KPH01E931VIHN6));
			if (type2 != null && type2.IsValueType)
			{
				N7MWCC13TJYWVY(mF17QBDJ2XZN, N5FOVNHH7R(array3[0], type2));
			}
		}
		if (g7EGHJWC9W.TU7EHPZ1WNB6 != 0)
		{
			Type type3 = A6C3WIL3Y0P2GG(g7EGHJWC9W.TU7EHPZ1WNB6, KPH01E931VIHN6);
			if (type3 != null && type3 != typeof(void))
			{
				YQLYFR33PBGCY(ref OBPX6BORZ3, ref XNIJQXA9Y, N5FOVNHH7R(nZACAI1OO4OR, type3));
			}
		}
	}

	private static object ANM3SLBP(MF17QBDJ2XZN OXACTCMK3NFWH7, Type XPY8HBZ9)
	{
		if (OXACTCMK3NFWH7.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			MF17QBDJ2XZN xJ1V5RII7XUE = KBCKWMUMXML(OXACTCMK3NFWH7);
			if (xJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.HLWFIKBCY || xJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.Y4RFK5NL)
			{
				return xJ1V5RII7XUE.TWKPQR6TSEL4JD;
			}
			return UILMDHEUWW(xJ1V5RII7XUE, XPY8HBZ9);
		}
		if (OXACTCMK3NFWH7.P7LCR721 == DV3CMNYZ.HLWFIKBCY || OXACTCMK3NFWH7.P7LCR721 == DV3CMNYZ.Y4RFK5NL)
		{
			return OXACTCMK3NFWH7.TWKPQR6TSEL4JD;
		}
		return UILMDHEUWW(OXACTCMK3NFWH7, XPY8HBZ9);
	}

	private static object GQKXGFYMAH(int CE7JZJ8NA, object[] K2QI6DXDH83XY)
	{
		try
		{
			return M6D0D278DTP[CE7JZJ8NA].Invoke(null, new object[1] { K2QI6DXDH83XY });
		}
		catch (TargetInvocationException ex)
		{
			if (ex.InnerException != null)
			{
				throw ex.InnerException;
			}
			throw;
		}
	}

	private static void C2YDXY2WA0A2S(byte G8CM8U4X3P, ref MF17QBDJ2XZN[] CBJ2JMQPE, ref int XU40M8210)
	{
		MF17QBDJ2XZN mF17QBDJ2XZN = W0SHY6ZB2T0(ref CBJ2JMQPE, ref XU40M8210);
		MF17QBDJ2XZN mF17QBDJ2XZN2 = W0SHY6ZB2T0(ref CBJ2JMQPE, ref XU40M8210);
		if (mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			mF17QBDJ2XZN2 = KBCKWMUMXML(mF17QBDJ2XZN2);
		}
		if (mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			mF17QBDJ2XZN = KBCKWMUMXML(mF17QBDJ2XZN);
		}
		if (mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.IXQCPIWABD || mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			if (G8CM8U4X3P != 14)
			{
				DO78FA91UGCJ();
			}
			else
			{
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN(EDCZVI61K(mF17QBDJ2XZN2, mF17QBDJ2XZN) ? 1 : 0));
			}
			return;
		}
		if (mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.PSQWPP92 || mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			double num = VJG4PFQGX3(mF17QBDJ2XZN2);
			double num2 = VJG4PFQGX3(mF17QBDJ2XZN);
			switch (G8CM8U4X3P)
			{
			case 1:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.AETACUN9G(num + num2));
				break;
			case 2:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.AETACUN9G(num - num2));
				break;
			case 3:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.AETACUN9G(num * num2));
				break;
			case 4:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.AETACUN9G(num / num2));
				break;
			case 6:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.AETACUN9G(num % num2));
				break;
			case 14:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN((num == num2) ? 1 : 0));
				break;
			case 15:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN((num > num2) ? 1 : 0));
				break;
			case 17:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN((num < num2) ? 1 : 0));
				break;
			case 16:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN((!(num <= num2)) ? 1 : 0));
				break;
			case 18:
				YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN((!(num >= num2)) ? 1 : 0));
				break;
			default:
				DO78FA91UGCJ();
				break;
			}
			return;
		}
		bool num3 = mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.MQ1612J556 || mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.MQ1612J556 || mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.BBR61ES6SP || mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.BBR61ES6SP;
		bool flag = mF17QBDJ2XZN2.P7LCR721 == DV3CMNYZ.BBR61ES6SP || mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.BBR61ES6SP;
		if (!num3)
		{
			int num4 = LFATGDD1N43(mF17QBDJ2XZN2);
			int num5 = LFATGDD1N43(mF17QBDJ2XZN);
			int y0HB5H5JK0UW;
			switch (G8CM8U4X3P)
			{
			case 1:
				y0HB5H5JK0UW = num4 + num5;
				break;
			case 2:
				y0HB5H5JK0UW = num4 - num5;
				break;
			case 3:
				y0HB5H5JK0UW = num4 * num5;
				break;
			case 4:
				if (num5 == 0)
				{
					throw new DivideByZeroException();
				}
				if (num4 == int.MinValue && num5 == -1)
				{
					throw new OverflowException();
				}
				y0HB5H5JK0UW = num4 / num5;
				break;
			case 5:
				if (num5 == 0)
				{
					throw new DivideByZeroException();
				}
				y0HB5H5JK0UW = (int)((uint)num4 / (uint)num5);
				break;
			case 6:
				if (num5 == 0)
				{
					throw new DivideByZeroException();
				}
				y0HB5H5JK0UW = ((num4 != int.MinValue || num5 != -1) ? (num4 % num5) : 0);
				break;
			case 7:
				if (num5 == 0)
				{
					throw new DivideByZeroException();
				}
				y0HB5H5JK0UW = (int)((uint)num4 % (uint)num5);
				break;
			case 8:
				y0HB5H5JK0UW = num4 & num5;
				break;
			case 9:
				y0HB5H5JK0UW = num4 | num5;
				break;
			case 10:
				y0HB5H5JK0UW = num4 ^ num5;
				break;
			case 11:
				y0HB5H5JK0UW = num4 << (num5 & 0x1F);
				break;
			case 12:
				y0HB5H5JK0UW = num4 >> (num5 & 0x1F);
				break;
			case 13:
				y0HB5H5JK0UW = num4 >>> (num5 & 0x1F);
				break;
			case 14:
				y0HB5H5JK0UW = ((num4 == num5) ? 1 : 0);
				break;
			case 15:
				y0HB5H5JK0UW = ((num4 > num5) ? 1 : 0);
				break;
			case 17:
				y0HB5H5JK0UW = ((num4 < num5) ? 1 : 0);
				break;
			case 16:
				y0HB5H5JK0UW = (((uint)num4 > (uint)num5) ? 1 : 0);
				break;
			case 18:
				y0HB5H5JK0UW = (((uint)num4 < (uint)num5) ? 1 : 0);
				break;
			case 19:
				y0HB5H5JK0UW = checked(num4 + num5);
				break;
			case 21:
				y0HB5H5JK0UW = checked(num4 - num5);
				break;
			case 23:
				y0HB5H5JK0UW = checked(num4 * num5);
				break;
			case 20:
				y0HB5H5JK0UW = (int)checked((uint)num4 + (uint)num5);
				break;
			case 22:
				y0HB5H5JK0UW = (int)checked((uint)num4 - (uint)num5);
				break;
			case 24:
				y0HB5H5JK0UW = (int)checked((uint)num4 * (uint)num5);
				break;
			default:
				DO78FA91UGCJ();
				return;
			}
			YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN(y0HB5H5JK0UW));
			return;
		}
		long num6 = AJX2UJ4GMLEP(mF17QBDJ2XZN2);
		long num7 = AJX2UJ4GMLEP(mF17QBDJ2XZN);
		long num8;
		switch (G8CM8U4X3P)
		{
		case 1:
			num8 = num6 + num7;
			break;
		case 2:
			num8 = num6 - num7;
			break;
		case 3:
			num8 = num6 * num7;
			break;
		case 4:
			if (num7 == 0L)
			{
				throw new DivideByZeroException();
			}
			if (num6 == long.MinValue && num7 == -1)
			{
				throw new OverflowException();
			}
			num8 = num6 / num7;
			break;
		case 5:
			if (num7 == 0L)
			{
				throw new DivideByZeroException();
			}
			num8 = (long)((ulong)num6 / (ulong)num7);
			break;
		case 6:
			if (num7 == 0L)
			{
				throw new DivideByZeroException();
			}
			num8 = ((num6 != long.MinValue || num7 != -1) ? (num6 % num7) : 0);
			break;
		case 7:
			if (num7 == 0L)
			{
				throw new DivideByZeroException();
			}
			num8 = (long)((ulong)num6 % (ulong)num7);
			break;
		case 8:
			num8 = num6 & num7;
			break;
		case 9:
			num8 = num6 | num7;
			break;
		case 10:
			num8 = num6 ^ num7;
			break;
		case 11:
			num8 = num6 << (int)(num7 & 0x3F);
			break;
		case 12:
			num8 = num6 >> (int)(num7 & 0x3F);
			break;
		case 13:
			num8 = num6 >>> (int)(num7 & 0x3F);
			break;
		case 14:
			num8 = ((num6 == num7) ? 1 : 0);
			break;
		case 15:
			num8 = ((num6 > num7) ? 1 : 0);
			break;
		case 17:
			num8 = ((num6 < num7) ? 1 : 0);
			break;
		case 16:
			num8 = (((ulong)num6 > (ulong)num7) ? 1 : 0);
			break;
		case 18:
			num8 = (((ulong)num6 < (ulong)num7) ? 1 : 0);
			break;
		case 19:
			num8 = checked(num6 + num7);
			break;
		case 21:
			num8 = checked(num6 - num7);
			break;
		case 23:
			num8 = checked(num6 * num7);
			break;
		case 20:
			num8 = (long)checked((ulong)num6 + (ulong)num7);
			break;
		case 22:
			num8 = (long)checked((ulong)num6 - (ulong)num7);
			break;
		case 24:
			num8 = (long)checked((ulong)num6 * (ulong)num7);
			break;
		default:
			DO78FA91UGCJ();
			return;
		}
		if (flag && IntPtr.Size == 4)
		{
			YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.UTGMQIE8((int)num8));
		}
		else if (flag)
		{
			YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.UTGMQIE8(num8));
		}
		else if (G8CM8U4X3P >= 14 && G8CM8U4X3P <= 18)
		{
			YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.BOMPQ5YKVN((int)num8));
		}
		else
		{
			YQLYFR33PBGCY(ref CBJ2JMQPE, ref XU40M8210, MF17QBDJ2XZN.E6MQKQ3X5(num8));
		}
	}

	private static void CUJ3J5RYE(byte L8J3UXS31NUNOH, ref MF17QBDJ2XZN[] JIVWVC6DIG, ref int UPSO41LG18L)
	{
		MF17QBDJ2XZN vRM2FCRB = W0SHY6ZB2T0(ref JIVWVC6DIG, ref UPSO41LG18L);
		if (vRM2FCRB.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			vRM2FCRB = KBCKWMUMXML(vRM2FCRB);
		}
		switch (L8J3UXS31NUNOH)
		{
		case 1:
			if (vRM2FCRB.P7LCR721 == DV3CMNYZ.PSQWPP92)
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.AETACUN9G(0.0 - vRM2FCRB.UX79V5QBV5));
			}
			else if (vRM2FCRB.P7LCR721 == DV3CMNYZ.MQ1612J556)
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.E6MQKQ3X5(-vRM2FCRB.BM5CYY368));
			}
			else if (vRM2FCRB.P7LCR721 == DV3CMNYZ.BBR61ES6SP)
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.UTGMQIE8(-vRM2FCRB.BM5CYY368));
			}
			else
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.BOMPQ5YKVN(-(int)vRM2FCRB.BM5CYY368));
			}
			break;
		case 2:
			if (vRM2FCRB.P7LCR721 == DV3CMNYZ.MQ1612J556)
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.E6MQKQ3X5(~vRM2FCRB.BM5CYY368));
			}
			else if (vRM2FCRB.P7LCR721 == DV3CMNYZ.BBR61ES6SP)
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.UTGMQIE8(~vRM2FCRB.BM5CYY368));
			}
			else
			{
				YQLYFR33PBGCY(ref JIVWVC6DIG, ref UPSO41LG18L, MF17QBDJ2XZN.BOMPQ5YKVN((int)(~vRM2FCRB.BM5CYY368)));
			}
			break;
		default:
			DO78FA91UGCJ();
			break;
		}
	}

	private static void EYQ8AMX0(byte BS6X6CT5T, ref MF17QBDJ2XZN[] AXC5CKNS2CIQNB, ref int L7EE60VQL)
	{
		MF17QBDJ2XZN mF17QBDJ2XZN = W0SHY6ZB2T0(ref AXC5CKNS2CIQNB, ref L7EE60VQL);
		if (mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			mF17QBDJ2XZN = KBCKWMUMXML(mF17QBDJ2XZN);
		}
		switch (BS6X6CT5T)
		{
		case 1:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN((sbyte)LFATGDD1N43(mF17QBDJ2XZN)));
			break;
		case 5:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN((byte)LFATGDD1N43(mF17QBDJ2XZN)));
			break;
		case 2:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN((short)LFATGDD1N43(mF17QBDJ2XZN)));
			break;
		case 6:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN((ushort)LFATGDD1N43(mF17QBDJ2XZN)));
			break;
		case 3:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN(LFATGDD1N43(mF17QBDJ2XZN)));
			break;
		case 7:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN((int)AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			break;
		case 4:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.E6MQKQ3X5(AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			break;
		case 8:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.E6MQKQ3X5(AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			break;
		case 9:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.AETACUN9G((float)VJG4PFQGX3(mF17QBDJ2XZN)));
			break;
		case 10:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.AETACUN9G(VJG4PFQGX3(mF17QBDJ2XZN)));
			break;
		case 13:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.AETACUN9G((mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.MQ1612J556 || mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.BBR61ES6SP) ? ((double)(ulong)AJX2UJ4GMLEP(mF17QBDJ2XZN)) : ((double)(uint)LFATGDD1N43(mF17QBDJ2XZN))));
			break;
		case 11:
			if (IntPtr.Size == 4)
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8(LFATGDD1N43(mF17QBDJ2XZN)));
			}
			else
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8(AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			}
			break;
		case 12:
			if (IntPtr.Size == 4)
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8((int)AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			}
			else
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8(AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			}
			break;
		case 14:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN(checked((int)AJX2UJ4GMLEP(mF17QBDJ2XZN))));
			break;
		case 15:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.E6MQKQ3X5(checked((long)VJG4PFQGX3(mF17QBDJ2XZN))));
			break;
		case 16:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.BOMPQ5YKVN((int)checked((uint)AJX2UJ4GMLEP(mF17QBDJ2XZN))));
			break;
		case 17:
			YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.E6MQKQ3X5((long)checked((ulong)VJG4PFQGX3(mF17QBDJ2XZN))));
			break;
		case 18:
			if (IntPtr.Size == 4)
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8(checked((int)AJX2UJ4GMLEP(mF17QBDJ2XZN))));
			}
			else
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8(AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			}
			break;
		case 19:
			if (IntPtr.Size == 4)
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8((int)checked((uint)AJX2UJ4GMLEP(mF17QBDJ2XZN))));
			}
			else
			{
				YQLYFR33PBGCY(ref AXC5CKNS2CIQNB, ref L7EE60VQL, MF17QBDJ2XZN.UTGMQIE8(AJX2UJ4GMLEP(mF17QBDJ2XZN)));
			}
			break;
		default:
			DO78FA91UGCJ();
			break;
		}
	}

	private static bool YW18Z1KHDKND3(MF17QBDJ2XZN QW34X8VE4P, MF17QBDJ2XZN DO0WEQH1EFX, byte ODK7IJ13ME1R)
	{
		if (QW34X8VE4P.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			QW34X8VE4P = KBCKWMUMXML(QW34X8VE4P);
		}
		if (DO0WEQH1EFX.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			DO0WEQH1EFX = KBCKWMUMXML(DO0WEQH1EFX);
		}
		if (QW34X8VE4P.P7LCR721 == DV3CMNYZ.IXQCPIWABD || DO0WEQH1EFX.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			if (ODK7IJ13ME1R != 1 && ODK7IJ13ME1R != 2)
			{
				DO78FA91UGCJ();
				return false;
			}
			bool flag = EDCZVI61K(QW34X8VE4P, DO0WEQH1EFX);
			if (ODK7IJ13ME1R != 1)
			{
				return !flag;
			}
			return flag;
		}
		if (QW34X8VE4P.P7LCR721 == DV3CMNYZ.PSQWPP92 || DO0WEQH1EFX.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			double num = VJG4PFQGX3(QW34X8VE4P);
			double num2 = VJG4PFQGX3(DO0WEQH1EFX);
			bool flag2 = double.IsNaN(num) || double.IsNaN(num2);
			switch (ODK7IJ13ME1R)
			{
			case 1:
				return num == num2;
			case 2:
				if (!flag2)
				{
					return num != num2;
				}
				return true;
			case 3:
				return num > num2;
			case 4:
				if (!flag2)
				{
					return num >= num2;
				}
				return false;
			case 5:
				return num < num2;
			case 6:
				if (!flag2)
				{
					return num <= num2;
				}
				return false;
			case 7:
				if (!flag2)
				{
					return num > num2;
				}
				return true;
			case 8:
				if (!flag2)
				{
					return num >= num2;
				}
				return true;
			case 9:
				if (!flag2)
				{
					return num < num2;
				}
				return true;
			case 10:
				if (!flag2)
				{
					return num <= num2;
				}
				return true;
			default:
				DO78FA91UGCJ();
				return false;
			}
		}
		bool flag3 = ODK7IJ13ME1R >= 7;
		bool flag4 = QW34X8VE4P.P7LCR721 == DV3CMNYZ.MQ1612J556 || DO0WEQH1EFX.P7LCR721 == DV3CMNYZ.MQ1612J556 || QW34X8VE4P.P7LCR721 == DV3CMNYZ.BBR61ES6SP || DO0WEQH1EFX.P7LCR721 == DV3CMNYZ.BBR61ES6SP;
		int num5;
		if (!flag4 && !flag3)
		{
			int num3 = LFATGDD1N43(QW34X8VE4P);
			int num4 = LFATGDD1N43(DO0WEQH1EFX);
			num5 = ((num3 < num4) ? (-1) : ((num3 > num4) ? 1 : 0));
		}
		else if (!flag4)
		{
			uint num6 = (uint)LFATGDD1N43(QW34X8VE4P);
			uint num7 = (uint)LFATGDD1N43(DO0WEQH1EFX);
			num5 = ((num6 < num7) ? (-1) : ((num6 > num7) ? 1 : 0));
		}
		else if (!flag3)
		{
			long num8 = AJX2UJ4GMLEP(QW34X8VE4P);
			long num9 = AJX2UJ4GMLEP(DO0WEQH1EFX);
			num5 = ((num8 < num9) ? (-1) : ((num8 > num9) ? 1 : 0));
		}
		else
		{
			ulong num10 = (ulong)AJX2UJ4GMLEP(QW34X8VE4P);
			ulong num11 = (ulong)AJX2UJ4GMLEP(DO0WEQH1EFX);
			num5 = ((num10 < num11) ? (-1) : ((num10 > num11) ? 1 : 0));
		}
		switch (ODK7IJ13ME1R)
		{
		case 1:
			return num5 == 0;
		case 2:
			return num5 != 0;
		case 3:
			return num5 > 0;
		case 4:
			return num5 >= 0;
		case 5:
			return num5 < 0;
		case 6:
			return num5 <= 0;
		case 7:
			return num5 > 0;
		case 8:
			return num5 >= 0;
		case 9:
			return num5 < 0;
		case 10:
			return num5 <= 0;
		default:
			DO78FA91UGCJ();
			return false;
		}
	}

	private static MF17QBDJ2XZN X02MF32LS(MF17QBDJ2XZN JUV94GLYI9AJ, byte JBM4CWEAXJNGZ)
	{
		switch (JBM4CWEAXJNGZ)
		{
		case 1:
			return MF17QBDJ2XZN.BOMPQ5YKVN((sbyte)LFATGDD1N43(JUV94GLYI9AJ));
		case 5:
			return MF17QBDJ2XZN.BOMPQ5YKVN((byte)LFATGDD1N43(JUV94GLYI9AJ));
		case 2:
			return MF17QBDJ2XZN.BOMPQ5YKVN((short)LFATGDD1N43(JUV94GLYI9AJ));
		case 6:
			return MF17QBDJ2XZN.BOMPQ5YKVN((ushort)LFATGDD1N43(JUV94GLYI9AJ));
		case 3:
			return MF17QBDJ2XZN.BOMPQ5YKVN(LFATGDD1N43(JUV94GLYI9AJ));
		case 7:
			return MF17QBDJ2XZN.BOMPQ5YKVN(LFATGDD1N43(JUV94GLYI9AJ));
		case 4:
			return MF17QBDJ2XZN.E6MQKQ3X5(AJX2UJ4GMLEP(JUV94GLYI9AJ));
		case 8:
			return MF17QBDJ2XZN.AETACUN9G((float)VJG4PFQGX3(JUV94GLYI9AJ));
		case 9:
			return MF17QBDJ2XZN.AETACUN9G(VJG4PFQGX3(JUV94GLYI9AJ));
		case 11:
			if (IntPtr.Size == 4)
			{
				return MF17QBDJ2XZN.UTGMQIE8(LFATGDD1N43(JUV94GLYI9AJ));
			}
			return MF17QBDJ2XZN.UTGMQIE8(AJX2UJ4GMLEP(JUV94GLYI9AJ));
		default:
			return JUV94GLYI9AJ;
		}
	}

	private static MF17QBDJ2XZN K9L5LBS7MX(byte XXAPSRJX8O, int U80YOU0LH2, MethodBase T6Y6EZIJ)
	{
		return XXAPSRJX8O switch
		{
			1 => MF17QBDJ2XZN.Z9CM4XCRMKU75(A6C3WIL3Y0P2GG(U80YOU0LH2, T6Y6EZIJ).TypeHandle), 
			2 => MF17QBDJ2XZN.Z9CM4XCRMKU75(DS68XOTBRWOGT(U80YOU0LH2, T6Y6EZIJ).MethodHandle), 
			_ => MF17QBDJ2XZN.Z9CM4XCRMKU75(P4IC1Y2IVRW(U80YOU0LH2, T6Y6EZIJ).FieldHandle), 
		};
	}

	private static MF17QBDJ2XZN SZUF9DUE1ET(object AEHNEWX8HBPS2, Type C0WNTOZ8VCOUZK)
	{
		if (C0WNTOZ8VCOUZK == null)
		{
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(AEHNEWX8HBPS2);
		}
		if (!C0WNTOZ8VCOUZK.IsValueType)
		{
			if (AEHNEWX8HBPS2 != null && !C0WNTOZ8VCOUZK.IsAssignableFrom(AEHNEWX8HBPS2.GetType()))
			{
				throw new InvalidCastException();
			}
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(AEHNEWX8HBPS2);
		}
		if (AEHNEWX8HBPS2 == null)
		{
			throw new NullReferenceException();
		}
		return N5FOVNHH7R(AEHNEWX8HBPS2, C0WNTOZ8VCOUZK);
	}

	private static bool PTDIN02RT9CUKI(MF17QBDJ2XZN HCMD93SOUFBC)
	{
		if (HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			HCMD93SOUFBC = KBCKWMUMXML(HCMD93SOUFBC);
		}
		if (HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.Y4RFK5NL || HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.Y3SEV4IY3HNBXZ)
		{
			return false;
		}
		if (HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			return true;
		}
		if (HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			return HCMD93SOUFBC.UX79V5QBV5 != 0.0;
		}
		if (HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.HLWFIKBCY || HCMD93SOUFBC.P7LCR721 == DV3CMNYZ.WJPEM36CYE0)
		{
			return HCMD93SOUFBC.TWKPQR6TSEL4JD != null;
		}
		return HCMD93SOUFBC.BM5CYY368 != 0;
	}

	private static MF17QBDJ2XZN D9U7M8VRLJO(MF17QBDJ2XZN IJDNR4OZ7)
	{
		if (IJDNR4OZ7.P7LCR721 == DV3CMNYZ.HLWFIKBCY && IJDNR4OZ7.TWKPQR6TSEL4JD != null && IJDNR4OZ7.TWKPQR6TSEL4JD.GetType().IsValueType)
		{
			IJDNR4OZ7.TWKPQR6TSEL4JD = IHWLFDFTDMYJM(IJDNR4OZ7.TWKPQR6TSEL4JD);
		}
		return IJDNR4OZ7;
	}

	private static object IHWLFDFTDMYJM(object LEHMXG8277Y)
	{
		if (LEHMXG8277Y == null)
		{
			return null;
		}
		Type type = LEHMXG8277Y.GetType();
		if (!type.IsValueType)
		{
			return LEHMXG8277Y;
		}
		object obj = Activator.CreateInstance(type);
		while (type != null && type != typeof(object) && type != typeof(ValueType))
		{
			FieldInfo[] fields = type.GetFields(BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
			for (int i = 0; i < fields.Length; i++)
			{
				fields[i].SetValue(obj, fields[i].GetValue(LEHMXG8277Y));
			}
			type = type.BaseType;
		}
		return obj;
	}

	private static MF17QBDJ2XZN KBCKWMUMXML(MF17QBDJ2XZN VRM2FCRB)
	{
		if (VRM2FCRB.P7LCR721 != DV3CMNYZ.KAR68QYSS1DBT9)
		{
			return VRM2FCRB;
		}
		XPW79CCA0Z7AM xPW79CCA0Z7AM = (XPW79CCA0Z7AM)VRM2FCRB.TWKPQR6TSEL4JD;
		if (xPW79CCA0Z7AM.B6C7V8393N == 2)
		{
			return xPW79CCA0Z7AM.U4E9E36P4C.PFQJAWSLDAXI8T[xPW79CCA0Z7AM.MION9PHQ3H9MO];
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 1)
		{
			return xPW79CCA0Z7AM.U4E9E36P4C.G7N19SD4[xPW79CCA0Z7AM.MION9PHQ3H9MO];
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 3)
		{
			Array array = (Array)xPW79CCA0Z7AM.INFN96WI;
			if (array == null)
			{
				throw new NullReferenceException();
			}
			return N5FOVNHH7R(array.GetValue(xPW79CCA0Z7AM.N4XW1KZTS), array.GetType().GetElementType());
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 4)
		{
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(xPW79CCA0Z7AM.INFN96WI);
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 5)
		{
			return OK3SDCXOH2IL(xPW79CCA0Z7AM);
		}
		DO78FA91UGCJ();
		return default;
	}

	private static void N7MWCC13TJYWVY(MF17QBDJ2XZN M2ZMY97D, MF17QBDJ2XZN ESF4GW5QWW6DZ)
	{
		if (M2ZMY97D.P7LCR721 != DV3CMNYZ.KAR68QYSS1DBT9)
		{
			DO78FA91UGCJ();
		}
		XPW79CCA0Z7AM xPW79CCA0Z7AM = (XPW79CCA0Z7AM)M2ZMY97D.TWKPQR6TSEL4JD;
		if (ESF4GW5QWW6DZ.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			ESF4GW5QWW6DZ = KBCKWMUMXML(ESF4GW5QWW6DZ);
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 2)
		{
			Type type = xPW79CCA0Z7AM.U4E9E36P4C.RA1SKDQBDVMHHD[xPW79CCA0Z7AM.MION9PHQ3H9MO];
			xPW79CCA0Z7AM.U4E9E36P4C.PFQJAWSLDAXI8T[xPW79CCA0Z7AM.MION9PHQ3H9MO] = ((type == null) ? ESF4GW5QWW6DZ : N5FOVNHH7R(UILMDHEUWW(ESF4GW5QWW6DZ, type), type));
			return;
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 1)
		{
			Type type2 = xPW79CCA0Z7AM.U4E9E36P4C.UAY2QGUPINF680[xPW79CCA0Z7AM.MION9PHQ3H9MO];
			xPW79CCA0Z7AM.U4E9E36P4C.G7N19SD4[xPW79CCA0Z7AM.MION9PHQ3H9MO] = ((type2 == null) ? ESF4GW5QWW6DZ : N5FOVNHH7R(UILMDHEUWW(ESF4GW5QWW6DZ, type2), type2));
			return;
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 3)
		{
			Array array = (Array)xPW79CCA0Z7AM.INFN96WI;
			if (array == null)
			{
				throw new NullReferenceException();
			}
			Type elementType = array.GetType().GetElementType();
			try
			{
				array.SetValue(UILMDHEUWW(ESF4GW5QWW6DZ, elementType), xPW79CCA0Z7AM.N4XW1KZTS);
				return;
			}
			catch (ArgumentException)
			{
				throw new ArrayTypeMismatchException();
			}
		}
		if (xPW79CCA0Z7AM.B6C7V8393N == 4)
		{
			xPW79CCA0Z7AM.INFN96WI = UILMDHEUWW(ESF4GW5QWW6DZ, (ESF4GW5QWW6DZ.TWKPQR6TSEL4JD != null) ? ESF4GW5QWW6DZ.TWKPQR6TSEL4JD.GetType() : typeof(object));
		}
		else if (xPW79CCA0Z7AM.B6C7V8393N == 5)
		{
			Q6OIA82A0EFB5Q(xPW79CCA0Z7AM, ESF4GW5QWW6DZ);
		}
		else
		{
			DO78FA91UGCJ();
		}
	}

	private static MF17QBDJ2XZN OK3SDCXOH2IL(XPW79CCA0Z7AM JFN7V3TQT6)
	{
		FieldInfo fieldInfo = (FieldInfo)JFN7V3TQT6.V8H14PQDYL29M;
		object obj = GAIUJGDRR2(JFN7V3TQT6, fieldInfo);
		if (obj == null && !fieldInfo.IsStatic)
		{
			throw new NullReferenceException();
		}
		return N5FOVNHH7R(fieldInfo.GetValue(obj), fieldInfo.FieldType);
	}

	private static void Q6OIA82A0EFB5Q(XPW79CCA0Z7AM BG0KMV5JTKIYK, MF17QBDJ2XZN EHAN65GXO)
	{
		FieldInfo fieldInfo = (FieldInfo)BG0KMV5JTKIYK.V8H14PQDYL29M;
		object value = UILMDHEUWW(EHAN65GXO, fieldInfo.FieldType);
		if (BG0KMV5JTKIYK.WTNPO3LS5GDW != null)
		{
			object obj = GAIUJGDRR2(BG0KMV5JTKIYK, fieldInfo);
			if (obj == null)
			{
				throw new NullReferenceException();
			}
			fieldInfo.SetValue(obj, value);
			N7MWCC13TJYWVY(MF17QBDJ2XZN.VUJVHZV3TI8(BG0KMV5JTKIYK.WTNPO3LS5GDW), N5FOVNHH7R(obj, fieldInfo.DeclaringType));
		}
		else
		{
			if (BG0KMV5JTKIYK.INFN96WI == null && !fieldInfo.IsStatic)
			{
				throw new NullReferenceException();
			}
			fieldInfo.SetValue(BG0KMV5JTKIYK.INFN96WI, value);
		}
	}

	private static object GAIUJGDRR2(XPW79CCA0Z7AM JZITL2X571KS0, FieldInfo XFY9VWN1MBM)
	{
		if (JZITL2X571KS0.WTNPO3LS5GDW == null)
		{
			return JZITL2X571KS0.INFN96WI;
		}
		return UILMDHEUWW(KBCKWMUMXML(MF17QBDJ2XZN.VUJVHZV3TI8(JZITL2X571KS0.WTNPO3LS5GDW)), XFY9VWN1MBM.DeclaringType);
	}

	private static MF17QBDJ2XZN HAMH0HRR3R(Type VUDT2RW8RRAMB)
	{
		if (VUDT2RW8RRAMB == null)
		{
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(null);
		}
		if (VUDT2RW8RRAMB.IsByRef)
		{
			VUDT2RW8RRAMB = VUDT2RW8RRAMB.GetElementType();
		}
		if (VUDT2RW8RRAMB.IsEnum)
		{
			VUDT2RW8RRAMB = Enum.GetUnderlyingType(VUDT2RW8RRAMB);
		}
		if (VUDT2RW8RRAMB == typeof(long) || VUDT2RW8RRAMB == typeof(ulong))
		{
			return MF17QBDJ2XZN.E6MQKQ3X5(0L);
		}
		if (VUDT2RW8RRAMB == typeof(float) || VUDT2RW8RRAMB == typeof(double))
		{
			return MF17QBDJ2XZN.AETACUN9G(0.0);
		}
		if (VUDT2RW8RRAMB == typeof(IntPtr) || VUDT2RW8RRAMB == typeof(UIntPtr))
		{
			return MF17QBDJ2XZN.UTGMQIE8(0L);
		}
		if (VUDT2RW8RRAMB.IsPrimitive || VUDT2RW8RRAMB == typeof(bool) || VUDT2RW8RRAMB == typeof(char))
		{
			return MF17QBDJ2XZN.BOMPQ5YKVN(0);
		}
		if (VUDT2RW8RRAMB.IsValueType)
		{
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(Activator.CreateInstance(VUDT2RW8RRAMB));
		}
		return MF17QBDJ2XZN.Z9CM4XCRMKU75(null);
	}

	private static MF17QBDJ2XZN N5FOVNHH7R(object NZACAI1OO4OR, Type PK0D46KX)
	{
		if (PK0D46KX != null && PK0D46KX.IsByRef)
		{
			PK0D46KX = PK0D46KX.GetElementType();
		}
		if (NZACAI1OO4OR == null)
		{
			if (PK0D46KX != null && PK0D46KX.IsValueType && Nullable.GetUnderlyingType(PK0D46KX) == null)
			{
				return HAMH0HRR3R(PK0D46KX);
			}
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(null);
		}
		if (PK0D46KX != null && PK0D46KX.IsEnum)
		{
			return N5FOVNHH7R(NZACAI1OO4OR, Enum.GetUnderlyingType(PK0D46KX));
		}
		if (PK0D46KX == typeof(int) || PK0D46KX == typeof(uint) || PK0D46KX == typeof(short) || PK0D46KX == typeof(ushort) || PK0D46KX == typeof(byte) || PK0D46KX == typeof(sbyte) || PK0D46KX == typeof(char) || PK0D46KX == typeof(bool))
		{
			return MF17QBDJ2XZN.BOMPQ5YKVN(U1YFTJ3H15HMTF(NZACAI1OO4OR));
		}
		if (PK0D46KX == typeof(long))
		{
			return MF17QBDJ2XZN.E6MQKQ3X5(XSQKVO6B4(NZACAI1OO4OR));
		}
		if (PK0D46KX == typeof(ulong))
		{
			return MF17QBDJ2XZN.E6MQKQ3X5((long)ZOGJTZY4O5X1N7(NZACAI1OO4OR));
		}
		if (PK0D46KX == typeof(IntPtr))
		{
			return MF17QBDJ2XZN.UTGMQIE8(((IntPtr)NZACAI1OO4OR).ToInt64());
		}
		if (PK0D46KX == typeof(UIntPtr))
		{
			return MF17QBDJ2XZN.UTGMQIE8((long)((UIntPtr)NZACAI1OO4OR).ToUInt64());
		}
		if (PK0D46KX == typeof(float))
		{
			return MF17QBDJ2XZN.AETACUN9G(W41OP3DB(NZACAI1OO4OR));
		}
		if (PK0D46KX == typeof(double))
		{
			return MF17QBDJ2XZN.AETACUN9G(W41OP3DB(NZACAI1OO4OR));
		}
		if (PK0D46KX != null)
		{
			_ = PK0D46KX.IsValueType;
			return MF17QBDJ2XZN.Z9CM4XCRMKU75(NZACAI1OO4OR);
		}
		return MF17QBDJ2XZN.Z9CM4XCRMKU75(NZACAI1OO4OR);
	}

	private static object UILMDHEUWW(MF17QBDJ2XZN XJ1V5RII7XUE, Type B2LWDMBH9H)
	{
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			XJ1V5RII7XUE = KBCKWMUMXML(XJ1V5RII7XUE);
		}
		if (B2LWDMBH9H != null && B2LWDMBH9H.IsByRef)
		{
			B2LWDMBH9H = B2LWDMBH9H.GetElementType();
		}
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			return L4QJ39X346FIY((VKX10TW32TH)XJ1V5RII7XUE.TWKPQR6TSEL4JD);
		}
		if (B2LWDMBH9H != null && B2LWDMBH9H.IsEnum)
		{
			object value = UILMDHEUWW(XJ1V5RII7XUE, Enum.GetUnderlyingType(B2LWDMBH9H));
			return Enum.ToObject(B2LWDMBH9H, value);
		}
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.Y4RFK5NL || XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.Y3SEV4IY3HNBXZ)
		{
			return null;
		}
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.HLWFIKBCY || XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.WJPEM36CYE0)
		{
			return XJ1V5RII7XUE.TWKPQR6TSEL4JD;
		}
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			if (B2LWDMBH9H == typeof(float))
			{
				return (float)XJ1V5RII7XUE.UX79V5QBV5;
			}
			return XJ1V5RII7XUE.UX79V5QBV5;
		}
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.MQ1612J556)
		{
			if (B2LWDMBH9H == typeof(ulong))
			{
				return (ulong)XJ1V5RII7XUE.BM5CYY368;
			}
			if (B2LWDMBH9H == typeof(int))
			{
				return (int)XJ1V5RII7XUE.BM5CYY368;
			}
			if (B2LWDMBH9H == typeof(uint))
			{
				return (uint)XJ1V5RII7XUE.BM5CYY368;
			}
			return XJ1V5RII7XUE.BM5CYY368;
		}
		if (XJ1V5RII7XUE.P7LCR721 == DV3CMNYZ.BBR61ES6SP)
		{
			if (B2LWDMBH9H == typeof(IntPtr))
			{
				return new IntPtr(XJ1V5RII7XUE.BM5CYY368);
			}
			if (B2LWDMBH9H == typeof(UIntPtr))
			{
				return new UIntPtr((ulong)XJ1V5RII7XUE.BM5CYY368);
			}
			if (IntPtr.Size == 4)
			{
				return (int)XJ1V5RII7XUE.BM5CYY368;
			}
			return XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(bool))
		{
			return XJ1V5RII7XUE.BM5CYY368 != 0;
		}
		if (B2LWDMBH9H == typeof(byte))
		{
			return (byte)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(sbyte))
		{
			return (sbyte)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(short))
		{
			return (short)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(ushort))
		{
			return (ushort)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(char))
		{
			return (char)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(uint))
		{
			return (uint)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(long))
		{
			return (long)(int)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(ulong))
		{
			return (ulong)(uint)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(float))
		{
			return (float)(int)XJ1V5RII7XUE.BM5CYY368;
		}
		if (B2LWDMBH9H == typeof(double))
		{
			return (double)(int)XJ1V5RII7XUE.BM5CYY368;
		}
		return (int)XJ1V5RII7XUE.BM5CYY368;
	}

	private static int U1YFTJ3H15HMTF(object JXBZYHE7K)
	{
		if (JXBZYHE7K is int)
		{
			return (int)JXBZYHE7K;
		}
		if (JXBZYHE7K is uint)
		{
			return (int)(uint)JXBZYHE7K;
		}
		if (JXBZYHE7K is short)
		{
			return (short)JXBZYHE7K;
		}
		if (JXBZYHE7K is ushort)
		{
			return (ushort)JXBZYHE7K;
		}
		if (JXBZYHE7K is byte)
		{
			return (byte)JXBZYHE7K;
		}
		if (JXBZYHE7K is sbyte)
		{
			return (sbyte)JXBZYHE7K;
		}
		if (JXBZYHE7K is char)
		{
			return (char)JXBZYHE7K;
		}
		if (JXBZYHE7K is bool)
		{
			return ((bool)JXBZYHE7K) ? 1 : 0;
		}
		if (JXBZYHE7K is long)
		{
			return (int)(long)JXBZYHE7K;
		}
		if (JXBZYHE7K is ulong)
		{
			return (int)(ulong)JXBZYHE7K;
		}
		return Convert.ToInt32(JXBZYHE7K);
	}

	private static long XSQKVO6B4(object C2DZY3NMS4Q2Q)
	{
		if (C2DZY3NMS4Q2Q is long)
		{
			return (long)C2DZY3NMS4Q2Q;
		}
		if (C2DZY3NMS4Q2Q is ulong)
		{
			return (long)(ulong)C2DZY3NMS4Q2Q;
		}
		if (C2DZY3NMS4Q2Q is int)
		{
			return (int)C2DZY3NMS4Q2Q;
		}
		if (C2DZY3NMS4Q2Q is uint)
		{
			return (uint)C2DZY3NMS4Q2Q;
		}
		return Convert.ToInt64(C2DZY3NMS4Q2Q);
	}

	private static ulong ZOGJTZY4O5X1N7(object MKKYNDVUM)
	{
		if (MKKYNDVUM is ulong)
		{
			return (ulong)MKKYNDVUM;
		}
		if (MKKYNDVUM is long)
		{
			return (ulong)(long)MKKYNDVUM;
		}
		if (MKKYNDVUM is uint)
		{
			return (uint)MKKYNDVUM;
		}
		if (MKKYNDVUM is int)
		{
			return (uint)(int)MKKYNDVUM;
		}
		return Convert.ToUInt64(MKKYNDVUM);
	}

	private static double W41OP3DB(object IGIXSEDJOHB6)
	{
		if (IGIXSEDJOHB6 is double)
		{
			return (double)IGIXSEDJOHB6;
		}
		if (IGIXSEDJOHB6 is float)
		{
			return (float)IGIXSEDJOHB6;
		}
		return Convert.ToDouble(IGIXSEDJOHB6);
	}

	private static int LFATGDD1N43(MF17QBDJ2XZN R47P8CUZ2)
	{
		if (R47P8CUZ2.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			R47P8CUZ2 = KBCKWMUMXML(R47P8CUZ2);
		}
		if (R47P8CUZ2.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			return (int)R47P8CUZ2.UX79V5QBV5;
		}
		if (R47P8CUZ2.P7LCR721 == DV3CMNYZ.HLWFIKBCY)
		{
			return U1YFTJ3H15HMTF(R47P8CUZ2.TWKPQR6TSEL4JD);
		}
		return (int)R47P8CUZ2.BM5CYY368;
	}

	private static long AJX2UJ4GMLEP(MF17QBDJ2XZN QN6WA727MO)
	{
		if (QN6WA727MO.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			QN6WA727MO = KBCKWMUMXML(QN6WA727MO);
		}
		if (QN6WA727MO.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			return (long)QN6WA727MO.UX79V5QBV5;
		}
		if (QN6WA727MO.P7LCR721 == DV3CMNYZ.HLWFIKBCY && QN6WA727MO.TWKPQR6TSEL4JD != null)
		{
			return XSQKVO6B4(QN6WA727MO.TWKPQR6TSEL4JD);
		}
		if (QN6WA727MO.P7LCR721 == DV3CMNYZ.NFOJ5W7C)
		{
			return (int)QN6WA727MO.BM5CYY368;
		}
		return QN6WA727MO.BM5CYY368;
	}

	private static double VJG4PFQGX3(MF17QBDJ2XZN T5OT47HRS)
	{
		if (T5OT47HRS.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			T5OT47HRS = KBCKWMUMXML(T5OT47HRS);
		}
		if (T5OT47HRS.P7LCR721 == DV3CMNYZ.PSQWPP92)
		{
			return T5OT47HRS.UX79V5QBV5;
		}
		if (T5OT47HRS.P7LCR721 == DV3CMNYZ.MQ1612J556 || T5OT47HRS.P7LCR721 == DV3CMNYZ.BBR61ES6SP)
		{
			return T5OT47HRS.BM5CYY368;
		}
		return (int)T5OT47HRS.BM5CYY368;
	}

	private static object GPKBCPT2(MF17QBDJ2XZN RX5I8KD90G472V)
	{
		if (RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			RX5I8KD90G472V = KBCKWMUMXML(RX5I8KD90G472V);
		}
		if (RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			return L4QJ39X346FIY((VKX10TW32TH)RX5I8KD90G472V.TWKPQR6TSEL4JD) ?? throw new NullReferenceException();
		}
		if (RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.Y4RFK5NL || (RX5I8KD90G472V.TWKPQR6TSEL4JD == null && (RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.HLWFIKBCY || RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.Y4RFK5NL || RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.Y3SEV4IY3HNBXZ)))
		{
			throw new NullReferenceException();
		}
		if (RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.HLWFIKBCY || RX5I8KD90G472V.P7LCR721 == DV3CMNYZ.WJPEM36CYE0)
		{
			return RX5I8KD90G472V.TWKPQR6TSEL4JD;
		}
		return UILMDHEUWW(RX5I8KD90G472V, null);
	}

	private static object PAIRD4045LU(MF17QBDJ2XZN W2N07OXFR6WPI)
	{
		if (W2N07OXFR6WPI.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			W2N07OXFR6WPI = KBCKWMUMXML(W2N07OXFR6WPI);
		}
		if (W2N07OXFR6WPI.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			return L4QJ39X346FIY((VKX10TW32TH)W2N07OXFR6WPI.TWKPQR6TSEL4JD);
		}
		if (W2N07OXFR6WPI.P7LCR721 == DV3CMNYZ.Y4RFK5NL || W2N07OXFR6WPI.P7LCR721 == DV3CMNYZ.Y3SEV4IY3HNBXZ)
		{
			return null;
		}
		if (W2N07OXFR6WPI.P7LCR721 == DV3CMNYZ.HLWFIKBCY || W2N07OXFR6WPI.P7LCR721 == DV3CMNYZ.WJPEM36CYE0)
		{
			return W2N07OXFR6WPI.TWKPQR6TSEL4JD;
		}
		return UILMDHEUWW(W2N07OXFR6WPI, null);
	}

	private static void YQLYFR33PBGCY(ref MF17QBDJ2XZN[] Y397NPHH, ref int L6TEQ9ZO2I, MF17QBDJ2XZN XKTGGDACMM)
	{
		if (L6TEQ9ZO2I >= Y397NPHH.Length)
		{
			MF17QBDJ2XZN[] array = new MF17QBDJ2XZN[Y397NPHH.Length * 2];
			for (int i = 0; i < Y397NPHH.Length; i++)
			{
				array[i] = Y397NPHH[i];
			}
			Y397NPHH = array;
		}
		Y397NPHH[L6TEQ9ZO2I++] = XKTGGDACMM;
	}

	private static MF17QBDJ2XZN W0SHY6ZB2T0(ref MF17QBDJ2XZN[] W1WMN4ZW, ref int VMIXK30KPF)
	{
		if (VMIXK30KPF <= 0)
		{
			DO78FA91UGCJ();
		}
		VMIXK30KPF--;
		MF17QBDJ2XZN result = W1WMN4ZW[VMIXK30KPF];
		W1WMN4ZW[VMIXK30KPF] = default;
		return result;
	}

	private static Type A6C3WIL3Y0P2GG(int KT1WIWZFANKT, MethodBase C91NO5D9Z3)
	{
		if (KT1WIWZFANKT == 0)
		{
			return null;
		}
		int num = KT1WIWZFANKT & -16777216;
		if (num == -536870912 || num == -520093696)
		{
			TQ7YKQBMYDEUS4(C91NO5D9Z3, out var HAI3J2PD, out var X6HCDRWD3G);
			Type[] array = ((num == -520093696) ? X6HCDRWD3G : HAI3J2PD);
			int num2 = KT1WIWZFANKT & 0xFFFFFF;
			if (array == null || num2 < 0 || num2 >= array.Length)
			{
				return null;
			}
			return array[num2];
		}
		TQ7YKQBMYDEUS4(C91NO5D9Z3, out var HAI3J2PD2, out var X6HCDRWD3G2);
		return typeof(XRBAXIFCLQGHN).Module.ResolveType(KT1WIWZFANKT, HAI3J2PD2, X6HCDRWD3G2);
	}

	private static MethodBase DS68XOTBRWOGT(int XIK0BPMZ70Z9B, MethodBase IDYZ0BSZ01)
	{
		TQ7YKQBMYDEUS4(IDYZ0BSZ01, out var HAI3J2PD, out var X6HCDRWD3G);
		return typeof(XRBAXIFCLQGHN).Module.ResolveMethod(XIK0BPMZ70Z9B, HAI3J2PD, X6HCDRWD3G);
	}

	private static FieldInfo P4IC1Y2IVRW(int GXONPVFIYME0N, MethodBase RQRKHSSIPUEXFB)
	{
		TQ7YKQBMYDEUS4(RQRKHSSIPUEXFB, out var HAI3J2PD, out var X6HCDRWD3G);
		return typeof(XRBAXIFCLQGHN).Module.ResolveField(GXONPVFIYME0N, HAI3J2PD, X6HCDRWD3G);
	}

	private static void TQ7YKQBMYDEUS4(MethodBase SRY4AM0LJ, out Type[] HAI3J2PD, out Type[] X6HCDRWD3G)
	{
		HAI3J2PD = Type.EmptyTypes;
		X6HCDRWD3G = Type.EmptyTypes;
		if (!(SRY4AM0LJ == null))
		{
			if (SRY4AM0LJ.DeclaringType != null && SRY4AM0LJ.DeclaringType.IsGenericType)
			{
				HAI3J2PD = SRY4AM0LJ.DeclaringType.GetGenericArguments();
			}
			MethodInfo methodInfo = SRY4AM0LJ as MethodInfo;
			if (methodInfo != null && methodInfo.IsGenericMethod)
			{
				X6HCDRWD3G = methodInfo.GetGenericArguments();
			}
		}
	}

	private static Exception XANG3W8L(Exception PAFXT9P3)
	{
		if (PAFXT9P3 is TargetInvocationException { InnerException: not null } ex)
		{
			return ex.InnerException;
		}
		return PAFXT9P3;
	}

	private static bool KLZRG7MSPUN(QETT1OIHT G7EGHJWC9W, int DC061TSDB3UO5, MF17QBDJ2XZN L3Q3LHO7XM, bool AQM021S2, MF17QBDJ2XZN[] PPQAV86QMUX, MethodBase G31QGIYPPGO, out MF17QBDJ2XZN V0DGNIBCWN)
	{
		V0DGNIBCWN = default;
		switch (G7EGHJWC9W.DSX5XSDZXB1)
		{
		case 1:
		case 2:
			return ANPHML7VDYV1X(G7EGHJWC9W, DC061TSDB3UO5, L3Q3LHO7XM, AQM021S2, PPQAV86QMUX, G31QGIYPPGO, out V0DGNIBCWN);
		case 3:
		case 4:
		case 5:
		case 6:
			return B3281C090UJ(G7EGHJWC9W, DC061TSDB3UO5, L3Q3LHO7XM, AQM021S2, PPQAV86QMUX, G31QGIYPPGO, out V0DGNIBCWN);
		case 7:
			return S81N58H3G8R(L3Q3LHO7XM, AQM021S2, out V0DGNIBCWN);
		case 8:
			return C4AVZJK50A64C3(L3Q3LHO7XM, AQM021S2, PPQAV86QMUX, out V0DGNIBCWN);
		case 9:
			return SOA22TGVVT8W(DC061TSDB3UO5, PPQAV86QMUX, G31QGIYPPGO, out V0DGNIBCWN);
		case 10:
		case 11:
			return OP5EODO75Z(G7EGHJWC9W, PPQAV86QMUX, out V0DGNIBCWN);
		default:
			return false;
		}
	}

	private static bool ANPHML7VDYV1X(QETT1OIHT GWS3NCOABH5, int SDDSV55A1D1BMD, MF17QBDJ2XZN PK0I8PWEWTI, bool HO9LHMQV4, MF17QBDJ2XZN[] PCZ6W3G4RRJ, MethodBase V0L96PD8R8NW, out MF17QBDJ2XZN Q12TY5RXDZX)
	{
		Q12TY5RXDZX = default;
		if (!B1T9CBXOKYGN(SDDSV55A1D1BMD, PCZ6W3G4RRJ, V0L96PD8R8NW, out var M7L4XGWDXG54XE))
		{
			return false;
		}
		MF17QBDJ2XZN mF17QBDJ2XZN;
		MF17QBDJ2XZN mF17QBDJ2XZN2;
		if (HO9LHMQV4)
		{
			if (A5E9AP6A1Z(PK0I8PWEWTI))
			{
				throw new NullReferenceException();
			}
			if (PCZ6W3G4RRJ.Length < 1)
			{
				return false;
			}
			mF17QBDJ2XZN = PK0I8PWEWTI;
			mF17QBDJ2XZN2 = PCZ6W3G4RRJ[0];
		}
		else
		{
			if (PCZ6W3G4RRJ.Length < 2)
			{
				return false;
			}
			mF17QBDJ2XZN = PCZ6W3G4RRJ[0];
			mF17QBDJ2XZN2 = PCZ6W3G4RRJ[1];
		}
		bool flag = WA39DMJZR67(mF17QBDJ2XZN, out var AGJAHRQ0KQNZUW);
		bool flag2 = WA39DMJZR67(mF17QBDJ2XZN2, out var AGJAHRQ0KQNZUW2);
		if (!flag || !flag2)
		{
			if (WWS93WWX(SDDSV55A1D1BMD, PCZ6W3G4RRJ, V0L96PD8R8NW) && ((flag | flag2) || FC6CSI8DGC(mF17QBDJ2XZN) || FC6CSI8DGC(mF17QBDJ2XZN2)))
			{
				bool y0HB5H5JK0UW = GWS3NCOABH5.DSX5XSDZXB1 == 2;
				Q12TY5RXDZX = MF17QBDJ2XZN.BOMPQ5YKVN(y0HB5H5JK0UW ? 1 : 0);
				return true;
			}
			return false;
		}
		bool flag3 = (AGJAHRQ0KQNZUW.SPDLYZMZ7OKO && AGJAHRQ0KQNZUW2.SPDLYZMZ7OKO) || (!AGJAHRQ0KQNZUW.SPDLYZMZ7OKO && !AGJAHRQ0KQNZUW2.SPDLYZMZ7OKO && CP8B70U93ABO(AGJAHRQ0KQNZUW, AGJAHRQ0KQNZUW2, M7L4XGWDXG54XE));
		if (GWS3NCOABH5.DSX5XSDZXB1 == 2)
		{
			flag3 = !flag3;
		}
		Q12TY5RXDZX = MF17QBDJ2XZN.BOMPQ5YKVN(flag3 ? 1 : 0);
		return true;
	}

	private static bool B3281C090UJ(QETT1OIHT FQBS5AWZDMACOL, int P16ZAYR3WKAZ6, MF17QBDJ2XZN Q3BR2LI482CD, bool K020UQKFH34IL0, MF17QBDJ2XZN[] KI4LZCRS9UV9, MethodBase T3EX70BD4TQ, out MF17QBDJ2XZN PROAGJRUV)
	{
		PROAGJRUV = default;
		if (!K020UQKFH34IL0 || KI4LZCRS9UV9.Length < 1)
		{
			return false;
		}
		if (A5E9AP6A1Z(Q3BR2LI482CD))
		{
			throw new NullReferenceException();
		}
		if (!B1T9CBXOKYGN(P16ZAYR3WKAZ6, KI4LZCRS9UV9, T3EX70BD4TQ, out var M7L4XGWDXG54XE))
		{
			return false;
		}
		if (A5E9AP6A1Z(KI4LZCRS9UV9[0]))
		{
			throw new ArgumentNullException();
		}
		if (!WA39DMJZR67(Q3BR2LI482CD, out var AGJAHRQ0KQNZUW) || AGJAHRQ0KQNZUW.SPDLYZMZ7OKO)
		{
			return false;
		}
		if (!WA39DMJZR67(KI4LZCRS9UV9[0], out var AGJAHRQ0KQNZUW2) || AGJAHRQ0KQNZUW2.SPDLYZMZ7OKO)
		{
			return false;
		}
		int num = 0;
		int num2 = 0;
		int num3 = -1;
		int[] array = D3ZHTTVVTBXL[P16ZAYR3WKAZ6];
		for (int i = 1; i < KI4LZCRS9UV9.Length; i++)
		{
			Type type = ((array != null && i < array.Length && array[i] != 0) ? A6C3WIL3Y0P2GG(array[i], T3EX70BD4TQ) : null);
			if (!(type == typeof(StringComparison)))
			{
				if (type != null && type != typeof(int))
				{
					return false;
				}
				MF17QBDJ2XZN mF17QBDJ2XZN = KI4LZCRS9UV9[i];
				if (mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
				{
					mF17QBDJ2XZN = KBCKWMUMXML(mF17QBDJ2XZN);
				}
				int num4 = LFATGDD1N43(mF17QBDJ2XZN);
				switch (num)
				{
				case 0:
					num2 = num4;
					break;
				case 1:
					num3 = num4;
					break;
				default:
					return false;
				}
				num++;
			}
		}
		int num5 = AGJAHRQ0KQNZUW.ETHH0SOCI6F();
		int num6 = AGJAHRQ0KQNZUW2.ETHH0SOCI6F();
		if (FQBS5AWZDMACOL.DSX5XSDZXB1 == 3 || FQBS5AWZDMACOL.DSX5XSDZXB1 == 4 || FQBS5AWZDMACOL.DSX5XSDZXB1 == 5)
		{
			if (num != 0)
			{
				return false;
			}
			bool y0HB5H5JK0UW;
			if (FQBS5AWZDMACOL.DSX5XSDZXB1 == 3)
			{
				y0HB5H5JK0UW = num6 <= num5 && AEAMD4TPNEHQP(AGJAHRQ0KQNZUW, AGJAHRQ0KQNZUW2, 0, num6, M7L4XGWDXG54XE);
			}
			else
			{
				y0HB5H5JK0UW = ((FQBS5AWZDMACOL.DSX5XSDZXB1 != 4) ? (num6 == 0 || HRG4MFBB7EDR(AGJAHRQ0KQNZUW, AGJAHRQ0KQNZUW2, 0, num5, num6, M7L4XGWDXG54XE) >= 0) : (num6 <= num5 && AEAMD4TPNEHQP(AGJAHRQ0KQNZUW, AGJAHRQ0KQNZUW2, num5 - num6, num6, M7L4XGWDXG54XE)));
			}
			PROAGJRUV = MF17QBDJ2XZN.BOMPQ5YKVN(y0HB5H5JK0UW ? 1 : 0);
			return true;
		}
		if (num2 < 0 || num2 > num5)
		{
			throw new ArgumentOutOfRangeException();
		}
		if (num3 < 0)
		{
			num3 = num5 - num2;
		}
		if (num3 < 0 || num3 > num5 - num2)
		{
			throw new ArgumentOutOfRangeException();
		}
		if (num6 == 0)
		{
			PROAGJRUV = MF17QBDJ2XZN.BOMPQ5YKVN(num2);
			return true;
		}
		PROAGJRUV = MF17QBDJ2XZN.BOMPQ5YKVN(HRG4MFBB7EDR(AGJAHRQ0KQNZUW, AGJAHRQ0KQNZUW2, num2, num3, num6, M7L4XGWDXG54XE));
		return true;
	}

	private static bool S81N58H3G8R(MF17QBDJ2XZN KOZHKVZTUZNCD, bool BR2KEO7LCF5U, out MF17QBDJ2XZN C5AMS15C9L896)
	{
		C5AMS15C9L896 = default;
		if (!BR2KEO7LCF5U)
		{
			return false;
		}
		if (A5E9AP6A1Z(KOZHKVZTUZNCD))
		{
			throw new NullReferenceException();
		}
		if (!WA39DMJZR67(KOZHKVZTUZNCD, out var AGJAHRQ0KQNZUW) || AGJAHRQ0KQNZUW.SPDLYZMZ7OKO)
		{
			return false;
		}
		C5AMS15C9L896 = MF17QBDJ2XZN.BOMPQ5YKVN(AGJAHRQ0KQNZUW.ETHH0SOCI6F());
		return true;
	}

	private static bool C4AVZJK50A64C3(MF17QBDJ2XZN ITMZ0VXT, bool WLISCG3LIT, MF17QBDJ2XZN[] MCUGLTIFAPYYB, out MF17QBDJ2XZN R1WJFKPK)
	{
		R1WJFKPK = default;
		if (!WLISCG3LIT || MCUGLTIFAPYYB.Length < 1)
		{
			return false;
		}
		if (A5E9AP6A1Z(ITMZ0VXT))
		{
			throw new NullReferenceException();
		}
		if (!WA39DMJZR67(ITMZ0VXT, out var AGJAHRQ0KQNZUW) || AGJAHRQ0KQNZUW.SPDLYZMZ7OKO)
		{
			return false;
		}
		MF17QBDJ2XZN mF17QBDJ2XZN = MCUGLTIFAPYYB[0];
		if (mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			mF17QBDJ2XZN = KBCKWMUMXML(mF17QBDJ2XZN);
		}
		int num = LFATGDD1N43(mF17QBDJ2XZN);
		if (num < 0)
		{
			throw new IndexOutOfRangeException();
		}
		AGJAHRQ0KQNZUW.UQONUI8RF();
		char DDEYMZ5I = '\0';
		for (int i = 0; i <= num; i++)
		{
			if (!AGJAHRQ0KQNZUW.B29Y44MW2T(out DDEYMZ5I))
			{
				throw new IndexOutOfRangeException();
			}
		}
		R1WJFKPK = MF17QBDJ2XZN.BOMPQ5YKVN(DDEYMZ5I);
		return true;
	}

	private static bool SOA22TGVVT8W(int ZGOGNRT7G, MF17QBDJ2XZN[] FSOOHBDIPGO4, MethodBase H1PV34CFCOO2Q, out MF17QBDJ2XZN Z7710T13KNF9TS)
	{
		Z7710T13KNF9TS = default;
		if (!B1T9CBXOKYGN(ZGOGNRT7G, FSOOHBDIPGO4, H1PV34CFCOO2Q, out var M7L4XGWDXG54XE))
		{
			return false;
		}
		if (FSOOHBDIPGO4.Length < 2)
		{
			return false;
		}
		if (!WA39DMJZR67(FSOOHBDIPGO4[0], out var AGJAHRQ0KQNZUW) || !WA39DMJZR67(FSOOHBDIPGO4[1], out var AGJAHRQ0KQNZUW2))
		{
			return false;
		}
		if (AGJAHRQ0KQNZUW.SPDLYZMZ7OKO && AGJAHRQ0KQNZUW2.SPDLYZMZ7OKO)
		{
			Z7710T13KNF9TS = MF17QBDJ2XZN.BOMPQ5YKVN(0);
			return true;
		}
		if (AGJAHRQ0KQNZUW.SPDLYZMZ7OKO)
		{
			Z7710T13KNF9TS = MF17QBDJ2XZN.BOMPQ5YKVN(-1);
			return true;
		}
		if (AGJAHRQ0KQNZUW2.SPDLYZMZ7OKO)
		{
			Z7710T13KNF9TS = MF17QBDJ2XZN.BOMPQ5YKVN(1);
			return true;
		}
		AGJAHRQ0KQNZUW.UQONUI8RF();
		AGJAHRQ0KQNZUW2.UQONUI8RF();
		int num3;
		do
		{
			bool flag = AGJAHRQ0KQNZUW.B29Y44MW2T(out var DDEYMZ5I);
			bool flag2 = AGJAHRQ0KQNZUW2.B29Y44MW2T(out var DDEYMZ5I2);
			if (!flag && !flag2)
			{
				Z7710T13KNF9TS = MF17QBDJ2XZN.BOMPQ5YKVN(0);
				return true;
			}
			if (!flag || !flag2)
			{
				int num = 0;
				int num2 = 0;
				if (flag)
				{
					num = 1;
					char DDEYMZ5I3;
					while (AGJAHRQ0KQNZUW.B29Y44MW2T(out DDEYMZ5I3))
					{
						num++;
					}
				}
				if (flag2)
				{
					num2 = 1;
					char DDEYMZ5I4;
					while (AGJAHRQ0KQNZUW2.B29Y44MW2T(out DDEYMZ5I4))
					{
						num2++;
					}
				}
				Z7710T13KNF9TS = MF17QBDJ2XZN.BOMPQ5YKVN(num - num2);
				return true;
			}
			num3 = (M7L4XGWDXG54XE ? (MJPRGMW60R3FY2(DDEYMZ5I) - MJPRGMW60R3FY2(DDEYMZ5I2)) : (DDEYMZ5I - DDEYMZ5I2));
		}
		while (num3 == 0);
		Z7710T13KNF9TS = MF17QBDJ2XZN.BOMPQ5YKVN(num3);
		return true;
	}

	private static bool OP5EODO75Z(QETT1OIHT DREEAV1G, MF17QBDJ2XZN[] IROXLARR, out MF17QBDJ2XZN L4KT4T8S)
	{
		L4KT4T8S = default;
		if (IROXLARR.Length < 1)
		{
			return false;
		}
		if (A5E9AP6A1Z(IROXLARR[0]))
		{
			L4KT4T8S = MF17QBDJ2XZN.BOMPQ5YKVN(1);
			return true;
		}
		if (!WA39DMJZR67(IROXLARR[0], out var AGJAHRQ0KQNZUW))
		{
			return false;
		}
		if (AGJAHRQ0KQNZUW.SPDLYZMZ7OKO)
		{
			L4KT4T8S = MF17QBDJ2XZN.BOMPQ5YKVN(1);
			return true;
		}
		if (DREEAV1G.DSX5XSDZXB1 == 10)
		{
			L4KT4T8S = MF17QBDJ2XZN.BOMPQ5YKVN((AGJAHRQ0KQNZUW.ETHH0SOCI6F() == 0) ? 1 : 0);
			return true;
		}
		AGJAHRQ0KQNZUW.UQONUI8RF();
		bool y0HB5H5JK0UW = true;
		char DDEYMZ5I;
		while (AGJAHRQ0KQNZUW.B29Y44MW2T(out DDEYMZ5I))
		{
			if (!char.IsWhiteSpace(DDEYMZ5I))
			{
				y0HB5H5JK0UW = false;
				break;
			}
		}
		L4KT4T8S = MF17QBDJ2XZN.BOMPQ5YKVN(y0HB5H5JK0UW ? 1 : 0);
		return true;
	}

	private static bool B1T9CBXOKYGN(int FNO8BAH3OV7, MF17QBDJ2XZN[] K42UWUFR7ZOUMP, MethodBase Z6Z2LY6X7F, out bool M7L4XGWDXG54XE)
	{
		M7L4XGWDXG54XE = false;
		int[] array = D3ZHTTVVTBXL[FNO8BAH3OV7];
		if (array == null)
		{
			return true;
		}
		for (int i = 0; i < K42UWUFR7ZOUMP.Length && i < array.Length; i++)
		{
			if (!(((array[i] == 0) ? null : A6C3WIL3Y0P2GG(array[i], Z6Z2LY6X7F)) != typeof(StringComparison)))
			{
				MF17QBDJ2XZN mF17QBDJ2XZN = K42UWUFR7ZOUMP[i];
				if (mF17QBDJ2XZN.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
				{
					mF17QBDJ2XZN = KBCKWMUMXML(mF17QBDJ2XZN);
				}
				switch (LFATGDD1N43(mF17QBDJ2XZN))
				{
				case 4:
					M7L4XGWDXG54XE = false;
					return true;
				case 5:
					M7L4XGWDXG54XE = true;
					return true;
				default:
					return false;
				}
			}
		}
		return true;
	}

	private static bool WWS93WWX(int XY2VHSH4O, MF17QBDJ2XZN[] CIGDBI8J2GECB, MethodBase I2KF8MI4JD79)
	{
		int[] array = D3ZHTTVVTBXL[XY2VHSH4O];
		if (array == null)
		{
			return false;
		}
		for (int i = 0; i < CIGDBI8J2GECB.Length && i < array.Length; i++)
		{
			if (((array[i] == 0) ? null : A6C3WIL3Y0P2GG(array[i], I2KF8MI4JD79)) == typeof(object))
			{
				return true;
			}
		}
		return false;
	}

	private static bool A5E9AP6A1Z(MF17QBDJ2XZN L14N4QD4WEK)
	{
		if (L14N4QD4WEK.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			L14N4QD4WEK = KBCKWMUMXML(L14N4QD4WEK);
		}
		if (L14N4QD4WEK.P7LCR721 == DV3CMNYZ.Y4RFK5NL || L14N4QD4WEK.P7LCR721 == DV3CMNYZ.Y3SEV4IY3HNBXZ)
		{
			return true;
		}
		if (L14N4QD4WEK.P7LCR721 == DV3CMNYZ.HLWFIKBCY && L14N4QD4WEK.TWKPQR6TSEL4JD == null)
		{
			return true;
		}
		return false;
	}

	private static bool FC6CSI8DGC(MF17QBDJ2XZN YNXHDXFYTD1ZH)
	{
		if (YNXHDXFYTD1ZH.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			YNXHDXFYTD1ZH = KBCKWMUMXML(YNXHDXFYTD1ZH);
		}
		return YNXHDXFYTD1ZH.P7LCR721 == DV3CMNYZ.IXQCPIWABD;
	}

	private static bool WA39DMJZR67(MF17QBDJ2XZN JO22WMN6, out DV13OEJJ AGJAHRQ0KQNZUW)
	{
		if (JO22WMN6.P7LCR721 == DV3CMNYZ.KAR68QYSS1DBT9)
		{
			JO22WMN6 = KBCKWMUMXML(JO22WMN6);
		}
		AGJAHRQ0KQNZUW = new DV13OEJJ();
		if (JO22WMN6.P7LCR721 == DV3CMNYZ.Y4RFK5NL || JO22WMN6.P7LCR721 == DV3CMNYZ.Y3SEV4IY3HNBXZ || (JO22WMN6.P7LCR721 == DV3CMNYZ.HLWFIKBCY && JO22WMN6.TWKPQR6TSEL4JD == null))
		{
			AGJAHRQ0KQNZUW.BGSM60L1EMNB();
			return true;
		}
		if (JO22WMN6.P7LCR721 == DV3CMNYZ.IXQCPIWABD)
		{
			if (!(JO22WMN6.TWKPQR6TSEL4JD is VKX10TW32TH cC8X79RMU))
			{
				return false;
			}
			AGJAHRQ0KQNZUW.NPELJKWDLVFM(cC8X79RMU);
			return true;
		}
		if (JO22WMN6.P7LCR721 == DV3CMNYZ.HLWFIKBCY)
		{
			if (!(JO22WMN6.TWKPQR6TSEL4JD is string a2R0VMAUX))
			{
				return false;
			}
			AGJAHRQ0KQNZUW.VD0O6VC0KDG6VV(a2R0VMAUX);
			return true;
		}
		return false;
	}

	private static bool EDCZVI61K(MF17QBDJ2XZN H061RPLKU53T86, MF17QBDJ2XZN V8GQTO21TWSJYL)
	{
		if (H061RPLKU53T86.P7LCR721 != DV3CMNYZ.IXQCPIWABD || V8GQTO21TWSJYL.P7LCR721 != DV3CMNYZ.IXQCPIWABD)
		{
			return false;
		}
		if (!WA39DMJZR67(H061RPLKU53T86, out var AGJAHRQ0KQNZUW) || !WA39DMJZR67(V8GQTO21TWSJYL, out var AGJAHRQ0KQNZUW2))
		{
			return false;
		}
		if (AGJAHRQ0KQNZUW.SPDLYZMZ7OKO || AGJAHRQ0KQNZUW2.SPDLYZMZ7OKO)
		{
			return false;
		}
		return CP8B70U93ABO(AGJAHRQ0KQNZUW, AGJAHRQ0KQNZUW2, P78FJ9MPR9: false);
	}

	private static bool CP8B70U93ABO(DV13OEJJ TPVFG32J, DV13OEJJ I0UR9ME9FW951, bool P78FJ9MPR9)
	{
		TPVFG32J.UQONUI8RF();
		I0UR9ME9FW951.UQONUI8RF();
		while (true)
		{
			bool flag = TPVFG32J.B29Y44MW2T(out var DDEYMZ5I);
			bool flag2 = I0UR9ME9FW951.B29Y44MW2T(out var DDEYMZ5I2);
			if (flag != flag2)
			{
				return false;
			}
			if (!flag)
			{
				return true;
			}
			if (P78FJ9MPR9)
			{
				if (MJPRGMW60R3FY2(DDEYMZ5I) != MJPRGMW60R3FY2(DDEYMZ5I2))
				{
					return false;
				}
			}
			else if (DDEYMZ5I != DDEYMZ5I2)
			{
				break;
			}
		}
		return false;
	}

	private static bool AEAMD4TPNEHQP(DV13OEJJ F535OPE9BAIHY, DV13OEJJ HN5IVZ8HDWC, int LQOINQSOBDSTD, int RBDAE5GAF9I, bool W02A1H3W9YU2X1)
	{
		if (RBDAE5GAF9I == 0)
		{
			return true;
		}
		F535OPE9BAIHY.UQONUI8RF();
		if (!AUKREHKIDFV(F535OPE9BAIHY, LQOINQSOBDSTD))
		{
			return false;
		}
		HN5IVZ8HDWC.UQONUI8RF();
		for (int i = 0; i < RBDAE5GAF9I; i++)
		{
			if (!F535OPE9BAIHY.B29Y44MW2T(out var DDEYMZ5I))
			{
				return false;
			}
			if (!HN5IVZ8HDWC.B29Y44MW2T(out var DDEYMZ5I2))
			{
				return false;
			}
			if (W02A1H3W9YU2X1)
			{
				if (MJPRGMW60R3FY2(DDEYMZ5I) != MJPRGMW60R3FY2(DDEYMZ5I2))
				{
					return false;
				}
			}
			else if (DDEYMZ5I != DDEYMZ5I2)
			{
				return false;
			}
		}
		return true;
	}

	private static int HRG4MFBB7EDR(DV13OEJJ PPKOAOV2V, DV13OEJJ IL0QU9QK, int JG6T9E633Z, int WXZWATOF2IF6YP, int OVZQCQ40EAZ6K, bool CU2D0GYVE)
	{
		if (OVZQCQ40EAZ6K == 0)
		{
			return JG6T9E633Z;
		}
		int num = JG6T9E633Z + WXZWATOF2IF6YP - OVZQCQ40EAZ6K;
		for (int i = JG6T9E633Z; i <= num; i++)
		{
			if (AEAMD4TPNEHQP(PPKOAOV2V, IL0QU9QK, i, OVZQCQ40EAZ6K, CU2D0GYVE))
			{
				return i;
			}
		}
		return -1;
	}

	private static bool AUKREHKIDFV(DV13OEJJ DMWOB7VVLW, int WZYN38JF)
	{
		for (int i = 0; i < WZYN38JF; i++)
		{
			if (!DMWOB7VVLW.B29Y44MW2T(out var _))
			{
				return false;
			}
		}
		return true;
	}

	private static char MJPRGMW60R3FY2(char LQLE1ASEORP)
	{
		if (LQLE1ASEORP >= 'A' && LQLE1ASEORP <= 'Z')
		{
			return (char)(LQLE1ASEORP + 32);
		}
		if (LQLE1ASEORP < '\u0080')
		{
			return LQLE1ASEORP;
		}
		return char.ToLowerInvariant(LQLE1ASEORP);
	}

	private static string L4QJ39X346FIY(VKX10TW32TH R5427G6H7N)
	{
		if (R5427G6H7N == null)
		{
			return null;
		}
		int m58ZXEXJN = R5427G6H7N.M58ZXEXJN;
		if (m58ZXEXJN == 0)
		{
			return "";
		}
		int[] array = NPICRWTVCFVSG.I0TQU1ZOQ3HTH(R5427G6H7N.IM083WCP9MK, R5427G6H7N.XF04171FF8NK0M, m58ZXEXJN);
		byte[] array2 = new byte[m58ZXEXJN];
		byte rEGPFFYL9L = NPICRWTVCFVSG.GCJW5JWMX9Y7Z4(R5427G6H7N.IM083WCP9MK, R5427G6H7N.XF04171FF8NK0M);
		for (int i = 0; i < m58ZXEXJN; i++)
		{
			byte b = R5427G6H7N.TVC0VIQWM[R5427G6H7N.L538NR5O + array[i]];
			array2[i] = NPICRWTVCFVSG.HM4960J8N(R5427G6H7N.IM083WCP9MK, R5427G6H7N.XF04171FF8NK0M, i, b, rEGPFFYL9L);
			rEGPFFYL9L = b;
		}
		string result = Encoding.UTF8.GetString(array2);
		for (int j = 0; j < m58ZXEXJN; j++)
		{
			array2[j] = 0;
		}
		return result;
	}

	private static void DO78FA91UGCJ()
	{
		throw new BadImageFormatException();
	}

	private static ushort AFB9VSLDQ(byte[] IWKWTI5I6DX, ref int P04Z6FRDEWWW)
	{
		ushort result = (ushort)(IWKWTI5I6DX[P04Z6FRDEWWW] | (IWKWTI5I6DX[P04Z6FRDEWWW + 1] << 8));
		P04Z6FRDEWWW += 2;
		return result;
	}

	private static uint UF7VOBTY7VL5O(byte[] NY7FGTLULE6, ref int EWMMZAX31D8W)
	{
		int result = NY7FGTLULE6[EWMMZAX31D8W] | (NY7FGTLULE6[EWMMZAX31D8W + 1] << 8) | (NY7FGTLULE6[EWMMZAX31D8W + 2] << 16) | (NY7FGTLULE6[EWMMZAX31D8W + 3] << 24);
		EWMMZAX31D8W += 4;
		return (uint)result;
	}

	private static int BEAXET4RY8P(byte[] MPDQH43Z1, ref int XLV6LHUYP0KXEP)
	{
		return (int)UF7VOBTY7VL5O(MPDQH43Z1, ref XLV6LHUYP0KXEP);
	}

	private static long XGUBFRX7GI(byte[] ONUIE70FHYCI, ref int Q6ATY53LX)
	{
		uint num = UF7VOBTY7VL5O(ONUIE70FHYCI, ref Q6ATY53LX);
		uint num2 = UF7VOBTY7VL5O(ONUIE70FHYCI, ref Q6ATY53LX);
		return (long)(num | ((ulong)num2 << 32));
	}

	private static string HXIYWOJN(byte[] R0XHEGVN68, ref int Q48MOJQDJ)
	{
		int num = BEAXET4RY8P(R0XHEGVN68, ref Q48MOJQDJ);
		if (num < 0 || Q48MOJQDJ + num > R0XHEGVN68.Length)
		{
			DO78FA91UGCJ();
		}
		byte[] array = new byte[num];
		for (int i = 0; i < num; i++)
		{
			array[i] = (byte)(R0XHEGVN68[Q48MOJQDJ + i] ^ GUB8C8FSW1TKG[i & 0x1F] ^ (byte)(i * 29 + 7));
		}
		Q48MOJQDJ += num;
		string result = Encoding.UTF8.GetString(array);
		for (int j = 0; j < array.Length; j++)
		{
			array[j] = 0;
		}
		return result;
	}

	private static int KJ6IJU6JE1(byte[] IXTR9Y5MCR7MPR, int S5JN7FEDKR0, int WVZE2HKLGO5PUU)
	{
		int num = WVZE2HKLGO5PUU;
		int num2;
		for (int i = 0; i < S5JN7FEDKR0; i += num2)
		{
			if (i >= IXTR9Y5MCR7MPR.Length)
			{
				DO78FA91UGCJ();
			}
			byte b = X0C7AMDZL[IXTR9Y5MCR7MPR[i]];
			num2 = E3Q6R135AA131(b, IXTR9Y5MCR7MPR, i, num);
			if (num2 <= 0 || i + num2 > IXTR9Y5MCR7MPR.Length)
			{
				DO78FA91UGCJ();
			}
			num = NPICRWTVCFVSG.ONUDDOCF1(num, i, b);
			for (int j = 1; j < num2; j++)
			{
				num = NPICRWTVCFVSG.ONUDDOCF1(num, i + j, IXTR9Y5MCR7MPR[i + j]);
			}
		}
		return num;
	}

	private static int E3Q6R135AA131(byte OJAI0A1NN, byte[] DEGJKA33, int K7K3UJHC0Z, int AOTDWF5H)
	{
		if (OJAI0A1NN == 6)
		{
			if (K7K3UJHC0Z + 5 > DEGJKA33.Length)
			{
				return -1;
			}
			int cX0P7BYA6IVZQP = DEGJKA33[K7K3UJHC0Z + 1] | (DEGJKA33[K7K3UJHC0Z + 2] << 8) | (DEGJKA33[K7K3UJHC0Z + 3] << 16) | (DEGJKA33[K7K3UJHC0Z + 4] << 24);
			int num = NPICRWTVCFVSG.TFEL0HSTYJ(AOTDWF5H, K7K3UJHC0Z, cX0P7BYA6IVZQP);
			if (num < 0 || num > 1000000)
			{
				return -1;
			}
			return 5 + num;
		}
		return O93QM1NUTUAG8(OJAI0A1NN, DEGJKA33, K7K3UJHC0Z);
	}

	private static int O93QM1NUTUAG8(byte JJJQP8S8BXI, byte[] TVCWFFW9, int LE3R26XSFY8D7)
	{
		switch (JJJQP8S8BXI)
		{
		case 1:
		case 7:
		case 14:
		case 15:
		case 27:
		case 28:
		case 29:
		case 31:
		case 42:
		case 54:
		case 55:
			return 1;
		case 16:
		case 17:
		case 18:
		case 43:
		case 44:
		case 45:
		case 46:
		case 47:
			return 2;
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
			return 3;
		case 22:
		case 48:
			return 6;
		case 3:
		case 5:
			return 9;
		case 23:
		{
			if (LE3R26XSFY8D7 + 5 > TVCWFFW9.Length)
			{
				return -1;
			}
			int num = TVCWFFW9[LE3R26XSFY8D7 + 1] | (TVCWFFW9[LE3R26XSFY8D7 + 2] << 8) | (TVCWFFW9[LE3R26XSFY8D7 + 3] << 16) | (TVCWFFW9[LE3R26XSFY8D7 + 4] << 24);
			if (num < 0 || num > 100000)
			{
				return -1;
			}
			return 5 + 4 * num + 4;
		}
		case 6:
			return -1;
		default:
			return 5;
		}
	}

	private static float VNZPILV8F(int GA2S7O5T8)
	{
		return BitConverter.ToSingle(new byte[4]
		{
			(byte)GA2S7O5T8,
			(byte)(GA2S7O5T8 >> 8),
			(byte)(GA2S7O5T8 >> 16),
			(byte)(GA2S7O5T8 >> 24)
		}, 0);
	}

	private static double YFP8XC5P58KA(long KIJQ0NYGQ8WI2)
	{
		byte[] array = new byte[8];
		for (int i = 0; i < 8; i++)
		{
			array[i] = (byte)(KIJQ0NYGQ8WI2 >> 8 * i);
		}
		return BitConverter.ToDouble(array, 0);
	}
}
