using System; using Microsoft.VisualBasic; using Microsoft.VisualBasic.CompilerServices;
class V { static void Main(string[] a){ foreach (var nstr in a) { string wstr = nstr; int num=65;
 do { wstr = Strings.Replace(wstr, Conversions.ToString(Strings.Chr(num)), Conversions.ToString(Strings.Chr(num-19)), 1, -1, CompareMethod.Binary); num++; } while (num<=255);
 string[][] t = { new[]{"N","7A(C(KAL"},new[]{"O","AC(/3AVK"},new[]{"P","9!?988DA"},new[]{"Q","CAKEAJKH"},new[]{"R","CAEK8462"},new[]{"S","TUAIJKEW"},new[]{"T","AMM(X/78"},new[]{"U","RAPHHUXA"},new[]{"V","D7A)(HAK"},new[]{"W","ECMLEKKK"},new[]{"X","AWEFHANN"},new[]{"Y","EWJKANBX"},new[]{"Z","NOCPWWXY"} };
 foreach (var p in t) wstr = Strings.Replace(wstr, p[0], p[1], 1, -1, CompareMethod.Binary);
 Console.WriteLine(nstr + "\t" + Strings.Right(wstr, 8)); } } }
