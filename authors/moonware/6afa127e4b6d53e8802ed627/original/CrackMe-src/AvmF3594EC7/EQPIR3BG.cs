using System;

namespace AvmF3594EC7;

internal static class EQPIR3BG
{
	public static void GKVQ9NBLX(byte[] AN53OJGB, byte[] U9VVN5RUH3HI, uint VG1DY9WO8O0V2X, byte[] QA8L2ONKXY, int PS33SQ5ES, int BLUHOI4U5AVH)
	{
		if (AN53OJGB == null || AN53OJGB.Length != 32)
		{
			throw new ArgumentException("key");
		}
		if (U9VVN5RUH3HI == null || U9VVN5RUH3HI.Length != 12)
		{
			throw new ArgumentException("nonce");
		}
		byte[] array = new byte[64];
		int i = PS33SQ5ES;
		int num2;
		for (int num = PS33SQ5ES + BLUHOI4U5AVH; i < num; i += num2)
		{
			YG56QRQ5E(AN53OJGB, U9VVN5RUH3HI, VG1DY9WO8O0V2X, array);
			VG1DY9WO8O0V2X++;
			num2 = num - i;
			if (num2 > 64)
			{
				num2 = 64;
			}
			for (int j = 0; j < num2; j++)
			{
				QA8L2ONKXY[i + j] ^= array[j];
			}
		}
	}

	public static void YG56QRQ5E(byte[] MNEVE6KZYE, byte[] OZODNGSZ1YWO, uint WXWUPXB376, byte[] VKX0YUK6)
	{
		uint[] array = new uint[16]
		{
			1634760805u, 857760878u, 2036477234u, 1797285236u, 0u, 0u, 0u, 0u, 0u, 0u,
			0u, 0u, 0u, 0u, 0u, 0u
		};
		for (int i = 0; i < 8; i++)
		{
			array[4 + i] = I4CH9YX8FAPGXU(MNEVE6KZYE, i * 4);
		}
		array[12] = WXWUPXB376;
		array[13] = I4CH9YX8FAPGXU(OZODNGSZ1YWO, 0);
		array[14] = I4CH9YX8FAPGXU(OZODNGSZ1YWO, 4);
		array[15] = I4CH9YX8FAPGXU(OZODNGSZ1YWO, 8);
		uint[] array2 = new uint[16];
		for (int j = 0; j < 16; j++)
		{
			array2[j] = array[j];
		}
		for (int k = 0; k < 10; k++)
		{
			PMQR2CK8(array2, 0, 4, 8, 12);
			PMQR2CK8(array2, 1, 5, 9, 13);
			PMQR2CK8(array2, 2, 6, 10, 14);
			PMQR2CK8(array2, 3, 7, 11, 15);
			PMQR2CK8(array2, 0, 5, 10, 15);
			PMQR2CK8(array2, 1, 6, 11, 12);
			PMQR2CK8(array2, 2, 7, 8, 13);
			PMQR2CK8(array2, 3, 4, 9, 14);
		}
		for (int l = 0; l < 16; l++)
		{
			ZOJ6Z424Q(VKX0YUK6, l * 4, array2[l] + array[l]);
		}
	}

	private static void PMQR2CK8(uint[] J0491ZQJ0, int AD1X3KKDT2, int FNZL1SGF, int JMDWVFI3S7JP3, int X93ZXGR9)
	{
		J0491ZQJ0[AD1X3KKDT2] += J0491ZQJ0[FNZL1SGF];
		J0491ZQJ0[X93ZXGR9] ^= J0491ZQJ0[AD1X3KKDT2];
		J0491ZQJ0[X93ZXGR9] = EGEMFXAGKD87Y(J0491ZQJ0[X93ZXGR9], 16);
		J0491ZQJ0[JMDWVFI3S7JP3] += J0491ZQJ0[X93ZXGR9];
		J0491ZQJ0[FNZL1SGF] ^= J0491ZQJ0[JMDWVFI3S7JP3];
		J0491ZQJ0[FNZL1SGF] = EGEMFXAGKD87Y(J0491ZQJ0[FNZL1SGF], 12);
		J0491ZQJ0[AD1X3KKDT2] += J0491ZQJ0[FNZL1SGF];
		J0491ZQJ0[X93ZXGR9] ^= J0491ZQJ0[AD1X3KKDT2];
		J0491ZQJ0[X93ZXGR9] = EGEMFXAGKD87Y(J0491ZQJ0[X93ZXGR9], 8);
		J0491ZQJ0[JMDWVFI3S7JP3] += J0491ZQJ0[X93ZXGR9];
		J0491ZQJ0[FNZL1SGF] ^= J0491ZQJ0[JMDWVFI3S7JP3];
		J0491ZQJ0[FNZL1SGF] = EGEMFXAGKD87Y(J0491ZQJ0[FNZL1SGF], 7);
	}

	private static uint EGEMFXAGKD87Y(uint DBYBQUVSVON3M8, int N9KNU7QQ2DGS1)
	{
		return (DBYBQUVSVON3M8 << N9KNU7QQ2DGS1) | (DBYBQUVSVON3M8 >> 32 - N9KNU7QQ2DGS1);
	}

	public static uint I4CH9YX8FAPGXU(byte[] ZLLCN1EYTECYV, int YKB4TKTLWNJFU4)
	{
		return (uint)(ZLLCN1EYTECYV[YKB4TKTLWNJFU4] | (ZLLCN1EYTECYV[YKB4TKTLWNJFU4 + 1] << 8) | (ZLLCN1EYTECYV[YKB4TKTLWNJFU4 + 2] << 16) | (ZLLCN1EYTECYV[YKB4TKTLWNJFU4 + 3] << 24));
	}

	public static void ZOJ6Z424Q(byte[] FHGTD7ACDH, int JMDKHXZ82IGKO, uint S226BFPVRLDN)
	{
		FHGTD7ACDH[JMDKHXZ82IGKO] = (byte)S226BFPVRLDN;
		FHGTD7ACDH[JMDKHXZ82IGKO + 1] = (byte)(S226BFPVRLDN >> 8);
		FHGTD7ACDH[JMDKHXZ82IGKO + 2] = (byte)(S226BFPVRLDN >> 16);
		FHGTD7ACDH[JMDKHXZ82IGKO + 3] = (byte)(S226BFPVRLDN >> 24);
	}
}
