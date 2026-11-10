using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;

namespace ThemidaPlus;

public static class Runtime
{
	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate bool IsDebuggerPresentDelegate();

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate bool CheckRemoteDebuggerPresentDelegate(nint hProcess, ref bool isDebuggerPresent);

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate nint GetCurrentProcessDelegate();

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate int NtQueryInformationProcessDelegate(nint hProcess, int infoClass, ref int info, int infoLen, ref int returnLen);

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate bool IsProcessorFeaturePresentDelegate(uint feature);

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate uint GetTickCountDelegate();

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate bool QueryPerformanceCounterDelegate(out long lpPerformanceCount);

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate bool QueryPerformanceFrequencyDelegate(out long lpFrequency);

	[UnmanagedFunctionPointer(CallingConvention.StdCall)]
	private delegate bool VirtualProtectDelegate(nint lpAddress, uint dwSize, uint flNewProtect, out uint lpflOldProtect);

	private class DebugProbeException : Exception
	{
	}

	private static nint _kernel32Base;

	private static nint _ntdllBase;

	private static bool _winApiResolved;

	private static IsDebuggerPresentDelegate _isDebuggerPresent;

	private static CheckRemoteDebuggerPresentDelegate _checkRemoteDebuggerPresent;

	private static GetCurrentProcessDelegate _getCurrentProcess;

	private static NtQueryInformationProcessDelegate _ntQueryInformationProcess;

	private static IsProcessorFeaturePresentDelegate _isProcessorFeaturePresent;

	private static GetTickCountDelegate _getTickCount;

	private static QueryPerformanceCounterDelegate _queryPerformanceCounter;

	private static QueryPerformanceFrequencyDelegate _queryPerformanceFrequency;

	private static VirtualProtectDelegate _virtualProtect;

	private const uint PAGE_READWRITE = 4u;

	private const uint PAGE_EXECUTE_READWRITE = 64u;

	private static readonly byte[] _nIsDbg;

	private static readonly byte[] _nChkRem;

	private static readonly byte[] _nGetCP;

	private static readonly byte[] _nNtQ;

	private static readonly byte[] _nIsPF;

	private static readonly byte[] _nGetTC;

	private static readonly byte[] _nQPC;

	private static readonly byte[] _nQPF;

	private static readonly byte[] _nVP;

	private const int BLOCK_SIZE = 32;

	private static byte[] _blockKey;

	private static byte[] _blob;

	private static byte[] _strBlob;

	private static int _methodCount;

	private static int _stringCount;

	private static int _stringsOffset;

	private static readonly Dictionary<int, string> _methodRefs;

	private static readonly Dictionary<int, string> _fieldRefs;

	private static long _poison;

	private static bool _initialized;

	private static string DecodeName(byte[] enc, byte key)
	{
		char[] array = new char[enc.Length];
		for (int i = 0; i < enc.Length; i++)
		{
			array[i] = (char)(enc[i] ^ key);
		}
		return new string(array);
	}

	private static nint FindModuleBase(string dllName)
	{
		try
		{
			foreach (ProcessModule module in Process.GetCurrentProcess().Modules)
			{
				if (module.ModuleName.Equals(dllName, StringComparison.OrdinalIgnoreCase))
				{
					return module.BaseAddress;
				}
			}
		}
		catch
		{
		}
		return IntPtr.Zero;
	}

	private static nint ResolveExport(nint moduleBase, string funcName)
	{
		if (moduleBase == IntPtr.Zero)
		{
			return IntPtr.Zero;
		}
		try
		{
			int offset = Marshal.ReadInt32(moduleBase, 60);
			nint num = IntPtr.Add(moduleBase, offset);
			if (Marshal.ReadInt32(num) != 17744)
			{
				return IntPtr.Zero;
			}
			Marshal.ReadInt16(num, 6);
			Marshal.ReadInt16(num, 20);
			nint ptr = IntPtr.Add(num, 24);
			int num2 = ((Marshal.ReadInt16(ptr) == 523) ? 112 : 96);
			int num3 = Marshal.ReadInt32(ptr, num2);
			Marshal.ReadInt32(ptr, num2 + 4);
			if (num3 == 0)
			{
				return IntPtr.Zero;
			}
			nint ptr2 = IntPtr.Add(moduleBase, num3);
			int num4 = Marshal.ReadInt32(ptr2, 24);
			int offset2 = Marshal.ReadInt32(ptr2, 28);
			int offset3 = Marshal.ReadInt32(ptr2, 32);
			int offset4 = Marshal.ReadInt32(ptr2, 36);
			nint ptr3 = IntPtr.Add(moduleBase, offset3);
			nint ptr4 = IntPtr.Add(moduleBase, offset2);
			nint ptr5 = IntPtr.Add(moduleBase, offset4);
			for (int i = 0; i < num4; i++)
			{
				int offset5 = Marshal.ReadInt32(ptr3, i * 4);
				if (Marshal.PtrToStringAnsi(IntPtr.Add(moduleBase, offset5)) == funcName)
				{
					short num5 = Marshal.ReadInt16(ptr5, i * 2);
					int offset6 = Marshal.ReadInt32(ptr4, num5 * 4);
					return IntPtr.Add(moduleBase, offset6);
				}
			}
		}
		catch
		{
		}
		return IntPtr.Zero;
	}

	private static void ResolveHiddenIAT()
	{
		if (_winApiResolved)
		{
			return;
		}
		_winApiResolved = true;
		try
		{
			if (Environment.OSVersion.Platform != PlatformID.Win32NT)
			{
				return;
			}
			_kernel32Base = FindModuleBase("kernel32.dll");
			_ntdllBase = FindModuleBase("ntdll.dll");
			if (_kernel32Base != IntPtr.Zero)
			{
				nint num = ResolveExport(_kernel32Base, DecodeName(_nIsDbg, 55));
				if (num != IntPtr.Zero)
				{
					_isDebuggerPresent = Marshal.GetDelegateForFunctionPointer<IsDebuggerPresentDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nChkRem, 55));
				if (num != IntPtr.Zero)
				{
					_checkRemoteDebuggerPresent = Marshal.GetDelegateForFunctionPointer<CheckRemoteDebuggerPresentDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nGetCP, 55));
				if (num != IntPtr.Zero)
				{
					_getCurrentProcess = Marshal.GetDelegateForFunctionPointer<GetCurrentProcessDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nIsPF, 55));
				if (num != IntPtr.Zero)
				{
					_isProcessorFeaturePresent = Marshal.GetDelegateForFunctionPointer<IsProcessorFeaturePresentDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nGetTC, 55));
				if (num != IntPtr.Zero)
				{
					_getTickCount = Marshal.GetDelegateForFunctionPointer<GetTickCountDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nQPC, 55));
				if (num != IntPtr.Zero)
				{
					_queryPerformanceCounter = Marshal.GetDelegateForFunctionPointer<QueryPerformanceCounterDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nQPF, 55));
				if (num != IntPtr.Zero)
				{
					_queryPerformanceFrequency = Marshal.GetDelegateForFunctionPointer<QueryPerformanceFrequencyDelegate>(num);
				}
				num = ResolveExport(_kernel32Base, DecodeName(_nVP, 55));
				if (num != IntPtr.Zero)
				{
					_virtualProtect = Marshal.GetDelegateForFunctionPointer<VirtualProtectDelegate>(num);
				}
			}
			if (_ntdllBase != IntPtr.Zero)
			{
				nint num2 = ResolveExport(_ntdllBase, DecodeName(_nNtQ, 55));
				if (num2 != IntPtr.Zero)
				{
					_ntQueryInformationProcess = Marshal.GetDelegateForFunctionPointer<NtQueryInformationProcessDelegate>(num2);
				}
			}
		}
		catch
		{
		}
	}

	private static bool Int2DDetection()
	{
		try
		{
			throw new DebugProbeException();
		}
		catch (DebugProbeException)
		{
			return false;
		}
	}

	private static bool RdtscCheck()
	{
		try
		{
			if (_queryPerformanceFrequency == null)
			{
				return false;
			}
			_queryPerformanceFrequency(out var lpFrequency);
			if (lpFrequency == 0L)
			{
				return false;
			}
			_queryPerformanceCounter(out var lpPerformanceCount);
			long num = 0L;
			for (int i = 0; i < 100000; i++)
			{
				num += i * 7;
			}
			_queryPerformanceCounter(out var lpPerformanceCount2);
			return (lpPerformanceCount2 - lpPerformanceCount) * 1000000 / lpFrequency > 5000;
		}
		catch
		{
			return false;
		}
	}

	private static bool PebCheck()
	{
		return Debugger.IsAttached;
	}

	private static bool HardwareBreakpointCheck()
	{
		try
		{
			return Debugger.IsLogging();
		}
		catch
		{
			return false;
		}
	}

	private static void AntiDebugCheck()
	{
		ResolveHiddenIAT();
		bool flag = false;
		if (PebCheck())
		{
			flag = true;
		}
		if (Int2DDetection())
		{
			flag = true;
		}
		if (RdtscCheck())
		{
			flag = true;
		}
		if (HardwareBreakpointCheck())
		{
			flag = true;
		}
		try
		{
			if (Environment.OSVersion.Platform == PlatformID.Win32NT)
			{
				if (_isDebuggerPresent != null && _isDebuggerPresent())
				{
					flag = true;
				}
				if (_checkRemoteDebuggerPresent != null && _getCurrentProcess != null)
				{
					bool isDebuggerPresent = false;
					if (_checkRemoteDebuggerPresent(_getCurrentProcess(), ref isDebuggerPresent) && isDebuggerPresent)
					{
						flag = true;
					}
				}
				if (_ntQueryInformationProcess != null && _getCurrentProcess != null)
				{
					int info = 0;
					int returnLen = 0;
					_ntQueryInformationProcess(_getCurrentProcess(), 7, ref info, 4, ref returnLen);
					if (info != 0)
					{
						flag = true;
					}
				}
				if (_isProcessorFeaturePresent != null && _isProcessorFeaturePresent(35u))
				{
					flag = true;
				}
			}
		}
		catch
		{
		}
		try
		{
			if (_getTickCount != null)
			{
				uint num = _getTickCount();
				long num2 = 0L;
				for (int i = 0; i < 100000; i++)
				{
					num2 += i;
				}
				if (_getTickCount() - num > 100)
				{
					flag = true;
				}
			}
		}
		catch
		{
		}
		if (flag)
		{
			_poison = -2401053088876216593L;
		}
		EraseHeaders();
	}

	private static void EraseHeaders()
	{
		try
		{
			if (Environment.OSVersion.Platform != PlatformID.Win32NT || _virtualProtect == null)
			{
				return;
			}
			nint hINSTANCE = Marshal.GetHINSTANCE(typeof(Runtime).Module);
			if (hINSTANCE != IntPtr.Zero)
			{
				uint num = 4096u;
				uint lpflOldProtect = 0u;
				if (_virtualProtect(hINSTANCE, num, 4u, out lpflOldProtect))
				{
					Marshal.Copy(new byte[num], 0, hINSTANCE, (int)num);
					_virtualProtect(hINSTANCE, num, lpflOldProtect, out var _);
				}
			}
		}
		catch
		{
		}
	}

	private static byte[] LoadEncryptedBytecode(int methodToken)
	{
		int num = methodToken & 0xFFFFFF;
		int num2 = 16;
		for (int i = 0; i < _methodCount; i++)
		{
			int num3 = ReadI4(_blob, num2);
			int num4 = ReadI4(_blob, num2 + 4);
			if ((num3 & 0xFFFFFF) == num)
			{
				byte[] array = new byte[num4];
				Buffer.BlockCopy(_blob, num2 + 8, array, 0, num4);
				return array;
			}
			num2 += 8 + num4 + 1 + 2 + 256;
		}
		return null;
	}

	private static void DecryptBlock(byte[] encBc, int blockIndex, byte[] outBuf)
	{
		int num = blockIndex * 32;
		int num2 = 32;
		if (num + num2 > encBc.Length)
		{
			num2 = encBc.Length - num;
		}
		uint num3 = (uint)((_blockKey != null) ? ((uint)((_blockKey[blockIndex % _blockKey.Length] << 24) | (blockIndex << 8)) | 0x5Au) : (blockIndex * 2654435769u));
		for (int i = 0; i < num2; i++)
		{
			outBuf[i] = (byte)(encBc[num + i] ^ (num3 & 0xFFu));
			num3 = (num3 << 1) | (num3 >> 31);
		}
		for (int j = num2; j < 32; j++)
		{
			outBuf[j] = 0;
		}
	}

	private static void SecureZero(byte[] buf)
	{
		try
		{
			CryptographicOperations.ZeroMemory(buf);
		}
		catch
		{
			Array.Clear(buf, 0, buf.Length);
		}
	}

	private static void EnsureInit()
	{
		if (_initialized)
		{
			return;
		}
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		using (Stream stream = executingAssembly.GetManifestResourceStream("tpl_vm_blob.bin"))
		{
			if (stream != null)
			{
				_blob = new byte[stream.Length];
				stream.Read(_blob, 0, _blob.Length);
				_methodCount = ReadI4(_blob, 8);
				_stringCount = ReadI4(_blob, 12);
				int num = 16;
				for (int i = 0; i < _methodCount; i++)
				{
					if (num + 8 > _blob.Length)
					{
						break;
					}
					int num2 = ReadI4(_blob, num + 4);
					num += 8 + num2 + 1 + 2 + 256;
				}
				_stringsOffset = num;
				for (int j = 0; j < _stringCount; j++)
				{
					int num3 = ReadI4(_blob, num + 4);
					num += 8 + num3 + 4;
				}
				int num4 = ReadI4(_blob, num);
				num += 4;
				for (int k = 0; k < num4; k++)
				{
					int key = ReadI4(_blob, num);
					short num5 = ReadI2(_blob, num + 4);
					string @string = Encoding.UTF8.GetString(_blob, num + 6, num5);
					_methodRefs[key] = @string;
					num += 6 + num5;
				}
				int num6 = ReadI4(_blob, num);
				num += 4;
				for (int l = 0; l < num6; l++)
				{
					int key2 = ReadI4(_blob, num);
					short num7 = ReadI2(_blob, num + 4);
					string string2 = Encoding.UTF8.GetString(_blob, num + 6, num7);
					_fieldRefs[key2] = string2;
					num += 6 + num7;
				}
				_blockKey = new byte[8] { 90, 60, 110, 41, 123, 77, 143, 18 };
			}
		}
		using (Stream stream2 = executingAssembly.GetManifestResourceStream("tpl_strings.bin"))
		{
			if (stream2 != null)
			{
				_strBlob = new byte[stream2.Length];
				stream2.Read(_strBlob, 0, _strBlob.Length);
			}
		}
		if (_blob != null)
		{
			_initialized = true;
			AntiDebugCheck();
		}
	}

	static Runtime()
	{
		_nIsDbg = new byte[18]
		{
			122, 84, 33, 87, 66, 85, 80, 80, 33, 84,
			70, 33, 84, 33, 70, 80, 66, 33
		};
		_nChkRem = new byte[25]
		{
			5, 33, 33, 85, 125, 84, 86, 66, 125, 33,
			87, 66, 85, 80, 80, 33, 84, 70, 33, 84,
			33, 70, 80, 66, 33
		};
		_nGetCP = new byte[14]
		{
			7, 33, 125, 5, 85, 86, 33, 84, 70, 125,
			85, 66, 33, 84
		};
		_nNtQ = new byte[20]
		{
			29, 125, 5, 85, 86, 84, 57, 85, 86, 66,
			86, 33, 125, 85, 66, 125, 66, 85, 66, 33
		};
		_nIsPF = new byte[26]
		{
			122, 84, 33, 70, 85, 66, 33, 84, 84, 85,
			33, 5, 33, 33, 85, 66, 33, 84, 70, 33,
			84, 33, 70, 80, 66, 33
		};
		_nGetTC = new byte[12]
		{
			7, 33, 125, 5, 85, 86, 33, 125, 85, 66,
			85, 85
		};
		_nQPC = new byte[22]
		{
			22, 85, 33, 86, 84, 33, 70, 85, 86, 66,
			86, 33, 85, 66, 33, 85, 33, 125, 85, 66,
			33, 84
		};
		_nQPF = new byte[23]
		{
			22, 85, 33, 86, 84, 33, 70, 85, 86, 66,
			86, 33, 33, 86, 33, 85, 66, 85, 84, 70,
			84, 33, 84
		};
		_nVP = new byte[14]
		{
			31, 85, 86, 125, 85, 66, 125, 33, 70, 85,
			125, 33, 66, 125
		};
		_methodRefs = new Dictionary<int, string>();
		_fieldRefs = new Dictionary<int, string>();
		EnsureInit();
	}

	public static void Warmup()
	{
		EnsureInit();
		AntiDebugCheck();
	}

	public static int RunEntry(string[] args)
	{
		Warmup();
		try
		{
			Type type = ResolveType("CrackMe.Program");
			if (type != null)
			{
				MethodInfo method = type.GetMethod("Main", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
				if (method != null)
				{
					object obj = method.Invoke(null, new object[1] { args });
					if (obj is int)
					{
						return (int)obj;
					}
				}
			}
		}
		catch
		{
		}
		return 1;
	}

	public static object Dispatch(int methodToken, object[] args)
	{
		EnsureInit();
		try
		{
			return DispatchCore(methodToken, args);
		}
		catch (Exception)
		{
			return null;
		}
	}

	private static object DispatchCore(int methodToken, object[] args)
	{
		byte[] array = LoadEncryptedBytecode(methodToken);
		if (array == null || array.Length == 0)
		{
			return null;
		}
		byte[] array2 = new byte[array.Length];
		_ = new byte[32];
		int num = (array.Length + 32 - 1) / 32;
		for (int i = 0; i < num; i++)
		{
			int num2 = i * 32;
			int num3 = Math.Min(32, array.Length - num2);
			if (num3 <= 0)
			{
				break;
			}
			uint num4 = (uint)((_blockKey[i % _blockKey.Length] << 24) | (i << 8)) | 0x5Au;
			for (int j = 0; j < num3; j++)
			{
				array2[num2 + j] = (byte)(array[num2 + j] ^ (num4 & 0xFFu));
				num4 = (num4 << 1) | (num4 >> 31);
			}
		}
		object[] array3 = new object[1024];
		object[] array4 = new object[256];
		for (int k = 0; k < array4.Length; k++)
		{
			array4[k] = 0L;
		}
		int sp = 0;
		int num5 = 0;
		while (num5 < array2.Length)
		{
			byte b = array2[num5];
			int num6 = ((num5 + 1 < array2.Length) ? array2[num5 + 1] : 0);
			byte[] array5 = new byte[num6];
			if (num6 > 0 && num5 + 2 + num6 <= array2.Length)
			{
				Buffer.BlockCopy(array2, num5 + 2, array5, 0, num6);
			}
			int num7 = num5 + 2 + num6;
			switch (b)
			{
			case 2:
				array3[sp++] = (long)ReadI4(array5, 0);
				goto default;
			case 3:
				array3[sp++] = ReadI8(array5, 0);
				goto default;
			case 4:
				array3[sp++] = null;
				goto default;
			case 5:
				array3[sp++] = args[array5[0]];
				goto default;
			case 6:
				array3[sp++] = array4[array5[0]];
				goto default;
			case 7:
				array4[array5[0]] = array3[--sp];
				goto default;
			case 8:
				array3[sp] = array3[sp - 1];
				sp++;
				goto default;
			case 9:
				sp--;
				goto default;
			case 10:
				array3[sp++] = array4[array5[0]];
				goto default;
			case 16:
			{
				long num22 = ToI64(array3[--sp]);
				long num23 = ToI64(array3[--sp]);
				array3[sp++] = num23 + num22;
				goto default;
			}
			case 17:
			{
				long num20 = ToI64(array3[--sp]);
				long num21 = ToI64(array3[--sp]);
				array3[sp++] = num21 - num20;
				goto default;
			}
			case 18:
			{
				long num18 = ToI64(array3[--sp]);
				long num19 = ToI64(array3[--sp]);
				array3[sp++] = num19 * num18;
				goto default;
			}
			case 19:
			{
				long num16 = ToI64(array3[--sp]);
				long num17 = ToI64(array3[--sp]);
				array3[sp++] = ((num16 == 0L) ? 0 : (num17 / num16));
				goto default;
			}
			case 20:
			{
				long num10 = ToI64(array3[--sp]);
				long num11 = ToI64(array3[--sp]);
				array3[sp++] = ((num10 == 0L) ? 0 : (num11 % num10));
				goto default;
			}
			case 21:
			{
				long num12 = ToI64(array3[--sp]);
				long num13 = ToI64(array3[--sp]);
				array3[sp++] = num13 & num12;
				goto default;
			}
			case 22:
			{
				long num14 = ToI64(array3[--sp]);
				long num15 = ToI64(array3[--sp]);
				array3[sp++] = num15 | num14;
				goto default;
			}
			case 23:
			{
				long num8 = ToI64(array3[--sp]);
				long num9 = ToI64(array3[--sp]);
				array3[sp++] = num9 ^ num8;
				goto default;
			}
			case 24:
			{
				int num36 = (int)(ToI64(array3[--sp]) & 0x3F);
				long num37 = ToI64(array3[--sp]);
				array3[sp++] = num37 << num36;
				goto default;
			}
			case 25:
			{
				int num34 = (int)(ToI64(array3[--sp]) & 0x3F);
				long num35 = ToI64(array3[--sp]);
				array3[sp++] = num35 >> num34;
				goto default;
			}
			case 26:
				array3[sp - 1] = -ToI64(array3[sp - 1]);
				goto default;
			case 27:
				array3[sp - 1] = ~ToI64(array3[sp - 1]);
				goto default;
			case 28:
				array3[sp - 1] = (long)(int)ToI64(array3[sp - 1]);
				goto default;
			case 29:
				array3[sp - 1] = ToI64(array3[sp - 1]);
				goto default;
			case 30:
				array3[sp - 1] = (long)(byte)ToI64(array3[sp - 1]);
				goto default;
			case 31:
				array3[sp - 1] = ToI64(array3[sp - 1]);
				goto default;
			case 32:
			{
				long num32 = ToI64(array3[--sp]);
				long num33 = ToI64(array3[--sp]);
				array3[sp++] = (long)((num33 == num32) ? 1 : 0);
				goto default;
			}
			case 33:
			{
				long num30 = ToI64(array3[--sp]);
				long num31 = ToI64(array3[--sp]);
				array3[sp++] = (long)((num31 < num30) ? 1 : 0);
				goto default;
			}
			case 34:
			{
				long num28 = ToI64(array3[--sp]);
				long num29 = ToI64(array3[--sp]);
				array3[sp++] = (long)((num29 > num28) ? 1 : 0);
				goto default;
			}
			case 35:
			{
				long num26 = ToI64(array3[--sp]);
				long num27 = ToI64(array3[--sp]);
				array3[sp++] = (long)((num27 != num26) ? 1 : 0);
				goto default;
			}
			case 48:
				num5 = ReadI4(array5, 0);
				continue;
			case 49:
				if (ToI64(array3[--sp]) != 0L)
				{
					num5 = ReadI4(array5, 0);
					continue;
				}
				goto default;
			case 50:
				if (ToI64(array3[--sp]) == 0L)
				{
					num5 = ReadI4(array5, 0);
					continue;
				}
				goto default;
			case 51:
				num5 = ReadI4(array5, 0);
				continue;
			case 52:
			{
				int num24 = ReadI4(array5, 0);
				int num25 = (int)ToI64(array3[--sp]);
				if (num25 >= 0 && num25 < num24)
				{
					num5 = ReadI4(array5, 4 + num25 * 4);
					continue;
				}
				goto default;
			}
			case 64:
			case 65:
			{
				object obj6 = InvokeByName(ReadI4(array5, 0), array3, ref sp);
				if (obj6 != null)
				{
					array3[sp++] = obj6;
				}
				goto default;
			}
			case 88:
			{
				object obj5 = InvokeBySignature(LoadEncString(ReadI4(array5, 0)), array3, ref sp);
				if (obj5 != null)
				{
					array3[sp++] = obj5;
				}
				goto default;
			}
			case 66:
				SecureZero(array2);
				if (_poison == 0L)
				{
					return array3[--sp];
				}
				return _poison;
			case 67:
				SecureZero(array2);
				if (_poison == 0L)
				{
					return null;
				}
				return _poison;
			case 68:
			{
				object obj4 = InvokeConstructorByName(ReadI4(array5, 0), array3, ref sp);
				if (obj4 != null)
				{
					array3[sp++] = obj4;
				}
				goto default;
			}
			case 80:
				array3[sp++] = LoadEncString(ReadI4(array5, 0));
				goto default;
			case 83:
			{
				FieldInfo fieldInfo3 = ResolveField(ReadI4(array5, 0));
				array3[sp++] = fieldInfo3.GetValue(null);
				goto default;
			}
			case 84:
				ResolveField(ReadI4(array5, 0)).SetValue(null, array3[--sp]);
				goto default;
			case 81:
			{
				FieldInfo fieldInfo2 = ResolveField(ReadI4(array5, 0));
				object obj3 = array3[--sp];
				array3[sp++] = fieldInfo2.GetValue(obj3);
				goto default;
			}
			case 82:
			{
				FieldInfo fieldInfo = ResolveField(ReadI4(array5, 0));
				object value2 = array3[--sp];
				object obj2 = array3[--sp];
				fieldInfo.SetValue(obj2, value2);
				goto default;
			}
			case 86:
			{
				Type type = typeof(Runtime).Module.ResolveType(ReadI4(array5, 0));
				object obj = array3[--sp];
				if (obj == null)
				{
					array3[sp++] = (type.IsValueType ? Activator.CreateInstance(type) : null);
				}
				else if (type.IsEnum)
				{
					array3[sp++] = Enum.ToObject(type, ToI64(obj));
				}
				else
				{
					array3[sp++] = Convert.ChangeType(obj, type);
				}
				goto default;
			}
			case 87:
				array3[sp++] = typeof(Runtime).Module.ResolveType(ReadI4(array5, 0));
				goto default;
			case 112:
			{
				Type elementType = typeof(Runtime).Module.ResolveType(ReadI4(array5, 0));
				int length = (int)ToI64(array3[--sp]);
				array3[sp++] = Array.CreateInstance(elementType, length);
				goto default;
			}
			case 113:
			{
				int index4 = (int)ToI64(array3[--sp]);
				Array array8 = (Array)array3[--sp];
				array3[sp++] = (long)(byte)array8.GetValue(index4);
				goto default;
			}
			case 114:
			{
				int index3 = (int)ToI64(array3[--sp]);
				Array array7 = (Array)array3[--sp];
				array3[sp++] = array7.GetValue(index3);
				goto default;
			}
			case 115:
			{
				object value = array3[--sp];
				int index2 = (int)ToI64(array3[--sp]);
				((Array)array3[--sp]).SetValue(value, index2);
				goto default;
			}
			case 116:
			{
				byte b2 = (byte)ToI64(array3[--sp]);
				int index = (int)ToI64(array3[--sp]);
				((Array)array3[--sp]).SetValue(b2, index);
				goto default;
			}
			case 117:
			{
				Array array6 = (Array)array3[--sp];
				array3[sp++] = (long)array6.Length;
				goto default;
			}
			case 128:
				throw (Exception)array3[--sp];
			case 129:
				num5 = ReadI4(array5, 0);
				continue;
			default:
				num5 = num7;
				continue;
			case 254:
				break;
			}
			break;
		}
		SecureZero(array2);
		if (sp <= 0)
		{
			return null;
		}
		return array3[sp - 1];
	}

	public static object InvokeBCL(int typeToken, int methodToken, object[] args)
	{
		EnsureInit();
		string fullName = LoadEncString(typeToken);
		string name = LoadEncString(methodToken);
		Type type = ResolveType(fullName);
		if (type == null)
		{
			return null;
		}
		MethodInfo method = type.GetMethod(name, BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
		if (method == null)
		{
			return null;
		}
		ParameterInfo[] parameters = method.GetParameters();
		object[] array = new object[parameters.Length];
		for (int i = 0; i < parameters.Length && i < args.Length; i++)
		{
			Type parameterType = parameters[i].ParameterType;
			object obj = args[i];
			if (obj == null)
			{
				array[i] = (parameterType.IsValueType ? Activator.CreateInstance(parameterType) : null);
			}
			else if (parameterType.IsValueType)
			{
				long num = ToI64(obj);
				if (parameterType == typeof(int))
				{
					array[i] = (int)num;
				}
				else if (parameterType == typeof(byte))
				{
					array[i] = (byte)num;
				}
				else if (parameterType == typeof(byte[]))
				{
					array[i] = obj;
				}
				else
				{
					array[i] = Convert.ChangeType(num, parameterType);
				}
			}
			else
			{
				array[i] = obj;
			}
		}
		object obj2 = null;
		if (!method.IsStatic && args.Length > parameters.Length)
		{
			obj2 = args[^1];
		}
		return method.Invoke(obj2, array);
	}

	private static object InvokeByName(int refId, object[] es, ref int sp)
	{
		if (!_methodRefs.TryGetValue(refId, out string value))
		{
			throw new Exception($"method ref 0x{refId:X8} not found");
		}
		return InvokeBySignature(value, es, ref sp);
	}

	private static object InvokeBySignature(string sig, object[] es, ref int sp)
	{
		int num = sig.IndexOf("::");
		string text = sig.Substring(0, num);
		string text2 = sig.Substring(num + 2);
		int num2 = text2.IndexOf('|');
		string text3 = ((num2 >= 0) ? text2.Substring(0, num2) : text2);
		string text4 = ((num2 >= 0) ? text2.Substring(num2 + 1) : "");
		Type type = ResolveType(text);
		if (type == null)
		{
			throw new Exception("type " + text + " not found");
		}
		List<Type> list = new List<Type>();
		if (!string.IsNullOrEmpty(text4))
		{
			string[] array = text4.Split(',');
			foreach (string text5 in array)
			{
				if (!string.IsNullOrEmpty(text5.Trim()))
				{
					list.Add(ResolveType(text5.Trim()));
				}
			}
		}
		MethodInfo methodInfo = null;
		MethodInfo[] methods = type.GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
		foreach (MethodInfo methodInfo2 in methods)
		{
			if (methodInfo2.Name != text3)
			{
				continue;
			}
			ParameterInfo[] parameters = methodInfo2.GetParameters();
			if (parameters.Length != list.Count)
			{
				continue;
			}
			bool flag = true;
			for (int j = 0; j < parameters.Length; j++)
			{
				if (parameters[j].ParameterType.FullName != list[j].FullName)
				{
					flag = false;
					break;
				}
			}
			if (flag)
			{
				methodInfo = methodInfo2;
				break;
			}
		}
		if (methodInfo == null)
		{
			methodInfo = type.GetMethod(text3, BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
			if (methodInfo == null)
			{
				throw new Exception($"method {text}::{text3} not found");
			}
		}
		ParameterInfo[] parameters2 = methodInfo.GetParameters();
		object[] array2 = new object[parameters2.Length];
		for (int num3 = parameters2.Length - 1; num3 >= 0; num3--)
		{
			object obj = es[--sp];
			Type parameterType = parameters2[num3].ParameterType;
			if (obj == null)
			{
				array2[num3] = (parameterType.IsValueType ? Activator.CreateInstance(parameterType) : null);
			}
			else if (parameterType.IsValueType)
			{
				long num4 = ToI64(obj);
				if (parameterType == typeof(int))
				{
					array2[num3] = (int)num4;
				}
				else if (parameterType == typeof(uint))
				{
					array2[num3] = (uint)num4;
				}
				else if (parameterType == typeof(bool))
				{
					array2[num3] = num4 != 0;
				}
				else if (parameterType == typeof(byte))
				{
					array2[num3] = (byte)num4;
				}
				else if (parameterType == typeof(sbyte))
				{
					array2[num3] = (sbyte)num4;
				}
				else if (parameterType == typeof(short))
				{
					array2[num3] = (short)num4;
				}
				else if (parameterType == typeof(ushort))
				{
					array2[num3] = (ushort)num4;
				}
				else if (parameterType == typeof(long))
				{
					array2[num3] = num4;
				}
				else if (parameterType == typeof(ulong))
				{
					array2[num3] = (ulong)num4;
				}
				else if (parameterType == typeof(char))
				{
					array2[num3] = (char)num4;
				}
				else if (parameterType == typeof(float))
				{
					array2[num3] = (float)num4;
				}
				else if (parameterType == typeof(double))
				{
					array2[num3] = (double)num4;
				}
				else if (parameterType.IsEnum)
				{
					array2[num3] = Enum.ToObject(parameterType, num4);
				}
				else
				{
					array2[num3] = Convert.ChangeType(num4, parameterType);
				}
			}
			else if (parameterType.IsAssignableFrom(obj.GetType()))
			{
				array2[num3] = obj;
			}
			else if (obj is long num5)
			{
				if (parameterType == typeof(string))
				{
					array2[num3] = num5.ToString();
				}
				else
				{
					array2[num3] = Convert.ChangeType(num5, parameterType);
				}
			}
			else
			{
				array2[num3] = obj;
			}
		}
		object obj2 = null;
		if (!methodInfo.IsStatic)
		{
			obj2 = es[--sp];
			if (methodInfo.DeclaringType != null && methodInfo.DeclaringType.IsValueType && obj2 != null && obj2.GetType() != methodInfo.DeclaringType)
			{
				long num6 = ToI64(obj2);
				Type declaringType = methodInfo.DeclaringType;
				obj2 = ((declaringType == typeof(ulong)) ? ((object)(ulong)num6) : ((declaringType == typeof(uint)) ? ((object)(uint)num6) : ((declaringType == typeof(int)) ? ((object)(int)num6) : ((declaringType == typeof(byte)) ? ((object)(byte)num6) : ((!(declaringType == typeof(char))) ? Convert.ChangeType(num6, declaringType) : ((object)(char)num6))))));
			}
		}
		return methodInfo.Invoke(obj2, array2);
	}

	private static object InvokeConstructorByName(int refId, object[] es, ref int sp)
	{
		if (!_methodRefs.TryGetValue(refId, out string value))
		{
			throw new Exception($"ctor ref 0x{refId:X8} not found");
		}
		int length = value.IndexOf("::");
		string text = value.Substring(0, length);
		Type type = ResolveType(text);
		if (type == null)
		{
			throw new Exception("type " + text + " not found");
		}
		ConstructorInfo[] constructors = type.GetConstructors();
		if (constructors.Length == 0)
		{
			return Activator.CreateInstance(type);
		}
		ConstructorInfo constructorInfo = constructors[0];
		ParameterInfo[] parameters = constructorInfo.GetParameters();
		object[] array = new object[parameters.Length];
		for (int num = parameters.Length - 1; num >= 0; num--)
		{
			array[num] = es[--sp];
		}
		return constructorInfo.Invoke(array);
	}

	private static FieldInfo ResolveField(int refId)
	{
		if (!_fieldRefs.TryGetValue(refId, out string value))
		{
			throw new Exception($"field ref 0x{refId:X8} not found");
		}
		int num = value.IndexOf("::");
		string text = value.Substring(0, num);
		string name = value.Substring(num + 2);
		Type type = ResolveType(text);
		if (type == null)
		{
			throw new Exception("type " + text + " not found");
		}
		return type.GetField(name, BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
	}

	private static Type ResolveType(string fullName)
	{
		Type type = Type.GetType(fullName);
		if (type != null)
		{
			return type;
		}
		Assembly[] assemblies = AppDomain.CurrentDomain.GetAssemblies();
		foreach (Assembly assembly in assemblies)
		{
			try
			{
				type = assembly.GetType(fullName);
			}
			catch
			{
				continue;
			}
			if (type != null)
			{
				return type;
			}
		}
		string[][] array = new string[6][]
		{
			new string[1] { "System.Security.Cryptography.Algorithms" },
			new string[1] { "System.Security.Cryptography.Primitives" },
			new string[1] { "System.Security.Cryptography.Csp" },
			new string[1] { "System.Console" },
			new string[1] { "System.Runtime" },
			new string[1] { "System.Private.CoreLib" }
		};
		foreach (string[] array2 in array)
		{
			foreach (string assemblyString in array2)
			{
				try
				{
					type = Assembly.Load(assemblyString).GetType(fullName);
					if (type != null)
					{
						return type;
					}
				}
				catch
				{
				}
			}
		}
		string text = (fullName.Contains(".") ? fullName.Substring(fullName.LastIndexOf('.') + 1) : fullName);
		assemblies = AppDomain.CurrentDomain.GetAssemblies();
		foreach (Assembly assembly2 in assemblies)
		{
			try
			{
				Type[] types = assembly2.GetTypes();
				foreach (Type type2 in types)
				{
					if (type2.Name == text)
					{
						return type2;
					}
				}
			}
			catch
			{
			}
		}
		return null;
	}

	public static string LoadEncString(int token)
	{
		EnsureInit();
		return LoadEncStringCore(token);
	}

	private static string LoadEncStringCore(int token)
	{
		if (_strBlob != null && _strBlob.Length >= 8)
		{
			int num = ReadI4(_strBlob, 4);
			int num2 = 8;
			for (int i = 0; i < num; i++)
			{
				if (num2 + 8 > _strBlob.Length)
				{
					break;
				}
				int num3 = ReadI4(_strBlob, num2);
				int num4 = ReadI4(_strBlob, num2 + 4);
				if (num3 == token)
				{
					byte[] array = new byte[num4];
					Buffer.BlockCopy(_strBlob, num2 + 8, array, 0, num4);
					uint num5 = (uint)ReadI4(_strBlob, num2 + 8 + num4);
					byte[] array2 = new byte[num4];
					for (int j = 0; j < num4; j++)
					{
						array2[j] = (byte)(array[j] ^ (num5 & 0xFFu));
						num5 = (num5 << 1) | (num5 >> 31);
					}
					return Encoding.UTF8.GetString(array2);
				}
				num2 += 8 + num4 + 4;
			}
		}
		int num6 = _stringsOffset;
		for (int k = 0; k < _stringCount; k++)
		{
			int num7 = ReadI4(_blob, num6);
			int num8 = ReadI4(_blob, num6 + 4);
			if (num7 == token)
			{
				byte[] array3 = new byte[num8];
				Buffer.BlockCopy(_blob, num6 + 8, array3, 0, num8);
				uint num9 = (uint)ReadI4(_blob, num6 + 8 + num8);
				byte[] array4 = new byte[num8];
				for (int l = 0; l < num8; l++)
				{
					array4[l] = (byte)(array3[l] ^ (num9 & 0xFFu));
					num9 = (num9 << 1) | (num9 >> 31);
				}
				return Encoding.UTF8.GetString(array4);
			}
			num6 += 8 + num8 + 4;
		}
		return "";
	}

	private static long ToI64(object o)
	{
		if (o == null)
		{
			return 0L;
		}
		if (o is long)
		{
			return (long)o;
		}
		if (o is int num)
		{
			return num;
		}
		if (o is uint num2)
		{
			return num2;
		}
		if (o is bool flag)
		{
			return flag ? 1 : 0;
		}
		if (o is byte b)
		{
			return b;
		}
		if (o is string text)
		{
			return text.Length;
		}
		if (o is char c)
		{
			return c;
		}
		return Convert.ToInt64(o);
	}

	private static int ReadI4(byte[] a, int o)
	{
		if (o + 3 >= a.Length)
		{
			return 0;
		}
		return a[o] | (a[o + 1] << 8) | (a[o + 2] << 16) | (a[o + 3] << 24);
	}

	internal static int ReadI4Pub(byte[] a, int o)
	{
		return ReadI4(a, o);
	}

	private static short ReadI2(byte[] a, int o)
	{
		if (o + 1 >= a.Length)
		{
			return 0;
		}
		return (short)(a[o] | (a[o + 1] << 8));
	}

	private static long ReadI8(byte[] a, int o)
	{
		if (o + 7 >= a.Length)
		{
			return 0L;
		}
		return (long)((uint)(a[o] | (a[o + 1] << 8) | (a[o + 2] << 16) | (a[o + 3] << 24)) | ((ulong)(uint)(a[o + 4] | (a[o + 5] << 8) | (a[o + 6] << 16) | (a[o + 7] << 24)) << 32));
	}
}
